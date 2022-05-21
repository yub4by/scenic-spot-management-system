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
    
    <title>My JSP 'list.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/WdatePicker.js"></script>
	<script type="text/javascript">
	/**   
	 * 操作全选复选框事件   
	 **/
	function doCheck(obj) {
		var isCheck = obj.checked;
		var inputs = document.getElementsByTagName("input");
		for ( var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "checkbox" && inputs[i].id != "chkMsgId") //刷选出所有复选框   
			{
				inputs[i].checked = obj.checked;
				if (isCheck == true) {
					inputs[i].name = "check";
				} else {
					inputs[i].name = "user";
				}
			}
		}
	}

	/**   
	 * 复选框变化  全选按钮变化   
	 **/
	function toChkSon(obj) {
		var isCheck = obj.checked;
		obj.name = "check";
		if (isCheck == false) //当此复选框未选中 全选为未选   
		{
			document.getElementById("chkMsgId").checked = false;
			obj.name = "user";
			return;
		}

		var chkInputs = getCheckBox(); //获取所有复选框   
		var j = 0;
		for ( var i = 0; i < chkInputs.length; i++) {
			if (chkInputs[i].checked == isCheck)
				j++;
			else
				break;
		}

		if (j == chkInputs.length) //当所有复选框为同一状态时 赋值全选同一状态   
			document.getElementById("chkMsgId").checked = isCheck;
	}

	/**   
	 * 获取所有复选框   
	 **/
	function getCheckBox() {
		var inputs = document.getElementsByTagName("input");
		var chkInputs = new Array();
		var j = 0;
		for ( var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "checkbox" && inputs[i].id != "chkMsgId") //刷选出所有复选框   
			{
				chkInputs[j] = inputs[i];
				j++;
			}
		}
		return chkInputs;
	}

	/**
	 *提交
	 */
	function submitForm() {
		document.getElementById("myForm").submit();
	}
	function trans(){
		var index=document.getElementById("pageIndex").value;
		window.location.href="NewsServlet?flag=manage&pageIndex="+index;
	}
	</script>


  </head>
  
  <body>
   <form name="myForm" id="myForm" action="NewsServlet?flag=numdel" method="post">
	<!--main_top-->
	<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
	  <tr>
	    <td width="99%" align="left" valign="top">
	          <div class="place"><span> 您的位置：系统管理  > 新闻列表</span></div>
	    </td>
	  </tr>
	  <tr>
	    <td align="left" valign="top">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
		      <tr>
				<th align="center" valign="middle" class="borderright">
					<input type="checkbox" name="chkMsgId" id="chkMsgId"onclick="doCheck(this)" />
				</th>
		      	<th align="center" valign="middle" class="borderright">新闻题目</th>
		        <th align="center" valign="middle" class="borderright">新闻作者</th>
		        <th align="center" valign="middle" class="borderright">新闻内容</th>
		        <th align="center" valign="middle" class="borderright">创建时间</th>
		        <th align="center" valign="middle" class="borderright">浏览次数</th>
		        <th align="center" valign="middle" class="borderright">操作</th>
		      </tr>
		      <c:forEach var="news" items="${newsList }">
    			<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
    				<td align="center" valign="middle" class="borderright borderbottom">
    					<input type="checkbox"onclick="toChkSon(this);" value="${news.id }" id="user" name="user" />
					</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${news.title }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${news.author }</td>
    				<td align="center" valign="middle" class="borderright borderbottom" style="width: 500">${news.content }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${news.createDate }</td>
    				<td align="center" valign="middle" class="borderright borderbottom">${news.seeCount }</td>
    				<td align="center" valign="middle" class="borderbottom">
	    				<a href="NewsServlet?flag=updateid&id=${news.id}" target="mainFrame" onFocus="this.blur()" class="add" >
	    					<img src="images/t02.png" />修改
	    				</a>
	    				&nbsp;|&nbsp;
	    				<a href="NewsServlet?flag=del&id=${news.id}" onclick="return confirm('确定删除吗？')" target="mainFrame" onFocus="this.blur()" class="add" >
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
	  	 	<a href="pages/news/add_news.jsp"><input type="button"value="发布新闻"></a>
			<input type="button" value="批量删除" onclick="submitForm()">
	  	 </td>
	  </tr>
	  <tr>
	    <td align="right" valign="top" class="fenye">
	    	<div>
	    		共 ${page.rowCount } 条数据 ${page.pageIndex }/${page.pageCount } 页
				<c:choose>
					<c:when test="${page.hasPre }">
						<a href="NewsServlet?flag=manage&pageIndex=1">首页</a>
						<a href="NewsServlet?flag=manage&pageIndex=${page.pageIndex -1 }">上一页</a>
					</c:when>
					<c:otherwise>
			   	 		首页    前一页
			   	 	</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${page.hasNext }">
						<a href="NewsServlet?flag=manage&pageIndex=${page.pageIndex +1 }">下一页</a>
						<a href="NewsServlet?flag=manage&pageIndex=${page.pageCount }">尾页
						</a>
					</c:when>
					<c:otherwise>
			   	 		下一页   尾页
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
