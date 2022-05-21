<%@ page language="java" import="java.util.*,beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upd_scenic.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/imagePreview.js"></script>

  </head>
  
  <body>
  <%
     	SpotInfo spot = (SpotInfo)request.getAttribute("spot");
  %>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">
    <div class="place"><span>您的位置：景点管理&nbsp;&nbsp;>&nbsp;&nbsp;修改景点</span></div>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form method="post" action="SpotServlet?flag=doUpdate" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景点图像：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="file" name="photo"  class="text-word" onchange="setImagePreview(this,localImag,preview,'120px','120px');" >
        <div id="localImag" ></div>
        <img src="${pageContext.request.contextPath }/pages/spot/spot_photo.jsp?id=${spot.id}" style="width: 120px;height: 120px;" id="preview" alt="请上传新头像">
        </td>
        </tr>
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景点ID：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="id" value="<%=spot.getId()%>" readonly="readonly" required="required" class="text-word">
        </td>
        </tr>
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景点名称：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="spotName" value="<%=spot.getSpotName()%>" required="required" class="text-word">
        </td>
        </tr>
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景点地址：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="address" value="<%=spot.getAddress()%>"  required="required" class="text-word">
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">景点描述：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
      <textarea rows="10" cols="40" id="note" name="note"  required="required" class="text-word"><%=spot.getNote()%></textarea>
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
      <a href="SpotServlet?flag=sel" target="mainFrame" onFocus="this.blur()" class="add">返回上一级</a>
    </td>
  </tr>
</table>
</body>
</html>
