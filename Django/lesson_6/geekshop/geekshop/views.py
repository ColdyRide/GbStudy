from django.shortcuts import render
from mainapp.models import Product
from basketapp.models import Basket

import json
import os


JSON_PATH = 'geekshop/json'


def get_json(file_name):
    with open(os.path.join(JSON_PATH, f'{file_name}.json'), 'r', encoding='UTF-8') as file:
        result = json.load(file)
    return result

# Create your views here.


def main(request):
    main_links = get_json('main_links')
    title = 'главная'
    basket = []
    if request.user.is_authenticated:
        basket = Basket.objects.filter(user=request.user)

    context = {
        'title': title,
        'main_links': main_links,
        'products': Product.objects.all()[:3],
        'basket': basket,
    }
    return render(request, 'index.html', context)


def contact(request):
    main_links = get_json('main_links')
    title = 'контакты'
    context = {
        'title': title,
        'main_links': main_links,
        'contact_number': range(3)
    }

    return render(request, 'contact.html', context)
