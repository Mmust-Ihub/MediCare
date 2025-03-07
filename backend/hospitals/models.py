from django.db import models
from authentication.models import User
from django.contrib.auth import get_user_model
from django.contrib.auth.models import User


User = get_user_model()
class Hospital(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=255, null = True)
    category = models.CharField(max_length=100)
    # doctors = models.ManyToManyField('Doctor', related_name='hospitals')
    # enrolled_patients = models.ManyToManyField(User, related_name='enrolled_hospitals', blank=True)
    image_url = models.URLField(default='https://www.google.com/imgres?q=migrating%20data%20from%20sqlite%20to%20postgres%20django&imgurl=https%3A%2F%2Fmedia2.dev.to%2Fdynamic%2Fimage%2Fwidth%3D1080%2Cheight%3D1080%2Cfit%3Dcover%2Cgravity%3Dauto%2Cformat%3Dauto%2Fhttps%253A%252F%252Fthepracticaldev.s3.amazonaws
    rating = models.FloatField()

    def __str__(self):
        return self.name



class Doctor(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=200)
    specialization = models.CharField(max_length=200)
    hospital = models.ForeignKey(Hospital, on_delete=models.CASCADE)
    image_url = models.URLField()
    rating = models.FloatField()

    def __str__(self):
        return self.name



# from django.db import models

# class Hospital(models.Model):
#     user = models.OneToOneField('authentication.User', on_delete=models.CASCADE, related_name='hospital')  # Use string literal
#     name = models.CharField(max_length=100)
#     location = models.CharField(max_length=100)
#     email = models.EmailField()
#     created_at = models.DateTimeField(auto_now_add=True)
#     updated_at = models.DateTimeField(auto_now=True)

#     def __str__(self):
#         return f"<Hospital {self.name}>"


# from django.db import models

# # Create your models here.

# from authentication.models import User

# class Hospital(models.Model):
#     user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='hospital')
#     name = models.CharField(max_length=100)
#     location = models.CharField(max_length=100)
#     email = models.EmailField()
#     created_at = models.DateTimeField(auto_now_add=True)
#     updated_at = models.DateTimeField(auto_now=True)

#     def __str__(self):
#         return f"<Hospital {self.name}>"


