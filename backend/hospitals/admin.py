from django.contrib import admin
from .models import Hospital

# Register your models here.

@admin.register(Hospital)
class HospitalAdmin(admin.ModelAdmin):
    pass