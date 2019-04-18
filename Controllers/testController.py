from Network.bottle import route, static_file, post, request,get, response,redirect
import json
from Test import TEST

TEST("testController")
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
    TEST("save")
    fs = open("./Data/WebServices.json", mode="w", encoding="UTF-8")
    data = {'services': request.json.get('services')}
    fs.write(json.dumps(data))
    fs.close()


@get('/loadservices')
def load():
    TEST('load')
    fs = open("./Data/WebServices.json", mode="r", encoding="UTF-8")
    data = fs.read()
    fs.close()
    response.set_header("Content-Type", "application/json")
    TEST(json.loads(data, encoding="UTF-8"))
    return json.loads(str(data), encoding="UTF-8")

