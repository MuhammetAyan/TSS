debug = True
mobileTest = True


def TEST(*values):
    if debug:
        print(*values)


def MOBILETEST(*values):
    if mobileTest:
        print(*values)
