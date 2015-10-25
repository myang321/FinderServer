# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('finder_server', '0002_report_uid'),
    ]

    operations = [
        migrations.AddField(
            model_name='users',
            name='phone_status',
            field=models.IntegerField(default=0, help_text=b'1 means lost, 0 means not lost'),
            preserve_default=False,
        ),
    ]
