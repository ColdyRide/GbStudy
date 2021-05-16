from django.urls import path
from .views import products, detail

app_name = 'mainapp'

urlpatterns = [
   path('', products, name='category'),
   path('category/<int:pk>', products, name='category'),
   path('product/<int:pk>', detail, name='details' )
]
