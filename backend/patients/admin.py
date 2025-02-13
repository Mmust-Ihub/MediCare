from django.contrib import admin
from .models import PatientRecord

# Register your models here.

@admin.register(PatientRecord)
class PatientAdmin(admin.ModelAdmin):
    pass