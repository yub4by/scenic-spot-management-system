<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_vedio.jsp' starting page</title>
    
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
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">
    <div class="place"><span>您的位置：视频发布&nbsp;&nbsp;>&nbsp;&nbsp;发布视频</span></div>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form action="VideoServlet?flag=add" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="flag" value="add">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">视频名称：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="video_full_name" name="video_full_name" required="required" placeholder="不允许为空！"  class="text-word" >
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">视频介绍：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" id="video_introduction" name="video_introduction" required="required" placeholder="不允许为空！" class="text-word" >
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">视频作者：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
       <input type="text" id="author_email" name="author_email" required="required" placeholder="不允许为空！" class="text-word" >
        </td>
        </tr>
        <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">视频链接：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="url" id="link" name="link" required="required" placeholder="不允许为空！" class="text-word" >
        </td>
        </tr>
       <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">视频预览：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="file" id="file" name="file" required="required" placeholder="不允许为空！" class="text-word" onchange="setImagePreview(this,localImag,preview,'120px','120px');">
        <div id="localImag" ></div>
       	<img id="preview" alt="请上传照片" style="width:120px; height: 120px;"/>
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
      <a href="VideoServlet?flag=sel" target="mainFrame" onFocus="this.blur()" class="add">返回上一级</a>
    </td>
  </tr>
</table>
</body>
</html>

