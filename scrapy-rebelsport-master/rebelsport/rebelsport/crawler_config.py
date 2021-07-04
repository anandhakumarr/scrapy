from rebelsport.spiders.rebelsport_spider import RebelSportSpider

class CrawlerConfig:
    def __init__(self):
        self.manual_unit_sites = set()
        self.manual_unit_sites.add(RebelSportSpider.name)

    def is_manual_unit_extract_site(self, from_site):
        return from_site in self.manual_unit_sites
