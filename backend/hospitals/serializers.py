from rest_framework import serializers
from .models import Hospital, Doctor
# from .serializers import DoctorSerializer, HospitalSerializer
from authentication.serializers import UserSerializer



class DoctorSerializer(serializers.ModelSerializer):
    # hospital = HospitalSerializer(read_only=True)

    class Meta:
        model = Doctor
        fields = '__all__'

class HospitalSerializer(serializers.ModelSerializer):
    doctors = DoctorSerializer(many=True, read_only=True)
    enrolled_patients = UserSerializer(many=True, read_only=True)

    class Meta:
        model = Hospital
        fields = '__all__'


# # from rest_framework import serializers
# # from .models import Hospital
# # from authentication.models import User
# # from patients.models import PatientRecord
# # from doctors.models import Doctor

# # # Existing Hospital Serializer
# # class HospitalSerializer(serializers.ModelSerializer):
# #     class Meta:
# #         model = Hospital
# #         fields = ['id', 'name', 'location', 'email', 'created_at', 'updated_at']
# #         read_only_fields = ['created_at', 'updated_at']

# #     def create(self, validated_data):
# #         user = self.context['request'].user
# #         hospital = Hospital.objects.create(user=user, **validated_data)
# #         return hospital

# # Patient Creation Serializer
# # class PatientCreationSerializer(serializers.ModelSerializer):
# #     hospital = serializers.PrimaryKeyRelatedField(queryset=Hospital.objects.all(), write_only=True)

# #     class Meta:
# #         model = User
# #         fields = ['id', 'username', 'password', 'phone_number', 'hospital']
# #         extra_kwargs = {
# #             'password': {'write_only': True},
# #             'role': {'default': 'patient', 'read_only': True}
# #         }

# #     def create(self, validated_data):
# #         hospital = validated_data.pop('hospital')
# #         user = User.objects.create_user(
# #             username=validated_data['username'],
# #             password=validated_data['password'],
# #             role='patient',
# #             phone_number=validated_data.get('phone_number', '')
# #         )
# #         user.hospitals.add(hospital)  # Add hospital to patient's catalog
# #         return user


# class PatientCreationSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = ['id', 'username', 'password', 'phone_number', 'hospitals']
#         extra_kwargs = {
#             'password': {'write_only': True},
#             'role': {'default': 'patient', 'read_only': True}
#         }

#     def create(self, validated_data):
#         # Remove hospitals from validated_data since it's a M2M field
#         hospitals = validated_data.pop('hospitals', [])
#         user = User.objects.create_user(
#             username=validated_data['username'],
#             password=validated_data['password'],
#             role='patient',
#             phone_number=validated_data.get('phone_number', '')
#         )
#         # Add hospitals to the user
#         if hospitals:
#             user.hospitals.set(hospitals)
#         return user

# # Doctor Creation Serializer
# class DoctorCreationSerializer(serializers.ModelSerializer):
#     hospital = serializers.PrimaryKeyRelatedField(queryset=Hospital.objects.all(), write_only=True)

#     class Meta:
#         model = User
#         fields = ['id', 'username', 'password', 'phone_number', 'hospital']
#         extra_kwargs = {
#             'password': {'write_only': True},
#             'role': {'default': 'doctor', 'read_only': True}
#         }

#     def create(self, validated_data):
#         hospital = validated_data.pop('hospital')
#         user = User.objects.create_user(
#             username=validated_data['username'],
#             password=validated_data['password'],
#             role='doctor',
#             phone_number=validated_data.get('phone_number', '')
#         )
#         Doctor.objects.create(
#             user=user,
#             hospital=hospital,
#             specialization='General',  # Default value, can be updated later
#             phone=user.phone_number,
#             email=f"{user.username}@example.com"  # Placeholder email
#         )
#         return user