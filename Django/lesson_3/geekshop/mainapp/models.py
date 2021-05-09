from django.db import models


# Create your models here.
class ProductCategories (models.Model):
    name = models.CharField(verbose_name='имя', max_length=64, unique=True)

    def __str__(self):
        return self.name


class MiniImg(models.Model):
    name = models.CharField(verbose_name='имя', max_length=64, unique=True)
    image = models.ImageField(verbose_name='картинка', upload_to='img', blank=True)

    def __str__(self):
        return self.name


class ProductsImg(models.Model):
    category = models.ForeignKey(ProductCategories, on_delete=models.CASCADE)
    name = models.CharField(verbose_name='имя', max_length=64, unique=True)
    image = models.ImageField(verbose_name='картинка', upload_to='img', blank=True)

    def __str__(self):
        return f'{self.name} ({self.category})'
