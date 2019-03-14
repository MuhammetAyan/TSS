from Data.DBConnect import select
from Data.DBModels import *
from Models.GrupModel import *

def getList(search, GrupId):
    """
    Stok kodu üzerinden ürünleri listeler.
    :param search: Stok kodu.
    :return:
    """
    datalist: list[dbUrunlerGruplarModel] = select("select * from UrunlerGruplar where 'Urunmu'=1 and 'StokKodu' LIKE '{}%' and 'GrupId' = {}".format(search, GrupId))
    temp = []
    for data in datalist:
        temp.append(data.StokKodu)
    return temp


def getGruplar(ustGrupid):
    """

    :param ustGrupid:
    :return:
    """
    print("grup")
    if ustGrupid == 0:
        datalist: list[dbUrunlerGruplarModel] = select("select * from UrunlerGruplar where Urunmu=0 and GrupId = NULL")
    else:
        datalist: list[dbUrunlerGruplarModel] = select("select * from UrunlerGruplar where Urunmu=0 and GrupId = {}".format(ustGrupid))
    temp: list[GrupModel] = []
    for data in datalist:
        x = GrupModel(data.id, data.StokAdi)
        temp.append(x)
    return temp

