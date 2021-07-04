from datetime import datetime

from sqlalchemy import Column, Integer, String, Unicode, Float, DateTime, ForeignKey, Boolean, TEXT
from sqlalchemy.ext.declarative import declarative_base
from db_config import Session, engine

Base = declarative_base()


class Product(Base):
    __tablename__ = 'product'
    id = Column(Integer, primary_key=True, autoincrement=True)

    from_site = Column(Unicode(50))
    from_id = Column(Unicode(50))
    original_url = Column(Unicode(256))
    crawled_time = Column(DateTime)

    name = Column(Unicode(200))
    slug = Column(Unicode(200))
    img_url = Column(Unicode(200))
    brand = Column(Unicode(200))
    unit = Column(Unicode(200))
    extracted_unit = Column(Boolean)
    full_name = Column(Unicode(200))
    full_name_before_remove_unit = Column(Unicode(200))

    category = Column(Unicode(200))
    description = Column(Unicode(10000))
    feature = Column(Unicode(10000))
    usage_instruction = Column(Unicode(10000))
    serving_size = Column(Unicode(50))
    ingredient = Column(Unicode(10000))

    category_id = Column(Integer)

    last_insert_price_time = Column(DateTime)
    latest_price = Column(Float)
    before_price = Column(Float)
    change_percent = Column(Float)
    last_changed_price_time = Column(DateTime)


    has_nutrition = Column(Integer)

    normal_price = Column(Float)
    discount = Column(Float)
    last_update_normal_price = Column(DateTime)


class ProductPrice(Base):
    __tablename__ = 'product_price'
    id = Column(Unicode(50), primary_key=True)
    crawled_time = Column(DateTime, primary_key=True)
    price = Column(Float)
    unit = Column(Unicode(50))

    def __unicode__(self):
        return u'id={}, price={}, crawled_time={}'.format(self.id, self.price, self.crawled_time)


class DailyChanged(Base):
    __tablename__ = 'daily_change'
    id = Column(Integer, primary_key=True, autoincrement=True)
    product_id = Column(Integer)
    from_site = Column(Unicode(50))
    today_price = Column(Float)
    last_price = Column(Float)
    change_percent = Column(Float)
    today_crawled_time = Column(DateTime)
    last_crawled_time = Column(DateTime)


class UnitChanged(Base):
    __tablename__ = 'unit_change'
    id = Column(Integer, primary_key=True, autoincrement=True)
    product_id = Column(Integer)
    from_site = Column(Unicode(50))
    old_unit = Column(Unicode(50))
    new_unit = Column(Unicode(50))
    crawled_time = Column(DateTime)

if __name__ == '__main__':
    Base.metadata.create_all(engine)
