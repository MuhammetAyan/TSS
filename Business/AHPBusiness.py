# def matrisSutunToplami(matris: list) -> list:
#     toplam = []
#     for x in range(0, len(matris[0])):
#         top = 0
#         for y in range(0, len(matris)):
#             top += matris[y][x]
#         toplam.append(top)
#     return toplam
#
#
# def matrisAgirlikBolumu(matris: list, sutunToplami: list) -> list:
#     result = []
#     for y in range(0, len(matris)):
#         result.append([])
#         for x in range(0, len(matris[y])):
#             result[y].append(matris[y][x] / sutunToplami[x])
#     return result
#
#
# def matrisAgirlikCarpimi(matris: list, sutunAgirliklari: list) -> list:
#     result = []
#     for y in range(0, len(matris)):
#         result.append([])
#         for x in range(0, len(matris[y])):
#             result[y].append(matris[y][x] * sutunAgirliklari[x])
#     return result
#
#
# def matrisSatirOrtalamasi(matris: list) -> list:
#     result = []
#     for y in range(0, len(matris)):
#         toplam = 0
#         for x in range(0, len(matris[y])):
#             toplam += matris[y][x]
#         result.append(toplam / len(matris[y]))
#     return result


def matrisSatirOrtalamasi(matris: list) -> list:
    LEN = len(matris) # matris kare matris kabul edilir.
    # Sütun toplama
    toplamlar = []
    for j in range(0, LEN):  # sütun
        toplam = 0
        for i in range(0, LEN):  # satır
            toplam += matris[i][j]
        toplamlar.append(toplam)  # j. sütunun toplamı
    # sütunu toplamlara bölüyoruz
    for j in range(0, LEN):  # sütun
        for i in range(0, LEN):  # satır
            matris[i][j] /= toplamlar[j]
    # Herbir satırın ortalamasını alıyoruz.
    ortalamalar = []
    for satir in matris:
        toplam = 0
        for x in satir:
            toplam += x
        ortalamalar.append(toplam / len(satir) * 100)
    return ortalamalar
