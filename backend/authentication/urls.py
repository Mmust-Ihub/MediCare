from django.urls import path, include
from .views import UserViewSet
from rest_framework_simplejwt.views import TokenRefreshView
from rest_framework.routers import DefaultRouter



router = DefaultRouter()
router.register(r'users', UserViewSet)



urlpatterns = [
    path('', include(router.urls)),
    # path('register/', UserCreateView.as_view(), name='register'),
    # path('login/', LoginView.as_view(), name='login'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    # path('register/patient/', RegisterPatientView.as_view(), name='register-patient'),
    # path('register/hospital/', RegisterHospitalView.as_view(), name='register-hospital'),
    # path('register/doctor/', RegisterDoctorView.as_view(), name='register-doctor'),
]

from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserViewSet


urlpatterns = [
    path('', include(router.urls)),
    # ... other paths
]