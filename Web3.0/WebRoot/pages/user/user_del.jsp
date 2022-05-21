<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_del.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/css.css" type="text/css" rel="stylesheet" />
	<link href="css/list.css" type="text/css" rel="stylesheet" />
	<link href="css/main.css" type="text/css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="images/main/favicon.ico" />

  </head>
  
  <body>
	<!--main_top-->
	<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
	  <tr>
	    <td width="99%" align="left" valign="top">
	    <div class="place"><span> 您的位置：用户管理 > 已删用户列表</span></div>
	    </td>
	  </tr>
	  <tr>
	    <td align="left" valign="top">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
		      <tr>
		      	<th align="center" valign="middle" class="borderright">头像</th>
		        <th align="center" valign="middle" class="borderright">用户ID</th>
		        <th align="center" valign="middle" class="borderright">用户名称</th>
		        <th align="center" valign="middle" class="borderright">用户密码</th>
		        <th align="center" valign="middle" class="borderright">用户备注</th>
		        <th align="center" valign="middle" class="borderright">操作</th>
		      </tr>
		      <c:forEach var="user" items="${list }">
    			<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
    				<td align="center" valign="middle" class="borderright borderbottom">
	    				<c:choose>
	  						<c:when test="${user.photo!=null }">
	  							<img id="img" src="${pageContext.request.contextPath }/pages/user/user_photo.jsp?id=${user.id}">				
	  						</c:when>
	  						<c:otherwise>
	  							暂无数据
	  						</c:otherwise>
	  					</c:choose>
    				</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${user.id }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${user.userName }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${user.password }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${user.note }</td>
    				<td align="center" valign="middle" class="borderbottom">
	    				<a href="UserServlet?flag=upd&id=${user.id }" target="mainFrame" onFocus="this.blur()" class="add" >
	    					<img src="images/t02.png" />修改
	    				</a>
	    				&nbsp;|&nbsp;
	    				<a href="UserServlet?flag=rcv&id=${user.id }" onclick="return confirm('确定恢复吗？')" target="mainFrame" onFocus="this.blur()" class="add" >
	    					<img src="images/t01.png" />恢复
	    				</a>
    				</td>
    			</tr>
    		 </c:forEach>
		    </table>
	    </td>
	  </tr>
	  
	</table>
</body>
</html>
