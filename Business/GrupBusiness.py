
from Data.DBConnect import select
from Data.DBModels import *
from Models.GrupModel import *
from Models.GrupStratejilerModel import *

def getGruplar(ustGrupid):
    """
    Üst grubun altındaki tüm grupları adları ve id'lerini getirir.
    :param ustGrupid:
    :return:
    """
    datalist: list[dbMalzemeGruplariModel] = select("select * from MalzemeGruplari where UstGrupId = {}".format(ustGrupid))
    temp: list[GrupModel] = []
    for data in datalist:
        x = GrupModel(data.id, data.GrupAdi)
        temp.append(x.__dict__)
    return temp

def GetGrupStratejileri(Grupid):
    datalist: list[dbGrupStratejilerModel] = select("select * from GrupStratejiler where GrupId = {}".format(Grupid))
    temp: list[GrupStratejilerModel] = []
    GrupStratejiler = []
    for data in datalist:
        y = GrupStratejilerModel('Maliyet',data.Maliyet)  # kritere o stunun ısmını koymalı
        temp.append(y.__dict__)

        y = GrupStratejilerModel('Kalite',data.Kalite)  # kritere o stunun ısmını koymalı
        temp.append(y.__dict__)

        y = GrupStratejilerModel('Memnuniyet',data.Memnuniyet)  # kritere o stunun ısmını koymalı
        temp.append(y.__dict__)

        y = GrupStratejilerModel('Teslimat',data.Teslimat)  # kritere o stunun ısmını koymalı
        temp.append(y.__dict__)

    return temp
