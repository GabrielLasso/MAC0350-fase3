# -*- coding: utf-8 -*-

from django.db import connection


def queries_middleware(get_response):
    def middleware(request):
        response = get_response(request)
        print "\n\nPostgreSQL"
        print(connection.queries)
        return response

    return middleware
