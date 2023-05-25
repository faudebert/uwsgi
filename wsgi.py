import logging
import sys


def application(env, start_response):
    start_response('200 OK', [('Content-Type','text/html')])

    print('{"type": "coin", "msg": "This is JSON message"}')
    print('Non-JSON message')

    return [b"Hello World"]
