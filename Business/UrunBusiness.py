from Data.DBConnect import DB
from Data.DBModels import *
import Models.UrunBilgiModel as ubm
import Models.UrunTedarikciBilgileriModel as tbm

def UrunleriGetir(arama):
    """
    [{'stok': 'stok kodu', 'grup': 'grup adı'}]
    arama metni ile başlayan stok koduna sahip ürünleri ve bağlı olduğu grubun adını döndürür. .
    :param search: Stok kodu.
    :return:
    """
    datalist: list[dbUrunlerModel] = DB.select("select * from Urunler where StokKodu LIKE '{}%'".format(arama))
    Urunler : list[ubm.UrunBilgiModel] = []

    for urun in datalist:
        GrupId = urun.GrupId
        Grup : list[dbMalzemeGruplariModel] = DB.select("select * from MalzemeGruplari where id = '{}'".format(GrupId))

        x = ubm.UrunBilgiModel(urun.StokKodu, Grup[0].GrupAdi)
        Urunler.append(x.__dict__)

    return Urunler




def UrunAdresi(stokkodu):
    Urun: list[dbUrunlerModel] = DB.select("select top 1 * from Urunler where StokKodu = '{}'".format(stokkodu))
    GrupId = Urun[0].GrupId
    Gruplar = []
    while GrupId != 0:
        Grup: list[dbMalzemeGruplariModel] = DB.select("select * from MalzemeGruplari where id = '{}'".format(GrupId))
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
    DB.query("update Urunler set DefTedId = '{}' where StokKodu= '{}'".format(TedarikciId,StokKodu))

    #return 0  yapmaya gerek varmı bu halde çalışıyor ??????




def TedarikciBilgi(stokkodu):
    Tedarikci: list[dbTedarikUrunleriModel] = DB.select("select * from TedarikUrunleri where StokKodu = '{}'".format(stokkodu))

    TedarikciBilgi : list[tbm.UrunTedarikciBilgileriModel] = []

    for Ted in Tedarikci:

        Tedid = Ted.TedarikciId

        #TedAdi: list[dbTedarikciModel] = DB.select("select * from Tedarikci where id = '{}'".format(Tedid))
        #TedAdi2= TedAdi[0].TedarikciAdi

        TedAdi = DB.select("select TedarikciAdi from Tedarikci where id = '{}'".format(Tedid),True)
        TedAhpPuan = DB.select("select AHPPuan from sonuclar where StokKodu = '{}'".format(Ted.StokKodu),True)
        TedAhpPuan=TedAhpPuan[0][0] if len(TedAhpPuan) > 0 else 0

        x = tbm.UrunTedarikciBilgileriModel(Tedid,TedAdi[0][0],TedAhpPuan,False)
        TedarikciBilgi.append(x.__dict__)

    return TedarikciBilgi





