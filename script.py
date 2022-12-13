#!/usr/bin/python3

from sqlalchemy import create_engine
from random import randint
from sqlalchemy.sql import text

conn_str = "postgresql+psycopg2://postgres:postgres@postgres:5432/webinar"
l = []
engine = create_engine(conn_str,encoding="UTF-8")
ri =randint(1, 5)

sql1=text("select liquid.name from food inner join liquid on food.id=liquid.id where food.id= :id;")
sql2=text("select food.name from food inner join liquid on food.id=liquid.id where food.id= :id;")

print("Content-Type: text/html")
print()

with engine.connect() as con:

    res = con.execute(sql1, id=ri).fetchall()
    for row in res:
        liquid=str(row[0])
        # print(liquid)

    res = con.execute(sql2, id=ri).fetchall()
    for row in res:
        food=str(row[0])
        # print(food)

    f = open('/etc/hostname', 'r')
    hostname = f.read()

    print(food+" "+liquid+" from "+hostname)