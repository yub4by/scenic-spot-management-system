<%@ page language="java" import="java.util.*,dao.*,beans.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'SystemSet.jsp' starting page</title>

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

</head>

<body>
	<%
		SystemInfo system = (SystemInfo) request.getAttribute("system");
    %>
    <table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
	  <tr>
	    <td width="99%" align="left" valign="top">
	     <div class="place"><span>您的位置：系统管理&nbsp;&nbsp;>&nbsp;&nbsp;系统设置</span></div>
	     </td>
	  </tr>
	  <tr>
	    <td align="left" valign="top">
			<form action="SystemServlet?flag=a" method="post">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
					 <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
				        <td align="right" valign="middle" class="borderright borderbottom bggray">网站名称：</td>
				        <td align="left" valign="middle" class="borderright borderbottom main-for">
				     	  <input type="text" name="webname" value="<%=system.getWebname()%>" required="required" class="text-word">
				        </td>
				        </tr>
				    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
				        <td align="right" valign="middle" class="borderright borderbottom bggray">网站域名：</td>
				        <td align="left" valign="middle" class="borderright borderbottom main-for">
				          <input type="text" name="webyu" value="<%=system.getWebYu()%>" required="required" class="text-word">
				        </td>
				        </tr>
				      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
				        <td align="right" valign="middle" class="borderright borderbottom bggray">网站描述：</td>
				        <td align="left" valign="middle" class="borderright borderbottom main-for">
				       	 <input type="text" name="webdescribe" value="<%=system.getWebdescribe()%>" required="required" class="text-word">
				        </td>
				        </tr>
				      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
				        <td align="right" valign="middle" class="borderright borderbottom bggray">版权设置：</td>
				        <td align="left" valign="middle" class="borderright borderbottom main-for">
				     	 <input type="text" name="copyright" value="<%=system.getCopyright()%>" required="required" class="text-word">
				        </td>
				        </tr>
				      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
				        <td align="right" valign="middle" class="borderright borderbottom bggray">客服热线：</td>
				        <td align="left" valign="middle" class="borderright borderbottom main-for">
				       	<input type="text" name="num" value="<%=system.getTel()%>" required="required" class="text-word">
				        </td>
				      </tr>
				      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
				        <td align="right" valign="middle" class="borderright borderbottom bggray">备案编号：</td>
				        <td align="left" valign="middle" class="borderright borderbottom main-for">
				       	<input type="text" name="tel" value="<%=system.getNum()%>" required="required" class="text-word">
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
      ${msg }
    </td>
  </tr>
</table>
</body>
</html>
