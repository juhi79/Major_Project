from random import randint


from django.core.mail import EmailMultiAlternatives
from django.shortcuts import render, redirect, get_object_or_404

# Create your views here.
from Designing_Cyber_Insurance_Policies.settings import DEFAULT_FROM_EMAIL
from user.forms import RegisterForms
from user.models import RegisterModel, UploadModel, RequestModel, FeedbackModel


def index(request):
    usid=''
    if request.method=="POST":
        usid=request.POST.get('username')
        pswd = request.POST.get('password')
        try:
            check = RegisterModel.objects.get(userid=usid,password=pswd)
            request.session['userid']=check.id
            return redirect('user_page')
        except:
            pass
    return render(request,'user/index.html',{'fh':usid})

def register(request):
    if request.method=="POST":
        forms=RegisterForms(request.POST)
        if forms.is_valid():
            forms.save()
            return redirect('index')
    else:
        forms=RegisterForms()
    return render(request,'user/register.html',{'form':forms})

def user_page(request):
    uid = request.session['userid']
    request_obj = RegisterModel.objects.get(id=uid)
    myfile=''
    a=''
    b=''
    c=''
    d=''
    if request.method=="POST"and request.FILES['myfile']:
        myfile = request.FILES['myfile']
        a=request.POST.get('name')
        b=request.POST.get('category')
        c=request.POST.get('area')
        UploadModel.objects.create(file_name=a,category=b,upload_user=request_obj,upload_file=myfile,area=c)
    return render(request,'user/user_page.html')

def upload_fileview(request):
    uid=''
    sts = 'pending'
    sent = 'sent'
    uid = request.session['userid']
    request_obj = RegisterModel.objects.get(id=uid)
    obj=UploadModel.objects.filter(upload_user=request_obj)
    if request.method=="POST":
        uid=request.session['userid']
        request_obj=RegisterModel.objects.get(id=uid)
        subject = "OTP"
        text_content = ""
        otp = randint(1000, 9999)
        request.session['otp']=otp
        html_content = "<br/><p>OTP :<strong>" + str(otp) + "</strong>/p>"
        from_mail = DEFAULT_FROM_EMAIL
        to_mail = [request_obj.email]
    # if send_mail(subject,message,from_mail,to_mail):
        msg = EmailMultiAlternatives(subject, text_content, from_mail, to_mail)
        msg.attach_alternative(html_content, "text/html")
        if msg.send():
            sts='sent'
            #return redirect('otppage',lawer=userObj.id)
    return render(request,'user/upload_fileview.html',{'obj':obj,'sts':sts,'sent':sent,})

def otppage(request,pk):
    password = request.session['otp']
    sts = "c"
    pas = type(password)
    ss=''
    count=0
    aaa=''
    vott,vott1=0,0
    pkid=UploadModel.objects.get(id=pk)
    aaa=pkid.id
    request.session['jhf']=aaa
    if request.method == "POST":

        objs = UploadModel.objects.get(id=pk)
        unid = objs.id
        vot_count = UploadModel.objects.all().filter(id=unid)
        for t in vot_count:
            vott = t.add_count
        vott1 = vott + 1
        obj = get_object_or_404(UploadModel, id=unid)
        obj.add_count = vott1
        obj.save(update_fields=["add_count"])



        onetime = request.POST.get('otp', '')
        ss = onetime
        if int(password) == int(onetime):

            return redirect('download_page')
        else:
            sts = "Please Enter Correct OTP"

    return render(request, 'user/otppage.html',{'password':pas,'sts':sts,'count':aaa})

def download_page(request):
    count=0
    aaaa= request.session['jhf']
    obj=UploadModel.objects.filter(id=aaaa)
    if request.method == "POST":
        obj = get_object_or_404(UploadModel, id=obj)
        obj.add_count = count
        obj.save(update_fields=["add_count"])
        return redirect('upload_fileview')
    return render(request,'user/download_page.html',{'a':aaaa,'obj':obj})
def request(request,pk):
    a=''
    userid = request.session['userid']
    uobj = RegisterModel.objects.get(id=userid)
    obj = UploadModel.objects.get(id=pk)
    a=obj.category
    RequestModel.objects.create(accessone=uobj,accesstwo=obj,cate=a)
    return redirect('download_page')


def view_file(request):
    uid = request.session['userid']
    request_obj = RegisterModel.objects.get(id=uid)
    obj = UploadModel.objects.filter(upload_user=request_obj)
    return render(request,'user/view_file.html',{'obj':obj})

def send_feedback(request):
    uid = request.session['userid']
    objec = RegisterModel.objects.get(id=uid)
    if request.method == "POST":
        feed = request.POST.get('feedback')
        FeedbackModel.objects.create(username=objec, feedback=feed)
    return render(request,'user/send_feedback.html')

def mydetails(request):
    usid = request.session['userid']
    us_id = RegisterModel.objects.get(id=usid)
    return render(request,'user/mydetails.html',{'obje':us_id})