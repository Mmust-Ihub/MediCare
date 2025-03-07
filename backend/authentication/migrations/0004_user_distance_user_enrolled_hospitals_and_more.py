# Generated by Django 5.1.6 on 2025-02-14 05:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authentication', '0003_user_hospitals'),
        ('hospitals', '0003_rename_location_hospital_category_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='distance',
            field=models.FloatField(default=0.0),
        ),
        migrations.AddField(
            model_name='user',
            name='enrolled_hospitals',
            field=models.ManyToManyField(related_name='enrolled_patients', to='hospitals.hospital'),
        ),
        migrations.AddField(
            model_name='user',
            name='is_critical',
            field=models.BooleanField(default=False),
        ),
    ]
