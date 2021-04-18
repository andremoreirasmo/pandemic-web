"""pandemic URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.urls import include, path
from rest_framework import routers
from core.api.viewsets import *
from location.api.viewsets import *
from orientation.api.viewsets import *


router = routers.DefaultRouter()
router.register(r'person',PersonViewSet)
router.register(r'symptom',SymptomViewSet)
router.register(r'personsymptom',PersonSymptomViewSet)

router.register(r'adress',AdressViewSet)
router.register(r'city',CityViewSet)
router.register(r'region',RegionViewSet)
router.register(r'state',StateViewSet)

router.register(r'orientation',OrientationViewSet)



urlpatterns = [
    path('',include(router.urls)),
    path('admin/', admin.site.urls),

]
