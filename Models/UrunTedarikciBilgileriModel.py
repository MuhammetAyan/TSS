
"""[{'id': 0, 'tedarikci': 'tedarikçi adı', 'ahp': 23, 'default': False}]
       uruncontroller ve urunbussinesda kullan     """
class UrunTedarikciBilgileriModel(object):
    def __init__(self, id,tedarikci,ahp,default):
        self.id: int = id
        self.tedarikci: str = tedarikci
        self.ahp: float = ahp
        self.default: bool = default


