from django.urls import include, path
from rest_framework import routers
from . import views

app_name = 'api'

router = routers.SimpleRouter()
router.register('todo', viewset=views.TodoViewSet)

urlpatterns = [
    path('', include(router.urls))
]
