from datetime import datetime

from sqlalchemy import Column, Integer, String, Unicode, Float, DateTime, ForeignKey, Boolean, TEXT
from sqlalchemy.ext.declarative import declarative_base
from rebelsport.db_config import Session, engine

Base = declarative_base()

class Nutrition(Base):
    __tablename__ = 'nutrition'
    id = Column(Integer, primary_key=True, autoincrement=True)
    product_id = Column(Integer)
    crawled_time = Column(DateTime)
    row_number = Column(Integer)
    column_number = Column(Integer)
    text = Column(Unicode(200))

if __name__ == '__main__':
    Base.metadata.create_all(engine)
