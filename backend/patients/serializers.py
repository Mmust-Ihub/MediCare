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
        read_only_fields = ['patient_username', 'hospital_name', 'doctor_username', 'created_at', 'updated_at']

    def validate(self, data):
        if data['patient'].role != 'patient':
            raise serializers.ValidationError("Selected user is not a patient.")
        if 'doctor' in data and data['doctor'].role != 'doctor':
            raise serializers.ValidationError("Selected user is not a doctor.")
        return data


class DiseasePredictionSerializer(serializers.Serializer):
    symptoms = serializers.CharField(max_length=200)
    disease = serializers.CharField(read_only=True)
    recommendation = serializers.CharField(read_only=True)
    prescription = serializers.CharField(read_only=True)


# Patient Hospital Catalog Serializer
class PatientHospitalSerializer(serializers.ModelSerializer):
    hospitals = serializers.PrimaryKeyRelatedField(many=True, queryset=Hospital.objects.all())

    class Meta:
        model = User
        fields = ['id', 'username', 'hospitals']

# Patient Profile Serializer
class PatientProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'phone_number']  # Add other fields like email if needed
        read_only_fields = ['id', 'username']