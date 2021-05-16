import random

from django.shortcuts import render, get_object_or_404
from .models import ProductCategories, Product
from basketapp.models import Basket

import json
import os


JSON_PATH = 'geekshop/json'


def get_json(file_name):
    with open(os.path.join(JSON_PATH, f'{file_name}.json'), 'r', encoding='UTF-8') as file:
        result = json.load(file)
    return result


def get_basket(user):
    if user.is_authenticated:
        return Basket.objects.filter(user=user)
    else:
        return []


def get_hot_product():
    products = Product.objects.all()
    return random.sample(list(products), 1)[0]


def get_same_products(hot_product):
    same_products = Product.objects.filter(category=hot_product.category).exclude(pk=hot_product.pk)[:3]

    return same_products

# Create your views here.
def products(request, pk=None):

    main_links = get_json('main_links')
    title = 'каталог'
    basket = get_basket(request.user)
    hot_product = get_hot_product()
    same_products = get_same_products(hot_product)
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

    context = {
        'title': title,
        'main_links': main_links,
        'categories': categories,
        'products': same_products,
        'product': hot_product,
        'basket': basket,
    }
    return render(request, 'mainapp/products.html', context)


def detail(request, pk=None):
    title = 'продукт'
    main_links = get_json('main_links')
    content = {
        'title': title,
        'main_links': main_links,
        'categories': ProductCategories.objects.all(),
        'product': get_object_or_404(Product, pk=pk),
        'basket': get_basket(request.user),
    }

    return render(request, 'mainapp/products.html', content)