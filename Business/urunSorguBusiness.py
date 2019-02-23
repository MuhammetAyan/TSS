from Data.DBConnect import select
from Data.DBModels import *


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
