from rest_framework.viewsets import ModelViewSet
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework import status
from .models import PatientRecord
from .serializers import PatientRecordSerializer, PatientHospitalSerializer, PatientProfileSerializer
from authentication.permissions import IsDoctor, IsPatient


class PatientRecordViewSet(ModelViewSet):
    queryset = PatientRecord.objects.all()
    serializer_class = PatientRecordSerializer

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            return [IsAuthenticated(), IsDoctor()]  # Only doctors can modify
        return [IsAuthenticated()]  # Anyone authenticated can read (patients see their own)

    def get_queryset(self):
        user = self.request.user
        if user.role == 'patient':
            return PatientRecord.objects.filter(patient=user)  # Patients see only their records
        elif user.role == 'doctor':
            return PatientRecord.objects.filter(doctor=user)  # Doctors see their records
        return PatientRecord.objects.all()  # Admins/hospitals see all

    def perform_create(self, serializer):
        serializer.save(doctor=self.request.user)

# Patient Hospital Catalog View
class PatientHospitalView(APIView):
    permission_classes = [IsAuthenticated, IsPatient]

    def get(self, request):
        serializer = PatientHospitalSerializer(request.user)
        return Response(serializer.data)

    def post(self, request):
        serializer = PatientHospitalSerializer(request.user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# Patient Profile View
class PatientProfileView(APIView):
    permission_classes = [IsAuthenticated, IsPatient]

    def get(self, request):
        serializer = PatientProfileSerializer(request.user)
        return Response(serializer.data)

    def put(self, request):
        serializer = PatientProfileSerializer(request.user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DiseasePredictionView(APIView):
    permission_classes = [IsAuthenticated, IsPatient]

    def post(self, request):
        serializer = DiseasePredictionSerializer(data=request.data)
        if serializer.is_valid():
            symptoms = serializer.validated_data['symptoms']
            prediction = predict_disease(symptoms)
            return Response({
                'disease': prediction['disease'],
                'recommendation': prediction['recommendation'],
                'prescription': prediction['prescription']
            }, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)