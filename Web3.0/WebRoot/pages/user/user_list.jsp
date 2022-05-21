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
    
    <title>My JSP 'main_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link href="css/css.css" type="text/css" rel="stylesheet" />
	<link href="css/list.css" type="text/css" rel="stylesheet" />
	<link href="css/main.css" type="text/css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="images/main/favicon.ico" />
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" >
	function doCheck(obj) {
		var isCheck = obj.checked;
		var inputs = document.getElementsByTagName("input");
		for ( var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "checkbox" && inputs[i].id != "chkMsgId"){
				inputs[i].checked = obj.checked;
				if (isCheck == true) {
					inputs[i].name = "check";
				} else {
					inputs[i].name = "user";
				}
			}
		}
	}
	function toChkSon(obj) {
		var isCheck = obj.checked;
		obj.name = "check";
		if (isCheck == false){
			document.getElementById("chkMsgId").checked = false;
			obj.name = "user";
			return;
		}
		var chkInputs = getCheckBox();
		var j = 0;
		for ( var i = 0; i < chkInputs.length; i++) {
			if (chkInputs[i].checked == isCheck)
				j++;
			else
				break;
		}
		if (j == chkInputs.length)
			document.getElementById("chkMsgId").checked = isCheck;
	}
	function getCheckBox() {
		var inputs = document.getElementsByTagName("input");
		var chkInputs = new Array();
		var j = 0;
		for ( var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "checkbox" && inputs[i].id != "chkMsgId"){
				chkInputs[j] = inputs[i];
				j++;
			}
		}
		return chkInputs;
	}
	function submitForm() {
		document.getElementById("myForm").submit();
	}
	function trans(){
		var index=document.getElementById("pageIndex").value;
		window.location.href="UserServlet?flag=sel&pageIndex="+index;
	}
	function mh(){
		var name=document.getElementById("name").value;
		var note=document.getElementById("note").value;
		window.location.href="UserServlet?flag=mh&name="+name+"&note="+note;
	}
	</script>
  
  <body>
  <form name="myForm" id="myForm" action="UserServlet?flag=alldel" method="post">
	<!--main_top-->
	<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
	  <tr>
	    <td width="99%" align="left" valign="top">
	 <div class="place"><span>您的位置：用户管理 > 用户列表</span></div>
	    </td>
	  </tr>
	  <tr>
	    <td align="left" valign="top">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
		  		<tr>
		   		 <td width="90%" align="left" valign="middle">
			        <div>
						         名称：<input type="text" name="name" id="name" value="${param.name }" class="text-word">
						        备注：<input type="text" name="note" id="note" value="${param.note }" class="text-word">
				           <a><input type="button"  value="查询" class="text-but" onclick="mh()"></a>
			        </div>
		         </td>
		  		 <td width="10%" align="center" valign="middle" style="text-align:right; width:150px;">
		  		  	<a href="#" target="mainFrame" onFocus="this.blur()" class="add"></a>
		  		  	<sp
		  		 </td>
		  		</tr>
			</table>
	    </td>
	  </tr>
	  <tr>
	    <td align="left" valign="top">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
		      <tr>
		      	<th align="center" valign="middle" class="borderright">
		      		<div>
		      			<input type="checkbox" name="chkMsgId" id="chkMsgId"onclick="doCheck(this)" />
		      		</div>
		      	</th>
		      	<th align="center" valign="middle" class="borderright">头像</th>
		        <th align="center" valign="middle" class="borderright">用户ID</th>
		        <th align="center" valign="middle" class="borderright">用户名称</th>
		        <th align="center" valign="middle" class="borderright">用户密码</th>
		        <th align="center" valign="middle" class="borderright">用户备注</th>
		        <th align="center" valign="middle" class="borderright">操作</th>
		      </tr>
		      <c:forEach var="user" items="${userList }">
    			<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
    				<td align="center" valign="middle" class="borderright borderbottom">
    					<center>
    						<input type="checkbox"onclick="toChkSon(this);" value="${user.id }" id="user" name="user" />
    					</center>
    				</td>
    				<td align="center" valign="middle" class="borderright borderbottom">
    					<c:choose>
    						<c:when test="${user.photo!=null }">
    							<img id="img" src="${pageContext.request.contextPath }/pages/user/user_photo.jsp?id=${user.id}">				
    						</c:when>
    						<c:otherwise>
    							暂无数据
    						</c:otherwise>
    					</c:choose>
    				</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${user.id }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${user.userName }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${user.password }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${user.note }</td>
    				<td align="center" valign="middle" class="borderbottom">
	    				<a href="UserServlet?flag=upd&id=${user.id }" target="mainFrame" onFocus="this.blur()" class="add" >
	    					<img src="images/t02.png" />修改
	    				</a>
	    				&nbsp;|&nbsp;
	    				<a href="UserServlet?flag=del&id=${user.id }" onclick="return confirm('确定删除吗？')" target="mainFrame" onFocus="this.blur()" class="add" >
	    					<img src="images/t03.png" />删除
	    				</a>
    				</td>
    			</tr>
    		 </c:forEach>
		    </table>
	    </td>
	  </tr>
	   <tr>
	  	<td align="left" valign="top">
			<input type="button" value="批量删除" onclick="submitForm()">
	  	 </td>
	  </tr>
	  <tr>
	    <td align="left" valign="top" class="fenye">
	    	<div>
	    		共有${page.rowCount }条数据	${page.pageIndex }/${page.pageCount }页
	    		<c:choose>
	    			<c:when test="${page.hasPre }">
	    				<a href="UserServlet?flag=${list }&pageIndex=1" target="mainFrame" onFocus="this.blur()">首页</a>
	    				<a href="UserServlet?flag=${list }&pageIndex=${page.pageIndex-1 }" target="mainFrame" onFocus="this.blur()">上一页</a>
	    			</c:when>
	    			<c:otherwise>
	    				首页	上一页
	    			</c:otherwise>
	    		</c:choose>	
	    		<c:choose>
	    			<c:when test="${page.hasNext }">
	    				<a href="UserServlet?flag=${list }&pageIndex=${page.pageIndex+1 }" target="mainFrame" onFocus="this.blur()">下一页</a>
	    				<a href="UserServlet?flag=${list }&pageIndex=${page.pageCount }" target="mainFrame" onFocus="this.blur()">尾页</a>
	    			</c:when>
	    			<c:otherwise>
	    				下一页	尾页
	    			</c:otherwise>
	    		</c:choose>	
	    		<a ><input type="button" value="转到" onclick="trans()"></a> 
				<input type="number" id="pageIndex" name="pageIndex" value="${page.pageIndex }" min="1" max="${page.pageCount }" > 
    		</div>
	    </td>
	  </tr>
	</table>
 </form>
</body>
</html>
