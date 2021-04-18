from rest_framework.serializers import ModelSerializer
from orientation.models import *

class OrientationSerializer(ModelSerializer):
    class Meta:
        model = Orientation
        fields = '__all__'

