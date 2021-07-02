import random

from django.shortcuts import render, get_object_or_404
from django.views.generic import ListView

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
    print(hot_product, hot_product.category)
    same_products = Product.objects.filter(category=hot_product.category).exclude(pk=hot_product.pk)[:3]
    return same_products


class ProductsView(ListView):
    template_name = 'mainapp/products_list.html'
    extra_context = {'title': 'каталог',
                     'main_links': get_json('main_links'),
                     'categories': ProductCategories.objects.all()}
    paginate_by = 3
    context_object_name = 'products'

    def get_queryset(self):
        if 'pk' in self.kwargs.keys():
            if self.kwargs['pk'] == 1:
                return Product.objects.all().order_by('price')
            else:
                return Product.objects.filter(category_id__pk=self.kwargs['pk']).order_by('price')
        same_products = get_same_products(self.hot_product)
        return same_products

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if 'pk' in self.kwargs.keys():
            if self.kwargs['pk'] == 1:
                context['category'] = {'name': 'все'}
            else:
                context['category'] = get_object_or_404(ProductCategories, pk=self.kwargs['pk'])
            return context
        context['product'] = self.hot_product
        return context

    def get(self, request, *args, **kwargs):
        self.hot_product = get_hot_product()
        self.object_list = self.get_queryset()
        context = self.get_context_data(**kwargs)
        context['basket'] = get_basket(self.request.user)
        if 'product' in context.keys():
            self.template_name = 'mainapp/products.html'
        return self.render_to_response(context)


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
