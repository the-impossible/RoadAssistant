from django.shortcuts import render
from rest_framework import generics
from rest_framework import status
from rest_framework import permissions
from rest_framework.response import Response


from RD_auth.serializer import (
    RegisterSerializer,
)

# Create your views here.
class RegisterView(generics.CreateAPIView):

    """This View create an account for the user"""
    serializer_class = RegisterSerializer
    permission_classes = [permissions.AllowAny]

    def create(self, request, *args, **kwargs):
        """Creates a user"""
        super().create(request, *args, **kwargs)
        return Response(status=status.HTTP_201_CREATED)
    