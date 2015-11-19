# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('finder_server', '0005_img_uid'),
    ]

    operations = [
        migrations.AlterField(
            model_name='img',
            name='timestamp',
            field=models.CharField(max_length=500),
        ),
    ]
