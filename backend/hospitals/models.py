from django.db import models

class Hospital(models.Model):
    user = models.OneToOneField('authentication.User', on_delete=models.CASCADE, related_name='hospital')  # Use string literal
    name = models.CharField(max_length=100)
    location = models.CharField(max_length=100)
    email = models.EmailField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"<Hospital {self.name}>"


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


