from rest_framework.serializers import ModelSerializer
from location.models import *

class RegionSerializer(ModelSerializer):
    class Meta:
        model = Region
        fields = '__all__'

class StateSerializer(ModelSerializer):
    class Meta:
        model = State
        fields = '__all__'

class CitySerializer(ModelSerializer):
    class Meta:
        model = City
        fields = '__all__'

class AdressSerializer(ModelSerializer):
    class Meta:
        model = Adress
        fields = '__all__'