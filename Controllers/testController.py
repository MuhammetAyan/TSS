from Network.bottle import route, static_file, post, request,get, response,redirect
import json

print("testController")
"""
Bu dosya test dosyasıdır. Gerçek projeye dahil değildir.
"""


@route('/')
def index():
    redirect("/test/index.html")


@route('/test/')
@route('/test/<filename>')
def test(filename="index.html"):
    return static_file(filename, root="./Test/")


@post('/saveservices')
def save():
    print("save")
    fs = open("./Data/WebServices.json", mode="w", encoding="UTF-8")
    data = {'services': request.json.get('services')}
    print(data)
    fs.write(json.dumps(data))
    fs.close()


@get('/loadservices')
def load():
    print('load')
    fs = open("./Data/WebServices.json", mode="r", encoding="UTF-8")
    data = fs.read()
    print("data", data)
    fs.close()
    response.set_header("Content-Type", "application/json")
    print(json.loads(data, encoding="UTF-8"))
    return json.loads(str(data), encoding="UTF-8")
