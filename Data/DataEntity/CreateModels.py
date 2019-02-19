from Data.DBConnect import select


def CreateModels():
    f = open("../DBModels.py", mode="w", encoding="utf8")
    print("Modeller oluşturuluyor...")

    def WriteClass(name: str):
        print("\n{}:\t".format(name), end="")
        f.write("\n\nclass {}(object):\n".format(name))
        f.write("\tdef __init__(self, data: tuple):\n")

    def WriteAtt(attribute: str, i: int):
        print(attribute[0] + ", ", end="")
        f.write("\t\tself.{} = data[{}]\n".format(attribute[0], i))

    Tables = select("select name, object_id from sys.tables WHERE type = 'U'", IsFree=True)
    n = 0
    for table in Tables:
        WriteClass(table[0])
        n += 1
        columns = select("select name, /*max_length,*/ (select name from sys.types WHERE user_type_id = sys.all_columns.user_type_id)user_type from sys.all_columns WHERE object_id=" + str(table[1]), IsFree=True)
        i = 0
        for col in columns:
            WriteAtt(col, i)
            i += 1

    print("\n\n{} adet model oluştuldu.".format(n))
CreateModels()

