# -*- coding: utf-8 -*-

from django.contrib import messages
from django.shortcuts import redirect
from django.db import connection


def queries_middleware(get_response):
    def middleware(request):
        response = get_response(request)
        print("\n\nQUERIES")
        print(connection.queries)
        return response

    return middleware
