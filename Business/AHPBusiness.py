def matrisSutunToplami(matris: list) -> list:
    toplam = []
    for x in range(0, len(matris[0])):
        top = 0
        for y in range(0, len(matris)):
            top += matris[y][x]
        toplam.append(top)
    return toplam


def matrisAgirlikBolumu(matris: list, sutunToplami: list) -> list:
    result = []
    for y in range(0, len(matris)):
        result.append([])
        for x in range(0, len(matris[y])):
            result[y].append(matris[y][x] / sutunToplami[x])
    return result


def matrisAgirlikCarpimi(matris: list, sutunAgirliklari: list) -> list:
    result = []
    for y in range(0, len(matris)):
        result.append([])
        for x in range(0, len(matris[y])):
            result[y].append(matris[y][x] * sutunAgirliklari[x])
    return result


def matrisSatirOrtalamasi(matris: list) -> list:
    result = []
    for y in range(0, len(matris)):
        toplam = 0
        for x in range(0, len(matris[y])):
            toplam += matris[y][x]
        result.append(toplam / len(matris[y]))
    return result
