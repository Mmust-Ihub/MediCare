from django.db import models

class Exercise(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=200)
    category = models.CharField(max_length=100)
    description = models.TextField()
    image_url = models.URLField()
    duration = models.DurationField()
    calories_burn = models.IntegerField()

    def __str__(self):
        return self.name

class Diet(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=200)
    category = models.CharField(max_length=100)
    description = models.TextField()
    image_url = models.URLField()
    calories = models.IntegerField()
    ingredients = models.JSONField()

    def __str__(self):
        return self.name