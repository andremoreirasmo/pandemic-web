# Generated by Django 3.2 on 2021-04-18 21:01

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_rename_id_person_id_per'),
    ]

    operations = [
        migrations.CreateModel(
            name='Symptom',
            fields=[
                ('id_sym', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('des_sym', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='PersonSymptom',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dat_sym', models.DateField()),
                ('dat_cur', models.DateField(null=True)),
                ('int_sym', models.CharField(default='L', help_text='L para low , M para medio H para high', max_length=1)),
                ('id_per', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.person')),
                ('id_sym', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.symptom')),
            ],
        ),
    ]
