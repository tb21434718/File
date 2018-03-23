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

<script>
        $(document).ready(function(){
            $('#yyyy').click(function () {
                $.ajax({
                    type: "POST",
                    data:{"score":"2","filmid":"${film.id}"},
                    url: "http://localhost:8080/File/updatescore",
                    dataType: "json",
                    success: function (data){
                      
                       
                       alert("hello");
 
                      
                    }
                });
            });
            }
        
</script>



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
						    <li class="mail"><p><a href="http://localhost:8080/File/login.jsp">登陆</a></p></li>
							<li class="phone"><p><a href="http://localhost:8080/File/login.jsp?registerornot=yes">注册</a></p></li>
						 </c:when>
						 <c:otherwise>
						  <li class="mail"><p><a href="localhost:8080/File/login.jsp">${username }</a></p></li>
							<li class="phone"><p><a href="http://localhost:8080/File/loginout">登出</a></p></li>
						 </c:otherwise>
						</c:choose>	
						</ul>
					</div>
				</div>
				<div class="col-1-2">
					<div class="wrap-col f-right">
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
						 <li id="li1" class="active"><a href="http://localhost:8080/File/index_servlet?round=1">主页</a></li>
						 <li id="li2"><a href="http://localhost:8080/File/index_servlet?round=1&&type=剧情&&liid=li2">剧情</a></li>
						 <li id="li3"><a href="http://localhost:8080/File/index_servlet?round=1&&type=动作&&liid=li3">动作</a></li>
						 <li id="li4"><a href="http://localhost:8080/File/index_servlet?round=1&&type=悬疑&&liid=li4">悬疑</a></li>
						 <li id="li5"><a href="http://localhost:8080/File/index_servlet?round=1&&type=爱情&&liid=li5">爱情</a></li>
						 <li id="li6"><a href="http://localhost:8080/File/index_servlet?round=1&&type=动画&&liid=li6">动画</a></li>
						 <li id="li7"><a href="http://localhost:8080/File/index_servlet?round=1&&type=喜剧&&liid=li7">喜剧</a></li>
						 <li id="li8"><a href="http://localhost:8080/File/index_servlet?round=1&&type=惊悚&&liid=li8">惊悚</a></li>
						 <li id="li9"><a href="http://localhost:8080/File/index_servlet?round=1&&type=冒险&&liid=li9">冒险</a></li>
						 <li id="li10"><a href="http://localhost:8080/File/index_servlet?round=1&&type=科幻&&liid=li10">科幻</a></li>
						 <li id="li11"><a href="http://localhost:8080/File/index_servlet?round=1&&type=战争&&liid=li11">战争</a></li>
						 <li id="li12"><a href="http://localhost:8080/File/index_servlet?round=1&&type=历史&&liid=li12">历史</a></li>
						 <li id="li13"><a href="http://localhost:8080/File/index_servlet?round=1&&type=音乐&&liid=li13">音乐</a></li>
						 <li id="li14"><a href="http://localhost:8080/File/index_servlet?round=1&&type=真人秀&&liid=li14">真人秀</a></li>
						 <li id="li15"><a href="http://localhost:8080/File/index_servlet?round=1&&type=纪录片&&liid=li15">纪录片</a></li>
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
								<a  href="${film.link}" target="_blank"><img src="film_images/${film.imagename }" /></a>
							</div>
						</div>
						<div class="col-2-3">
							<div class="wrap-col">
								<ul>
								    <li><p>影名: ${film.filename }</p></li>
									<li><p>类型: ${film.filmtype }</p></li>
									<li><p>主演: ${film.actor }</p></li>
									<li><p>导演: ${film.dector }</p></li>
									<li><p>国家/地区: ${film.country }</p></li>
									<li><p>上映时间: ${film.year }</p></li>
									<li style="height:24.8px"><p style="float:left;height:24.8px" >电影总评: ${film.score }<div id="bg" style="position:relative;left:8px;top:12.4px;float:left"> <div id="over" style="width:${totalpoints}"></div></div></li>
									<li  class="star" style="height:24.8px">
									 <c:if test="${empty hasscored}">
									 <p style="position:relative;float:left;left:-120px">个人评分:</p>
									 </c:if>
									 <c:if test="${not empty hasscored}">
									 <p style="position:relative;float:left;left:-120px">个人评分: ${score}</p>
									 </c:if>
									<span id="yxx" style="position:relative;left:-100px;top:12.4px;float:left" >
	                                  	   <a href="http://localhost:8080/File/updatescore?score=2&&filmid=${film.id}"><img src="img/star.png" id="star1" onMouseOver="over(1)" onMouseOut="out(1)"/></a>
		                                   <a href="http://localhost:8080/File/updatescore?score=4&&filmid=${film.id}"><img src="img/star.png" id="star2" onMouseOver="over(2)" onMouseOut="out(2)" /></a>
		                                   <a href="http://localhost:8080/File/updatescore?score=6&&filmid=${film.id}"><img src="img/star.png" id="star3" onMouseOver="over(3)" onMouseOut="out(3)" /></a>
		                                   <a href="http://localhost:8080/File/updatescore?score=8&&filmid=${film.id}"><img src="img/star.png" id="star4" onMouseOver="over(4)" onMouseOut="out(4)"/></a>
		                                   <a href="http://localhost:8080/File/updatescore?score=10&&filmid=${film.id}"><img src="img/star.png" id="star5" onMouseOver="over(5)" onMouseOut="out(5)"/></a>
	                                </span>
									</li>
									<li id="start" >
									<div id="bg" style="position:relative;left:-105px;top:-25.4px;float:left" >
		                              <div id="over" style="width:${points}"></div>
	                                </div>
	                            
	                                    </li>
									<!--   <li><a class="button bt1" href="${film.link}" target="_blank">链接</a></li> -->
									
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
						<h5>宣传信息相关电影</h5>
					</div>
					<div class="wid-content">
						<div class="row">
						  <c:forEach items="${relatedfilm}" var="r">
							  <div class="col-1-3">
								  <div class="wrap-col">
									  <a href="http://localhost:8080/File/single?id=${r.id}"><img src="film_images/${r.imagename}" /></a>
									  <a href="http://localhost:8080/File/single?id=${r.id}"><h4>${r.filename}</h4></a>
								  </div>
							  </div>
						  </c:forEach>	
		
						</div>
					</div>
				</div>
				
				<div class="widget wid-related">
					<div class="wid-header">
						<h5>相同类型相关电影</h5>
					</div>
					<div class="wid-content">
						<div class="row">
						  <c:forEach items="${relatedfilm}" var="r">
							  <div class="col-1-3">
								  <div class="wrap-col">
									  <a href="http://localhost:8080/File/single?id=${r.id}"><img src="film_images/${r.imagename}" /></a>
									  <a href="http://localhost:8080/File/single?id=${r.id}"><h4>${r.filename}</h4></a>
								  </div>
							  </div>
						  </c:forEach>	
		
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="sidebar" class="col-1-3">
			<div class="wrap-sidebar">
				<!---- Start Widget ---->
				<!---- Start Widget ---->
				<div class="widget wid-post">
					<div class="wid-header">
						<h5>导演相关电影</h5>
					</div>
					<div class="wid-content">
						
					<c:if test="${not empty dectorrelatedfilm}">
						<c:forEach items="${dectorrelatedfilm}" var="film">
						    <div class="post">
							    <a href="http://localhost:8080/File/single?id=${film.id}"><img src="film_images/${film.imagename}"/></a>
							    <div class="wrapper" style="width:40%">
							      <a href="http://localhost:8080/File/single?id=${film.id}"><h6>${film.filename}</h6></a>
							     <p>${film.year}</p>
							</div>
						    </div>
					     </c:forEach>
					</c:if>
					<c:if test="${ empty dectorrelatedfilm}">
					   <p>本站中无此导演执导的其他影片信息</p>
					</c:if>
						
					</div>
				</div>
				<!---- Start Widget ---->
				<div class="widget wid-last-updates">
					<div class="wid-header">
						<h5>演员相关电影</h5>
					</div>
					<div class="wid-content">
					<c:if test="${not empty actorrelatedfilm}">
						<c:forEach items="${actorrelatedfilm}" var="film">
						<div class="post">
							<a href="http://localhost:8080/File/single?id=${film.id}"><img src="film_images/${film.imagename}"/></a>
							<div class="wrapper" style="width:40%">
							  <a href="http://localhost:8080/File/single?id=${film.id}"><h6>${film.filename}</h6></a>
							  <p>${film.year}</p>
							</div>
						</div>
					</c:forEach>
					</c:if>
					<c:if test="${ empty actorrelatedfilm}">
					   <p>本站中无主演参与的其他影片信息</p>
					</c:if>
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
				<p>©2018 和平鸽小组 <a href="#" target="_blank" title="模板之家">大数据电影推荐网站</a></p>
			</div>
		</div>
	</div>
</footer>


</div>

</body></html>