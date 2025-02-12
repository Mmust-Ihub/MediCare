from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated
from .models import PatientRecord
from .serializers import PatientRecordSerializer
from authentication.permissions import IsDoctor, IsPatient

class PatientRecordViewSet(ModelViewSet):
    queryset = PatientRecord.objects.all()
    serializer_class = PatientRecordSerializer

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            return [IsAuthenticated(), IsDoctor()]  # Only doctors can create/update/delete
        return [IsAuthenticated(), IsPatient()]  # Patients can read their own records

    def get_queryset(self):
        user = self.request.user
        if user.role == 'patient':
            return PatientRecord.objects.filter(patient=user)  # Patients see only their records
        elif user.role == 'doctor':
            return PatientRecord.objects.filter(doctor=user)  # Doctors see only their records
        return PatientRecord.objects.all()  # Admins/hospitals see all records

    def perform_create(self, serializer):
        serializer.save(doctor=self.request.user)  # Automatically set the doctor to the authenticated user