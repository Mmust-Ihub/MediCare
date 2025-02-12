from django.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.base_user import BaseUserManager
from django.utils.translation import gettext_lazy as _
from phonenumber_field.modelfields import PhoneNumberField

class User(AbstractUser):
    ROLE_CHOICES = (
        ('admin', 'Admin'),
        ('hospital', 'Hospital'),
        ('doctor', 'Doctor'),
        ('patient', 'Patient')
    )

    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='patient')
    phone_number = PhoneNumberField(blank=True, null=True)
    hospitals = models.ManyToManyField('hospitals.Hospital', related_name='patients', blank=True)  # Use string literal

    def __str__(self):
        return f"<User {self.username}>"




# from django.db import models

# from django.contrib.auth.models import AbstractUser
# from hospitals.models import Hospital

# # manager to dictate how to create super user and normal users
# from django.contrib.auth.base_user import BaseUserManager
# from django.utils.translation import gettext_lazy as _ # help to raise value error

# from phonenumber_field.modelfields import PhoneNumberField

# # Create your models here.

# # create custom user model

# class User(AbstractUser):
#     ROLE_CHOICES = (
#         ('admin', 'Admin'),
#         ('hospital', 'Hospital'),
#         ('doctor', 'Doctor'),
#         ('patient', 'Patient')
#     )

#     role =  models.CharField(max_length=10, choices=ROLE_CHOICES, default='patient')
#     phone_number = PhoneNumberField(blank=True, null=True)
#     hospitals = models.ManyToManyField(Hospital, related_name='patients', blank=True)  

    
#     def str(self):
#         return f"<User {self.username}>"


# class CustomUserManager(BaseUserManager):

#     def create_user(self, email, password, **extra_fields):
#         if not email:
#             raise ValueError(_("Email should be provided"))
        
#         # normalizing email
#         email = self.normalize_email(email)

#         new_user = self.model(email=email, **extra_fields)

#         new_user.set_password(password)

#         new_user.save()

#         return new_user
    

#     def create_superuser(self, email, password, **extra_fields):
#         extra_fields.setdefault('is_staff', True)
#         extra_fields.setdefault('is_superuser', True)
#         extra_fields.setdefault('is_active', True)

#         if extra_fields.get('is_staff') is not True:
#             raise ValueError(_("Super user should have is_staff to True"))

#         if extra_fields.get('is_superuser') is not True:
#             raise ValueError(_("Super user should have is_superuser to True"))

#         if extra_fields.get('is_active') is not True:
#             raise ValueError(_("Super user should have is_active to True"))


#         return self.create_user(email, password, **extra_fields)

# class User(AbstractUser):
#     username = models.CharField(max_length=20, unique = True)
#     email = models.EmailField(max_length = 25, unique = True)
#     phone_number = PhoneNumberField(blank = True)


#     object = CustomUserManager()

#     def def __str__(self):
#         return f"<User {self.email}"