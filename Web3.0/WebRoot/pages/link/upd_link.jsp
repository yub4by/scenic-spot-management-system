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
    
    <title>My JSP 'upd_link.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/imagePreview.js"></script>

  </head>
  
    <body>
<!--main_top-->
<%
			LinkInfo link = (LinkInfo)request.getAttribute("link");
%>
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">
      <div class="place"><span> 您的位置：友情链接&nbsp;&nbsp;>&nbsp;&nbsp;链接更新</span></div>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form action="LinkServlet?flag=doUpd" method="post" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">链接ID：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="id" name="id" value="<%=link.getId()%>" readonly  class="text-word" >
        </td>
        </tr>
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">链接图像：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="file" name="photo"  class="text-word" onchange="setImagePreview(this,localImag,preview,'120px','120px');" >
        <div id="localImag" ></div>
        <img src="${pageContext.request.contextPath }/pages/link/link_photo.jsp?id=${link.id}" style="width: 120px;height: 120px;" id="preview" alt="请上传新图像">
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">链接名称：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="linkName" name="linkName" value="<%=link.getLinkName()%>" required="required" placeholder="不允许为空！"  class="text-word" >
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">链接URL：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="url" id="linkStr" name="linkStr" value="<%=link.getLinkStr()%>" required="required" placeholder="不允许为空！" class="text-word" >
        </td>
        </tr>
       <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">链接状态：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="radio" name="state" value="1"  <c:if test="${link.state == 1 }"> checked="checked" </c:if>	 	>恢复正常
       	<input type="radio" name="state" value="0"  <c:if test="${link.state == 0 }"> checked="checked" </c:if> 	>删除链接
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
      <a href="LinkServlet?flag=sel" target="mainFrame" onFocus="this.blur()" class="add">返回上一级</a>
    </td>
  </tr>
</table>
</body>
</html>
