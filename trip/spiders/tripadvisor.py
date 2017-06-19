# -*- coding: utf-8 -*-
import scrapy
from datetime import datetime

class TripadvisorSpider(scrapy.Spider):
    name = "trip"
    allowed_domains = ["tripadvisor.in"]
    start_urls = ['https://www.tripadvisor.in/Hotel_Review-g4093423-d5062896-Reviews-Hotel_Southern_Residency-Kelambakkam_Tamil_Nadu.html']

    def parse(self, response):

    	try:
    		rv_count = int(response.xpath('//li[@id="TABS_REVIEWS"]//span[@class="tabs_pers_counts"]/text()').extract()[0].replace(')','').replace('(','').encode('utf-8'))
    	except:
    		rv_count = 0
    	if rv_count:
    		no = len(response.xpath('//div[contains(@class,"reviewSelector") and not(contains(@class,"recent_review"))]').extract())
    		for i in range(no):
    			

    			try:
    				rvdate = response.xpath('//div[@id="REVIEWS"]//div[@class="rating reviewItemInline"]/span/text()').extract()[i].replace(',','').replace('\n','').replace('Reviewed','').strip()
    				rv_date =str(datetime.strptime(rvdate,'%d %B %Y'))
    			except:
    				rvdate = '1900-01-01 00:00:00'

    			print rv_date
    	else:
    		rv_desc = ''
    		rv_rating = ''
    		rv_user = ''
    		rv_location = ''
    		rv_date = ''    		

        
