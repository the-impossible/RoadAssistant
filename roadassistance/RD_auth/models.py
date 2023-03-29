from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser, PermissionsMixin
import uuid

# My app imports

# Create your models here.
class UserManager(BaseUserManager):
    def create_user(self, email, name, phone, password=None):

        #creates a user with the parameters
        if not email:
            raise ValueError('Email address is required!')
        
        if not phone:
            raise ValueError('Phone number is required!')
        
        if not name:
            raise ValueError('Email address is required!')

        if password is None:
            raise ValueError('Password is required!')

        user = self.model(
            email = self.normalize_email(email.strip()),
            name = name.strip(),
            phone = phone.strip(),
        )

        user.set_password(password)
        user.save(using=self._db)

        return user

    def create_superuser(self, email, name, phone, password=None):
        # create a superuser with the above parameters
        if not email:
            raise ValueError('Email Address is required!')
        
        if not phone:
            raise ValueError('Phone number is required!')
        
        if not name:
            raise ValueError('Full name is required!')

        if password is None:
            raise ValueError('Password should not be empty')

        user = self.create_user(
            email = self.normalize_email(email.strip()),
            password=password,
            name = name,
            phone = phone,
        )

        user.is_staff = True
        user.is_superuser = True
        user.is_active = True
        user.save(using=self._db)

        return user

class User(AbstractBaseUser, PermissionsMixin):
    user_id = models.UUIDField(default=uuid.uuid4, primary_key=True, unique=True, editable=False)
    email = models.CharField(max_length=100, db_index=True, unique=True, verbose_name='email address', blank=True, null=True)
    name = models.CharField(max_length=100, blank=True, null=True)
    phone = models.CharField(max_length=11, blank=True, null=True)
    pic = models.ImageField(null=True, blank=True, upload_to='uploads/', default='img/user.png')

    date_joined = models.DateTimeField(verbose_name='date_joined', auto_now_add=True)
    last_login = models.DateTimeField(verbose_name='last_login', auto_now=True, null=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_mec = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'

    REQUIRED_FIELDS = ['phone', 'name']

    objects = UserManager()

    def _str_(self):
        return f'{self.email}'

    def has_perm(self, perm, obj=None):
        return self.is_staff

    def has_module_perms(self, app_label):
        return True


    class Meta:
        db_table = 'Users'
        verbose_name_plural = 'Users'