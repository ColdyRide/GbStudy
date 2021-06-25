from datetime import timedelta
from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils.timezone import now


# Create your models here.



class ShopUser(AbstractUser):
    avatar = models.ImageField(verbose_name='аватарка', upload_to='users_avatars', blank=True)
    age = models.PositiveIntegerField(verbose_name='возраст')
    activation_key = models.CharField(max_length=128, blank=True)
    activation_key_issued = models.DateTimeField(auto_now_add=True, blank=True, null=True)

    def is_activation_key_expired(self):
        if now() < self.activation_key_issued + timedelta(hours=48):
            return False
        return True
