<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<style type="text/css">
#bg{
	width: 60px;
	height: 16px;
	background: url("img/star_gray.png");
}
#over{
	height:16px;
	background:url("img/star_org.png") no-repeat;
}
</style>
<head>
<script type="text/javascript">
var check = 0;//该变量是记录当前选择的评分
var time = 0;//该变量是统计用户评价的次数，这个是我的业务要求统计的（改变评分不超过三次），可以忽略

/*over()是鼠标移过事件的处理方法*/
function over(param){
	if(param == 1){
		$("#star1").attr("src","img/star_red.png");//第一颗星星亮起来，下面以此类推
		$("#message").html("很差");//设置提示语，下面以此类推
	}else if(param == 2){
		$("#star1").attr("src","img/star_red.png");
		$("#star2").attr("src","img/star_red.png");
		$("#message").html("比较差");
	}else if(param == 3){
		$("#star1").attr("src","img/star_red.png");
		$("#star2").attr("src","img/star_red.png");
		$("#star3").attr("src","img/star_red.png");
		$("#message").html("一般");
	}else if(param == 4){
		$("#star1").attr("src","img/star_red.png");
		$("#star2").attr("src","img/star_red.png");
		$("#star3").attr("src","img/star_red.png");
		$("#star4").attr("src","img/star_red.png");
		$("#message").html("比较好");
	}else if(param == 5){
		$("#star1").attr("src","img/star_red.png");
		$("#star2").attr("src","img/star_red.png");
		$("#star3").attr("src","img/star_red.png");
		$("#star4").attr("src","img/star_red.png");
		$("#star5").attr("src","img/star_red.png");
		$("#message").html("很好");
	}
}
/*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
function out(){
	if(check == 1){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
		$("#star1").attr("src","img/star_red.png");
		$("#star2").attr("src","img/star.png");
		$("#star3").attr("src","img/star.png");
		$("#star4").attr("src","img/star.png");
		$("#star5").attr("src","img/star.png");
		$("#message").html("");
	}else if(check == 2){
		$("#star1").attr("src","img/star_red.png");
		$("#star2").attr("src","img/star_red.png");
		$("#star3").attr("src","img/star.png");
		$("#star4").attr("src","img/star.png");
		$("#star5").attr("src","img/star.png");
		$("#message").html("");
	}else if(check == 3){
		$("#star1").attr("src","img/star_red.png");
		$("#star2").attr("src","img/star_red.png");
		$("#star3").attr("src","img/star_red.png");
		$("#star4").attr("src","img/star.png");
		$("#star5").attr("src","img/star.png");
		$("#message").html("");
	}else if(check == 4){
		$("#star1").attr("src","img/star_red.png");
		$("#star2").attr("src","img/star_red.png");
		$("#star3").attr("src","img/star_red.png");
		$("#star4").attr("src","img/star_red.png");
		$("#star5").attr("src","img/star.png");
		$("#message").html("");
	}else if(check == 5){
		$("#star1").attr("src","img/star_red.png");
		$("#star2").attr("src","img/star_red.png");
		$("#star3").attr("src","img/star_red.png");
		$("#star4").attr("src","img/star_red.png");
		$("#star5").attr("src","img/star_red.png");
		$("#message").html("");
	}else if(check == 0){
		$("#star1").attr("src","img/star.png");
		$("#star2").attr("src","img/star.png");
		$("#star3").attr("src","img/star.png");
		$("#star4").attr("src","img/star.png");
		$("#star5").attr("src","img/star.png");
		$("#message").html("");
	}
}
/*click()点击事件处理，记录打分*/
function click(param){
	time++;//记录打分次数
	check = param;//记录当前打分
	out();//设置星星数
}
</script>
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
</head>

<c:choose>
  <c:when test="${empty login}">
         <script type="text/javascript"> 
        $(document).ready(function(){       
	    $('#yxx').hide();
	    $('#start').hide();
                 }); 
        </script>
  </c:when>
  <c:otherwise> 
     <c:choose>
     <c:when test="${empty hasscored}">
       <script type="text/javascript">
   
       $(document).ready(function(){     
	   $('#yxx').show();
	   $('#start').hide();
	
        }); 
       </script>
   </c:when>  
    <c:otherwise>
    <script type="text/javascript">
   
       $(document).ready(function(){     
	   $('#yxx').hide();
	   $('#start').show();
	
        }); 
       </script>
    </c:otherwise>    
     </c:choose>
   </c:otherwise>
</c:choose>







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
						 <li><a href="index.jsp">Home</a></li>
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


<!--////////////////////////////////////Container-->
<section id="container">
	<div class="wrap-container zerogrid">
		<div id="main-content" class="col-2-3">
			<div class="wrap-content">
				<article>
					<div class="art-header">
						<div class="col-1-3">
							<div class="wrap-col">
								<img src="film_images/${film.imagename }" />
							</div>
						</div>
						<div class="col-2-3">
							<div class="wrap-col">
								<ul>
									<li><p>Production: ${film.filmtype }</p></li>
									<li><p>Actor: ${film.actor }</p></li>
									<li><p>Director: ${film.dector }</p></li>
									<li><p>Nation: ${film.country }</p></li>
									<li><p>Upload: ${film.year }</p></li>
									<li><p>score:  ${film.score }<div id="bg"> <div id="over" style="width:${totalpoints}"></div></div></p></li>
									<li><a class="button bt1" href="#">Play</a><a class="button bt1" href="#">Trailer</a></li>
									<!--<li class="star"><a href="#"><img src="images/star.png" /></a></li>-->
									<li class="star">
									<div id="yxx">
	                                  	   <a href="http://localhost:8080/File/updatescore?score=2&&filmid=${film.id}"><img src="img/star.png" id="star1" onMouseOver="over(1)" onMouseOut="out(1)"/></a>
		                                   <a href="http://localhost:8080/File/updatescore?score=4&&filmid=${film.id}"><img src="img/star.png" id="star2" onMouseOver="over(2)" onMouseOut="out(2)" /></a>
		                                   <a href="http://localhost:8080/File/updatescore?score=6&&filmid=${film.id}"><img src="img/star.png" id="star3" onMouseOver="over(3)" onMouseOut="out(3)" /></a>
		                                   <a href="http://localhost:8080/File/updatescore?score=8&&filmid=${film.id}"><img src="img/star.png" id="star4" onMouseOver="over(4)" onMouseOut="out(4)"/></a>
		                                   <a href="http://localhost:8080/File/updatescore?score=10&&filmid=${film.id}"><img src="img/star.png" id="star5" onMouseOver="over(5)" onMouseOut="out(5)"/></a>
		                                   <span id="message"></span>
	                                </div>
									</li>
									<li id="start">
									<div id="bg"><!--这里是背景，也就是灰色的星星-->
		                              <div id="over" style="width:${points}"></div><!--这里是遮罩，设置宽度以达到评分的效果-->
	                                    </div>
	                                    </li>
								</ul>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					
					
					
					
					
					
					<div class="art-content">
						<p>${film.introduction }</p>
						<p></p>
						<blockquote><p></p></blockquote>
					
						<p></p>
						<div class="note">
						  <div class="clear"></div>
						</div>
						<p></p>
						<div class="clear"></div>
					</div>
				</article>
				
				<div class="widget wid-related">
					<div class="wid-header">
						<h5>Related Post</h5>
					</div>
					<div class="wid-content">
						<div class="row">
							<div class="col-1-3">
								<div class="wrap-col">
									<a href="#"><img src="images/10.jpg" /></a>
									<a href="#"><h4>Vero eros et accumsan et iusto odio </h4></a>
								</div>
							</div>
							<div class="col-1-3">
								<div class="wrap-col">
									<a href="#"><img src="images/13.jpg" /></a>
									<a href="#"><h4>Vero eros et accumsan et iusto odio </h4></a>
								</div>
							</div>
							<div class="col-1-3">
								<div class="wrap-col">
									<a href="#"><img src="images/6.jpg" /></a>
									<a href="#"><h4>Vero eros et accumsan et iusto odio </h4></a>
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
						<li><a href="#">Mad Max: Fury Road</a><span><img src="images/hot.png" /></span></li>
						<li><a href="#">The Age of Adaline</a><span><img src="images/hot.png" /></span></li>
						<li><a href="#">Pound of Flesh</a><span><img src="images/hot.png" /></span></li>
						<li><a href="#">Bloodbath Island</a><span><img src="images/hot.png" /></span></li>
						<li><a href="#">Pound of Flesh</a><span><img src="images/hot.png" /></span></li>
						</ul>
					</div>
				</div>
				<!---- Start Widget ---->
				<div class="widget wid-tag">
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
				</div>
				<!---- Start Widget ---->
				<div class="widget wid-post">
					<div class="wid-header">
						<h5>Today's movies</h5>
					</div>
					<div class="wid-content">
						<div class="post">
							<a href="#"><img src="images/1.jpg"/></a>
							<div class="wrapper">
							  <a href="#"><h6>A Blue Morning</h6></a>
							  <p>March 1, 2015</p>
							  <a href="#"><img src="images/star.png" /></a>
							</div>
						</div>
						<div class="post">
							<a href="#"><img src="images/2.jpg"/></a>
							<div class="wrapper">
							 <a href="#"><h6>A Blue Morning</h6></a>
							  <p>March 1, 2015</p>
							  <a href="#"><img src="images/star.png" /></a>
							</div>
						</div>
						<div class="post">
							<a href="#"><img src="images/3.jpg"/></a>
							<div class="wrapper">
							 <a href="#"><h6>A Blue Morning</h6></a>
							  <p>March 1, 2015</p>
							  <a href="#"><img src="images/star.png" /></a>
							</div>
						</div>
					</div>
				</div>
				<!---- Start Widget ---->
				<div class="widget wid-last-updates">
					<div class="wid-header">
						<h5>Lastest Updates</h5>
					</div>
					<div class="wid-content">
						<div class="post">
							<a href="#"><img src="images/1.jpg"/></a>
							<div class="wrapper">
							  <a href="#"><h6>A Blue Morning</h6></a>
							  <p>March 1, 2015</p>
							  <a href="#"><img src="images/star.png" /></a>
							</div>
						</div>
						<div class="post">
							<a href="#"><img src="images/2.jpg"/></a>
							<div class="wrapper">
							 <a href="#"><h6>A Blue Morning</h6></a>
							  <p>March 1, 2015</p>
							  <a href="#"><img src="images/star.png" /></a>
							</div>
						</div>
						<div class="post">
							<a href="#"><img src="images/3.jpg"/></a>
							<div class="wrapper">
							 <a href="#"><h6>A Blue Morning</h6></a>
							  <p>March 1, 2015</p>
							  <a href="#"><img src="images/star.png" /></a>
							</div>
						</div>
					</div>
				</div>
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

</body></html>