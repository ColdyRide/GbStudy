from django.shortcuts import render
from .models import ProductCategories, Product

import json
import os


JSON_PATH = 'mainapp/json'


def get_json(file_name):
    with open(os.path.join(JSON_PATH, f'{file_name}.json'), 'r', encoding='UTF-8') as file:
        result = json.load(file)
    return result

# Create your views here.


def main(request):
    main_links = get_json('main_links')
    title = 'главная'
    context = {
        'title': title,
        'main_links': main_links,
        'products': Product.objects.all()[:3]
    }

    return render(request, 'mainapp/index.html', context)


def products(request, pk=None):
    main_links = get_json('main_links')
    title = 'каталог'
    context = {
        'title': title,
        'main_links': main_links,
        'categories': ProductCategories.objects.all()
    }

    return render(request, 'mainapp/products.html', context)


def contact(request):
    main_links = get_json('main_links')
    title = 'контакты'
    context = {
        'title': title,
        'main_links': main_links,
        'contact_number': range(3)
    }

    return render(request, 'mainapp/contact.html', context)
