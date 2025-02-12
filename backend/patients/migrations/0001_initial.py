# Generated by Django 5.1.6 on 2025-02-12 03:45

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('hospitals', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='PatientRecord',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('symptoms', models.TextField()),
                ('diagnosis', models.TextField(blank=True)),
                ('prescription', models.TextField(blank=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('hospital', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='patient_records', to='hospitals.hospital')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='patient_record', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
