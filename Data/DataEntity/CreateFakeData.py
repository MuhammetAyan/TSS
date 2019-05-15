from Data.DBModels import *
import datetime
import random
DB()
TedarikciUrunler = DB.select("select TedarikciId, StokKodu from TedarikUrunleri", True)

fs = open("./degerlendirme.txt", mode="r", encoding="utf-8")
Degerlendirmeler = [[tuple(int(t.strip()) if i == 0 else t.strip() for t in x.split("-"))
          for i, x in enumerate(y.split(' ')) if (x.__contains__("-") and i == 0) or x != ""]
         for y in fs.readlines() if (not y.startswith("#")) and y.strip() != ""]
fs.close()

SozlukDeg = {data[1][0]: data[0] for data in Degerlendirmeler}

fs = open("./Karakterler.txt", mode="r", encoding="utf-8")
Karakterler = [[SozlukDeg[x.strip()]
          for x in y.split(' ') if x != ""]
         for y in fs.readlines() if (not y.startswith("#")) and y.strip() != ""]
fs.close()

fs = open("./MalKabulVerileri.sql", mode="w", encoding="utf-8")
fs.writelines("DELETE FROM MalKabul WHERE 1=1;\n")
fs.writelines("DELETE FROM UrunTedarikci WHERE 1=1;\n")
fs.writelines("DELETE FROM Sonuclar WHERE 1=1;\n")
fs.writelines("UPDATE Tedarikci SET Memnuniyet=50, MemnuniyetAgirlik=1 WHERE 1=1;\n")
for TU in TedarikciUrunler:
    TedId, StokKodu = TU[0], TU[1]
    Karakter = random.choice(Karakterler)
    for i in range(random.randint(1, 10)):
        maliyet, kalite, teslimat, memnuniyet = tuple(random.randint(x[0], x[1])*10 for x in Karakter)
        tarih = datetime.datetime.today().strftime('%d-%m-%Y')
        fs.writelines("INSERT INTO MalKabul VALUES ('{}', {}, {}, {}, {}, {}, '{}', {});\n"
              .format(StokKodu, TedId, maliyet, kalite, teslimat, memnuniyet, tarih, random.randint(1, 500)))
