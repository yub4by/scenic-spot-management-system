<%@ page language="java" import="java.util.*,beans.*" pageEncoding="UTF-8"%>、
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'message_replay.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/mr.css" type="text/css" rel="stylesheet" />
	<link href="css/css.css" type="text/css" rel="stylesheet" />
	<link href="css/main.css" type="text/css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="images/main/favicon.ico" />

  </head>
  
  <body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">
  		 <div class="place"><span> 您的位置：留言板&nbsp;&nbsp;>&nbsp;&nbsp;留言回复</span></div>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form method="post" action="MessageServlet?flag=dorep&id=${msg.id }">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">留言时间：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">${msg.leaveTime }</td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">留言内容：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for" style="line-height:24px;">${msg.message }</td>
      </tr>
      <c:if test="${msg.replayMsg!=null }">
		  <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="right" valign="middle" class="borderright borderbottom bggray">回复时间：</td>
	        <td align="left" valign="middle" class="borderright borderbottom main-for">${msg.replayTime }</td>
	      </tr>
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="right" valign="middle" class="borderright borderbottom bggray">回复内容：</td>
	        <td align="left" valign="middle" class="borderright borderbottom main-for">${msg.replayMsg }</td>
	      </tr>									
	  </c:if>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">回复内容：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        	<div><textarea name="content" cols="40" rows="10" required="required"></textarea>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
	        <input name="" type="submit" value="确定" class="text-but">
	        <input name="" type="reset" value="重置" class="text-but">
        </td>
      </tr>
    </table>
    </form>
    </td>
    </tr>
    <tr>
    <td align="left" valign="top" id="addinfo">
    <a href="MessageServlet?flag=repp" target="mainFrame" onFocus="this.blur()" class="add">返回上一级</a>
    </td>
  </tr>
</table>
</body>
</html>
