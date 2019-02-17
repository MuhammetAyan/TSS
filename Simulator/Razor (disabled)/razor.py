from Network.bottle import static_file
import os


def razor(path: str, viewbag=None)->str:
    if not path.endswith(".html"):
        return static_file(path, root="./Simulator")
    root = os.path.join(os.path.abspath("."), '')
    if root.strip("/\\").endswith("Razor (disabled)"):
        root = os.path.join(os.path.abspath(".."), '')
    else:
        root = os.path.join(os.path.abspath("./Simulator"), '')
    path = os.path.abspath(os.path.join(root, path.strip('/\\')))
    fs = open(path, mode="r", encoding="utf-8")
    content = ""
    for line in fs.readlines():
        content += line
    output = ""
    temp = ""
    case = 0
    for c in content:
        if case == 0:  # read html
            if c == '{':
                case = 1
            else:
                output += str(c)
        elif case == 1:  # enter razor
            if c == '{':
                case = 2
            else:
                case = 0
                output += str('{') + str(c)
        elif case == 2:  # razor read
            if c == "}":
                case = 3
            else:
                temp += str(c)
        elif case == 3:  # leave razor
            if c == "}":
                case = 0
                if temp != "":
                    output += str(eval(temp.replace(";", "\n"), {"ViewBag": viewbag}))
                temp = ""
            else:
                temp += str(c)
    return output
