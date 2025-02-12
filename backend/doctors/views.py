from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from .models import Doctor
from .serializers import DoctorSerializer
from authentication.permissions import IsHospital

# Create your views here.

class DoctorViewSet(ModelViewSet):
    queryset= Doctor.objects.all()
    serializer_class = DoctorSerializer
    permission_classes = [IsHospital]