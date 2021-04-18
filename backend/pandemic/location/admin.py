from django.contrib import admin

from .models import *

admin.site.register(Adress)
admin.site.register(State)
admin.site.register(City)
admin.site.register(Region)

