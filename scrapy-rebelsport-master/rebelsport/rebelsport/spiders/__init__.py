# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.
import urlparse

import scrapy
from rebelsport.db_config import Session
from rebelsport.model import Product
import locale

locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')


class AbstractGroceryCrawler(scrapy.Spider):
    name = 'abstract'

    old_product_set = set()

    def __init__(self, *args, **kwargs):
        super(AbstractGroceryCrawler, self).__init__(*args, **kwargs)
        self.logger.info('select old products to filter')
        session = Session()
        for product in session.query(Product.from_id).filter(Product.from_site == self.name).all():
            self.old_product_set.add(product.from_id)
        session.close()

    def get_full_text_in_node(self, node):
        return u''.join(node.xpath('.//text()').extract())

    def convert_float_price(self, str):
        return locale.atof(str)

    def remove_query(self, url):
        return urlparse.urljoin(url, urlparse.urlparse(url).path)

    def debug_html(self, response):
        with open('debug.html', 'w') as f:
            f.write(response.body)


class DuplicatedFilter:
    crawled_set = set()

    @staticmethod
    def is_crawled_or_add(obj):
        res = obj in DuplicatedFilter.crawled_set
        if not res:
            DuplicatedFilter.crawled_set.add(obj)
        else:
            print u'Crawled: {}'.format(obj)
        return res


if __name__ == '__main__':
    crawler = AbstractGroceryCrawler()
    print crawler.convert_float_price('4,499.00')
    print crawler.convert_float_price('499.23')
    print crawler.convert_float_price('49,9.23')
