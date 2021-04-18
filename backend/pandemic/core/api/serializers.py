from rest_framework.serializers import ModelSerializer
from core.models import *

class PersonSerializer(ModelSerializer):
    class Meta:
        model = Person
        fields = ['id_per','nam_per','cpf_per','ema_per','nas_per','tel_per','cov_sit','wei_per','hei_per']


class SymptomSerializer(ModelSerializer):
    class Meta:
        model = Symptom
        fields = '__all__'

class PersonSymptomSerializer(ModelSerializer):
    class Meta:
        model = PersonSymptom
        fields = '__all__'