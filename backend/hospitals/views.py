from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated, AllowAny
from .models import Hospital
from .serializers import HospitalSerializer
from authentication.permissions import IsAdmin, IsHospital

# Create your views here.

# class HospitalViewSet(ModelViewSet):
#     queryset = Hospital.objects.all()
#     serializer_class = HospitalSerializer

#     def get_permissions(self):
#         if self.action == ['create', 'update', 'destroy']:
#             return [IsAdmin()]
#         return [IsHospital()]


class HospitalViewSet(ModelViewSet):
    queryset = Hospital.objects.all()
    serializer_class = HospitalSerializer

    def get_permissions(self):
        """
        Instantiate and return the list of permissions that this view requires.
        """
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            permission_classes = [IsAuthenticated, IsAdmin]
        else:
            permission_classes = [IsAuthenticated, IsHospital]
        return [permission() for permission in permission_classes]

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
