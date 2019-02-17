import pyodbc
from DBModels import *
cnxn = pyodbc.connect("Driver={SQL Server};"
                      "Server=(local);"
                      "Database=TSSDB;"
                      "Trusted_Connection=yes;"
                      "User Id=user;"
                      "Password=12345678;"
                      )
"""Provider=SQLOLEDB.1;Password=12345678;Persist Security Info=True;User ID=user;Initial Catalog=TSSDB;Data Source=(local)"""
# cursor.execute('CREATE TABLE Test1(id int, name varchar(50));')
# cursor.execute("DROP TABLE Test1;")

# insert ,update işlemleri için
def query(sql: str):
    cursor = cnxn.cursor()
    cursor.execute(sql)
    cnxn.commit()  # değişiklikleri kaydediyor.
    cursor.close()

 # select işlemleri için
def select(sql: str):
    cursor = cnxn.cursor()
    cursor.execute(sql)
    result = []
    p=sql.lower().find(" from ")
    modelname = ""
    for i in range(p+6, len(sql)):
        c = sql[i]
        if c != ' ':
            modelname += c
        else:
            break
    dbModel = eval("db" + modelname + "Model")
    for row in cursor.fetchall():
        # result.append(dbModel(row))
        result.append(dbModel(row))
    cursor.close()
    return result


x= select("select * from Kullanicilar" )
for i in x:
    print(i.KullaniciAdi)


