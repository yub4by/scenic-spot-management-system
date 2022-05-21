<%@ page language="java" import="java.util.*,beans.*" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/css.css" type="text/css" rel="stylesheet" />
	<link href="css/left.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="js/sdmenu.js"></script>
	<script type="text/javascript">
		// <![CDATA[
		var myMenu;
		window.onload = function() {
			myMenu = new SDMenu("my_menu");
			myMenu.init();
		};
		// ]]>
	</script>
	
  </head>
  
  <body onselectstart="return false;" ondragstart="return false;" oncontextmenu="return false;">
	<%
	    	UserInfo user=(UserInfo)session.getAttribute("user");
	    	String role="";
	    	if("admin".equals(user.getUserName())){
	    		role="一般管理员";
	    	}else if("root".equals(user.getUserName())){
	    		role="超级管理员";
	    	}else{
	    		role="普通用户";
	    	}
   	 %>
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
        <span>登录信息</span>
       <%--  <a><img alt="头像" src="${pageContext.request.contextPath }/pages/user/user_photo.jsp?id=${user.id}"; width="30" height="30" /></a> --%>
        <a>用户：<%=user.getUserName() %></a>
        <a>角色：<%=role %></a>
       <!-- <a><img alt="注销" src="images/main/exit.jpg"; href="UserServlet?flag=logout"/></a>
       	<a><img alt="微博" src="images/main/bool.jpg"; href="https://weibo.com/2887929925/profile"/></a>
       	<a><img alt="空间" src="images/main/home.jpg"; href="https://user.qzone.qq.com/1196006753"/></a>
       	<a><img alt="邮箱" src="images/main/time.jpg"; href="mailto:1196006753@qq.com"/></a> -->
        <p>
        	<img src="${pageContext.request.contextPath }/pages/user/user_photo.jsp?id=${user.id}"; width="45" height="45" />
       		<input type="image" alt="注销" src="images/main/exit.jpg" onclick="window.open('UserServlet?flag=logout')">
       		<input type="image" alt="微博" src="images/main/bool.jpg" onclick="window.open('https://weibo.com/2887929925/profile')">
       		<input type="image" alt="空间" src="images/main/home.jpg" onclick="window.open('https://user.qzone.qq.com/1196006753')">
       		<input type="image" alt="邮箱" src="images/main/time.jpg" onclick="window.open('mailto:1196006753@qq.com')">
        </p>
      </div>
      <div>
        <span>用户管理</span>
        <a href="pages/user/add_user.jsp" target="mainFrame" onFocus="this.blur()">添加用户</a>
        <a href="UserServlet?flag=sel" target="mainFrame" onFocus="this.blur()">用户列表</a>
        <a href="UserServlet?flag=deld" target="mainFrame" onFocus="this.blur()">已删用户</a>
      </div>
      <div>
        <span>景点管理</span>
        <a href="pages/spot/add_spot.jsp" target="mainFrame" onFocus="this.blur()">添加景点</a>
        <a href="SpotServlet?flag=sel" target="mainFrame" onFocus="this.blur()">景点列表</a>
        <a href="SpotServlet?flag=deld" target="mainFrame" onFocus="this.blur()">已删景点</a>
      </div>
      <div>
        <span>景区管理</span>
        <a href="pages/area/add_area.jsp" target="mainFrame" onFocus="this.blur()">添加景区</a>
        <a href="AreaServlet?flag=sel" target="mainFrame" onFocus="this.blur()">景区列表</a>
        <a href="AreaServlet?flag=son" target="mainFrame" onFocus="this.blur()">下设景点</a>
      </div>
      <div>
        <span>留言管理</span>
        <a href="MessageServlet?flag=seee" target="mainFrame" onFocus="this.blur()">查看留言</a>
        <a href="MessageServlet?flag=repp" target="mainFrame" onFocus="this.blur()">回复留言</a>
        <a href="MessageServlet?flag=dell" target="mainFrame" onFocus="this.blur()">删除留言</a>
        <a href="MessageServlet?flag=pass" target="mainFrame" onFocus="this.blur()">审核留言</a>
      </div>
      <div>
        <span>系统管理</span>
        <a href="SystemServlet" target="mainFrame" onFocus="this.blur()">系统设置</a>
        <a href="NewsServlet?flag=manage" target="mainFrame" onFocus="this.blur()">新闻发布</a>
        <a href="VideoServlet?flag=sel" target="mainFrame" onFocus="this.blur()">视频发布</a>
        <a href="LinkServlet?flag=sel" target="mainFrame" onFocus="this.blur()">友情链接</a>
      </div>
    </div>
  </body>
</html>
