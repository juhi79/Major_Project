from django.db import models

# Create your models here.
class RegisterModel(models.Model):
    firstname=models.CharField(max_length=300)
    lastname=models.CharField(max_length=200)
    userid=models.CharField(max_length=200)
    password=models.IntegerField()
    mblenum=models.BigIntegerField()
    email=models.EmailField(max_length=400)
    gender=models.CharField(max_length=200)

class UploadModel(models.Model):
    file_name=models.CharField(max_length=100)
    category=models.CharField(max_length=100)
    upload_user=models.ForeignKey(RegisterModel)
    upload_file=models.FileField()
    area=models.CharField(max_length=200)
    add_count=models.IntegerField(default='0')

class RequestModel(models.Model):
    accessone = models.ForeignKey(RegisterModel)
    accesstwo = models.ForeignKey(UploadModel)
    request = models.CharField(max_length=200, default='pending')
    cate=models.CharField(max_length=500)

class FeedbackModel(models.Model):
    username = models.ForeignKey(RegisterModel)
    feedback = models.CharField(max_length=300)