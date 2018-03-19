<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>zMovie</title>
	<meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
	<meta name="author" content="www.zerotheme.com">
	
    <!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <!-- CSS
  ================================================== -->
  	<link rel="stylesheet" href="css/zerogrid.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/responsive.css">
	
	<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
	<![endif]-->
	<script type="text/javascript">
	function changecalssname(){
		var obj=document.getElementById();
		obj.setAttribute("class","page active");
		
	}
	function switchclass(bb) {
	$(bb).siblings().removeClass().addClass("page gradient"); 
	$(bb).removeClass().addClass("page active");
	
}
 <%String id="cla"+(String)request.getAttribute("round1");
   System.out.println(id);%>
  
	
</script>
    
</head>



<body>
<div class="wrap-body">

<!--////////////////////////////////////Header-->
<header>
	<div class="top-bar">
		<div class="wrap-top zerogrid">
			<div class="row">
				<div class="col-1-2">
					<div class="wrap-col">
						<ul>
						<c:choose>
						 <c:when test="${empty login }">
						    <li class="mail"><p><a href="http://localhost:8080/File/login.jsp">login</a></p></li>
							<li class="phone"><p>please login in</p></li>
						 </c:when>
						 <c:otherwise>
						  <li class="mail"><p><a href="localhost:8080/File/login.jsp">${username }</a></p></li>
							<li class="phone"><p><a href="http://localhost:8080/File/loginout">loginout</a></p></li>
						 
						 </c:otherwise>
						
						
						</c:choose>
						
						
	
						
						</ul>
					</div>
				</div>
				<div class="col-1-2">
					<div class="wrap-col f-right">
						<ul>
							<li><select>
								<option value="en" selected>English</option>
								<option value="fe">France</option>
								<option value="ge">Germany</option>
							</select></li>
							<li><p>Language</p></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap-header zerogrid">
		<div class="row">
			<div class="col-1-2">
				<div class="wrap-col">
					<div class="logo"><a href="http://localhost:8080/File/index_servlet?round=1"><img src="images/logo.png"/></a></div>	
				</div>
			</div>
			<div class="col-1-2">
				<div class="wrap-col f-right">
					<form method="get" action="http://localhost:8080/File/searchFilm" id="search"  >
					  <input name="filmname" type="text" size="40" placeholder="Search..." />
					  <input type="submit" value="Submit">
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div id="menu">
				<nav>
					<div class="wrap-nav">
					   <ul>
						 <li class="active"><a href="#">Home</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=剧情">剧情</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=动作">动作</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=悬疑">悬疑</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=爱情">爱情</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=动画">动画</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=喜剧">喜剧</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=惊悚">惊悚</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=冒险">冒险</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=科幻">科幻</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=战争">战争</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=历史">历史</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=音乐">音乐</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=真人秀">真人秀</a></li>
						 <li><a href="http://localhost:8080/File/index_servlet?round=1&&type=纪录片">纪录片</a></li>
					   </ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>

<!--////////////////////////////////////Container-->
<section id="container">
	<div class="wrap-container zerogrid">
		<div id="main-content" class="col-2-3">
			<div class="wrap-content">
				<div class="movie">
					<div class="row type">
						<div class="title">
							<center><h2>MOVIE</h2></center>
						</div>
						<ul>
							<li>
								<select>
									<option value="audi" selected>Type</option>
									<option value="volvo">Text Text</option>
									<option value="saab">Text Text</option>
									<option value="volvo">Text Text</option>
									<option value="saab">Text Text</option>
									<option value="volvo">Text Text</option>
									<option value="saab">Text Text</option>
									<option value="volvo">Text Text</option>
									<option value="saab">Text Text</option>
									<option value="volvo">Text Text</option>
									<option value="saab">Text Text</option>
								</select>
							</li>
							<li><a class="button " href="#">Search</a></li>
						</ul>
					</div>
					<div class="row">
					
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									 <img class="thumb" src="film_images/${film[0].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${film[0].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${film[0].id}"><h3>${film[0].filename }</h3></a>
									<span>${film[0].filmtype }</span>
								</div>
							</div>
						</div>
						
						
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									   <img class="thumb" src="film_images/${film[1].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${film[1].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${film[1].id}"><h3>${film[1].filename }</h3></a>
									<span>${film[1].filmtype }</span>
								</div>
							</div>
						</div>
						
						
							
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									   <img class="thumb" src="film_images/${film[2].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${film[2].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${film[2].id}"><h3>${film[2].filename }</h3></a>
									<span>${film[2].filmtype }</span>
								</div>
							</div>
						</div>
						
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect"> 
									   <img class="thumb" src="film_images/${film[3].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${film[3].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${film[3].id}"><h3>${film[3].filename }</h3></a>
									<span>${film[3].filmtype }</span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									   <img class="thumb" src="film_images/${film[4].imagename }"  /> 
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${film[4].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${film[4].id}"><h3>${film[4].filename }</h3></a>
									<span>${film[4].filmtype }</span>
								</div>
							</div>
						</div>
						
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="film_images/${film[5].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${film[5].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${film[5].id}"><h3>${film[5].filename }</h3></a>
									<span>${film[5].filmtype }</span>
								</div>
							</div>
						</div>
						
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									   <img class="thumb" src="film_images/${film[6].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${film[6].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${film[6].id}"><h3>${film[6].filename }</h3></a>
									<span>${film[6].filmtype }</span>
								</div>
							</div>
						</div>
						
						
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									   <img class="thumb" src="film_images/${film[7].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${film[7].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${film[7].id}"><h3>${film[7].filename }</h3></a>
									<span>${film[7].filmtype }</span>
								</div>
							</div>
						</div>
					</div>
					
					<c:if test="${empty type}">
					<center><div class="pagination">
						<a href="http://localhost:8080/File/index_servlet?round=1" id="cla1" class="page active" onClick="javascript:switchclass(this)">1</a>
						<a href="http://localhost:8080/File/index_servlet?round=2" id="cla2" class="page gradient" onClick="javascript:switchclass(this)">2</a>
						<a href="http://localhost:8080/File/index_servlet?round=3" id="cla3" class="page gradient" onClick="javascript:switchclass(this)">3</a>
						<a href="http://localhost:8080/File/index_servlet?round=4" id="cla4" class="page gradient" onClick="javascript:switchclass(this)">4</a>
						<a href="http://localhost:8080/File/index_servlet?round=5" id="cla5" class="page gradient" onClick="javascript:switchclass(this)">5</a> 
					</div></center>
					</c:if>
					<c:if test="${not empty type}">
					<center><div class="pagination">
						<a href="http://localhost:8080/File/index_servlet?round=1&&type=${type}" id="cla1" class="page active" onClick="javascript:switchclass(this)">1</a>
						<a href="http://localhost:8080/File/index_servlet?round=2&&type=${type}" id="cla2" class="page gradient" onClick="javascript:switchclass(this)">2</a>
						<a href="http://localhost:8080/File/index_servlet?round=3&&type=${type}" id="cla3" class="page gradient" onClick="javascript:switchclass(this)">3</a>
						<a href="http://localhost:8080/File/index_servlet?round=4&&type=${type}" id="cla4" class="page gradient" onClick="javascript:switchclass(this)">4</a>
						<a href="http://localhost:8080/File/index_servlet?round=5&&type=${type}" id="cla5" class="page gradient" onClick="javascript:switchclass(this)">5</a> 
					</div></center>
					</c:if>
				</div>
				
				
				<div class="serie">
					<div class="row type">
						<div class="title">
							<center><h2>Re For You</h2></center>
						</div>
						<ul>
							<li>
								<select>
									<option value="audi" selected>Type</option>
									<option value="volvo">Text Text</option>
									<option value="saab">Text Text</option>
									<option value="volvo">Text Text</option>
									<option value="saab">Text Text</option>
									<option value="volvo">Text Text</option>
									<option value="saab">Text Text</option>
									<option value="volvo">Text Text</option>
									<option value="saab">Text Text</option>
									<option value="volvo">Text Text</option>
									<option value="saab">Text Text</option>
								</select>
							</li>
							
							<li><a class="button " href="#">Search</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="film_images/${vistor_film[0].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${vistor_film[0].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${vistor_film[0].id}"><h3>${vistor_film[0].filename }</h3></a>
									<span>${vistor_film[0].filmtype }</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="film_images/${vistor_film[1].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${vistor_film[1].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${vistor_film[1].id}"><h3>${vistor_film[1].filename }</h3></a>
									<span>${vistor_film[1].filmtype }</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									 <img class="thumb" src="film_images/${vistor_film[2].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${vistor_film[2].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${vistor_film[2].id}"><h3>${vistor_film[2].filename }</h3></a>
									<span>${vistor_film[2].filmtype }</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect"> 
									  <img class="thumb" src="film_images/${vistor_film[3].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${vistor_film[3].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${vistor_film[3].id}"><h3>${vistor_film[3].filename }</h3></a>
									<span>${vistor_film[3].filmtype }</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									 <img class="thumb" src="film_images/${vistor_film[4].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${vistor_film[4].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${vistor_film[4].id}"><h3>${vistor_film[4].filename }</h3></a>
									<span>${vistor_film[4].filmtype }</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="film_images/${vistor_film[5].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${vistor_film[5].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${vistor_film[5].id}"><h3>${vistor_film[5].filename }</h3></a>
									<span>${vistor_film[5].filmtype }</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									 <img class="thumb" src="film_images/${vistor_film[6].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${vistor_film[6].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${vistor_film[6].id}"><h3>${vistor_film[6].filename }</h3></a>
									<span>${vistor_film[6].filmtype }</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									 <img class="thumb" src="film_images/${vistor_film[7].imagename }"  />
									  <div class="mask">  
										<a href="http://localhost:8080/File/single?id=${vistor_film[7].id}" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="http://localhost:8080/File/single?id=${vistor_film[7].id}"><h3>${vistor_film[7].filename }</h3></a>
									<span>${vistor_film[7].filmtype }</span>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div id="sidebar" class="col-1-3">
			<div class="wrap-sidebar">
				<!---- Start Widget ---->
				<div class="widget wid-new-updates">
					<div class="wid-header">
						<h5>Hot Updates !</h5>
					</div>
					<div class="wid-content">
						<ul>
						<c:forEach items="${fivenewfilm}" var="film">
						<li><a href="http://localhost:8080/File/single?id=${film.id}">${film.filename}</a><span><img src="images/hot.png" /></span></li>
						</c:forEach>
						</ul>
					</div>
				</div>
				<!---- Start Widget ---->
				<!--  <div class="widget wid-tag">
					<div class="wid-header">
						<h5>Tags</h5>
					</div>
					<div class="wid-content">
						<ul>
						<li><a href="#">animals</a></li>
						<li><a href="#">ssdad</a></li>
						<li><a href="#">ss</a></li>
						<li><a href="#">asdas</a></li>
						<li><a href="#">asdsals</a></li>
						<li><a href="#">dasdas</a></li>
						<li><a href="#">animals</a></li>
						<li><a href="#">aasdasls</a></li>
						</ul>
					</div>
				</div>-->
				<!---- Start Widget ---->
				<div class="widget wid-post">
					<div class="wid-header">
						<h5>评分最高电影</h5>
					</div>
					<c:forEach items="${highfilm}" var="film">
					<div class="wid-content">
						<div class="post">
							<a href="http://localhost:8080/File/single?id=${film.id}"><img src="film_images/${film.imagename}"/></a>
							<div class="wrapper" style="width:40%">
							  <a href="http://localhost:8080/File/single?id=${film.id}"><h6>${film.filename}</h6></a>
							  <p>${film.year}</p>
							  <!--  <a href="#"><img src="images/star.png" /></a>-->
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<!---- Start Widget ---->
			
			</div>
		</div>
	</div>
</section>

<!--////////////////////////////////////Footer-->
<footer>
	<div class="zerogrid">
		<div class="wrap-footer">
			<div class="row">
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="widget wid-about">
							<div class="wid-header">
								<h5>Welcome</h5>
							</div>
							<div class="logo"><a href="#"><img src="images/logo.png"/></a></div>
							<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque quod maxime placeat 
								facere possimus nihil impedit quo minus id quod maxime placeat facere possimus. </p>
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="widget wid-meta">
							<div class="wid-header">
								<h5>Links List</h5>
							</div>
							<div class="widget-content">
								<div class="row">
									<ul>
										<li><a href="#">> Lorem ipsum dolor sit </a></li>
										<li><a href="#">> Nullam venenatis lacus a </a></li>
										<li><a href="#">> Morbi ut sapien nec nisl</a></li>
										<li><a href="#">> Integer a enim ac ex.</a></li>
										<li><a href="#">> Sed in nunc non eleifend  </a></li>
										<li><a href="#">> Integer a enim ac ex.</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="widget wid-report">
							<div class="wid-header">
								<h5>Report Link</h5>
							</div>
							<div class="wid-content">
								<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy 
								eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
								At vero eos et accusam et justo duo dolores et ea rebum. Consetetur sadipscing elitr,  
								sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="widget wid-meta">
							<div class="wid-header">
								<h5>Links List</h5>
							</div>
							<div class="widget-content">
								<div class="row">
									<ul>
										<li><a href="#">> Lorem ipsum dolor sit </a></li>
										<li><a href="#">> Nullam venenatis lacus a </a></li>
										<li><a href="#">> Morbi ut sapien nec nisl</a></li>
										<li><a href="#">> Integer a enim ac ex.</a></li>
										<li><a href="#">> Sed in nunc non eleifend  </a></li>
										<li><a href="#">> Integer a enim ac ex.</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom-footer">
		<div class="wrap-bottom ">
			<div class="copyright">
				<p>©2015 - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			</div>
		</div>
	</div>
</footer>


</div>
<script src="js/css3-mediaqueries.js"></script>
<script src="js/jquery.min.js"></script>
</body>

<script type="text/javascript">
 $(document).ready(function(){
   var ids='<%=id%>';
			
			$("#"+ids).siblings().removeClass().addClass("page gradient"); 
			$("#"+ids).removeClass().addClass("page active");
		});
</script>
</html>
