from django.shortcuts import render,HttpResponse
import json,Queue,datetime
from webuser.models import Webuser
from django.contrib.auth.decorators import login_required
# Create your views here.
from .models import ChatGroup

GLOBAL_MQ = {

}
@login_required
def webchat(request):
    return render(request,'webchat/webchat.html')

def contacts(request):
    contact_dic={}
    contacts = request.user.webuser.friends.select_related().values('id','user__username','online')

    for i in contacts:
        webuser = Webuser.objects.get(pk=i['id'])
        i["pictures"] = webuser.get_picture()
    print contacts
    contact_dic['contact_list'] = list(contacts)
    groups = request.user.webuser.chatgroup_set.select_related().values('id','name','memberlimits')
    print groups
    contact_dic['group_list'] = list(groups)
    print contact_dic

    return HttpResponse(json.dumps(contact_dic))

def newmsg(request):
    if request.method == 'POST':
        data = json.loads(request.POST.get('data'))
        send_to = data['to']
        if send_to not in GLOBAL_MQ:
            GLOBAL_MQ[send_to] = Queue.Queue()
        data['timestamp'] = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        GLOBAL_MQ[send_to].put(data)
        print GLOBAL_MQ
        print GLOBAL_MQ[send_to]
        return HttpResponse(GLOBAL_MQ[send_to].qsize())
    else:
        request_user_id = str(request.user.webuser.id)
        msg_list = []
        if request_user_id in GLOBAL_MQ:
            stored_ms_nums = GLOBAL_MQ[request_user_id].qsize()
            if stored_ms_nums == 0:
                try:
                    msg_list.append(GLOBAL_MQ[request_user_id].get(timeout=15))
                except Exception as e:
                    print "ERROR",e
            for i in range(stored_ms_nums):
                msg_list.append(GLOBAL_MQ[request_user_id].get())
        else:
            GLOBAL_MQ[request_user_id]=Queue.Queue()
        print msg_list
        return HttpResponse(json.dumps(msg_list))