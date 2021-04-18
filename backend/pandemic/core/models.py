from django.db import models
import uuid

# Create your models here.


class Person(models.Model):
    id_per = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    nam_per = models.CharField(max_length=255)
    cpf_per = models.CharField(max_length=255, null=True)
    ema_per = models.CharField(max_length=80, null=True)
    nas_per = models.DateField()
    tel_per = models.CharField(max_length=30, null=True)
    cov_sit = models.CharField(max_length=1, default='N', help_text='N para sem covid, S para suspeita, A para positivo')
    wei_per = models.FloatField(null=True)
    hei_per = models.FloatField(null=True)

    def __str__(self):
        return self.nam_per


class Symptom(models.Model):

    id_sym = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    des_sym = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.des_sym


class PersonSymptom(models.Model):
    id_ps = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    id_per = models.ForeignKey(Person, on_delete=models.CASCADE)
    id_sym = models.ForeignKey(Symptom, on_delete=models.CASCADE)
    dat_sym = models.DateField()
    dat_cur = models.DateField(null = True)
    int_sym = models.CharField(max_length=1, null= False, default= 'L', help_text= 'L para low , M para medio H para high')

    def __str__(self):
        return 'sintoma'



