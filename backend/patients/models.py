from django.db import models
from django.utils import timezone
from authentication.models import User
from hospitals.models import Hospital, Doctor

class MedicalRecord(models.Model):
    id = models.AutoField(primary_key=True)
    patient = models.ForeignKey(User, on_delete=models.CASCADE, related_name='medical_records')
    date_created = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)
    signs_and_symptoms = models.JSONField()
    prescription = models.TextField()
    diagnosed_disease = models.CharField(max_length=200)
    medications = models.JSONField()
    hospital = models.ForeignKey(Hospital, on_delete=models.CASCADE)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)

    def __str__(self):
        return f"Medical Record for {self.patient.username} - {self.id}"









# from django.db import models
# from authentication.models import User
# from hospitals.models import Hospital


# class PatientRecord(models.Model):
#     patient = models.ForeignKey('authentication.User', on_delete=models.CASCADE, related_name='records', limit_choices_to={'role': 'patient'})
#     hospital = models.ForeignKey(Hospital, on_delete=models.CASCADE, related_name='patient_records')
#     doctor = models.ForeignKey(User, on_delete=models.CASCADE, related_name='patient_records', limit_choices_to={'role': 'doctor'}, null = False)
#     symptoms = models.TextField()
#     diagnosis = models.TextField(blank=True)
#     treatment = models.TextField(blank=True)
#     created_at = models.DateTimeField(auto_now_add=True)
#     updated_at = models.DateTimeField(auto_now=True)

#     def __str__(self):
#         return f"Record for {self.patient.username} by {self.doctor.username} at {self.hospital.name}"

# class PatientProfile(models.Model):
#     user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile', limit_choices_to={'role': 'patient'})
#     email = models.EmailField(blank=True, null=True)
#     address = models.TextField(blank=True, null=True)

#     def __str__(self):
#         return f"Profile for {self.user.username}"