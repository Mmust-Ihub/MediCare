from django.shortcuts import render

# Create your views here.
from rest_framework.viewsets import ModelViewSet
from .models import Exercise, Diet
from .serializers import ExerciseSerializer, DietSerializer

class ExerciseViewSet(ModelViewSet):
    queryset = Exercise.objects.all()
    serializer_class = ExerciseSerializer

class DietViewSet(ModelViewSet):
    queryset = Diet.objects.all()
    serializer_class = DietSerializer