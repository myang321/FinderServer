# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('finder_server', '0004_auto_20151026_2221'),
    ]

    operations = [
        migrations.AddField(
            model_name='img',
            name='uid',
            field=models.ForeignKey(default=1, to='finder_server.Users'),
            preserve_default=False,
        ),
    ]
