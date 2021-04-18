from rest_framework.viewsets import ModelViewSet
from location.models import *
from .serializers import *

class RegionViewSet(ModelViewSet):
    queryset = Region.objects.all()
    serializer_class = RegionSerializer

class StateViewSet(ModelViewSet):
    queryset = State.objects.all()
    serializer_class = StateSerializer

class CityViewSet(ModelViewSet):
    queryset = City.objects.all()
    serializer_class = CitySerializer

class AdressViewSet(ModelViewSet):
    queryset = Adress.objects.all()
    serializer_class = AdressSerializer



