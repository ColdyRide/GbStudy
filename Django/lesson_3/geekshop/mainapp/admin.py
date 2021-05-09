from django.contrib import admin
from .models import ProductCategories, MiniImg, ProductsImg
# Register your models here.

admin.site.register(ProductCategories)
admin.site.register(MiniImg)
admin.site.register(ProductsImg)
