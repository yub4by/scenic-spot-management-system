<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/css.css" type="text/css" rel="stylesheet" />
	<link href="css/add.css" type="text/css" rel="stylesheet" />
	<link href="css/register.css" type="text/css" rel="stylesheet" />
	<link href="css/main.css" type="text/css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="images/main/favicon.ico" />
	<script type="text/javascript" src="js/imagePreview.js"></script>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/register.js"></script>
  </head>
  
  <body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">
    <div class="place"><span>您的位置：用户管理&nbsp;&nbsp;>&nbsp;&nbsp;添加用户</span></div>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form method="post" action="UserServlet?flag=add" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户头像：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        	<input type="file" name="photo" required="required" class="text-word" onchange="setImagePreview(this,localImag,preview,'120px','120px');" /> 
       		<div id="localImag" ></div>
       		<img id="preview" alt="请上传照片" style="width:120px; height: 120px;"/>
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户名称：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="userName" name="userName" required="required" placeholder="不允许为空！"  class="text-word" onBlur="userName_test(this)">
        <label id="lbl_userName"></label>
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户密码：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="password" name="password" required="required" placeholder="不允许为空！" class="text-word" onBlur="password_test(this)">
        <label id="lbl_password"></label>
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">确认密码：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="confirm" name="confirm" required="required" placeholder="须与上面密码相同" class="text-word" onBlur="password_confirm(this)">
        <label id="lbl_confirm"></label>
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户备注：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="note" required="required" placeholder="用户注册时默认为其邮箱" class="text-word">
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户权限：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
	        <select name="level" id="level">
			    <option value="1" >&nbsp;&nbsp;普&nbsp;通&nbsp;用&nbsp;户</option>
			    <option value="2" >&nbsp;&nbsp;一般管理员</option>
			    <option value="3" >&nbsp;&nbsp;超级管理员</option>
	        </select>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input name="" type="submit" value="提交" class="text-but">
        <input name="" type="reset" value="重置" class="text-but"></td>
        </tr>
    </table>
    </form>
    </td>
    </tr>
</table>
</body>
</html>
