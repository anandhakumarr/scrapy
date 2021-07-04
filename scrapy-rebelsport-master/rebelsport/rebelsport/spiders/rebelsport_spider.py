# -*- coding: utf-8 -*-
import json
import re
from datetime import datetime
from functools import partial
from urlparse import urljoin
import sys
import scrapy

from rebelsport.items import GroceryItem
from rebelsport.spiders import DuplicatedFilter, AbstractGroceryCrawler

def escapespecialchars(string):
    result = str(string.encode('utf-8')).lstrip().rstrip().replace("'","").replace('"','')
    return result

class RebelSportSpider(AbstractGroceryCrawler):
    name = "rebelsport"
    allowed_domains = ["www.rebelsport.com.au"]
    start_urls = ['http://www.rebelsport.com.au/']


    def parse_list(self, response):

        # has_product = False

        self.logger.info('parse list: {}'.format(response.url))
        items = response.xpath("//div[contains(@ng-controller, 'ProductListItemController')]")
        try:
            category = escapespecialchars(response.xpath("//meta[contains(@name, 'keywords')]/@content").extract()[0])
        except:
            category = escapespecialchars(response.xpath("//title/text()").extract()[0])
        # next_page = escapespecialchars(response.xpath("//a[contains(@data-filter-key, 'page') and contains(@rel,'next')]/@href").extract()[0])
        # print response.xpath("//a[contains(@rel,'next')]/@href").extract()
        # next_page_url = ""
        # if next_page:
        #     next_page_url = urljoin('http://www.rebelsport.com.au',next_page)
        #     has_product = True

        for item in items:
            price_list =  item.xpath(".//span[contains(@class, 'price')]/span/text()").extract()
            old_price = new_price = 0            
            if len(price_list)>1:
                old_price = escapespecialchars(price_list[0])
                new_price = escapespecialchars(price_list[1])
            else:
                new_price = escapespecialchars(price_list[0])

            product_name = escapespecialchars(item.xpath(".//div[contains(@class, 'details')]/div[contains(@class, 'title')]/text()").extract()[0])
            product_code = escapespecialchars(item.xpath("@ng-init").extract()[0].replace('productPLU = ',''))
            image_url = escapespecialchars(item.xpath(".//div[contains(@class, 'product-image')]/img/@src").extract()[0])
            original_url = urljoin('http://www.rebelsport.com.au', escapespecialchars(item.xpath(".//a[contains(@class, 'product-image-anchor')]/@href").extract()[0]))
        
            finalitem = GroceryItem(
                from_id=product_code,
                name=product_name,
                description="",
                unit="",
                img_url=image_url,
                original_url=original_url,
                crawled_time=datetime.now(),
                price=new_price,
                category=category,
            )

            if DuplicatedFilter.is_crawled_or_add(product_code):
                self.logger.info(u'Product was scrapped in this session: {}'.format(product_code))
                continue
            else:
                yield finalitem

        # if has_product:  
        #     self.logger.info('Few more pages {}'.format(next_page_url))
        #     yield scrapy.Request(next_page_url, callback=partial(self.parse_list))
        # else:
        #     self.logger.info('no more page')

    def parse(self, response):
        self.logger.info('parse home: {}'.format(response.url))
        storeurls = []
        producturls = []
        for urls in response.xpath("//a[contains(@class, 'menu-item')]/@href").extract():
            url=urljoin('http://www.rebelsport.com.au', urls+'?page=1&pageSize=1000000')
            if '/store/' in url:
                storeurls.append(url)
            if '/products/' in url:
                producturls.append(url)            
            final_urls = storeurls+producturls            
            for list_url in final_urls:        
                yield scrapy.Request(url=list_url, callback=partial(self.parse_list))