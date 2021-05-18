from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import *
from rest_framework.authentication import TokenAuthentication
from location.models import *
from .serializers import *

class RegionViewSet(ModelViewSet):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    queryset = Region.objects.all()
    serializer_class = RegionSerializer

class StateViewSet(ModelViewSet):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    queryset = State.objects.all()
    serializer_class = StateSerializer

class CityViewSet(ModelViewSet):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    queryset = City.objects.all()
    serializer_class = CitySerializer

class AdressViewSet(ModelViewSet):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    queryset = Adress.objects.all()
    serializer_class = AdressSerializer



