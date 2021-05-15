from django.urls import path
from .views import products

app_name = 'mainapp'

urlpatterns = [
   path('', products, name='category'),
   path('category/<int:pk>', products, name='category'),
]