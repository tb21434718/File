<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 包含公共的JSP代码片段 -->
	
<title>电影推荐网站后台管理</title>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="style/js/jquery.js"></script>
<script type="text/javascript" src="style/js/page_common.js"></script>
<link href="style/css/common_style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style/css/index_1.css" />
 <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Cache" content="no-cache"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="css/style1.css" rel="stylesheet"/>
    <script src="Scripts/jquery-1.3.2.js"></script>
    <script src="Scripts/jquery.paginate.js"></script>
    <style>
        .cib {
            padding: 5px 2px;
        }

        .cib input {
            vertical-align: bottom;
            height: 20px;
            color: #567e84;
            margin: 2px 0px;
        }

        .cib button {
            vertical-align: bottom;
            height: 26px;
            cursor: pointer;
            background-color: #cbefff;
            border: 1px solid #44a8d6;
            color: #567e84;
            margin: 2px 0px;
        }

        .desc {
            padding-left: 2px;
            color: #657e9a;
        }

        .code-con{
            font-size: 18px;
        }

        .hr-c{
            background-color: #2196F3;
            height: 5px;
            border: 0px;
        }
    </style>
</head>


<body>
<!-- 页面标题 -->
<div id="TitleArea">
	<div id="TitleArea_Head"></div>
	<div id="TitleArea_Title">
		<div id="TitleArea_Title_Content">
			<img border="0" width="13" height="13" src="style/images/title_arrow.gif"/> 电影列表
		</div>
    </div>
	<div id="TitleArea_End"></div>
</div>


	<!-- 过滤条件 -->
	<div id="QueryArea">
		<form action="/wirelessplatform/food.html" method="get">
			<input type="hidden" name="method" value="search">
			<input type="text" name="keyword" title="请输入菜品名称">
			<input type="submit" value="搜索">
		</form>
	</div>
<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
    <table class="MainArea_Content" align="center" cellspacing="0" cellpadding="0">
        <!-- 表头-->
        <thead>
            <tr align="center" valign="middle" id="TableTitle">
				<td>电影编号</td>
				<td>电影名称</td>
				<td>电影类型</td>
				<td>导演</td>
                <td>上映时间</td>
				<td>操作</td>
			</tr>
		</thead>	
		<!--显示数据列表 -->
        <tbody id="TableData">
		 <c:forEach items="${filmlist}" var="film">
			<tr class="TableDetail1">
				<td>${film.id }&nbsp;</td>
				<td>${film.filename }&nbsp;</td>
				<td>${film.filmtype }&nbsp;</td>
				<td>${film.dector }&nbsp;</td>
                <td>${film.year }&nbsp;</td>
				<td>
					<a id="update" href="http://localhost:8080/File/updatefilm?id=${film.id}&&currpage=${round}"  class="FunctionButton">更新</a>				
					<a id="delete" href="http://localhost:8080/File/deletefilm?id=${film.id}&&currpage=${round}"  class="FunctionButton">删除</a>				
				</td>
			</tr>
        </c:forEach>
        </tbody>
    </table>
	
   <!-- 其他功能超链接 -->
	<div id="TableTail" align="center">
		<div class="FunctionButton"><a id="insert" href="http://localhost:8080/File/preSaveFilm?currpage=${round}">添加</a></div>
    </div> 
    

<div id="demo1">   
</div>
    
<script type="text/javascript">
  
$("#demo1").paginate({
    count: ${total},
    start: ${round},
    display: 20,
    border: true,
    onChange: function(page) {
     window.location.href="http://localhost:8080/File/FilmList?round="+page;
    }
});

     /* $(document).ready(function(){
       
	  $("#pagination_4").whjPaging("setPage", "${round}", ${total});
	   var curp=$("#demo1").whjPaging("getPage", "${round}", ${total})[0];
	   $("#update").attr("href","http://localhost:8080/File/updatefilm?id=${film.id}&&currpage="+curp); 
	   $("#delete").attr("href","http://localhost:8080/File/deletefilm?id=${film.id}&&currpage="+curp); 
	  alert(curp);
   }); */

</script>
</div>
</body>
</html>

