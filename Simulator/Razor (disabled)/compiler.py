import os
from Simulator.Razor.razor import *


def compiler():
    root = os.path.join(os.path.abspath("."), '')
    path = os.path.abspath(os.path.join(root, "property.json".strip('/\\')))
    fs = open(path, mode="r", encoding="utf-8")
    jsontext: str = ""
    for line in fs.readlines():
        jsontext += line + "\r\n"
    fs.close()
    property: list = eval(jsontext)
    del fs
    del jsontext
    root = os.path.join(os.path.abspath(".."), '')
    for file in property:
        print("Oluşturuluyor: '{}'".format(file["Name"]))
        path = os.path.abspath(os.path.join(root, file["Name"].strip('/\\')))
        fs = open(path, "w", encoding="utf-8")
        viewbag = {"title": file["Name"], "css": css(file["css"]), "apptitle": file["app"]["Name"]}
        fs.write(razor("Shared/header.html", viewbag))
        fs.write(razor("Bodies/" + file["body"], []))
        viewbag = {"script": js(file["script"])}
        fs.write(razor("Shared/footer.html", viewbag))
        fs.close()
        print("TAMAM")


def css(csslink: list)->str:
    temp = ""
    for csstext in csslink:
        temp += """<link rel="stylesheet" href="{}">\r\n""".format(csstext)
    return temp


def js(jslink:list)->str:
    temp = ""
    for js in jslink:
        temp += """<script src="{}"></script>\r\n""".format(js)
    return temp


compiler()
