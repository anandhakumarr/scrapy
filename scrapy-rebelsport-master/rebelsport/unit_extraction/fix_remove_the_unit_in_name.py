import sys
sys.path.append('../')

from unit_extraction import UnitExtraction
from grocery_crawlers.db_config import Session
from grocery_crawlers.model import Product

if __name__ == '__main__':
    session = Session()

    unit_extraction = UnitExtraction()
    for product in session.query(Product).filter(Product.from_site == u'amcal',
                                                 Product.extracted_unit == 1).all():
        print 'id = {}'.format(product.id)
        full_name = unit_extraction.remove_unit(product.full_name)
        if full_name:
            print u'remove unit: {}'.format(product.full_name)
            # print product.full_name
            product.full_name_before_remove_unit = product.full_name
            product.full_name = full_name
            print product.full_name
            session.commit()
        else:
            print 'not remove'
    session.close()
