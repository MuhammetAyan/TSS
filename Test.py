debug = False
mobileTest = False


def TEST(*values):
    if debug:
        print(*values)


def MOBILETEST(*values):
    if mobileTest:
        print(*values)
