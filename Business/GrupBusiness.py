from Data.DBConnect import select
from Data.DBModels import *
from Models.GrupModel import *


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
