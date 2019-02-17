from Network.bottle import run, template, get, error


@error(404)
def error404(error):
    return 'Nothing here, sorry'


def runserver(host, port):
    run(host=host, port=port)
