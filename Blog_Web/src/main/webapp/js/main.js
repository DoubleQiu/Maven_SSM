function bloggerEdit() {
    var blogger_edit=document.getElementById("blogger-edit");
    var text=$('input[type=text]');
    var hidden=$('input[type=hidden]');
    if(blogger_edit.innerHTML=="编辑资料") {
        blogger_edit.innerHTML="提交修改";
        document.getElementsByTagName('form')[0].addEventListener('submit',function(e){
            e.preventDefault();
        },false);
        text.removeAttr("disabled");
        text.css("color","rgba(0,0,238,0.5)");
    }else{
        blogger_edit.innerHTML="编辑资料";
        text.attr("disabled",true);
        text.css("color","#222");
        hidden[1].value=text[0].value;
        hidden[2].value=text[1].value;
        hidden[3].value=text[2].value;
        hidden[4].value=text[3].value;
        document.getElementsByTagName('form')[0].submit();
    }
}
function delConfirm() {
    if(confirm("确认删除？")==true){
        return true;
    }else{
        return false;
    }
}
function checkUserId() {
    var user_id=document.getElementById("user_id").value;
    if(user_id==""){
        document.getElementsByTagName("form")[0].action="#";
        alert("评论前请先登录！");
    }
}