from django.contrib.auth import authenticate
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework import serializers
from django.contrib.auth import get_user_model


User = get_user_model()

# from phonenumber_field.modelfields import PhoneNumberField

from .models import User



class UserCreationSerializer(serializers.ModelSerializer):
    username = serializers.CharField(max_length=20)
    email = serializers.EmailField(max_length=25)
    # phone_number = PhoneNumberField(blank=True)
    password = serializers.CharField(max_length=20)

    class Meta:
        model = User
        fields = ['username', 'email', 'password']


    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        return user


class UserLoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField(write_only=True)


    def validate(self, data):
        user = authenticate(**data)
        if user:
            refresh = RefreshToken.for_user(user)
            return {
                'refresh': str(refresh),
                'access': str(refresh.access_token),
                'user': UserCreationSerializer(user).data
        }
        raise serializers.ValidationError("Invalid Credentials")




class BaseUserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    phone_number = serializers.CharField(required=False, allow_blank=True)

    def create(self, validated_data):
        user = User.objects.create_user(
            username=validated_data['username'],
            password=validated_data['password'],
            role=validated_data.get('role', 'patient'),  # Default to patient
            phone_number=validated_data.get('phone_number', '')
        )
        return user

    class Meta:
        model = User
        fields = ['username', 'password', 'phone_number', 'role']

class PatientSerializer(BaseUserSerializer):
    class Meta(BaseUserSerializer.Meta):
        extra_kwargs = {'role': {'default': 'patient', 'read_only': True}}

class HospitalSerializer(BaseUserSerializer):
    class Meta(BaseUserSerializer.Meta):
        extra_kwargs = {'role': {'default': 'hospital', 'read_only': True}}

class DoctorSerializer(BaseUserSerializer):
    class Meta(BaseUserSerializer.Meta):
        extra_kwargs = {'role': {'default': 'doctor', 'read_only': True}}






        # username = attrs.get('username')
        # email = attrs.get('email')
        # phone_number = attrs.get('phone_number')

        # if User.objects.filter(username=username).exists():
        #     raise serializers.ValidationError("Username is already in use")
        # if User.objects.filter(email=email).exists():
        #     raise serializers.ValidationError("Email is already in use")
        # if User.objects.filter(phone_number=phone_number).exists():
        #     raise serializers.ValidationError("Phone number is already in use")
        # return attrs
        

        # def create(self, validated_data):
        #     username = validated_data.get('username')
        #     email = validated_data.get('email')
        #     phone_number = validated_data.get('phone_number')
        #     password = validated_data.get('password')

        #     user = User.objects.create_user(username=username, email=email, phone_number=phone_number, password=password)
        #     return user

