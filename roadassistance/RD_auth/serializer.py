# Django Imports
from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password
from django.core.files.storage import default_storage

import base64
# My App Import
from RD_auth.models import User

class RegisterSerializer(serializers.ModelSerializer):

    """Serializes the User model"""

    email = serializers.EmailField(
        required=True,
        validators=[UniqueValidator(queryset=User.objects.all(), message='Email Already Exist')]
    )

    phone = serializers.CharField(
        required=True,
        validators=[UniqueValidator(queryset=User.objects.all(), message='Phone Number Already Exist')],
    )

    class Meta:
        """Meta for the UserSerializer"""
        model = User
        fields = ['user_id', 'name', 'email', 'phone', 'password', 'is_mec']

    def create(self, validated_data):

        user = User.objects.create_user(
            validated_data['email'],
            validated_data['name'],
            validated_data['phone'],
            validated_data['is_mec'],
            validated_data['password']
        )

        user.save()

        return user


class UserSerializer(serializers.ModelSerializer):

    """Serializes the User model"""

    image = serializers.SerializerMethodField("get_image")

    class Meta:
        """Meta for the UserSerializer"""
        model = User
        fields = ['user_id', 'email', 'name', 'phone', 'is_mec', 'biz_name', 'shop_address', 'lat', 'lon', 'image']


    def get_image(self, user:User):
        """IMAGE"""
        file = default_storage.open(user.pic.name, 'rb')
        data = file.read()
        file.close()
        return base64.b64encode(data)

class EditUserSerializer(serializers.ModelSerializer):

    """Serializes the User model"""

    image = serializers.SerializerMethodField("get_image")

    class Meta:
        """Meta for the UserSerializer"""
        model = User
        fields = ['user_id', 'email', 'name', 'phone', 'is_mec', 'biz_name', 'shop_address','lat', 'lon', 'pic', 'image']

    def get_image(self, user:User):
        """IMAGE"""
        file = default_storage.open(user.pic.name, 'rb')
        data = file.read()
        file.close()
        return base64.b64encode(data)

