from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from RD_auth.models import (
    User,
    RequestMec,
)

class UserAdmin(UserAdmin):
    list_display = ('email', 'name', 'phone', 'is_staff', 'is_superuser',  'is_mec', 'date_joined', 'last_login', 'is_active',)
    search_fields = ('email','phone',)
    ordering = ('email',)
    readonly_fields = ('date_joined', 'last_login',)
    add_fieldsets = (
            (None, {'fields': ('email', 'name', 'phone', 'is_staff', 'is_superuser', 'is_mec',)}
        ),
    )

    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()

# Register your models here.
admin.site.register(User, UserAdmin)
admin.site.register(RequestMec)