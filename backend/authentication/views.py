from rest_framework.viewsets import ModelViewSet
from .models import User
from .serializers import UserSerializer
from .permissions import IsAdmin

class UserViewSet(ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [IsAdmin]  # Only admin can manage all users

    def get_queryset(self):
        # Limit to authenticated user's data unless admin
        if self.request.user.is_staff:
            return User.objects.all()
        return User.objects.filter(id=self.request.user.id)












# from django.shortcuts import render
# from rest_framework import generics, status
# from rest_framework.response import Response
# from rest_framework.permissions import AllowAny
# from .models import User
# from rest_framework.views import APIView
# from rest_framework.authtoken.models import Token
# from .serializers import PatientSerializer, HospitalSerializer, DoctorSerializer, UserCreationSerializer, UserLoginSerializer


# class UserCreateView(generics.CreateAPIView):
#     serializer_class = UserCreationSerializer
#     queryset = User.objects.all()
#     permission_classes = [AllowAny]

# class LoginView(generics.GenericAPIView):
#     serializer_class = UserLoginSerializer
#     permission_classes = [AllowAny]
    
#     def post(self, request):
#         serializer = self.get_serializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         return Response(serializer.validated_data, status=status.HTTP_200_OK)



# class RegisterPatientView(APIView):
#     def post(self, request):
#         serializer = PatientSerializer(data=request.data)
#         if serializer.is_valid():
#             user = serializer.save()
#             token, _ = Token.objects.get_or_create(user=user)
#             return Response({'token': token.key}, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# class RegisterHospitalView(APIView):
#     def post(self, request):
#         serializer = HospitalSerializer(data=request.data)
#         if serializer.is_valid():
#             user = serializer.save()
#             token, _ = Token.objects.get_or_create(user=user)
#             return Response({'token': token.key}, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# class RegisterDoctorView(APIView):
#     def post(self, request):
#         serializer = DoctorSerializer(data=request.data)
#         if serializer.is_valid():
#             user = serializer.save()
#             token, _ = Token.objects.get_or_create(user=user)
#             return Response({'token': token.key}, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)