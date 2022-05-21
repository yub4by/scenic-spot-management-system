<%@ page language="java" import="java.util.*,beans.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update_user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/css.css" type="text/css" rel="stylesheet" />
	<link href="css/add.css" type="text/css" rel="stylesheet" />
	<link href="css/mi.css" type="text/css" rel="stylesheet" />
	<link href="css/main.css" type="text/css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="images/main/favicon.ico" />
	<script type="text/javascript" src="js/imagePreview.js"></script>
  </head>
  
  <body>
  <%
     	UserInfo user = (UserInfo)request.getAttribute("user");
  %>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">
     <div class="place"><span>您的位置：用户管理&nbsp;&nbsp;>&nbsp;&nbsp;修改用户</span></div>
     </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form method="post" action="UserServlet?flag=doUpdate" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">头像：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="file" name="photo"  class="text-word" onchange="setImagePreview(this,localImag,preview,'120px','120px');" >
       	    <div id="localImag" ></div>
        	<c:choose>
				<c:when test="${user.photo!=null }">
					<img src="${pageContext.request.contextPath }/pages/user/user_photo.jsp?id=${user.id}" style="width: 120px;height: 120px;" id="preview" alt="请上传新头像">
				</c:when>
				<c:otherwise>
					<img src="" style="width: 120px;height: 120px;" id="preview" alt="暂无数据">
				</c:otherwise>
			</c:choose>
        </td>
        </tr>
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户ID：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="id" value="<%=user.getId()%>" readonly="readonly" required="required" class="text-word">
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户名：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="userName" value="<%=user.getUserName()%>" required="required" class="text-word">
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户密码：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="password" value="<%=user.getPassword()%>" required="required" class="text-word">
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户备注：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="note" value="<%=user.getNote()%>" required="required" class="text-word">
        </td>
      </tr>
     <!--  <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户权限：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <select name="level" id="level">
	    <option value="1" >&nbsp;&nbsp;普通用户</option>
	    <option value="2" >&nbsp;&nbsp;一般管理员</option>
	    <option value="3" >&nbsp;&nbsp;超级管理员</option>
        </select>
        </td>
      </tr> -->
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
    <tr>
    <td align="left" valign="top" id="addinfo">
      <a href="UserServlet?flag=sel" target="mainFrame" onFocus="this.blur()" class="add">返回上一级</a>
    </td>
  </tr>
</table>
</body>
</html>
