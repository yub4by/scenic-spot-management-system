function byId(id){
	return document.getElementById(id);
}
function showError(item){
	byId("lbl_"+item.id).innerHTML="error";
	byId("lbl_"+item.id).className="error";
}
function showOK(item){
	byId("lbl_"+item.id).innerHTML="ok";
	byId("lbl_"+item.id).className="ok";
}
//验证用户名
function userName_test(item){
	var result = true;
	$.ajax({
		url:"UserServlet?flag=checkName",
		type:"post",
		data:{
			userName:$("#userName").val()
		},
		success:function(data){
              $("#lbl_userName").text("");//.empty()
              $("#lbl_userName").text(data);//append,html,text
              if(data=="ok"){
              	$("#lbl_userName").addClass("ok");
              }else{
              	$("#lbl_userName").addClass("error");
              }
		}
	});
	if(byId("lbl_"+item.id).innerHTML=="ok"){
		result = true;
	}else{
		result = false;
	}
	return result;
}
//验证密码
function password_test(item){
	var result = true;
	if(item.value ==""){
		result = false;
		showError(item);
	}else{
		result = true;
		showOK(item);
	}
	return result;
}
//验证重复密码
function password_confirm(item){
	var result = true;
	if(item.value != byId("password").value){
		result = false;
		showError(item);
	}else{
		result = true;
		showOK(item);
	}
	return result;
}
//验证邮箱
function email_test(item){
	var result = true;
	var reg = /^[0-9a-zA-Z_]{5,12}@(163|126|qq|yahoo|gmail|sina)\.(com|com\.cn|cn|la)$/;
	if(!reg.test(byId("email").value) ){
		result = false;
		showError(item);
	}else{
		result = true;
		showOK(item);
	}
	return result;
}
function validate(){
	var result = true;
	if(userName_test(byId("userName")) == false){
		result = false;
	}
	if(password_test(byId("password")) == false){
		result = false;
	}
	if(password_confirm(byId("confirm")) == false){
		result = false;
	}
	if(email_test(byId("email")) == false){
		result = false;
	}
	if(result==false){
		alert("注册信息填写不正确！");//js弹出乱码
	}
	if(result == true){
		result = confirm("确定提交吗？");
	}
	return result;	
}