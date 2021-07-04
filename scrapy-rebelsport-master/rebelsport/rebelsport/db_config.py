from sqlalchemy import create_engine
from sqlalchemy.orm.session import sessionmaker

# local
user = 'root'
password = 'password'
host = 'localhost'
db = 'test'

engine = create_engine('mysql://{0}:{1}@{2}/{3}?charset=utf8'.format(user, password, host, db))

Session = sessionmaker(bind=engine)
