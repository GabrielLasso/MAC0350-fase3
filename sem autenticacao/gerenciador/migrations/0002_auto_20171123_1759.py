# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2017-11-23 19:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gerenciador', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='dependencias',
            name='projeto',
        ),
        migrations.AlterField(
            model_name='dependencia',
            name='nome',
            field=models.CharField(max_length=200),
        ),
        migrations.DeleteModel(
            name='Dependencias',
        ),
    ]
