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
				<li><a href="MainServlet"><h5>主页</h5> </a></li>
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
					<a href="#" class="waves-effect waves-dark"><center>景区</center><span class="fa arrow"></span> </a>
					<ul class="nav nav-second-level">
						<li><a
							href="MainServlet#area">景区预览</a>
						</li>
						<li><a
							href="MainServlet#arealist">景区列表</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#" class="waves-effect waves-dark"><center>景点</center><span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li><a
							href="MainServlet#spot">景点预览</a>
						</li>
						<li><a
							href="MainServlet#spotlist">景点列表</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="waves-effect waves-dark"><center>推荐</center><span class="fa arrow"></span> </a>
					<ul class="nav nav-second-level">
						<li><a
							href="MainServlet#message">游客留言</a></li>
						<li><a
							href="MainServlet#news">热点新闻</a></li>
						<li><a
							href="MainServlet#video">美景视频</a>
						</li>
						<li><a
							href="MainServlet#link">友情链接</a></li>
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
							//每步移动像素，大＝快
							var speed = 20
							//循环周期（毫秒）大＝慢
							demo2.innerHTML = demo1.innerHTML
							function Marquee() { //正常移动
								if (dir > 0
										&& (demo2.offsetWidth - demo.scrollLeft) <= 0)
									demo.scrollLeft = 0
								if (dir < 0 && (demo.scrollLeft <= 0))
									demo.scrollLeft = demo2.offsetWidth
								demo.scrollLeft += dir
								demo.onmouseover = function() {
									clearInterval(MyMar)
								} //暂停移动
								demo.onmouseout = function() {
									MyMar = setInterval(Marquee, speed)
								} //继续移动
							}
							var MyMar = setInterval(Marquee, speed)
						</SCRIPT></td>
				</tr>
			</table>
			
			<a name="area"></a>
			
			<h3 class="page-header"><center>游览哈尔滨基本以欣赏独特的欧式建筑艺术为主。若冬季出游，冰雪项目必然不可错过。</center></h3>

			<div id="page-inner">
				
				<!-- 景区 -->
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
								<span class="card-title">呼兰</span>
								<p>&nbsp&nbsp呼兰离市区比较远，且景点不多。
									比较吸引人的有“东方巴黎圣母院”之称的呼兰天主教堂和近代著名女作家萧红的故居。</p>
							</div>
							<div class="card-action">
								<a href="#">呼兰区景点景区</a> <a href="#">呼兰区介绍</a>
							</div>
						</div>
					</div> -->
					<a name="spot"></a>
				</div>
				
				<!-- 景点 -->
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
				
				<!-- 景区列表-->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-content">
								<div class="alert alert-success">
									<strong>伏尔加庄园!</strong> &nbsp伏尔加庄园位于哈尔滨市香坊区成高子镇阿什河畔哈成路
									16公里处，占地面积60多万平方米，是一个以俄罗斯文化为主题的园林，是完完全全充实着异域风情的庄园。
								</div>
								<div class="alert alert-info">
									<strong>永泰世界主题乐园!</strong>
									&nbsp哈尔滨永泰世界——国内一流的室内主题乐园，位于哈尔滨香坊区永泰城中心4层-5层，
									是国内首家以梦幻天地为主题的室内主题乐园，投资达15亿元，建筑面积超过30000平方米，
									净高约20米的超大室内阳光穹顶设计，拥有银河奇境与云霄城堡王国两大主题原创区域，令宾客在四季如春的世界中感受无限的欢乐。
								</div>
								<div class="alert alert-warning">
									<strong>雪乡!</strong> &nbsp雪乡位于黑龙江省牡丹江市辖下海林市(长汀镇)大海林林业局双峰林场，
									距长汀镇7.9公里，占地面积500公顷，整个地区海拔均在1200米以上。
								</div>
								<div class="alert alert-danger">
									<strong>呼兰河口湿地公园!</strong> &nbsp呼兰河口湿地自然保护区位于呼兰区南部、松花江北岸、
									呼兰河河口。保护区北部与双井镇、方台镇、杨林乡相连，南与道外区黄土山乡、巨源镇、宾县糖坊镇隔江相望。
									保护区沿松花江北岸东西带状延伸，保护区东西长63.5公里，南北宽21.3公里，周长179.5公里，总面积为19262公顷
								</div>
								<div class="alert alert-success">
									<strong>万达茂!</strong> &nbsp哈尔滨万达茂，世界级冰雪主题购物中心。她的“红钢琴”
									造型是全球最大的钢结构建筑，总面积36.96万平米，拥有全球最大的暖库停车楼，共计4000个车位。
									全客层多品类的为顾客服务，体验、餐饮、儿童、精品、服装及哈尔滨印象文化街区的组合，区别于传统购物中心。
									拥有近300个国际国内主流品牌，其中永辉超市、万达影城、万达宝贝王、大玩家、喜悦冰场、传世冰雪冰壶体验馆、
									西西弗书店、H&M、ZARA、Game on冒险港、星巴克、哈根达斯、必胜客、周大福等为代表性品牌。
									万达茂是集文化、聚会、旅游、休闲、家庭娱乐中心于一体的世界级商业购物综合体
								</div>
								<div class="alert alert-info">
									<strong>中央大街!</strong>
									&nbsp中央大街始建于一八九八年，初称"中国大街"。一九二五年被改称为"中央大街"，
									后发展成为全市最为繁华的商业街，沿袭至今。 中央大街是哈尔滨现代的、历史的、文明的交织点，
									是哈尔滨人民的骄傲。一条街演绎了一座城市的文明史，一座城市因为一条街的繁荣而名扬中外。
								</div>
								<div class="alert alert-warning">
									<strong>哈尔滨防洪纪念塔!</strong> &nbsp位于哈尔滨市道里江岸中央大街终点广场，
									是为纪念战胜1957年特大洪水而建的。1957年洪水威胁哈尔滨市，水位超过1932年洪峰0.58米，
									全市人民战胜洪水袭击，于1958年建立此塔，以志纪念。
								</div>
							</div>
							<div class="card-action">
								<a href="http://www.hrblyj.com.cn/home.do?event=init">查看更多</a>
							</div>
							<a name="spotlist"></a>
						</div>
					</div>
				</div>

				<!-- 景点列表 -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-action" align="center">景点列表</div>
							<div class="card-content">
								<table class="table table-striped table-bordered table-hover"id="dataTables-example">
								<thead>
							      <tr>
							      	<th align="center" valign="middle" class="borderright">景点图像</th>
							        <th align="center" valign="middle" class="borderright">景点名称</th>
							        <th align="center" valign="middle" class="borderright">所属景区</th>
							        <th align="center" valign="middle" class="borderright">景点描述</th>
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
				
				<!-- 新闻区 -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-action" align="center">新闻区</div>
							<div class="card-content">
									<ul class="collapsible" data-collapsible="accordion">
										<c:forEach var="news" items="${newsList }">
											<li>
												<a href="NewsServlet?flag=seecount&id=${news.id }" target="_blank">
													<div class="collapsible-header" id="news" >
															<%-- <input type="hidden" id="newsid" name="news" value="${news.id }"> --%>
															<img alt="播放" src="images/ico06.png">
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
				
				<h4 class="page-header"><center>寒冬冻不住年轻的热情，窗台锁不住躁动的内心。 这一边是温暖和畅的被窝，另一边则是白雪茫茫之下的寒冬。</center></h4>
				
				<!-- 视频区 -->
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
											<img alt="播放" src="images/loginsj.png">
										</a>
										<i class="material-icons right">more_vert</i> 
									</span>
								</div>
								<div class="card-reveal">
									<span class="card-title grey-text text-darken-4">
										<a href="${video.link }" target="_blank">点击播放</a>
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
				
				<%-- <!-- 视频区 -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-action" align="center">视频区</div>
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
				
				<!-- 留言区  -->
				<div class="col-md-12 col-sm-12">
					<div class="card">
						<div class="card-action" align="center">留言区</div>
						<div class="card-content">
							<ul class="collapsible" data-collapsible="accordion">
								<c:forEach var="msg" items="${msgList }">
									<li>
										<div class="collapsible-header">
											<i class="fa fa-edit"></i>
											@${msg.userName }
										</div>
										<div class="collapsible-body">
											留言内容：<p>${msg.message }</p>
											留言时间：<p><em>${msg.leaveTime }</em></p>
											<c:if test="${msg.replayMsg!=null }">
												回复内容：<p>${msg.replayMsg }</p>
												回复时间：<p><em>${msg.replayTime }</em></p>
											</c:if>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<%-- <!-- 留言板  -->
				<div class="col-md-6 col-sm-6">
					<div class="card">
						<div class="card-action">留言板</div>
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
				
				<!-- 回复板  -->
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<div class="card">
							<div class="card-action">回复板</div>
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
				
			 <!-- 写留言  -->
			 <div class="row">
			 <div class="col-md-12 col-sm-12"><!-- col-lg-12 -->
			 <div class="card">
                  <div class="card-action" align="center">写留言 </div>
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
				       		<input type="submit" value="提交"  style="width:50px;height:30px;background:url(images/main/submit.gif) no-repeat center;cursor:pointer;text-indent:-9999px;"/>
							<input type="reset" value="重置"  style="width:50px;height:30px;background:url(images/main/reset.gif) no-repeat center;cursor:pointer;text-indent:-9999px;"/>
				       		${msg }
				       </div>
				       
					</form>
			    <div class="clearBoth"></div>
	 		    </div>
	 		    <a name="link"></a>
			 </div>
			 </div>	
			 </div>		
				
		<!--友情链接-->		
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					 <div class="card-action" align="center">友情链接</div>
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
				
				
		<!--系统设置-->		
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-content">
						<p>
						<center>
							本站域名:  <%=system.getWebYu()%><br>
							站点描述：    <%=system.getWebdescribe()%><br>
							版权所有：    <%=system.getCopyright()%><br> 
							客服热线：    <%=system.getTel()%><br> 
							备案编号：    <%=system.getNum()%><br>
							官方微博：    <a target="_blank"href="https://weibo.com/2887929925/profile">哈尔滨游玩网</a> <br>
							在线客服：    <a title="客服QQ" target="_blank" href="tencent://message/?uin=1196006753&Site=在线QQ&Menu=yes"><img alt="客服" src="images/main/member.gif"></a>
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
