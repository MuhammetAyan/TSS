import pyodbc
from Data.DbTestModel import *
cnxn = pyodbc.connect("Driver={SQL Server};"
                      "Server=.;"
                      "Database=testDB;"
                      "Trusted_Connection=yes;"
                      "User Id=user;"
                      "Password=12345678;"
                      )
"""Provider=SQLOLEDB.1;Password=12345678;Persist Security Info=True;User ID=user;Initial Catalog=testDB;Data Source=."""
# cursor.execute('CREATE TABLE Test1(id int, name varchar(50));')
# cursor.execute("DROP TABLE Test1;")


def query(sql: str):
    cursor = cnxn.cursor()
    cursor.execute(sql)
    cnxn.commit()  # değişiklikleri kaydediyor.
    cursor.close()


def select(sql: str, dbModel):
    cursor = cnxn.cursor()
    cursor.execute(sql)
    result = []
    for row in cursor.fetchall():
        # result.append(dbModel(row))
        result.append(dbModel(row))
    cursor.close()
    return result


x= select("select * from valueTable", dbTestModel)
for i in x:
    print(i.name)
