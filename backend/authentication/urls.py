from django.urls import path
from .views import UserCreateView, LoginView, RegisterPatientView, RegisterHospitalView, RegisterDoctorView
from rest_framework_simplejwt.views import TokenRefreshView

urlpatterns = [
    path('register/', UserCreateView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('register/patient/', RegisterPatientView.as_view(), name='register-patient'),
    path('register/hospital/', RegisterHospitalView.as_view(), name='register-hospital'),
    path('register/doctor/', RegisterDoctorView.as_view(), name='register-doctor'),
]
