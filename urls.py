"""Designing_Cyber_Insurance_Policies URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin

from Designing_Cyber_Insurance_Policies import settings
from user import views as user_views
from admins import views as admin_views

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url('^$',user_views.index,name="index"),
    url('user/register', user_views.register, name="register"),
    url('user_page', user_views.user_page, name="user_page"),
    url('upload_fileview', user_views.upload_fileview, name="upload_fileview"),
    url('view_file', user_views.view_file, name="view_file"),
    url('^user/otppage/(?P<pk>\d+)/$',user_views.otppage,name="otppage"),
    url('download_page',user_views.download_page,name="download_page"),
    url('send_feedback',user_views.send_feedback,name="send_feedback"),
    url('mydetails',user_views.mydetails,name="mydetails"),
    url('user/request/(?P<pk>\d+)/$',user_views.request, name="request"),



    url('login',admin_views.login,name="login"),
    url('admin_page',admin_views.admin_page,name="admin_page"),
    url('view_userdetails',admin_views.view_userdetails,name="view_userdetails"),
    url('view_uploadfile',admin_views.view_uploadfile,name="view_uploadfile"),
    url('view_user_request',admin_views.view_user_request,name="view_user_request"),
    url('admin_update/(?P<pk>\d+)/$',admin_views.admin_update, name="admin_update"),
    url('admin_graphicalanalysis', admin_views.admin_graphicalanalysis, name="admin_graphicalanalysis"),
    url('view_userquery', admin_views.view_userquery, name="view_userquery"),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

