from rest_framework.viewsets import ModelViewSet
from orientation.models import *
from .serializers import *

class OrientationViewSet(ModelViewSet):
    queryset = Orientation.objects.all()
    serializer_class = OrientationSerializer



