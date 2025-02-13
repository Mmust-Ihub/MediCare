from django.contrib import admin
from .models import Doctor

# Register your models here.

@admin.register(Doctor)
class DoctorsAdmin(admin.ModelAdmin):
    pass