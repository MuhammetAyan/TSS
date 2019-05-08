from Data.DBModels import *
import Models.TedarikciModel as tm
import Models.TedarikciUrunleriModel as tum

def TedarikciSorgula(arama):
    """
    arama metnini içeren tedarikçileri listeler.
    ( response'da 'defNo' ile bahsedilen bu tedarikçiden kaç tane ürün varsayılan olarak alınıyor.)
    :param arama:
    :return:
    """
    TedarikciListesi : list[tm.TedarikciModel] =[]
    Tedarikciler : list[dbTedarikciModel] = DB.select("select * from Tedarikci where TedarikciAdi like '{}%'".format(arama))

    for Tedarikci in Tedarikciler:

        DefTedSayisi = DB.select("select count(id) from Urunler where DefTedId = '{}'".format(Tedarikci.id),True)
        DefTedSayisi = DefTedSayisi[0][0] if len(DefTedSayisi) > 0 else 0

        x = tm.TedarikciModel(Tedarikci.id,Tedarikci.TedarikciAdi,DefTedSayisi)
        TedarikciListesi.append(x.__dict__)

    return TedarikciListesi

def TedarikciUrunleri(tedarikciId):   #burada urunid yerine stok kodunu geri döndürsek mi acaba ?????????
    """
    Tedarikçi sorgulamada bir tedarikçinin bilgileri gösterilirken tedarikçinin sattığı ürünler ve
    bu ürünlerden hangilerini varsayılan olarak aldığımızı göstermek için bu servis kullanılacak.
     [{'StokKodu': 'stokkodu', 'UrunAdi': 'Ürün adı', 'AHP': 24.3, 'AHPSira': 2, 'default': true}]
    :param tedarikciId:
    :return:
    """
    tedarikciId = int(tedarikciId)
    TedarikciUrunleriListe : list[tum.TedarikciUrunleriModel] = []
    TedarikciUrun : list[dbTedarikUrunleriModel] = DB.select("select * from TedarikUrunleri where TedarikciId = '{}'".format(tedarikciId))

    for TedarikciUrunu in TedarikciUrun:

        StokKodu = TedarikciUrunu.StokKodu
        Urunler : list[dbUrunlerModel] = DB.select("select * from Urunler where StokKodu = '{}'".format(StokKodu))
        UrunAdi = Urunler[0].StokAdi
        DefTedId = Urunler[0].DefTedId

        # Sonuclar : list[dbSonuclarModel] =DB.select("select * from Sonuclar where TedarikciId = '{}'".format(tedarikciId))   bu 3 satır yerine aşşada4 satır yazıldı ??????? neden bu 3 ü olmuyor
        # AhpPuan = Sonuclar[0].AHPPuan if AhpPuan > 0 else 0
        # AhpSira = Sonuclar[0].AHPUyumSirasi if len(AhpSira) > 0 else 0

        AhpPuan= DB.select("select AHPPuan from sonuclar where TedarikciId = '{}' and StokKodu = '{}'".format(tedarikciId, StokKodu), True)
        AhpPuan= AhpPuan[0][0] if len(AhpPuan) > 0 else 0

        AhpSira= DB.select("select AHPUyumSirasi from sonuclar where TedarikciId = '{}' and StokKodu = '{}'".format(tedarikciId, StokKodu), True)
        AhpSira= AhpSira[0][0] if len(AhpSira) > 0 else 0

        Default = DefTedId == tedarikciId

        x = tum.TedarikciUrunleriModel(StokKodu,UrunAdi,AhpPuan,AhpSira,Default)
        TedarikciUrunleriListe.append(x.__dict__)

    return sorted(TedarikciUrunleriListe, key=lambda y: y['AHPSira'])














