
"""
grup id'si girilen malzeme grubuna ait strateji verisi döndürülecek.
[{'Kriter1': 'Maliyet', 'Kriter2': 'Teslimat', 'Oran': 5}]
"""
class GrupStratejiOranlariModel(object):
    def __init__(self, Kriter1,Kriter2,Oran):
        self.Kriter1: str = Kriter1
        self.Kriter2: float = Kriter2
        self.Oran: float = Oran
