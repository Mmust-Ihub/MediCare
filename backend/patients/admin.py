from django.contrib import admin
from .models import MedicalRecord

# Register your models here.

@admin.register(MedicalRecord)
class PatientAdmin(admin.ModelAdmin):
    pass