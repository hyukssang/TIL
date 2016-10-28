from django.conf.urls import url
from . import views

urlpatterns = [
	url(r'^$', views.post_list, name='post_list'),	# use post_list function inside views.py,
													# when url is at /post_list
	url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),												
]
