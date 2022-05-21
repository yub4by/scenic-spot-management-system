<%@ page language="java" import="java.util.*,beans.*,dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/css.css" type="text/css" rel="stylesheet" />
	<link href="css/add.css" type="text/css" rel="stylesheet" />
	<link href="css/mi.css" type="text/css" rel="stylesheet" />
	<link href="css/main.css" type="text/css" rel="stylesheet" />
	<link rel="shortcut icon" href="images/main/favicon.ico" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/WdatePicker.js"></script>

  </head>
  
  <body>
<!--main_top-->
<%
			NewsInfo news = (NewsInfo) request.getAttribute("news");
%>
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">
      <div class="place"><span> 您的位置：新闻发布&nbsp;&nbsp;>&nbsp;&nbsp;新闻更新</span></div>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form action="NewsServlet?flag=update" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">新闻ID：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="id" name="id" value="<%=news.getId()%>" readonly  class="text-word" >
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">新闻题目：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="title" name="title" value="<%=news.getTitle()%>" required="required" placeholder="不允许为空！"  class="text-word" >
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">新闻作者：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="author" name="author" value="<%=news.getAuthor()%>" required="required" placeholder="不允许为空！" class="text-word" >
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">新闻内容：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
       	<textarea rows="10" cols="40" id="content" name="content" placeholder="不允许为空！" required="required" class="text-word">
       	<%=news.getContent()%>
       	</textarea>
        </td>
        </tr>
        <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"></td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        	<input type="hidden" name="createDate" value="<%=news.getCreateDate()%>"/>
        </td>
        </tr>
        <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">浏览次数：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="seeCount" name="seeCount" value="<%=news.getSeeCount()%>" readonly placeholder="不允许为空！" class="text-word" >
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
      <a href="NewsServlet?flag=manage" target="mainFrame" onFocus="this.blur()" class="add">返回上一级</a>
    </td>
  </tr>
</table>
</body>
</html>

