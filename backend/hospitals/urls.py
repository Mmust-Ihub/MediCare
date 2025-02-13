from django.urls import path
from .views import AddPatientView  # Import the new view

urlpatterns = [
    path('add-patient/<int:hospital_id>/', AddPatientView.as_view(), name='add-patient'),
]