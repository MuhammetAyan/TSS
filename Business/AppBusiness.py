from Data.DBConnect import DB
import Models.AppModel as apm

def OranGrafigi():

    Oran = DB.select(" declare @ahp float ,@tüm float , @oran float " +
    " select @ahp = count(u.StokKodu) from Urunler u inner join Sonuclar s on  s.StokKodu = u.StokKodu where s.AHPUyumSirasi = 1 and u.DefTedId=s.TedarikciId " +
    " select @tüm = count(id) from Urunler " +
    " select @oran = @ahp/@tüm *100 " +
    " select @oran as oran" ,True)

    x = apm.AppModel(Oran)

    return Oran[0][0]
