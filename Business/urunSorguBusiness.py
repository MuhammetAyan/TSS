from Data.DBConnect import select
from Data.DBModels import *
from Models.GrupModel import *

def getList(search):
    """
    Stok kodu üzerinden ürünleri listeler.
    :param search: Stok kodu.
    :return:
    """
    datalist: list[dbUrunlerGruplarModel] = select("select * from UrunlerGruplar where StokKodu LIKE '{}%'".format(search))
    temp = []
    for data in datalist:
        temp.append(data.StokKodu)
    return temp


def getGruplar(ustGrupid):
    """

    :param ustGrupid:
    :return:
    """
    datalist: list[dbUrunlerGruplarModel] = select("select * from UrunlerGruplar where Urunmu=1 and Grupid ={} '".format(ustGrupid))
    temp = []
    for data in datalist:
        x=GrupModel(data.id,data.StokAdi)
        temp.append(x)
    return temp

