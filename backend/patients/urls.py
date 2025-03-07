from django.urls import path, include
from .views import MedicalRecordViewSet
from rest_framework.routers import DefaultRouter



router = DefaultRouter()
router.register(r'medical-records', MedicalRecordViewSet)



urlpatterns = [
    path('', include(router.urls)),
    # path('hospitals/', PatientHospitalView.as_view(), name='patient-hospitals'),
    # path('profile/', PatientProfileView.as_view(), name='patient-profile'),
    # path('predict-disease/', DiseasePredictionView.as_view(), name='predict-disease'),
]


