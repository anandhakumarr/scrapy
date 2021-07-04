# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html
from scrapy.exceptions import DropItem

from coles.nutrition_model import Nutrition
from rebelsport.model import Product
from my_mysql import MysqlDbUtils
from slugify import slugify

from unit_extraction import UnitExtraction
import re
from db_config import Session
import sys  

reload(sys)  
sys.setdefaultencoding('utf8')

class CheckMandatoryFieldPipeline(object):
    def process_item(self, item, spider):
        if not item['price']:
            raise DropItem('Missing price in %s' % item)
        if len(item['name']) == 0:
            raise DropItem('Empty name in %s' % item)
        return item


class StripPipeline(object):
    def strip(self, obj):
        if not obj:
            return obj
        return obj.strip()

    def process_item(self, item, spider):
        if 'brand' in item and item['brand']:
            item['brand'] = self.strip(item['brand'])
        item['name'] = self.strip(item['name'])
        return item


class AddAdditionalFieldsPipeline(object):
    def process_item(self, item, spider):
        # from_site
        item['from_site'] = spider.name
        # full_name
        if 'full_name' not in item:
            if 'brand' in item and item['brand']:
                item['full_name'] = u'{} {}'.format(item['brand'], item['name'])
            else:
                item['full_name'] = unicode(item['name'])
        # slug
        item['slug'] = slugify(item['full_name'])
        item['price'] = float(item['price'].replace('$',''))
        return item


class ExtractUnitPipeline(object):
    def open_spider(self, spider):
        spider.logger.info('init unit extraction')
        self.unit_extraction = UnitExtraction()

    def process_item(self, item, spider):
        if 'unit' not in item or item['unit'] is None:
            item['unit'] = self.unit_extraction.parse(item['full_name'])
            if item['unit']:
                spider.logger.info(u'extracted unit = {}'.format(item['unit']))
                item['extracted_unit'] = 1
                spider.logger.info(u'remove unit')
                # print item['full_name']
                full_name = self.unit_extraction.remove_unit(item['full_name'])
                if full_name:
                    item['full_name_before_remove_unit'] = item['full_name']
                    item['full_name'] = full_name
        return item


class SaveToDb(object):
    def process_item(self, item, spider):
        db = MysqlDbUtils()
        db.process(item, spider)
        return item


class SaveNutritionPipeline(object):

    def process_item(self, item, spider):
        if 'nutrition' in item and item.get('is_new_product', False):
            session = Session()
            try:
                product = session.query(Product.id).filter(Product.from_site == spider.name,
                                                           Product.from_id == item['from_id']).one()
                row_num = 0
                for row in item['nutrition']:
                    column_num = 0
                    for text in row:
                        nutrition = Nutrition(
                            product_id=product.id,
                            crawled_time=item['crawled_time'],
                            column_number=column_num,
                            row_number=row_num,
                            text=text
                        )
                        session.add(nutrition)
                        column_num += 1
                    row_num += 1
                session.query(Product.id).filter(Product.id == product.id).update({
                    'has_nutrition': 1
                })
                session.commit()
                spider.logger.info('saved nutrition')
            except Exception as e:
                spider.logger.exception(e)
                session.rollback()
            finally:
                session.close()
        return item
