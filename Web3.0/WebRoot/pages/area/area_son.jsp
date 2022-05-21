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
    
    <title>My JSP 'area_son.jsp' starting page</title>
    
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
	    <div class="place"><span>您的位置：景区管理 > 下设景点列表</span></div>
	    </td>
	  </tr>
	  <tr>
	    <td align="left" valign="top">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
	    <tr>
	     <c:forEach var="area" items="${area }">
		        	<td align="center" valign="middle" class="borderright borderbottom">
			        	<table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
			        		<tr>
			        			<th align="center" valign="middle" id="${area.areaName }" class="borderright">${area.areaName }</th>
			        		</tr>
			        		<c:forEach var="spot" items="${spot }">
			    				 <c:if test="${spot.address == area.areaName }">
			    				 	<tr><td align="center" valign="middle" class="borderright borderbottom">${spot.spotName }</td></tr>
			    				 </c:if>
	    				    </c:forEach>
			        	</table>
		        	</td>
		  </c:forEach>
		  </tr>
		  </table>
	    </td>
	  </tr>
	</table>
</body>
</html>