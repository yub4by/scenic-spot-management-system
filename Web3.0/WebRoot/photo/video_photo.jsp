<%@ page language="java" import="java.util.*,beans.*,dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'video_photo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <% 
    	String strid = request.getParameter("id");
    	int id = Integer.parseInt(strid);
    	VideoInfo vd = new VideoDao().getVideoById(id);
    	
    	response.setContentType("text/jpg");
    	
    	ServletOutputStream os = response.getOutputStream();
    	os.write(vd.getPhoto());
    	
    	out.clear();
    	out=pageContext.pushBody();
    %>
  </body>
</html>
