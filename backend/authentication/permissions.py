from rest_framework.permissions import BasePermission
from .models import User


class IsAdmin(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role == 'admin'


class IsHospital(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role == 'hospital'

class IsDoctor(BasePermission):
    def has_permission(self, request, view):
        return request.user.role == 'doctor'


class IsPatient(BasePermission):
    def has_permission(self, request, view):
        return request.user.role == 'patient'