from Data.DBConnect import select,query
from Data.DBModels import *
from Models.TedarikciModel import *


def TedarikciSorgula(arama):
    """
    arama metnini içeren tedarikçileri listeler.
    ( response'da 'defNo' ile bahsedilen bu tedarikçiden kaç tane ürün varsayılan olarak alınıyor.)
    :param arama:
    :return:
    """
    TedarikciListesi : list[TedarikciModel] =[]
    Tedarikciler : list[dbTedarikciModel] = select("select * from Tedarikci where TedarikciAdi like '{}%'".format(arama))

    for Tedarikci in Tedarikciler:
        DefTedSayisi = select("select count(id) from Urunler where DefTedId = '{}'".format(Tedarikci.id))
        x = TedarikciModel(Tedarikci.id,Tedarikci.TedarikciAdi,DefTedSayisi)
        TedarikciListesi.append(x)

    return TedarikciListesi
