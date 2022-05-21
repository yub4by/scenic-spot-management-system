<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %><!-- errorPage="error.jsp" -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<style type="text/css">
		frame {
			border-color: rgb(22,160,133);
			border-width: 5px;
		}
	</style>

</head>
	<%-- ${10%0 } --%><!-- 404error页测试 -->

<frameset rows="94,*,10" cols="*" framespacing="0" frameborder="no" border="0">
		<frame style="background-color: rgb(22,160,133)" src="pages/main/t.jsp" scrolling="no" noresize="" frameborder="no" name="topframe" id="topframe" title="topframe" />
		<frameset cols="180,8,*,10" rows="*" framespacing="0" frameborder="no" border="0" id="attachucp">
			<frame style="background-color: rgb(248,248,248)" src="pages/main/l.jsp?user=${user}" scrolling="auto" noresize="" frameborder="no" name="leftFrame" ></frame>
			<frame style="background-color: rgb(248,248,248)" src="pages/main/swich.jsp" scrolling="no" noresize="" frameborder="no" name="switchFrame" id="leftbar"></frame>
			<frame style="background-color: rgb(238,238,238)" src="pages/main/main.jsp" scrolling="auto" noresize="" frameborder="no" name="mainFrame" ></frame>
			<frame style="background-color: rgb(22,160,133)" src="pages/main/b.jsp" scrolling="no" noresize="" frameborder="no" />
		</frameset>
		<frame style="background-color: rgb(22,160,133)" src="pages/main/b.jsp" scrolling="no" noresize="" frameborder="no" />
	</frameset><noframes></noframes>
</html>
