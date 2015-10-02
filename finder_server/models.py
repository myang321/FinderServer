from django.db import models


# Create your models here.

class Users(models.Model):
    uid = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=50)

    @classmethod
    def create(cls, username, password):
        user = cls(username=username, password=password)
        return user


class Report(models.Model):
    rid = models.AutoField(primary_key=True)
    uid = models.ForeignKey(Users)
    timestamp = models.BigIntegerField()
    device_name = models.CharField(max_length=100)
    location_x = models.FloatField()
    location_y = models.FloatField()
    ip_addr = models.CharField(max_length=50)
    wifi_name = models.CharField(max_length=50)


class Img(models.Model):
    iid = models.AutoField(primary_key=True)
    timestamp = models.BigIntegerField()
    device_name = models.CharField(max_length=100)
    url = models.CharField(max_length=500)
