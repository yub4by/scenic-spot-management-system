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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/login.css" />
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/enroll.js"></script>
	<style>
	body{height:100%;background:#16a085;overflow:hidden;}
	canvas{z-index:-1;position:absolute;}
	</style>
	<script src="js/jquery_login.js"></script>
	<script src="js/Particleground.js"></script>
	<script>
	$(document).ready(function() {
	  //粒子背景特效
	  $('body').particleground({
	    dotColor: '#5cbdaa',
	    lineColor: '#5cbdaa'
	  });
	});
	</script>

  </head>
  
  <body>
   <form action="UserServlet?flag=reg" method="post" onsubmit="return validate()">
	    <dl class="admin_login">
			 <dt>
			  <strong>用户注册</strong>
			   <em>User Log On</em>
			 </dt>
			 <dd >
			  <input type="text" id="userName" name="userName" placeholder="用户名称" required="required" class="login_txtbx" onBlur="userName_test(this)"/>
			  <br><label id="lbl_userName"></label>
			 </dd>
			 <dd >
			  <input type="password" id="password" name="password" placeholder="密码" required="required" class="login_txtbx" onBlur="password_test(this)"/>
			  <br><label id="lbl_password"></label>
			 </dd>
			 <dd >
			  <input type="password" id="confirm" name="confirm" placeholder="确认密码" required="required" class="login_txtbx" onBlur="password_confirm(this)"/>
			  <br><label id="lbl_confirm"></label>
			 </dd>
			 <dd >
			  <input type="text" id="email" name="email" placeholder="邮箱" required="required" class="login_txtbx" onBlur="email_test(this)"/>
			  <br><label id="lbl_email"></label>
			 </dd>
			 <dd>
			  <input type="submit" value="立即注册" class="submit_btn"/>
			 </dd>
		</dl>
	</form>
	<center>
		<a href="login.jsp">已有账号，立即登录</a>
    	<br>
    	<h1 style="color:red">${msg }</h1>
    </center>
  </body>
</html>
