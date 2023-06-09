from django.shortcuts import render
from rest_framework import generics
from rest_framework.generics import GenericAPIView
from rest_framework import status
from rest_framework import permissions
from rest_framework.response import Response
from rest_framework.views import APIView

from RD_auth.serializer import *

# Create your views here.
class RegisterView(generics.CreateAPIView):

    """This View create an account for the user"""
    serializer_class = RegisterSerializer
    permission_classes = [permissions.AllowAny]

    def create(self, request, *args, **kwargs):
        """Creates a user"""
        super().create(request, *args, **kwargs)
        return Response(status=status.HTTP_201_CREATED)

class UserView(generics.RetrieveAPIView):
    """This view returns a user"""
    serializer_class = UserSerializer
    permission_classes = (permissions.IsAuthenticated,)

    def get_object(self):
        return self.request.user

class UpdateUserView(generics.UpdateAPIView):
    """This view returns a user"""
    serializer_class = EditUserSerializer
    queryset = User.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

class GetMechanicsView(APIView):
    """This view gets all mechanics from a user"""
    # serializer_class = AllMecSerializers
    permission_classes = (permissions.IsAuthenticated,)

    def get(self, request, *args, **kwargs):
        mechanics = User.objects.filter(is_mec=True, shop_address__isnull=False)
        serializer = AllMecSerializers(mechanics, context={'geo_data':request.data}, many=True)
        ordered_serializer_data = sorted(serializer.data, key=lambda x: x['distance'])
        return Response(ordered_serializer_data)

