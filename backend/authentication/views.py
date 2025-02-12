from django.shortcuts import render
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from .models import User
from .serializers import UserCreationSerializer, UserLoginSerializer
from django.contrib.auth.hashers  import check_password
# Create your views here.

class UserCreateView(generics.CreateAPIView):
    serializer_class = UserCreationSerializer
    query_set = User.objects.all()
    permission_classes = [AllowAny]

    # def post(self, request, *args, **kwargs):
    #     data = request.data

    #     serializer = self.serializer_class(data=data)

    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data, status=status.HTTP_201_CREATED)
    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class LoginView(generics.GenericAPIView):
    serializer_class = UserCreationSerializer
    permission_classes = [AllowAny]

    
    def post(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
