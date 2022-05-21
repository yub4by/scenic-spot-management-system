<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/login.css" />
	<style>
	body{height:100%;background:#16a085;overflow:hidden;}
	canvas{z-index:-1;position:absolute;}
	</style>
	<script src="js/jquery_login.js"></script>
	<script src="js/verificationNumbers.js"></script>
	<script src="js/Particleground.js"></script>
	<script>
	$(document).ready(function() {
	  //粒子背景特效
	  $('body').particleground({
	    dotColor: '#5cbdaa',
	    lineColor: '#5cbdaa'
	  });
	  //验证码
	  createCode();
	});
	</script>

  </head>
  
  <body>
   <form action="LoginServlet" method="post" onsubmit="return validate()">
    <dl class="admin_login">
    
	 <dt>
	  <strong>用户登录</strong>
	  <em>User Login</em>
	 </dt>
	 
	 <dd ><!-- class="user_icon" -->
	  <input type="text" name="userName" placeholder="账号" class="login_txtbx"/>
	 </dd>
	 
	 <dd ><!-- class="pwd_icon" -->
	  <input type="password" name="password" placeholder="密码" class="login_txtbx"/>
	 </dd>
	 
	 <dd ><!-- class="val_icon" -->
	  <div class="checkcode">
	    <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
	    <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
	  </div>
	  <input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
	 </dd>
	 
	 <dd>
	  <input type="submit" value="立即登录" class="submit_btn"/>
	 </dd>
	 
	</dl>
	</form>
	
	<center>
    	<a href="enroll.jsp">没有账号，请先注册</a>
    	<br>
    	<h1 style="color:red">${msg }</h1>
    </center>
    
  </body>
</html>
