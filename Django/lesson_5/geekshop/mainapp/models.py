from django.db import models


# Create your models here.
class ProductCategories(models.Model):
    name = models.CharField(verbose_name='имя', max_length=64, unique=True)

    def __str__(self):
        return self.name


class Product(models.Model):
    category = models.ForeignKey(ProductCategories, on_delete=models.CASCADE)
    name = models.CharField(verbose_name='имя', max_length=64, unique=True)
    short_desc = models.CharField(verbose_name='краткое описание', max_length=64, blank=True)
    desc = models.TextField(verbose_name='описание', blank=True)
    price = models.DecimalField(verbose_name='цена продукта', max_digits=8, decimal_places=2, default=0)
    quantity = models.PositiveIntegerField(verbose_name='количество на складе', default=0)
    image = models.ImageField(verbose_name='картинка', upload_to='img', blank=True)

    def __str__(self):
        return f'{self.name} ({self.category.name})'