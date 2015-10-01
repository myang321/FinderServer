# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Img',
            fields=[
                ('iid', models.AutoField(serialize=False, primary_key=True)),
                ('timestamp', models.BigIntegerField()),
                ('device_name', models.CharField(max_length=100)),
                ('url', models.CharField(max_length=500)),
            ],
        ),
        migrations.CreateModel(
            name='Report',
            fields=[
                ('rid', models.AutoField(serialize=False, primary_key=True)),
                ('timestamp', models.BigIntegerField()),
                ('device_name', models.CharField(max_length=100)),
                ('location_x', models.FloatField()),
                ('location_y', models.FloatField()),
                ('ip_addr', models.CharField(max_length=50)),
                ('wifi_name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('uid', models.AutoField(serialize=False, primary_key=True)),
                ('username', models.CharField(unique=True, max_length=50)),
                ('password', models.CharField(max_length=50)),
            ],
        ),
    ]
