class UstGrupModel(object):
	def __init__(self, id, adi, kalitim=False):
		self.id: int = id
		self.adi: str = adi
		self.kalitim: bool = kalitim
