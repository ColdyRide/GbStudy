from django.shortcuts import render
import json


def get_json(file_name):
    with open(f'./mainapp/static/json/{file_name}.json', 'r', encoding='UTF-8') as file:
        result = json.load(file)
    return result

# Create your views here.


def main(request):
    return render(request, 'mainapp/index.html', context=get_json('main_page'))


def products(request):
    return render(request, 'mainapp/products.html', context=get_json('products_page'))


def contact(request):
    return render(request, 'mainapp/contact.html', context=get_json('contact_page'))
