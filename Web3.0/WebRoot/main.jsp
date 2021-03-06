<%@ page language="java" import="java.util.*,beans.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>My JSP 'main.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link rel="stylesheet" href="assets/materialize/css/materialize.min.css"
	media="screen,projection" />

<!-- Bootstrap Styles-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />

<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />

<!-- Morris Chart Styles-->
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />

<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />

<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">

<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>

<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>

<script src="assets/materialize/js/materialize.min.js"></script>

<!-- Metis Menu Js -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="assets/js/morris/morris.js"></script>


<script src="assets/js/easypiechart.js"></script>
<script src="assets/js/easypiechart-data.js"></script>

<script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>

<!-- DATA TABLE SCRIPTS -->
		<script src="assets/js/dataTables/jquery.dataTables.js"></script>
		<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
		<script>
			$(document).ready(function() {
				$('#dataTables-example').dataTable();
			});
		</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
<!-- <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script> -->
<script type="text/javascript">
/* 	$(function(){
			$("#news").click(function(){//div
				alert("66");
				$.ajax({
					url:"NewsServlet?flag=seecount",
					type:"post",
					data:{
						id:$("#newsid").val()//hidden
					},
					success:function(data){
						alert(data);
					}
				});
		   });
	}); */
</script>


</head>

<body>
<%
		SystemInfo system = (SystemInfo) request.getAttribute("system");
%>

	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle waves-effect waves-dark"
				data-toggle="collapse" data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand waves-effect waves-dark" href="MainServlet"><i
				class="large material-icons">track_changes</i> <strong><%=system.getWebname()%></strong>
			</a>
			<div id="sideNav" href="">
				<i class="material-icons dp48">toc</i>
			</div>
		</div>
		<div class="header" align="center">
			<ol class="breadcrumb">
				<li><a href="MainServlet"><h5>??????</h5> </a></li>
				<li class="active">Data</li>
			</ol>
		</div>
		</nav>

		<!--/. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation" >
		<div class="sidebar-collapse" ><!-- style="background-color: rgb(22,160,133)" -->
			<ul class="nav" id="main-menu">
				<li>
					<a class="waves-effect waves-dark"><center>
						<script charset="Shift_JIS" src="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_tr.js"></script>
					</center></a>
				</li>
				<li>
					<a href="#" class="waves-effect waves-dark"><center>??????</center><span class="fa arrow"></span> </a>
					<ul class="nav nav-second-level">
						<li><a
							href="MainServlet#area">????????????</a>
						</li>
						<li><a
							href="MainServlet#arealist">????????????</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#" class="waves-effect waves-dark"><center>??????</center><span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li><a
							href="MainServlet#spot">????????????</a>
						</li>
						<li><a
							href="MainServlet#spotlist">????????????</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="waves-effect waves-dark"><center>??????</center><span class="fa arrow"></span> </a>
					<ul class="nav nav-second-level">
						<li><a
							href="MainServlet#message">????????????</a></li>
						<li><a
							href="MainServlet#news">????????????</a></li>
						<li><a
							href="MainServlet#video">????????????</a>
						</li>
						<li><a
							href="MainServlet#link">????????????</a></li>
					</ul>
				</li>
			</ul>
		</div>
		</nav>
		
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<table width="700" border="0" align="center">
				<tr>
					<td><div id=demo
							style="OVERFLOW: hidden; WIDTH: 1450px; COLOR: #ffffff; HEIGHT: 250px">
							<table cellpadding=0 width=100% align=left border=0 cellspace=0>
								<tbody>
									<tr>
										<!--------------------demo1--------------------->
										<td id=demo1 valign=top><table cellspacing=1
												cellpadding=1>
												<tbody>
													<tr valign=top>
														<td valign=top nowrap><div align=right>
																<table cellspacing=0 cellpadding=0 align=center border=0>
																	<tbody>
																		<tr>
																			<td align=middle><table cellspacing=0
																					cellpadding=0 width=200 align=center border=0>
																					<tbody>
																						<tr>
																							<td align=middle height=200><a href="#"
																								target=_blank> <img
																									src="images/dragon_1.jpg" alt="" width=400
																									height=250 border=0> </a>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																			<td align=middle><table cellspacing=0
																					cellpadding=0 width=200 align=center border=0>
																					<tbody>
																						<tr>
																							<td align=middle height=200><a href="#"
																								target=_blank> <img
																									src="images/Gbrage_1.jpg" alt="" width=400
																									height=250 border=0> </a>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																			<td align=middle><table cellspacing=0
																					cellpadding=0 width=200 align=center border=0>
																					<tbody>
																						<tr>
																							<td align=middle height=200><a
																								href="IceWorld.jsp" target=_blank> <img
																									src="images/IceWorld_2.jpg" alt="" width=400
																									height=250 border=0> </a>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																			<td align=middle><table cellspacing=0
																					cellpadding=0 width=200 align=center border=0>
																					<tbody>
																						<tr>
																							<td align=middle height=200><a
																								href="IceWorld.jsp" target=_blank> <img
																									src="images/IceWorld_3.jpg" alt="" width=400
																									height=250 border=0> </a>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																			<td align=middle><table cellspacing=0
																					cellpadding=0 width=200 align=center border=0>
																					<tbody>
																						<tr>
																							<td align=middle height=200><a
																								href="IceWorld.jsp" target=_blank> <img
																									src="images/IceWorld_4.jpg" alt="" width=400
																									height=250 border=0> </a>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																			<td align=middle><table cellspacing=0
																					cellpadding=0 width=200 align=center border=0>
																					<tbody>
																						<tr>
																							<td align=middle height=200><a
																								href="IceWorld.jsp" target=_blank> <img
																									src="images/IceWorld_5.jpg" alt="" width=400
																									height=250 border=0> </a>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			<td align=middle><table cellspacing=0
																					cellpadding=0 width=200 align=center border=0>
																					<tbody>
																						<tr>
																							<td align=middle height=200><a href="#"
																								target=_blank> <img src="images/sofei_4.jpg"
																									alt="" width=400 height=250 border=0> </a>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			<td align=middle><table cellspacing=0
																					cellpadding=0 width=200 align=center border=0>
																					<tbody>
																						<tr>
																							<td align=middle height=200><a href="#"
																								target=_blank> <img src="images/sofei_3.jpg"
																									alt="" width=400 height=250 border=0> </a>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																			<td align=middle><table cellspacing=0
																					cellpadding=0 width=200 align=center border=0>
																					<tbody>
																						<tr>
																							<td align=middle height=200><a href="#"
																								target=_blank> <img src="images/sofei_2.jpg"
																									alt="" width=400 height=250 border=0> </a>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<!-------------------demo2--------------------->
										<td id=demo2 width="0"></td>
									</tr>
								</tbody>
							</table>
						</div> <!--------------------demo end------------------> <SCRIPT>
							var dir = 1
							//??????????????????????????????
							var speed = 20
							//?????????????????????????????????
							demo2.innerHTML = demo1.innerHTML
							function Marquee() { //????????????
								if (dir > 0
										&& (demo2.offsetWidth - demo.scrollLeft) <= 0)
									demo.scrollLeft = 0
								if (dir < 0 && (demo.scrollLeft <= 0))
									demo.scrollLeft = demo2.offsetWidth
								demo.scrollLeft += dir
								demo.onmouseover = function() {
									clearInterval(MyMar)
								} //????????????
								demo.onmouseout = function() {
									MyMar = setInterval(Marquee, speed)
								} //????????????
							}
							var MyMar = setInterval(Marquee, speed)
						</SCRIPT></td>
				</tr>
			</table>
			
			<a name="area"></a>
			
			<h3 class="page-header"><center>?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</center></h3>

			<div id="page-inner">
				
				<!-- ?????? -->
				<div class="row">
				<c:forEach var="area" items="${areaList}">
					<div class="col-md-4 col-sm-4" style="height: 300px"><!-- width: 350px; -->
							<div class="card" style="height: 250px"><!-- width: 300px; -->
								<div class="card-content">
									<span class="card-title" style="color: white;background-color: red;font-style: oblique;">${area.areaName }</span>
									<p>${area.note }</p>
								</div>
							</div>
						</div>
				</c:forEach>
					<!-- <div class="col-md-4 col-sm-4">
						<div class="card">
							<div class="card-content">
								<span class="card-title">??????</span>
								<p>&nbsp&nbsp?????????????????????????????????????????????
									?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
							</div>
							<div class="card-action">
								<a href="#">?????????????????????</a> <a href="#">???????????????</a>
							</div>
						</div>
					</div> -->
					<a name="spot"></a>
				</div>
				
				<!-- ?????? -->
				<div class="row">
				<c:forEach var="spot" items="${spotList}">
					<div class="col-md-4 col-sm-4">
						<div class="card">
							<div class="card-image waves-effect waves-block waves-light">
								<img class="activator" src="${pageContext.request.contextPath }/photo/spot_photo.jsp?id=${spot.id}" style="height: 250px"><!-- width: 350/323px; -->
							</div>
							<div class="card-content">
								<span class="card-title activator grey-text text-darken-4">
									${spot.spotName }
									<em style="font-size: x-small;">${spot.address }</em>
									<i class="material-icons right">more_vert</i> 
								</span>
							</div>
							<div class="card-reveal">
								<span class="card-title grey-text text-darken-4">
									${spot.spotName } 
									<em style="font-size: x-small;">${spot.address }</em>
									<i class="material-icons right">close</i> 
								</span>
								<p>${spot.note }</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<a name="arealist"></a>
				</div>
				
				<!-- ????????????-->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-content">
								<div class="alert alert-success">
									<strong>???????????????!</strong> &nbsp???????????????????????????????????????????????????????????????????????????
									16????????????????????????60??????????????????????????????????????????????????????????????????????????????????????????????????????????????????
								</div>
								<div class="alert alert-info">
									<strong>????????????????????????!</strong>
									&nbsp??????????????????????????????????????????????????????????????????????????????????????????????????????4???-5??????
									????????????????????????????????????????????????????????????????????????15???????????????????????????30000????????????
									?????????20?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
								</div>
								<div class="alert alert-warning">
									<strong>??????!</strong> &nbsp???????????????????????????????????????????????????(?????????)?????????????????????????????????
									????????????7.9?????????????????????500?????????????????????????????????1200????????????
								</div>
								<div class="alert alert-danger">
									<strong>????????????????????????!</strong> &nbsp???????????????????????????????????????????????????????????????????????????
									??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
									??????????????????????????????????????????????????????????????????63.5??????????????????21.3???????????????179.5?????????????????????19262??????
								</div>
								<div class="alert alert-success">
									<strong>?????????!</strong> &nbsp??????????????????????????????????????????????????????????????????????????????
									???????????????????????????????????????????????????36.96?????????????????????????????????????????????????????????4000????????????
									?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
									?????????300?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
									??????????????????H&M???ZARA???Game on????????????????????????????????????????????????????????????????????????????????????
									???????????????????????????????????????????????????????????????????????????????????????????????????????????????
								</div>
								<div class="alert alert-info">
									<strong>????????????!</strong>
									&nbsp?????????????????????????????????????????????"????????????"??????????????????????????????"????????????"???
									??????????????????????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????????
									?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
								</div>
								<div class="alert alert-warning">
									<strong>????????????????????????!</strong> &nbsp?????????????????????????????????????????????????????????
									??????????????????1957???????????????????????????1957??????????????????????????????????????????1932?????????0.58??????
									????????????????????????????????????1958?????????????????????????????????
								</div>
							</div>
							<div class="card-action">
								<a href="http://www.hrblyj.com.cn/home.do?event=init">????????????</a>
							</div>
							<a name="spotlist"></a>
						</div>
					</div>
				</div>

				<!-- ???????????? -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-action" align="center">????????????</div>
							<div class="card-content">
								<table class="table table-striped table-bordered table-hover"id="dataTables-example">
								<thead>
							      <tr>
							      	<th align="center" valign="middle" class="borderright">????????????</th>
							        <th align="center" valign="middle" class="borderright">????????????</th>
							        <th align="center" valign="middle" class="borderright">????????????</th>
							        <th align="center" valign="middle" class="borderright">????????????</th>
							      </tr>
						      	</thead>
								<tbody>
							      <c:forEach var="spot" items="${spotList }">
					    			<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
					    				<td align="center" valign="middle" class="borderright borderbottom"><img id="img" src="${pageContext.request.contextPath }/photo/spot_photo.jsp?id=${spot.id}" style="width: 100px;height: 100px;"></td>
					    				<td align="center" valign="middle" class="borderright borderbottom">${spot.spotName }</td>
					    				<td align="center" valign="middle" class="borderright borderbottom">${spot.address }</td>
					    				<td align="center" valign="middle" class="borderright borderbottom">${spot.note }</td>
					    			</tr>
					    		 </c:forEach>
				    		   </tbody>
						       </table>
						     </div>
		                     <a name="news"></a>
		                 </div>
	                </div>
                </div>
				
				<!-- ????????? -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-action" align="center">?????????</div>
							<div class="card-content">
									<ul class="collapsible" data-collapsible="accordion">
										<c:forEach var="news" items="${newsList }">
											<li>
												<a href="NewsServlet?flag=seecount&id=${news.id }" target="_blank">
													<div class="collapsible-header" id="news" >
															<%-- <input type="hidden" id="newsid" name="news" value="${news.id }"> --%>
															<img alt="??????" src="images/ico06.png">
															<em style="color: red;font-style: inherit;">${news.title }</em>|
															<em style="color: blue;font-style: inherit;">${news.author }</em>|
															<em style="color: green">${news.createDate }</em>
													</div>
												</a>
												<%-- <div class="collapsible-body">
													<p>${news.content }</p>
												</div> --%>
											</li>
										</c:forEach>
									</ul>
							</div>
							<a name="video"></a>
						</div>
					</div>
				</div>
				
				<h4 class="page-header"><center>?????????????????????????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????????????????????</center></h4>
				
				<!-- ????????? -->
				<div class="row">
					<c:forEach var="video" items="${videoList }">
						<div class="col-md-4 col-sm-4">
							<div class="card">
								<div class="card-image waves-effect waves-block waves-light">
									<img class="activator" src="${pageContext.request.contextPath }/photo/video_photo.jsp?id=${video.id}" style="height: 250px"><!-- width: 350/323px; -->
								</div>
								<div class="card-content">
									<span class="card-title activator grey-text text-darken-4">
										<a href="${video.link }" target="_blank">
											${video.video_full_name }
											<img alt="??????" src="images/loginsj.png">
										</a>
										<i class="material-icons right">more_vert</i> 
									</span>
								</div>
								<div class="card-reveal">
									<span class="card-title grey-text text-darken-4">
										<a href="${video.link }" target="_blank">????????????</a>
										<i class="material-icons right">close</i> 
									</span>
									<p>
										<em>${video.time }</em><br>
										${video.video_introduction }
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				<a name="message"></a>
				</div>
				
				<%-- <!-- ????????? -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-action" align="center">?????????</div>
							<div class="card-content">
								<table border=0 cellspace=0 cellpadding=0>
									<tr>
										<c:forEach var="video" items="${videoList }" begin="1" end="3" step="1">
											<td>
												<div class="card-image waves-effect waves-block waves-light">
													<a href="${video.link }" target="_blank">
														<img class="activator" src="${pageContext.request.contextPath }/photo/video_photo.jsp?id=${video.id}" style="width: 350px;height: 300px;">
													</a>
												</div>
												<div class="card-action">
													<center>${video.video_full_name }|${video.time }</center>
												</div>
											</td>
										</c:forEach>
									</tr>
									<tr>
										<c:forEach var="video" items="${videoList }" begin="4" end="6" step="1">
											<td>
												<div class="card-image waves-effect waves-block waves-light">
													<a href="${video.link }" target="_blank">
														<img class="activator" src="${pageContext.request.contextPath }/photo/video_photo.jsp?id=${video.id}" style="width: 350px;height: 300px;">
													</a>
												</div>
												<div class="card-action">
													<center>${video.video_full_name }|${video.time }</center>
												</div>
											</td>
										</c:forEach>
									</tr>
								</table>
								<a name="message"></a>
							</div>
						</div>
					</div>
				</div> --%>
				
				<!-- ?????????  -->
				<div class="col-md-12 col-sm-12">
					<div class="card">
						<div class="card-action" align="center">?????????</div>
						<div class="card-content">
							<ul class="collapsible" data-collapsible="accordion">
								<c:forEach var="msg" items="${msgList }">
									<li>
										<div class="collapsible-header">
											<i class="fa fa-edit"></i>
											@${msg.userName }
										</div>
										<div class="collapsible-body">
											???????????????<p>${msg.message }</p>
											???????????????<p><em>${msg.leaveTime }</em></p>
											<c:if test="${msg.replayMsg!=null }">
												???????????????<p>${msg.replayMsg }</p>
												???????????????<p><em>${msg.replayTime }</em></p>
											</c:if>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<%-- <!-- ?????????  -->
				<div class="col-md-6 col-sm-6">
					<div class="card">
						<div class="card-action">?????????</div>
						<div class="card-content">
							<ul class="collapsible" data-collapsible="accordion">
								<c:forEach var="msg" items="${msgList }">
									<li>
										<div class="collapsible-header">
											<i class="fa fa-edit"></i>
											<em>From</em>
											${msg.userName }
										</div>
										<div class="collapsible-body">
											<p>${msg.message }</p>
											<p>${msg.leaveTime }</p>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				
				<!-- ?????????  -->
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<div class="card">
							<div class="card-action">?????????</div>
							<div class="card-content">
								<ul class="collapsible" data-collapsible="accordion">
									<c:forEach var="msgg" items="${msgListt }">
										<li>
											<div class="collapsible-header">
												<i class="fa fa-edit"></i>
												<em>To</em>
												${msgg.userName }
											</div>
											<div class="collapsible-body">
												<p>${msgg.replayMsg }</p>
											    <p>${msgg.replayTime }</p>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div> --%>
				
			 <!-- ?????????  -->
			 <div class="row">
			 <div class="col-md-12 col-sm-12"><!-- col-lg-12 -->
			 <div class="card">
                  <div class="card-action" align="center">????????? </div>
                  <div class="card-content">
				    <form class="col s12" action="MessageServlet?flag=leave" method="post">
				    
				      <div class="row">
				        <div class="input-field col s6">
				          <input type="text" name="userName" value="${user.userName }" required="required"  class="validate">
				          <label for="UserName">UserName</label>
				        </div>
				      </div>
				      
				      <div class="row">
				        <div class="input-field col s6">
				          <input type="text" name="email" value="${user.note }" required="required"  class="validate">
				          <label for="email">Email</label>
				        </div>
				      </div>
				      
				      <div class="row">
				        <div class="input-field col s12">
				          <input type="text" name="message" required="required" class="validate">
				          <label for="message">Message</label>
				        </div>
				      </div>
				      
				       <div class="row"> 
				       		<input type="submit" value="??????"  style="width:50px;height:30px;background:url(images/main/submit.gif) no-repeat center;cursor:pointer;text-indent:-9999px;"/>
							<input type="reset" value="??????"  style="width:50px;height:30px;background:url(images/main/reset.gif) no-repeat center;cursor:pointer;text-indent:-9999px;"/>
				       		${msg }
				       </div>
				       
					</form>
			    <div class="clearBoth"></div>
	 		    </div>
	 		    <a name="link"></a>
			 </div>
			 </div>	
			 </div>		
				
		<!--????????????-->		
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					 <div class="card-action" align="center">????????????</div>
					<div class="card-content">
						<table border="0" cellspacing="0">
							<tr>
								<c:forEach var="linkList" items="${linkList }">
									<td>
										<a href="${linkList.linkStr}" target="_blank">
											<img class="activator" alt="${linkList.linkName }" src="${pageContext.request.contextPath }/photo/link_photo.jsp?id=${linkList.id}" style="width: 100px;height: 60px;">
										</a>
									</td>
								</c:forEach>
							</tr>
						</table>
					</div>
				</div>
			</div>
	    </div>
				
				
		<!--????????????-->		
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-content">
						<p>
						<center>
							????????????:  <%=system.getWebYu()%><br>
							???????????????    <%=system.getWebdescribe()%><br>
							???????????????    <%=system.getCopyright()%><br> 
							???????????????    <%=system.getTel()%><br> 
							???????????????    <%=system.getNum()%><br>
							???????????????    <a target="_blank"href="https://weibo.com/2887929925/profile">??????????????????</a> <br>
							???????????????    <a title="??????QQ" target="_blank" href="tencent://message/?uin=1196006753&Site=??????QQ&Menu=yes"><img alt="??????" src="images/main/member.gif"></a>
						</center>
						</p>
					</div>
				</div>
			</div>
	    </div>
	   
	</div>
	</div>
	</div>
	
</body>
</html>
