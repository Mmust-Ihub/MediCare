from django.db import models
from authentication.models import User
from hospitals.models import Hospital

# Create your models here.

class Doctor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='doctor')
    hospital = models.ForeignKey(Hospital, on_delete=models.CASCADE, related_name='doctors')
    specialization = models.CharField(max_length=100)
    phone = models.CharField(max_length=15)
    email = models.EmailField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"<Doctor {self.user}>"