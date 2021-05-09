from django.urls import path, re_path
import mainapp.views as mainapp

app_name = 'mainapp'

urlpatterns = [
   path('', mainapp.products, name='index'),
   path('<int:pk>/', mainapp.products, name='category'),
   re_path(r'/(?P<pk>\d?)', mainapp.products, name='category'),
]
