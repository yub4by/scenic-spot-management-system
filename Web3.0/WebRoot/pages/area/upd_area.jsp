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
    
    <title>My JSP 'upd_area.jsp' starting page</title>
    
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
     	AreaInfo area = (AreaInfo)request.getAttribute("area");
  %>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">
     <div class="place"><span>您的位置：景区管理&nbsp;&nbsp;>&nbsp;&nbsp;修改景区</span></div>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form method="post" action="AreaServlet?flag=doupd" >
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景区ID：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="id" value="<%=area.getId()%>" readonly="readonly" required="required" class="text-word">
        </td>
        </tr>
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景区名称：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="areaName" value="<%=area.getAreaName()%>" required="required" class="text-word">
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景区描述：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
      <textarea rows="10" cols="40" id="note" name="note"  required="required" class="text-word"><%=area.getNote()%></textarea>
        </td>
        </tr>
        <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景区状态：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        	<input type="radio" name="state" value="1" <c:if test="${area.state == 1 }"> checked="checked" </c:if>  >恢复正常
        	<input type="radio" name="state" value="0" <c:if test="${area.state == 0 }"> checked="checked" </c:if>  >删除景区
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
     <tr>
    <td align="left" valign="top" id="addinfo">
      <a href="AreaServlet?flag=sel" target="mainFrame" onFocus="this.blur()" class="add">返回上一级</a>
    </td>
  </tr>
</table>
</body>
</html>
