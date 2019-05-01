from Data.DBModels import DB, dbTedarikciModel, dbUrunTedarikciModel, dbSonuclarModel, dbGrupStratejilerModel, dbUrunlerModel
import Business.AHPBusiness as Ahp
import Models.AppModel as apm
from Models.GrupStratejilerModel import GrupStratejilerModel
import Business.UrunBusiness as UrunBusiness


def OranGrafigi():
    DB()
    Oran = DB.select(" declare @ahp float ,@tüm float , @oran float " +
    " select @ahp = count(u.StokKodu) from Urunler u inner join Sonuclar s on  s.StokKodu = u.StokKodu where s.AHPUyumSirasi = 1 and u.DefTedId=s.TedarikciId " +
    " select @tüm = count(id) from Urunler " +
    " select @oran = @ahp/@tüm *100 " +
    " select @oran as oran" ,True)

    x = apm.AppModel(Oran)

    return Oran[0][0]


def Optimizasyon():
    # stkkoduCur = DB.Cursor()
    DB()
    DB.query("delete from Sonuclar where 1=1")
    StokKodlari: list = DB.select("select distinct stokkodu from UrunTedarikci", True)
    # stkkoduCur.start("select distinct stokkodu from UrunTedarikci")
    # while stkkoduCur.fetch():
    for S in StokKodlari:
        StokKodu = S[0]
        # StokKodu = stkkoduCur.val()[0]  # Bu stokkodu ile ilgili gruplama yapılacak.
        # Aynı stokkoduna sahip çıkarımlar select ile getiriliyor.
        UrunTedarkiciler: list[dbUrunTedarikciModel] = DB.select("select * from UrunTedarikci where stokkodu = '{}'".format(StokKodu))
        tablo = []  # stokkodu ile ilgili tüm tedarikcilerin id ve kriter puanlarını tutar.
        for UT in UrunTedarkiciler:
            tedarikci: dbTedarikciModel = dbTedarikciModel.select(UT.TedarikciId)
            Memnuniyet = tedarikci.Memnuniyet * 0.8 + 10
            tablo.append({"ted": UT.TedarikciId, "kalite": UT.KalitePuan, "maliyet": UT.MaliyetPuan, "teslimat": UT.TeslimatPuan, "memnuniyet": tedarikci.Memnuniyet})
        liste = {'kalite': [], 'maliyet': [], 'teslimat': [], 'memnuniyet': []}
        for row in tablo:
            for key in liste:
                liste[key].append(row[key])
        tMatris = []  # tedarikciler matrisi
        for row in tablo:
            kriterDegerleri = [row['ted']]  # tedarikciId'si eklendi
            for key in liste:
                kriterDegeri = Ahp.matrisSatirOrtYakinsa(row[key], liste[key])
                kriterDegerleri.append(kriterDegeri)
            tMatris.append(kriterDegerleri)
        # strateji tablosuna ait veriler
        urun: dbUrunlerModel = DB.select("select top 1 * from Urunler where stokkodu = '{}'".format(StokKodu))[0]
        strateji: list = UrunBusiness.GetUrunStratejisi(StokKodu)
        # strateji: dbGrupStratejilerModel = DB.select("select top 1 * from GrupStratejiler where GrupId = '{}'".format(urun.GrupId))
        sMatris = []

        def getir(l: list, kriter: str):
            for d in l:
                if dict(d)["kriter"] == kriter:
                    return dict(d)["val"]
            return None
        sMatris.append(getir(strateji, "Kalite"))
        sMatris.append(getir(strateji, "Maliyet"))
        sMatris.append(getir(strateji, "Teslimat"))
        sMatris.append(getir(strateji, "Memnuniyet"))
        sonuclar = Ahp.SonCarpim(sMatris, tMatris)
        for ted in sonuclar:
            # sonuc = {'ted': /*Ahp Puani*/}
            # insert/update
            model = dbSonuclarModel()
            model.StokKodu = StokKodu
            model.TedarikciId = ted
            model.AHPPuan = sonuclar[ted][0]
            model.AHPUyumSirasi = sonuclar[ted][1]
            model.insert()
