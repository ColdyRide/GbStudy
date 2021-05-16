from django.shortcuts import render, get_object_or_404
from .models import ProductCategories, Product
from basketapp.models import Basket

import json
import os


JSON_PATH = 'mainapp/json'


def get_json(file_name):
    with open(os.path.join(JSON_PATH, f'{file_name}.json'), 'r', encoding='UTF-8') as file:
        result = json.load(file)
    return result

# Create your views here.
def products(request, pk=None):

    main_links = get_json('main_links')
    title = 'каталог'
    basket = []
    if request.user.is_authenticated:
        basket = Basket.objects.filter(user=request.user)
    categories = ProductCategories.objects.all()
    if pk is not None:
        if pk == 1:
            products = Product.objects.all().order_by('price')
            category = {'name': 'все'}
        else:
            category = get_object_or_404(ProductCategories, pk=pk)
            products = Product.objects.filter(category_id__pk=pk).order_by('price')

        context = {
            'title': title,
            'main_links': main_links,
            'categories': categories,
            'category': category,
            'products': products,
            'basket': basket,
        }

        return render(request, 'mainapp/products_list.html', context)

    some_products = Product.objects.all().order_by('price')[2:5]
    context = {
        'title': title,
        'main_links': main_links,
        'categories': categories,
        'products': some_products,
        'basket': basket,
    }
    return render(request, 'mainapp/products.html', context)
