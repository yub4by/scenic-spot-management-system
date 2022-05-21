<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/css.css" type="text/css" rel="stylesheet" />

  </head>
  
  <body>
  	<table>
  		<tr>
  			<!-- 第一列 -->
  			<td align="left">
  				<table>
  					<tr>
  						<td>
  							<h1><a href="pages/main/main.jsp" target="mainFrame" onFocus="this.blur()"><img src="images/admin_logo.png"/></a></h1>
  						</td>
  					</tr>
  					<tr>
  						<td>
  							<span style="color: white;">
				  				<SCRIPT type=text/javascript src="js/clock.js"></SCRIPT>
								<SCRIPT type=text/javascript>showcal();</SCRIPT>
							</span>
			  			</td>
  					</tr>
  				</table>
  			</td>
  			<!-- 第二列 -->
  			<td valign="bottom" id="header-menu" align="center">
			        <!-- <a href="tencent://message/?uin=1196006753&Site=在线QQ&Menu=yes" onFocus="this.blur()">在线客服</a>
			        <a href="MessageServlet?flag=sel" target="mainFrame" onFocus="this.blur()">留言板</a>
			        <a href="pages/main/error.jsp" target="mainFrame" onFocus="this.blur()">404</a> -->
  			</td>
  			<!-- 第三列 -->
  			<td valign="bottom" align="right">
  				<script charset="Shift_JIS" src="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_tr.js"></script>
  			</td>
  			<!-- 第四列 -->
  			<!-- <td valign="top" id="header-right">
	        	<a href="UserServlet?flag=logout" target="_blank" onFocus="this.blur()" class="admin-out" onclick="javascript:window.close()" >注销</a>
	            <a href="https://user.qzone.qq.com/1196006753" target="_blank" onFocus="this.blur()" class="admin-home">qzone</a>
	        	<a href="https://weibo.com/2887929925/profile" target="_blank" onFocus="this.blur()" class="admin-index">weibo</a>       	
  			</td> -->
  		</tr>
  	</table>
  </body>
</html>
