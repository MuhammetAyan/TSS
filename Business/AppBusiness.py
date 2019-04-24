from Data.DBModels import DB, dbTedarikciModel, dbUrunTedarikciModel
import Models.AppModel as apm


def OranGrafigi():

    Oran = DB.select(" declare @ahp float ,@tüm float , @oran float " +
    " select @ahp = count(u.StokKodu) from Urunler u inner join Sonuclar s on  s.StokKodu = u.StokKodu where s.AHPUyumSirasi = 1 and u.DefTedId=s.TedarikciId " +
    " select @tüm = count(id) from Urunler " +
    " select @oran = @ahp/@tüm *100 " +
    " select @oran as oran" ,True)

    x = apm.AppModel(Oran)

    return Oran[0][0]


def Optimizasyon():
    stkkoduCur = DB.Cursor()
    stkkoduCur.start("select distinct stokkodu from UrunTedarikci")
    while stkkoduCur.fetch():
        StokKodu = stkkoduCur.val()[0]  # Bu stokkodu ile ilgili gruplama yapılacak.
        # Aynı stokkoduna sahip çıkarımlar select ile getiriliyor.
        UrunTedarkiciler: list[dbUrunTedarikciModel] = DB.select("select * from UrunTedarikci where stokkodu = '{}'".format(StokKodu))
        for UT in UrunTedarkiciler:

            # yaşlandırmalı algoritma uygulanacak
            # fonksiyon yazılabilir
            pass
