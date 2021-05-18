from rest_framework.fields import ReadOnlyField
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import *
from rest_framework.authentication import TokenAuthentication
from orientation.models import *
from .serializers import *

class OrientationViewSet(ModelViewSet):
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    queryset = Orientation.objects.all()
    serializer_class = OrientationSerializer



