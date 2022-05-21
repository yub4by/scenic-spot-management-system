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
    
    <title>My JSP 'message_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/ml.css" type="text/css" rel="stylesheet" />
	<link href="css/css.css" type="text/css" rel="stylesheet" />
	<link href="css/main.css" type="text/css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="images/main/favicon.ico" />

</head>
<body>
<form action="MessageServlet?flag=sel" method="post">
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top" id="addinfo">
    <div class="place"><span>您的位置：留言板</span></div>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr>
        <th align="center" valign="middle" class="borderright">留言编号</th>
        <th align="center" valign="middle" class="borderright">留言用户</th>
  		<th align="center" valign="middle" class="borderright">留言内容</th>
        <th align="center" valign="middle" class="borderright">留言状态</th>
        <th align="center" valign="middle" class="borderright">留言时间</th>
         <th align="center" valign="middle" class="borderright">回复时间</th>
         <th align="center" valign="middle" class="borderright">回复内容</th>
        <th align="center" valign="middle">操作</th>
      </tr>
      <c:forEach var="msg" items="${msgList }">
			<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
				<td align="center" valign="middle" class="borderright borderbottom">${msg.id }</td>
				<td align="center" valign="middle" class="borderright borderbottom">${msg.userName }</td>
				<td align="center" valign="middle" class="borderright borderbottom" style="width: 500">${msg.message }</td>
				<td align="center" valign="middle" class="borderright borderbottom">${msg.state==1?"未审核":(msg.state==2?"已审核":"已删除") }</td>
				<td align="center" valign="middle" class="borderright borderbottom">${msg.leaveTime }</td>
				<td align="center" valign="middle" class="borderright borderbottom">${msg.replayTime }</td>
					<td align="center" valign="middle" class="borderright borderbottom">${msg.replayMsg }</td>
				<td align="center" valign="middle" class="borderbottom">
 				<a href="MessageServlet?flag=rep&id=${msg.id }" target="mainFrame" onFocus="this.blur()" class="add" >
 				<img src="images/leftico02.png" />回复
 				</a>
 				&nbsp;|&nbsp;
 				<a href="MessageServlet?flag=pas&id=${msg.id }" onclick="return confirm('确定通过审核吗？')" target="mainFrame" onFocus="this.blur()" class="add" >
 					<img src="images/leftico03.png" />审核
 				</a>
 				&nbsp;|&nbsp;
 				<a href="MessageServlet?flag=del&id=${msg.id }" onclick="return confirm('确定删除留言吗？')" target="mainFrame" onFocus="this.blur()" class="add" >
 					<img src="images/leftico04.png" />删除
 				</a>
 				&nbsp;|&nbsp;
 				<a href="MessageServlet?flag=see&id=${msg.id }"  target="mainFrame" onFocus="this.blur()" class="add" >
 					<img src="images/leftico01.png" />查看
 				</a>
				</td>
			</tr>
  	 </c:forEach>
      
    </table></td>
    </tr>
</table>
</form>
</body>
</html>
