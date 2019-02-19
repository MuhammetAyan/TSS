import pyodbc as db

cnxn = db.connect("Driver={SQL Server};"
                      "Server=(local);"
                      "Database=TSSDB;"
                      "Trusted_Connection=yes;"
                      "User Id=user;"
                      "Password=12345678;"
                      )

# cursor.execute('CREATE TABLE Test1(id int, name varchar(50));')
# cursor.execute("DROP TABLE Test1;")


def query(sql: str):
    """ insert ,update işlemleri için"""
    cursor = cnxn.cursor()
    cursor.execute(sql)
    cnxn.commit()  # değişiklikleri kaydediyor.
    cursor.close()


def select(sql: str, IsFree=False):
    """ select işlemleri için"""
    cursor = cnxn.cursor()
    cursor.execute(sql)
    result = []
    if IsFree:
        for row in cursor.fetchall():
            # result.append(dbModel(row))
            result.append(row)
        cursor.close()
        return result
    else:
        def FindModel(sql: str):
            p = sql.lower().find(" from ")
            modelname = ""
            for i in range(p+6, len(sql)):
                c = sql[i]
                if c != ' ':
                    modelname += c
                else:
                    break
            return eval("db" + modelname + "Model")
        for row in cursor.fetchall():
            # result.append(dbModel(row))
            result.append(FindModel(sql)(row))
        cursor.close()
        return result


# query("insert Kullanicilar VALUES('User', '1234', 'Kullanıcı')")
# query("delete from Kullanicilar Where KullaniciAdi='User'")


"""
x = select("select * from Kullanicilar")
print("Kullanıcılar:")
print("Id", "Kullanıcı Adı", "Şifre", "Rol")
for i in x:
    print(i.id, i.KullaniciAdi, i.Sifre, i.Rol)
"""
