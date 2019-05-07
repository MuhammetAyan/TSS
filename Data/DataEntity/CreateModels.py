from ..DBConnect import DB


def CreateModels():
    global temp
    f = open("../DBModels.py", mode="w", encoding="utf8")
    print("Modeller oluşturuluyor...")
    temp = "from .DBConnect import DB\n"
    imports = []

    def WriteClass(name: str):
        global temp
        print("\n{}:\t".format(name), end="")
        temp += "\n\nclass db{}Model:\n".format(name)
        temp += "\tdef __init__(self, data: tuple = None):\n"

    def WriteAtt(attribute: str, i: int):
        global temp
        print(attribute[0] + ", ", end="")
        temp += "\t\tself.{}: {} = data[{}] if data is not None else None\n".format(attribute[0], FindType(attribute[1]), i)

    def FindType(dbTypeName: str):
        if dbTypeName.__contains__("char"):
            return 'str'
        elif dbTypeName.__contains__("int"):
            return 'int'
        elif dbTypeName == 'float':
            return 'float'
        elif dbTypeName == 'decimal':
            return 'float'
        elif dbTypeName.__contains__('datetime'):
            if not imports.__contains__("datetime"):
                imports.append("datetime")
            return 'datetime.datetime'
        elif dbTypeName == 'bit':
            return 'bool'
        else:
            return 'object'

    def addInsert(columns:str, table:str):
        global temp
        temp += "\n\tdef insert(self):\n"
        temp += """\t\tDB.query(\"\"\"INSERT INTO {} ("""
        for col in columns:
            if str(col[0]) != "id":
                temp += str(col[0]) + ", "
        temp = temp[:-2]
        temp += ") VALUES ("
        temp += "'{}', " * (len(columns)-1)
        temp = temp[:-2]
        temp += ')\"\"\".format("' + str(table[0]) + '", '
        for col in columns:
            if str(col[0]) != "id":
                temp += "self." + str(col[0]) + ", "
        temp = temp[:-2]
        temp += "))\n"
        temp += """\t\tself.id = DB.select("SELECT TOP 1 id FROM {} ORDER BY id DESC", True)[0][0]\n""".format(table[0])

    def addUpdate(columns:str, table:str):
        global temp
        temp += "\n\tdef update(self):\n"
        temp += """\t\tDB.query(\"\"\"UPDATE {} SET """
        for col in columns:
            if str(col[0]) != "id":
                temp += str(col[0]) + "='{}'" + ", "
        temp = temp[:-2]
        temp += " WHERE id = {}\"\"\".format(\"" + str(table[0]) + '\", '
        for col in columns:
            if str(col[0]) != "id":
                temp += "self." + str(col[0]) + ", "
        temp += "self." + str(columns[0][0])
        temp += "))\n"

    def addDelete(table:str):
        global temp
        temp += "\n\tdef delete(self):\n"
        temp += """\t\tDB.query(\"\"\"DELETE FROM """ + str(table[0]) + """ WHERE id = {}\"\"\".format(self.id))\n\n"""

    def addSelect(table:str):
        global temp
        temp += "\n\t@staticmethod\n\tdef select(id):\n"
        temp += """\t\tresult = DB.select(\"\"\"SELECT * FROM """ + str(table[0]) + """ WHERE id = {}\"\"\".format(id))\n"""
        temp += "\t\tif len(result) > 0:\n"
        temp += "\t\t\treturn result[0]\n"
        temp += "\t\treturn None\n\n"

    def exportModels(tables):
        global temp
        temp += "\n"
        for table in tables:
            dbnamemodel = "db{}Model".format(table[0])
            temp += "DB.Models.update({" + "'{}': {}".format(dbnamemodel, dbnamemodel) + "})\n"

    tables = DB.select("select name, object_id from sys.tables WHERE type = 'U'", IsFree=True)
    n = 0
    for table in tables:
        WriteClass(table[0])
        n += 1
        columns = DB.select("select name, /*max_length,*/ (select name from sys.types WHERE user_type_id = sys.all_columns.user_type_id)userType from sys.all_columns WHERE object_id=" + str(table[1]), IsFree=True)
        i = 0
        for col in columns:
            WriteAtt(col, i)
            i += 1

        addInsert(columns, table)
        addUpdate(columns, table)
        addDelete(table)
        addSelect(table)

    exportModels(tables)

    print()
    for imp in imports:
        f.write("import {}\n".format(imp))
        print("\n'{}' kütüphanesi import edildi.".format(imp))
    f.write(temp)
    print("\n{} adet model oluşturuldu.".format(n))


CreateModels()

