from datetime import datetime

from rebelsport.crawler_config import CrawlerConfig
from rebelsport.model import Product, ProductPrice, DailyChanged, UnitChanged
from db_config import Session


class MysqlDbUtils:
    session = None
    is_new_product = False
    crawler_config = CrawlerConfig()

    def process(self, item, spider):
        self.session = Session()
        spider.logger.info('save item to db')
        product = self.get_product(item['from_site'], item['from_id'])
        if not product:
            spider.logger.info('create a new product')
            # insert new product
            self.is_new_product = True
            product = self.insert_new_product(from_site=item['from_site'], from_id=item['from_id'],
                                              original_url=item['original_url'], crawled_time=item['crawled_time'],
                                              name=item['name'], slug=item['slug'], img_url=item['img_url'],
                                              brand=item.get('brand', None),
                                              unit=item.get('unit', None),
                                              extracted_unit=item.get('extracted_unit', None),
                                              full_name=item['full_name'],
                                              full_name_before_remove_unit=item.get('full_name_before_remove_unit',
                                                                                    None),
                                              category=item.get('category', None),
                                              description=item.get('description', None),
                                              feature=item.get('feature', None),
                                              usage_instruction=item.get('usage_instruction', None),
                                              latest_price=item['price'], last_insert_price_time=item['crawled_time'])
        else:
            spider.logger.info(
                u'old product: id = {}, price = {}, unit = {}\nnew price price = {}, unit = {}'.format(
                    product.id,
                    product.latest_price, product.unit, item['price'], item.get('unit', None)))
        if not self.is_new_product:
            # check price was changed
            if self.crawler_config.is_manual_unit_extract_site(item['from_site']) and product.unit != item['unit'] and item['unit'] is not None:
                spider.logger.info('Changed unit and price')
                unit_changed = UnitChanged(
                    product_id=product.id,
                    from_site=item['from_site'],
                    old_unit=product.unit,
                    new_unit=item['unit'],
                    crawled_time=datetime.now()
                )
                self.session.add(unit_changed)
                product.unit = item['unit']
            if product.latest_price != item['price']:
                if not self.crawler_config.is_manual_unit_extract_site(item['from_site']):
                    # auto extract unit
                    # insert to daily changed
                    spider.logger.info('insert changed price, type 1')
                    self.insert_daily_change(product.id, from_site=product.from_site, today_price=item['price'],
                                             last_price=product.latest_price,
                                             today_crawled_time=item['crawled_time'],
                                             last_crawled_time=product.last_insert_price_time)
                    product.last_changed_price_time = item['crawled_time']
                    product.before_price = product.latest_price
                    product.change_percent = (1.0 * (item['price'] - product.latest_price) / product.latest_price) * 100
                else:
                    # manual extract unit
                    if product.unit == item['unit']:
                        # insert to daily changed
                        # this code copied from above
                        spider.logger.info('insert changed price, type 2')
                        self.insert_daily_change(product.id, from_site=product.from_site, today_price=item['price'],
                                                 last_price=product.latest_price,
                                                 today_crawled_time=item['crawled_time'],
                                                 last_crawled_time=product.last_insert_price_time)
                        product.last_changed_price_time = item['crawled_time']
                        product.before_price = product.latest_price
                        product.change_percent = (1.0 * (
                            item['price'] - product.latest_price) / product.latest_price) * 100

            # update last_insert_price_time, latest_price
            spider.logger.debug('update latest price and crawled_time')
            product.latest_price = item['price']
            product.last_insert_price_time = item['crawled_time']
        # add price
        spider.logger.debug('add price')
        if not self.crawler_config.is_manual_unit_extract_site(item['from_site']):
            self.add_one_price(product.id, item['price'], item['crawled_time'], None)
        else:
            self.add_one_price(product.id, item['price'], item['crawled_time'], item['unit'])
        try:
            self.session.commit()
        except:
            self.session.rollback()
            raise
        finally:
            self.session.close()

    def insert_daily_change(self, product_id, from_site, today_price, last_price, today_crawled_time,
                            last_crawled_time):
        change_percent = (1.0 * (today_price - last_price) / last_price) * 100
        daily_change = DailyChanged(
            product_id=product_id,
            from_site=from_site,
            today_price=today_price,
            last_price=last_price,
            change_percent=change_percent,
            today_crawled_time=today_crawled_time,
            last_crawled_time=last_crawled_time
        )
        self.session.add(daily_change)

    def add_one_price(self, product_id, price, crawled_time, unit=None):
        price = ProductPrice(
            id=product_id,
            crawled_time=crawled_time,
            price=price,
            unit=unit
        )
        self.session.add(price)

    def get_product(self, from_site, from_id):
        product = self.session.query(Product).filter(Product.from_site == from_site,
                                                     Product.from_id == from_id).one_or_none()
        return product

    def insert_new_product(self, from_site=None, from_id=None, original_url=None, crawled_time=None,
                           name=None, slug=None, img_url=None, brand=None, unit=None, full_name=None,
                           full_name_before_remove_unit=None,
                           category=None, description=None, feature=None, usage_instruction=None,
                           last_insert_price_time=None, latest_price=None, extracted_unit=None):
        product = Product(
            from_site=from_site,
            from_id=from_id,
            original_url=original_url,
            crawled_time=crawled_time,
            name=name,
            slug=slug,
            img_url=img_url,
            brand=brand,
            unit=unit,
            extracted_unit=extracted_unit,
            full_name=full_name,
            full_name_before_remove_unit=full_name_before_remove_unit,
            category=category,
            description=description,
            feature=feature,
            usage_instruction=usage_instruction,
            last_insert_price_time=last_insert_price_time,
            latest_price=latest_price
        )
        self.session.add(product)
        self.session.commit()
        return product
