# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class GroceryItem(scrapy.Item):
    from_id = scrapy.Field()
    from_site = scrapy.Field()
    original_url = scrapy.Field()
    crawled_time = scrapy.Field()
    name = scrapy.Field()
    slug = scrapy.Field()
    img_url = scrapy.Field()
    brand = scrapy.Field()
    unit = scrapy.Field()
    extracted_unit = scrapy.Field()
    full_name = scrapy.Field()
    full_name_before_remove_unit = scrapy.Field()
    category = scrapy.Field()
    description = scrapy.Field()
    feature = scrapy.Field()
    usage_instruction = scrapy.Field()

    price = scrapy.Field()
    serving_size = scrapy.Field()
    ingredient = scrapy.Field()

    nutrition = scrapy.Field()
    is_new_product = scrapy.Field()


class PricelineItem(GroceryItem):
    pass
