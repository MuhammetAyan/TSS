from Data.DBConnect import select
from Data.DBModels import *
from Models.GrupModel import *

"""
def getList(search, GrupId):
    ""
    Stok kodu üzerinden ürünleri listeler.
    :param search: Stok kodu.
    :return:
    ""
    datalist: list[db] = select("select * from UrunlerGruplar where 'Urunmu'=1 and 'StokKodu' LIKE '{}%' and 'GrupId' = {}".format(search, GrupId))
    temp = []
    for data in datalist:
        temp.append(data.StokKodu)
    return temp
"""


def UrunAdresi(stokkodu):
    Urun: list[dbUrunlerModel] = select("select top 1 * from Urunler where StokKodu = '{}'".format(stokkodu))
    GrupId = Urun[0].GrupId
    Gruplar = []
    while GrupId != 0:
        Grup: list[dbMalzemeGruplariModel] = select("select * from MalzemeGruplari where id = '{}'".format(GrupId))
        UstGrupId =Grup[0].UstGrupId
        Gruplar.append(Grup[0].GrupAdi)
        GrupId = UstGrupId

    Gruplar.append(".")
    Gruplar.reverse()
    return Gruplar
