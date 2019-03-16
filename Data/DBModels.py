import datetime
import Data.DBConnect


class dbKriterAgirlikModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.MaliyetPuan: float = data[2]
		self.KalitePuan: float = data[3]
		self.TeslimatPuan: float = data[4]
		self.MemnuniyetPuan: float = data[5]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, MaliyetPuan, KalitePuan, TeslimatPuan, MemnuniyetPuan) VALUES ('{}', '{}', '{}', '{}', '{}')""".format("KriterAgirlik", self.StokKodu, self.MaliyetPuan, self.KalitePuan, self.TeslimatPuan, self.MemnuniyetPuan))

class dbKullanicilarModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.KullaniciAdi: str = data[1]
		self.Sifre: str = data[2]
		self.Rol: str = data[3]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (KullaniciAdi, Sifre, Rol) VALUES ('{}', '{}', '{}')""".format("Kullanicilar", self.KullaniciAdi, self.Sifre, self.Rol))

class dbMalKabulModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.MaliyetPuan: float = data[3]
		self.KalitePuan: float = data[4]
		self.TeslimatPuan: float = data[5]
		self.MemnuniyetPuan: float = data[6]
		self.Tarih: datetime.datetime = data[7]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, TedarikciId, MaliyetPuan, KalitePuan, TeslimatPuan, MemnuniyetPuan, Tarih) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}')""".format("MalKabul", self.StokKodu, self.TedarikciId, self.MaliyetPuan, self.KalitePuan, self.TeslimatPuan, self.MemnuniyetPuan, self.Tarih))

class dbSonuclarModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.AHPPuan: float = data[3]
		self.AHPUyumSirasi: int = data[4]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, TedarikciId, AHPPuan, AHPUyumSirasi) VALUES ('{}', '{}', '{}', '{}')""".format("Sonuclar", self.StokKodu, self.TedarikciId, self.AHPPuan, self.AHPUyumSirasi))

class dbTedarikciModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.TedarikciAdi: str = data[1]
		self.MemnuniyetPuani: float = data[2]
		self.MemnuniyetAdedi: float = data[3]
		self.TeslimatPuani: float = data[4]
		self.TeslimatAdedi: float = data[5]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (TedarikciAdi, MemnuniyetPuani, MemnuniyetAdedi, TeslimatPuani, TeslimatAdedi) VALUES ('{}', '{}', '{}', '{}', '{}')""".format("Tedarikci", self.TedarikciAdi, self.MemnuniyetPuani, self.MemnuniyetAdedi, self.TeslimatPuani, self.TeslimatAdedi))

class dbTedarikUrunleriModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.BirimFiyat: float = data[3]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, TedarikciId, BirimFiyat) VALUES ('{}', '{}', '{}')""".format("TedarikUrunleri", self.StokKodu, self.TedarikciId, self.BirimFiyat))

class dbUrunlerGruplarModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.GrupId: int = data[2]
		self.DefaultTedId: int = data[3]
		self.Urunmu: bool = data[4]
		self.StokAdi: str = data[5]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, GrupId, DefaultTedId, Urunmu, StokAdi) VALUES ('{}', '{}', '{}', '{}', '{}')""".format("UrunlerGruplar", self.StokKodu, self.GrupId, self.DefaultTedId, self.Urunmu, self.StokAdi))

class dbUrunTedarikciModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.MaliyetPuan: float = data[3]
		self.MaliyetAdet: float = data[4]
		self.KalitePuan: float = data[5]
		self.KaliteAdet: float = data[6]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, TedarikciId, MaliyetPuan, MaliyetAdet, KalitePuan, KaliteAdet) VALUES ('{}', '{}', '{}', '{}', '{}', '{}')""".format("UrunTedarikci", self.StokKodu, self.TedarikciId, self.MaliyetPuan, self.MaliyetAdet, self.KalitePuan, self.KaliteAdet))