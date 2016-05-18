$(document).ready(function(){
    $(".chat-msg-sendbox").delegate('input','keydown',function(e){
    if(e.which ==13){
    var msg_text = $("#input-msg").val();
    if($.trim(msg_text).length>0){
//    SendMsg(msg_text);
        console.log(msg_text);
    }
    AddSentMsgIntoBox(msg_text);
    $("#input-msg").val('');
    }
    });//end delegate
});//end document ready

function AddSentMsgIntoBox(msg_text){
    var d = new Date();
    var send_time = d.toGMTString()
    var username = {{user.username}}
    console.log(username)
    var msg_ele = "<li class='media chat-content'><div class='media-body'><div class='media'>"+
        "<a class='pull-left' href='#'> <img class='media-object img-circle' src='/static/img/user.png'/></a>"+
        "<div class='media-body'>"+msg_text+"<br/><small class='text-muted'>"+{{user.username}}+"|"+ send_time+"</small><hr/></div></div></div></li>"
    $(".chat-content").append(msg_ele)
}