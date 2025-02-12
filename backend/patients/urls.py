from django.urls import path
from .views import PatientHospitalView, PatientProfileView, DiseasePredictionView

urlpatterns = [
    path('hospitals/', PatientHospitalView.as_view(), name='patient-hospitals'),
    path('profile/', PatientProfileView.as_view(), name='patient-profile'),
    path('predict-disease/', DiseasePredictionView.as_view(), name='predict-disease'),
]