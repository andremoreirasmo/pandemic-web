from rest_framework.viewsets import ModelViewSet
from core.models import *
from .serializers import *

class PersonViewSet(ModelViewSet):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer

class SymptomViewSet(ModelViewSet):
    queryset = Symptom.objects.all()
    serializer_class = SymptomSerializer

class PersonSymptomViewSet(ModelViewSet):
    queryset = PersonSymptom.objects.all()
    serializer_class = PersonSymptomSerializer


