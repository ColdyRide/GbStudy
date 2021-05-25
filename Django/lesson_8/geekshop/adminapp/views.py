from authapp.forms import ShopUserRegisterForm
from authapp.models import ShopUser
from django.shortcuts import get_object_or_404, render, HttpResponseRedirect, reverse
from mainapp.models import Product, ProductCategories
from django.contrib.auth.decorators import user_passes_test
from adminapp.forms import ShopUserAdminEditForm, ProductCategoryEditForm


@user_passes_test(lambda u: u.is_superuser)
def users(request):
    title = 'админка/пользователи'

    users_list = ShopUser.objects.all().order_by('-is_active', '-is_superuser', '-is_staff', 'username')

    context = {
        'title': title,
        'users_list': users_list
    }

    return render(request, 'adminapp/users.html', context)


@user_passes_test(lambda u: u.is_superuser)
def user_create(request):
    title = 'пользователи/создание'

    if request.method == 'POST':
        user_form = ShopUserRegisterForm(request.POST, request.FILES)
        if user_form.is_valid():
            user_form.save()
            return HttpResponseRedirect(reverse('admin_staff:users'))
    else:
        user_form = ShopUserRegisterForm()

    content = {
        'title': title,
        'update_form': user_form
    }

    return render(request, 'adminapp/user_update.html', content)


@user_passes_test(lambda u: u.is_superuser)
def user_update(request, pk):
    title = 'пользователи/редактирование'

    edit_cat = get_object_or_404(ShopUser, pk=pk)
    if request.method == 'POST':
        edit_form = ShopUserAdminEditForm(request.POST, request.FILES, instance=edit_cat)
        if edit_form.is_valid():
            edit_form.save()
            return HttpResponseRedirect(reverse('admin_staff:user_update', args=[edit_cat.pk]))
    else:
        edit_form = ShopUserAdminEditForm(instance=edit_cat)

    content = {
        'title': title,
        'update_form': edit_form
    }

    return render(request, 'adminapp/user_update.html', content)


@user_passes_test(lambda u: u.is_superuser)
def user_delete(request, pk):

    user = get_object_or_404(ShopUser, id=pk)

    if request.method == 'POST':
        user.is_active = False
        user.save()
        return HttpResponseRedirect(reverse('admin_staff:users'))

    return HttpResponseRedirect(request.META.get("HTTP_REFERER"))


@user_passes_test(lambda u: u.is_superuser)
def categories(request):
    title = 'админка/категории'

    categories_list = ProductCategories.objects.all()

    context = {
        'title': title,
        'categories': categories_list
    }

    return render(request, 'adminapp/categories.html', context)


@user_passes_test(lambda u: u.is_superuser)
def category_create(request):
    title = 'категории/создание'

    if request.method == 'POST':
        cat_form = ProductCategoryEditForm(request.POST)
        if cat_form.is_valid():
            cat_form.save()
            return HttpResponseRedirect(reverse('admin_staff:categories'))
    else:
        cat_form = ProductCategoryEditForm

    content = {
        'title': title,
        'update_form': cat_form
    }

    return render(request, 'adminapp/category_update.html', content)


@user_passes_test(lambda u: u.is_superuser)
def category_update(request, pk):
    title = 'категории/редактирование'

    edit_cat = get_object_or_404(ProductCategories, pk=pk)

    if request.method == 'POST':
        edit_form = ProductCategoryEditForm(request.POST, instance=edit_cat)
        if edit_form.is_valid():
            edit_form.save()
            return HttpResponseRedirect(reverse('admin_staff:category_update', args=[edit_cat.pk]))
    else:
        edit_form = ProductCategoryEditForm(instance=edit_cat)

    content = {
        'title': title,
        'update_form': edit_form
    }

    return render(request, 'adminapp/category_update.html', content)


@user_passes_test(lambda u: u.is_superuser)
def category_delete(request, pk):
    cat = get_object_or_404(ProductCategories, id=pk)

    if request.method == 'POST':
        cat.is_active = False
        cat.save()
        return HttpResponseRedirect(reverse('admin_staff:categories'))

    return HttpResponseRedirect(request.META.get("HTTP_REFERER"))


@user_passes_test(lambda u: u.is_superuser)
def products(request, pk):
    title = 'админка/продукты'
    category = get_object_or_404(ProductCategories, pk=pk)
    if pk == 1:
        products_list = Product.objects.all().order_by('name')
    else:
        products_list = Product.objects.filter(category__pk=pk).order_by('name')

    context = {
        'title': title,
        'category': category,
        'products': products_list,
    }

    return render(request, 'adminapp/products.html', context)


@user_passes_test(lambda u: u.is_superuser)
def product_create(request, pk):
    pass


@user_passes_test(lambda u: u.is_superuser)
def product_read(request, pk):
    pass


@user_passes_test(lambda u: u.is_superuser)
def product_update(request, pk):
    pass


@user_passes_test(lambda u: u.is_superuser)
def product_delete(request, pk):
    pass
