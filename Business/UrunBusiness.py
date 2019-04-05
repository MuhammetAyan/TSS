from Data.DBConnect import select,query
from Data.DBModels import *
from Models import UrunTedarikciBilgileriModel
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

def UrunTedarikciDefaultYap(StokKodu,TedarikciId):
    """
    /urunlerisorgula/defaultyap/<stokkodu>/<tedarikciId>
    Verilen stok koduna sahip ürünün varsayılan tedarikçisi olarak id'si verilen tedarikçi yapılacak.
    :param stokkodu:
    :param TedarikciId:
    :return:
    """
    query("update Urunler set DefTedId = '{}' where StokKodu= '{}'".format(TedarikciId,StokKodu))
    #return 0  yapmaya gerek varmı bu halde çalışıyor

def TedarikciBilgi(stokkodu):
    Tedarikci: list[dbTedarikUrunleriModel] = select("select * from TedarikUrunleri where StokKodu = '{}'".format(stokkodu))
    print('tedarikciiddd:',len(Tedarikci))
    TedarikciBilgi : list[UrunTedarikciBilgileriModel] = []
    TedarikcilerBilgileri = []
    for i in range(0,len(Tedarikci)-1):

        Tedid = Tedarikci[i].TedarikciId


        TedAdi: list[dbTedarikciModel] = select("select * from Tedarikci where id = '{}'".format(Tedid))
        TedAdi2= TedAdi[0].TedarikciAdi
        #print('tedadii2:',TedAdi2)

        """
        TedAhp : list[dbSonuclarModel] = select("select * from Sonuclar where TedarikciId = '{}' and StokKodu = '{}' ".format(Tedid, stokkodu))
        TedAhp2 = TedAhp[0].AHPPuan
        print('tedaahp:',TedAhp2)

        
        TedA = select(("select TedarikciAdi from Tedarikci where id = '{}'".format(Tedid)),True)
        print('teda:',TedA)
        
        """
        #x = UrunTedarikciBilgileriModel(Tedid,TedAdi2,5,False)
        #TedarikciBilgi.append(x)

        TedarikciBilgi.append(Tedid)
        #print('tedbilgielr1:',TedarikciBilgi)

        TedarikciBilgi.append(TedAdi2)
        #print('tedbilgielr2:',TedarikciBilgi)

        TedarikcilerBilgileri.append(TedarikciBilgi)
        TedarikciBilgi = []



    return TedarikcilerBilgileri






