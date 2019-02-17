import pyodbc
cnxn = pyodbc.connect("Driver={SQL Server};"
                      "Server=.;"
                      "Database=testDB;"
                      "Trusted_Connection=yes;"
                      "User Id=user;"
                      "Password=12345678;"
                      )
"""Provider=SQLOLEDB.1;Password=12345678;Persist Security Info=True;User ID=user;Initial Catalog=testDB;Data Source=."""

cursor = cnxn.cursor()
# cursor.execute('CREATE TABLE Test1(id int, name varchar(50));')
cnxn.commit()  # değişiklikleri kaydediyor.
# cursor.execute("DROP TABLE Test1;")
cursor.execute('Select * from ValueTable')
for row in cursor:
    for col in row:
        print(col, end=", ")
    print("")
cnxn.commit()
cursor.close()
