from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import *
from rest_framework.authentication import TokenAuthentication
from core.models import *
from .serializers import *

class PersonViewSet(ModelViewSet):
    permission_classes = (IsAuthenticated)
    authentication_classes = (TokenAuthentication,)
    queryset = Person.objects.all()
    serializer_class = PersonSerializer

class SymptomViewSet(ModelViewSet):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    queryset = Symptom.objects.all()
    serializer_class = SymptomSerializer

class PersonSymptomViewSet(ModelViewSet):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    queryset = PersonSymptom.objects.all()
    serializer_class = PersonSymptomSerializer


