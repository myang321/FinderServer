# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('finder_server', '0003_users_phone_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='report',
            name='timestamp',
            field=models.CharField(max_length=100),
        ),
    ]
