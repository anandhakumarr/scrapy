import sys
sys.path.append('./')
print sys.path

from unit_extraction import UnitExtraction
import re
from grocery_crawlers.db_config import Session
from grocery_crawlers.model import Product
import logging

logging.basicConfig(
    # filename=u'log/merge-{}.log'.format(datetime.now().strftime('%Y_%m_%d_%H_%M')),
    level=logging.DEBUG,
    format='%(asctime)s %(levelname)s %(message)s')

DONT_EXTRACT_SITE = (
    'coles',
    'rebelsport'
)


def main(argv):
    if len(argv) != 2:
        logging.error('Wrong main parameter, need name of site and type ')
        return
    # Init data
    from_site = argv[0]
    if from_site in DONT_EXTRACT_SITE:
        logging.error(u'Site {} DONT need to extract unit'.format(from_site))
        return
    type = argv[1]

    unit_extraction = UnitExtraction()

    session = Session()
    if type == 'all':
        products = session.query(Product.id, Product.full_name).filter(
            Product.from_site == from_site).all()
    elif type == 'empty':
        products = session.query(Product.id, Product.full_name).filter(Product.from_site == from_site,
                                                                       Product.unit == None).all()
    else:
        logging.error('Wrong type')
        return
    for product in products:
        print product.id
        unit = unit_extraction.parse(product.full_name)
        # print product.unit
        print product.full_name
        print unit
        if unit:
            session.query(Product.id).filter(Product.id == product.id).update({
                'unit': unit,
                'extracted_unit': True
            })
            session.commit()
            # product.unit = unit
            # product.extracted_unit = True
            # session.commit()
    session.close()


if __name__ == '__main__':
    main(sys.argv[1:])
