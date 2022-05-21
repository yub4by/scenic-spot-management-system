<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_scenic.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/css.css" type="text/css" rel="stylesheet" />
	<link href="css/add.css" type="text/css" rel="stylesheet" />
	<link href="css/main.css" type="text/css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="images/main/favicon.ico" />
	<script type="text/javascript" src="js/imagePreview.js"></script>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

  </head>
  
  <body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">
    <div class="place"><span>您的位置：景点管理&nbsp;&nbsp;>&nbsp;&nbsp;添加景点</span></div>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form method="post" action="SpotServlet?flag=add" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景点图像：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        	<input type="file" name="photo" required="required" class="text-word" onchange="setImagePreview(this,localImag,preview,'120px','120px');" /> 
       		<div id="localImag" ></div>
       		<img id="preview" alt="请上传照片" style="width:120px; height: 120px;"/>
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景点名称：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="spotName" name="spotName" required="required" placeholder="不允许为空！"  class="text-word" >
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">所属景区：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="address" name="address" required="required" placeholder="不允许为空！" class="text-word" >
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景点描述：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <textarea rows="10" cols="40" id="note" name="note" placeholder="不允许为空！" required="required" class="text-word"></textarea>
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
</table>
</body>
</html>
