# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):
    dependencies = [
        ('finder_server', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='report',
            name='uid',
            field=models.ForeignKey(default=1, to='finder_server.Users'),
            preserve_default=False,
        ),
    ]
