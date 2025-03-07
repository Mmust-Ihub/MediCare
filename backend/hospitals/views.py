from rest_framework.viewsets import ModelViewSet
from .models import Hospital, Doctor
from .serializers import HospitalSerializer, DoctorSerializer
from authentication.permissions import IsAdmin, IsHospital

class HospitalViewSet(ModelViewSet):
    queryset = Hospital.objects.all()
    serializer_class = HospitalSerializer

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            return [IsAdmin(), IsHospital()]
        return [IsHospital()]  # Hospitals can read their own data



class DoctorViewSet(ModelViewSet):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer
    permission_classes = [IsHospital]  # Only hospitals can manage doctors




# from django.shortcuts import render
# from rest_framework.viewsets import ModelViewSet
# from rest_framework.decorators import action
# from rest_framework.response import Response
# from rest_framework.permissions import IsAuthenticated
# from rest_framework import status
# from rest_framework.views import APIView


# from .models import Hospital
# from .serializers import HospitalSerializer, PatientCreationSerializer, DoctorCreationSerializer
# from authentication.permissions import IsAdmin, IsHospital

# class HospitalViewSet(ModelViewSet):
#     queryset = Hospital.objects.all()
#     serializer_class = HospitalSerializer

# def get_permissions(self):
#     if self.action in ['create', 'update', 'partial_update', 'destroy']:
#         return [IsAuthenticated(), IsAdmin()]
#     return [IsAuthenticated(), IsHospital()]


#     def perform_create(self, serializer):
#         serializer.save(user=self.request.user)

#     @action(detail=True, methods=['post'], permission_classes=[IsAuthenticated, IsHospital])
#     def create_patient(self, request, pk=None):
#         hospital = self.get_object()
#         serializer = PatientCreationSerializer(data=request.data, context={'request': request})
#         if serializer.is_valid():
#             serializer.save(hospital=hospital)
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#     @action(detail=True, methods=['post'], permission_classes=[IsAuthenticated, IsHospital])
#     def create_doctor(self, request, pk=None):
#         hospital = self.get_object()
#         serializer = DoctorCreationSerializer(data=request.data, context={'request': request})
#         if serializer.is_valid():
#             serializer.save(hospital=hospital)
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



# class AddPatientView(APIView):
#     permission_classes = [IsHospital]

#     def post(self, request, hospital_id):
#         # Ensure the hospital_id is the same as the authenticated hospital user's hospital
#         if request.user.hospital.id != int(hospital_id):
#             return Response({"error": "Hospital mismatch"}, status=status.HTTP_403_FORBIDDEN)
        
#         serializer = PatientCreationSerializer(data=request.data)
#         if serializer.is_valid():
#             serializer.save(hospitals=[request.user.hospital])
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)