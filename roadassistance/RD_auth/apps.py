from django.apps import AppConfig


class RdAuthConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'RD_auth'

    # def ready(self):
    #     print("check1")

    #     from Scheduler import request
    #     request.start()

