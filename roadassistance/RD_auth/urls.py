from django.urls import path

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenBlacklistView,
)

from RD_auth.views import *

app_name = "auth"

urlpatterns = [
    path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('logout/', TokenBlacklistView.as_view(), name='token_blacklist'),

    path('register/', RegisterView.as_view(), name='register'),
    path('getUser/', UserView.as_view(), name='getUser'),
    path("updateProfile/<str:pk>", UpdateUserView.as_view(), name="updateProfile"),

    path('getMec/', GetMechanicsView.as_view(), name='getMec'),
    path('getAMec/<str:pk>', GetAMecView.as_view(), name='getAUser'),
    path('requestAMec/', RequestAMecView.as_view(), name='requestAMec'),
    path('verifyRequest/', VerifyPendingRequestView.as_view(), name='verifyRequest'),
    path('GetDriverHistory/', GetHistoryView.as_view(), name='GetDriverHistory'),
    path('getRequest/<str:request_id>', GetRequestView.as_view(), name='getRequest'),

    path('cancelRequest/', CancelPendingRequestView.as_view(), name='cancelRequest'),
    path('approveRequest/', ApproveRequestView.as_view(), name='approveRequest'),

    path('allMecRequest/', MechanicRequestView.as_view(), name='allMecRequest'),
    path('getMecRequest/<str:request_id>', GetRequestDetailView.as_view(), name='getMecRequest'),
]