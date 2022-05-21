<%@ page language="java" import="java.util.*,beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'news.jsp' starting page</title>
    
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

  </head>
  
  <body>
  <table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td align="left" valign="top">
    <form method="post" action="UserServlet?flag=doUpdate" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="left" valign="middle" class="borderright borderbottom main-for">
         <center>
      	    <%--  <input type="text" value="${news.title }" readonly="readonly" class="text-word"> --%>
        	<h1 style="color:red">${news.title }</h1>
         </center>
        </td>
        </tr>
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="left" valign="middle" class="borderright borderbottom main-for">
          <center>
          	<%-- <input type="text" value="时间：${news.createDate }|作者：${news.author }" readonly="readonly" class="text-word"> --%>
         	<h3 style="color:blue">时间：${news.createDate }|作者：${news.author }| 阅读次数：${news.seeCount }</h3>
          </center>
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="left" valign="middle" class="borderright borderbottom main-for">
	        <center>
	        	<%-- <input type="text" value="${news.content }" readonly="readonly" class="text-word"> --%>
		        <!-- <textarea rows="20" cols="60" class="text-word" readonly="readonly" > -->
		       		${news.content }
		        <!-- 	</textarea> -->
	       </center>
        </td>
        </tr>
    </table>
    </form>
    </td>
    </tr>
    <tr>
    <td align="left" valign="top" id="addinfo">
      <a href="MainServlet" onFocus="this.blur()" class="add">返回主页</a>
    </td>
  </tr>
</table>
</body>
</html>
