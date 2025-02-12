from rest_framework import serializers
from .models import PatientRecord
from authentication.models import User
from hospitals.models import Hospital

class PatientRecordSerializer(serializers.ModelSerializer):
    patient_username = serializers.CharField(source='patient.username', read_only=True)
    doctor_username = serializers.CharField(source='doctor.username', read_only=True)
    hospital_name = serializers.CharField(source='hospital.name', read_only=True)

    class Meta:
        model = PatientRecord
        fields = ['id', 'patient', 'patient_username', 'hospital', 'hospital_name', 'doctor', 'doctor_username', 'symptoms', 'diagnosis', 'treatment', 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at']

    def validate(self, data):
        # Ensure patient has role 'patient'
        if data['patient'].role != 'patient':
            raise serializers.ValidationError("Selected user is not a patient.")
        # Ensure doctor has role 'doctor'
        if data['doctor'].role != 'doctor':
            raise serializers.ValidationError("Selected user is not a doctor.")
        return data