import datetime


class dbGrupStratejilerModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.GrupId: int = data[1]
		self.Maliyet: float = data[2]
		self.Kalite: float = data[3]
		self.Teslimat: float = data[4]
		self.Memnuniyet: float = data[5]


class dbKullanicilarModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.KullaniciAdi: str = data[1]
		self.Sifre: str = data[2]
		self.Rol: str = data[3]


class dbMalKabulModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.MaliyetPuan: int = data[3]
		self.KalitePuan: int = data[4]
		self.TeslimatPuan: int = data[5]
		self.MemnuniyetPuan: int = data[6]
		self.Tarih: datetime.datetime = data[7]
		self.Adet: int = data[8]


class dbMalzemeGruplariModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.GrupAdi: str = data[1]
		self.UstGrupId: int = data[2]


class dbSonuclarModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.AHPPuan: float = data[3]
		self.AHPUyumSirasi: int = data[4]


class dbTedarikciModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.TedarikciAdi: str = data[1]
		self.Memnuniyet: float = data[2]
		self.MemnuniyetAdedi: float = data[3]


class dbTedarikUrunleriModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.BirimFiyat: float = data[3]


class dbUrunlerModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.StokAdi: str = data[2]
		self.GrupId: int = data[3]
		self.DefTedId: int = data[4]


class dbUrunStratejilerModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.MaliyetPuan: float = data[2]
		self.KalitePuan: float = data[3]
		self.TeslimatPuan: float = data[4]
		self.MemnuniyetPuan: float = data[5]


class dbUrunTedarikciModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.MaliyetPuan: float = data[3]
		self.MaliyetAdet: float = data[4]
		self.KalitePuan: float = data[5]
		self.KaliteAdet: float = data[6]
		self.TeslimatPuan: float = data[7]
		self.TeslimatAdet: float = data[8]
