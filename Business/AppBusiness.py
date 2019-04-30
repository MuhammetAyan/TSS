from Data.DBModels import DB, dbTedarikciModel, dbUrunTedarikciModel, dbSonuclarModel
import Business.AHPBusiness as Ahp
import Models.AppModel as apm


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
    stkkoduCur = DB.Cursor()
    DB()
    DB.query("delete from Sonuclar where 1=1")
    stkkoduCur.start("select distinct stokkodu from UrunTedarikci")
    while stkkoduCur.fetch():
        StokKodu = stkkoduCur.val()[0]  # Bu stokkodu ile ilgili gruplama yapılacak.
        # Aynı stokkoduna sahip çıkarımlar select ile getiriliyor.
        UrunTedarkiciler: list[dbUrunTedarikciModel] = DB.select("select * from UrunTedarikci where stokkodu = '{}'".format(StokKodu))
        tablo = []  # stokkodu ile ilgili tüm tedarikcilerin id ve kriter puanlarını tutar.
        for UT in UrunTedarkiciler:
            tedarikci: dbTedarikciModel = dbTedarikciModel.select(UT.TedarikciId)
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
        # sorgu yapılacak
        sMatris = []
        sonuclar = Ahp.SonCarpim(sMatris, tMatris)
        for ted in sonuclar:
            # sonuc = {'ted': /*Ahp Puani*/}
            # insert/update
            model = dbSonuclarModel()
            model.StokKodu = StokKodu
            model.TedarikciId = ted
            model.AHPPuan = sonuclar[ted]
            model.AHPUyumSirasi = -1
            model.insert()
