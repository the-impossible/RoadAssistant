from apscheduler.schedulers.background import BackgroundScheduler
from RD_auth.views import MechanicRequestView


def start():
    scheduler = BackgroundScheduler()
    request = MechanicRequestView()

    scheduler.add_job(request.get_queryset, "interval", minutes = 1, id="request_001", replace_existing=True)

    scheduler.start()
