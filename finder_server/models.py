from django.db import models


# Create your models here.

class Users(models.Model):
    uid = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=50)
    phone_status=models.IntegerField(help_text="1 means lost, 0 means not lost")


    @classmethod
    def create(cls, username, password):
        user = cls(username=username, password=password,phone_status=0)
        return user


class Report(models.Model):
    rid = models.AutoField(primary_key=True)
    uid = models.ForeignKey(Users)
    timestamp = models.CharField(max_length=100)
    device_name = models.CharField(max_length=100)
    location_x = models.FloatField()
    location_y = models.FloatField()
    ip_addr = models.CharField(max_length=50)
    wifi_name = models.CharField(max_length=50)

    @classmethod
    def create(cls, uid, timestamp,device_name,location_x,location_y,ip_addr,wifi_name):
        report = cls(uid=uid,timestamp=timestamp,
                         device_name=device_name,location_x=location_x,location_y=location_y,ip_addr=ip_addr,
                         wifi_name=wifi_name)
        return report


class Img(models.Model):
    iid = models.AutoField(primary_key=True)
    timestamp = models.BigIntegerField()
    device_name = models.CharField(max_length=100)
    url = models.CharField(max_length=500)
    uid = models.ForeignKey(Users)

    @classmethod
    def create(cls,uid,timestamp,device_name,url):
        print "in create time stamp:",timestamp
        image = cls(uid=uid,timestamp=timestamp,
                         device_name=device_name,url=url)
        return image