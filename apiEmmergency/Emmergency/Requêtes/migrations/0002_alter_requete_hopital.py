# Generated by Django 4.2.3 on 2023-08-21 19:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Hopitaux', '0001_initial'),
        ('Requêtes', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='requete',
            name='hopital',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='Hopitaux.hopitaux'),
        ),
    ]
