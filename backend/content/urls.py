from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import ExerciseViewSet, DietViewSet

router = DefaultRouter()
router.register(r'exercises', ExerciseViewSet)
router.register(r'diets', DietViewSet)

urlpatterns = [
    path('', include(router.urls)),
]