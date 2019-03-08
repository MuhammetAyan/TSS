from xml.etree import ElementTree as ET
import re


pAtt = re.compile('\[\[[a-zA-Z][a-zA-Z0-9]*\]\]')


def Compailer(r, filename: str, fhtm=None, i=0):
    #print("{}{}:".format(i * "\t", r.tag))
    fcom = open("./Components/{}.html".format(str(r.tag).replace(".", "/")), mode="r", encoding="UTF-8")
    if fhtm is None:
        fhtm = open("../Views/{}".format(filename), mode="w", encoding="UTF-8")
    component = ""
    for line in fcom.readlines():
        component += "\t" * i + line
    ComAtt = pAtt.findall(component)
    for a in ComAtt:
        a = str(a).replace("[[", "").replace("]]", "")
        if a != "render":
            try:
                component = component.replace("[[{}]]".format(a), r.attrib[a])
            except:
                component.replace("[[{}]]".format(a), "")
                print('\t!"{}" özelliği eksik.'.format(a))

                # raise ValueError("Component üzerindeki '{}' için değer girilmemiş.".format(a))
    if component.__contains__("[[render]]"):
        fhtm.write(component[0:component.index("[[render]]")])
        fhtm.flush()
        if len(r.getchildren()) > 0:
            for p in r.getchildren():
                Compailer(p, filename, fhtm, i+1)
                fhtm.flush()
        fhtm.write(component[component.index("[[render]]") + 10:])
    else:
        fhtm.write(component)
    fhtm.flush()
    fcom.close()


def CompailerAll():
    import os
    for root, dirs, files in os.walk("./Input"):
        print("f", root.replace("./Input\\", "../Views\\"))
        if not os.path.exists(root.replace("./Input\\", "../Views\\")):
            os.makedirs(root.replace("./Input\\", "../Views\\"))
        for file in files:
            fullPath = os.path.join(root, file)
            print(fullPath)
            tree = ET.parse(fullPath)
            rootTree = tree.getroot()
            Compailer(rootTree, fullPath.replace("./Input\\", "").replace(".xml", ".html"))


CompailerAll()
