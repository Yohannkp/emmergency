# Generated by Django 4.2.3 on 2023-08-21 18:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Service', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Hopitaux',
            fields=[
                ('service_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='Service.service')),
                ('horaire', models.TextField()),
            ],
            bases=('Service.service',),
        ),
    ]
