# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
from .models import *

admin.site.register(Project)
admin.site.register(Dependency)
# admin.site.register(Colaborador)
