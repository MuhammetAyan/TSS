import pyodbc as db


class DB:

    Models = {}
    connectionString = "Driver={SQL Server};" \
                       "Server=(local);" \
                       "Database=TSSDB;" \
                       "Trusted_Connection=yes;" \
                       "User Id=user;" \
                       "Password=12345678;"

    cnxn = None

    def __init__(self):
        if DB.cnxn is None:
            DB.cnxn = db.connect(DB.connectionString)

    @staticmethod
    def query(sql: str):
        """ insert ,update işlemleri için"""
        DB()
        cursor = DB.cnxn.cursor()
        cursor.execute(sql)
        DB.cnxn.commit()  # değişiklikleri kaydediyor.
        cursor.close()

    @staticmethod
    def select(sql: str, IsFree=False):
        """ select işlemleri için"""
        DB()
        cursor = DB.cnxn.cursor()
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
                return eval("DB.Models['db" + modelname + "Model']")
            for row in cursor.fetchall():
                # result.append(dbModel(row))
                result.append(FindModel(sql)(row))
            cursor.close()
            return result

    class Cursor:
        def __init__(self):
            self.cursor = None

        def start(self, sql: str):
            DB()
            self.cursor = DB.cnxn.cursor()
            self.cursor.execute(sql)
            self.data = []
            self._val = None

        def fetch(self):
            if self.data.__len__() == 0:
                self.data = self.cursor.fetchmany(10)
            if self.data.__len__() > 0:
                self._val = self.data.pop(0)
                return self._val
            else:
                self._val = None
                self.cursor.close()
                return None

        def val(self):
            """fetch ile okunan son değeri döndürür."""
            return self._val

        def close(self):
            self.cursor.close()
