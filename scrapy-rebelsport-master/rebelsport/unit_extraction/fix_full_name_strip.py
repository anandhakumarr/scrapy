import sys
sys.path.append('../')

from unit_extraction import UnitExtraction
from grocery_crawlers.db_config import Session
from grocery_crawlers.model import Product

if __name__ == '__main__':
    session = Session()

    unit_extraction = UnitExtraction()
    for product in session.query(Product).filter(Product.from_site == u'amcal',
                                                 Product.extracted_unit == 1, Product.full_name_before_remove_unit != None).all():
        print product.full_name
        product.full_name = product.full_name.rstrip(' -')
        print product.full_name
        session.commit()
    session.close()
