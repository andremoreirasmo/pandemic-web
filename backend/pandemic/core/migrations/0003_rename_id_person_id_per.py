# Generated by Django 3.2 on 2021-04-18 20:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_auto_20210418_2005'),
    ]

    operations = [
        migrations.RenameField(
            model_name='person',
            old_name='id',
            new_name='id_per',
        ),
    ]
