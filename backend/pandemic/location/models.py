from django.db import models
from core.models import Person

import uuid
# Create your models here.


class Region(models.Model):
    id_reg = models.UUIDField(primary_key=True, default = uuid.uuid4, editable = False)
    nam_reg = models.CharField(max_length=255)

    def __str__(self):
        return self.nam_reg

class State(models.Model):
    id_sta = models.UUIDField(primary_key=True, default= uuid.uuid4, editable= False)
    nam_sta = models.CharField(max_length=255, unique= True)
    ini_sta = models.CharField(max_length=2, help_text= 'Sigla do estado', unique= True)
    cou_sta = models.CharField(max_length=3, help_text= 'Sigla do País do estado')
    id_reg = models.ForeignKey(Region, on_delete=models.CASCADE)

    def __str__(self):
        return self.nam_sta

class City(models.Model):
    id_cit = models.UUIDField(primary_key=True, default= uuid.uuid4, editable=False)
    nam_cit = models.CharField(max_length=255)
    id_sta = models.ForeignKey(State,on_delete=models.CASCADE)

    def __str__(self):
        return self.nam_cit

class Adress(models.Model):
    id_add = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    add_str = models.CharField(max_length=255, help_text="Rua")
    id_per = models.ForeignKey(Person, on_delete= models.CASCADE)
    id_cit = models.ForeignKey(City, on_delete= models.CASCADE)

    def __str__(self):
        return self.id_add + " " + self.add_str