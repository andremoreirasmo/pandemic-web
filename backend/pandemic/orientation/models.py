import uuid

from django.db import models

# Create your models here.

class Orientation(models.Model):
    id_ori = models.UUIDField(primary_key=True, default= uuid.uuid4, editable=False)
    nam_ori = models.CharField(max_length=255)
    des_ori = models.TextField()
    dat_ori = models.DateField(auto_now=True)
