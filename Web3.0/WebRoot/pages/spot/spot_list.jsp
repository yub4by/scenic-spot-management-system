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
    
    <title>My JSP 'scenic_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
		window.location.href="SpotServlet?flag=sel&pageIndex="+index;
	}
	function mh(){
		var name=document.getElementById("name").value;
		var address=document.getElementById("address").value;
		window.location.href="SpotServlet?flag=mh&name="+name+"&address="+address;
	}
	</script>

  </head>
  
  <body>
  <form name="myForm" id="myForm" action="SpotServlet?flag=alldel" method="post">
	<!--main_top-->
	<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
	  <tr>
	    <td width="99%" align="left" valign="top">
	    <div class="place"><span>??????????????????????????? > ????????????</span></div>
	    </td>
	  </tr>
	  <tr>
	    <td align="left" valign="top">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
		  		<tr>
		   		 <td width="90%" align="left" valign="middle">
			        <div>
					         ?????????<input type="text" name="name" id="name" value="${param.name }" class="text-word">
					         ?????????<input type="text" name="address" id="address" value="${param.address }" class="text-word">
				        <a><input type="button"  value="??????" class="text-but" onclick="mh()"></a>
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
		      	<th align="center" valign="middle" class="borderright">????????????</th>
		        <th align="center" valign="middle" class="borderright">??????ID</th>
		        <th align="center" valign="middle" class="borderright">????????????</th>
		        <th align="center" valign="middle" class="borderright">????????????</th>
		        <th align="center" valign="middle" class="borderright">????????????</th>
		        <th align="center" valign="middle" class="borderright">??????</th>
		      </tr>
		      <c:forEach var="spot" items="${spotList }">
    			<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
    				<td align="center" valign="middle" class="borderright borderbottom">
    					<center>
    						<input type="checkbox"onclick="toChkSon(this);" value="${spot.id }" id="user" name="user" />
    					</center>
    				</td>
    				<td align="center" valign="middle" class="borderright borderbottom"><img id="img" src="${pageContext.request.contextPath }/pages/spot/spot_photo.jsp?id=${spot.id}"></td>
    				<td align="center" valign="middle" class="borderright borderbottom">${spot.id }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${spot.spotName }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${spot.address }</td>
    				<td align="center" valign="middle" class="borderright borderbottom" style="width: 500">${spot.note }</td>
    				<td align="center" valign="middle" class="borderbottom">
	    				<a href="SpotServlet?flag=upd&id=${spot.id }" target="mainFrame" onFocus="this.blur()" class="add" >
	    					<img src="images/t02.png" />??????
	    				</a>
	    				&nbsp;|&nbsp;
	    				<a href="SpotServlet?flag=del&id=${spot.id }" onclick="return confirm('??????????????????')" target="mainFrame" onFocus="this.blur()" class="add" >
	    					<img src="images/t03.png" />??????
	    				</a>
    				</td>
    			</tr>
    		 </c:forEach>
		    </table>
	    </td>
	  </tr>
	  <tr>
	  	<td align="left" valign="top">
			<input type="button" value="????????????" onclick="submitForm()">
	  	 </td>
	  </tr>
	  <tr>
	    <td align="left" valign="top" class="fenye">
	    	<div>
	    		??????${page.rowCount }?????????	${page.pageIndex }/${page.pageCount }???
	    		<c:choose>
	    			<c:when test="${page.hasPre }">
	    				<a href="SpotServlet?flag=${list }&pageIndex=1" target="mainFrame" onFocus="this.blur()">??????</a>
	    				<a href="SpotServlet?flag=${list }&pageIndex=${page.pageIndex-1 }" target="mainFrame" onFocus="this.blur()">?????????</a>
	    			</c:when>
	    			<c:otherwise>
	    				??????	?????????
	    			</c:otherwise>
	    		</c:choose>	
	    		<c:choose>
	    			<c:when test="${page.hasNext }">
	    				<a href="SpotServlet?flag=${list }&pageIndex=${page.pageIndex+1 }" target="mainFrame" onFocus="this.blur()">?????????</a>
	    				<a href="SpotServlet?flag=${list }&pageIndex=${page.pageCount }" target="mainFrame" onFocus="this.blur()">??????</a>
	    			</c:when>
	    			<c:otherwise>
	    				?????????	??????
	    			</c:otherwise>
	    		</c:choose>	
	    		<a ><input type="button" value="??????" onclick="trans()"></a> 
	    		<input type="number" name="pageIndex" value="${page.pageIndex }" min="1" max="${page.pageCount }"/>
    		</div>
	    </td>
	  </tr>
	</table>
 </form>
</body>
</html>
