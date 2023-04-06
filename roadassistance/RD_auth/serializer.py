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
        fields = ['user_id', 'fullname', 'email', 'phone', 'password', 'is_mec']

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

