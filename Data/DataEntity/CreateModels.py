from Data.DBConnect import select


def CreateModels():
    global temp
    f = open("../DBModels.py", mode="w", encoding="utf8")
    print("Modeller oluşturuluyor...")
    temp = ""
    imports = []

    def WriteClass(name: str):
        global temp
        print("\n{}:\t".format(name), end="")
        temp += "\n\nclass db{}Model(object):\n".format(name)
        temp += "\tdef __init__(self, data: tuple):\n"

    def WriteAtt(attribute: str, i: int):
        global temp
        print(attribute[0] + ", ", end="")
        temp += "\t\tself.{}: {} = data[{}]\n".format(attribute[0], FindType(attribute[1]), i)

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
    tables = select("select name, object_id from sys.tables WHERE type = 'U'", IsFree=True)
    n = 0
    for table in tables:
        WriteClass(table[0])
        n += 1
        columns = select("select name, /*max_length,*/ (select name from sys.types WHERE user_type_id = sys.all_columns.user_type_id)userType from sys.all_columns WHERE object_id=" + str(table[1]), IsFree=True)
        i = 0
        for col in columns:
            WriteAtt(col, i)
            i += 1

    print()
    for imp in imports:
        f.write("import {}\n".format(imp))
        print("\n'{}' kütüphanesi import edildi.".format(imp))
    f.write(temp)
    print("\n{} adet model oluşturuldu.".format(n))


CreateModels()

