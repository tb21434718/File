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
	
<title>搜索结果</title>



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
    <link rel="stylesheet" type="text/css" href="./css/pagination.css"/>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="./js/pagination.min.js"></script>
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
				<form method="get" action="http://localhost:8080/File/searchFilm" id="search"  >
					  <input name="filmname" type="text" size="40" placeholder="Search..." />
					  <input type="submit" value="Submit">
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
					<a id="update" href="http://localhost:8080/File/single?id=${film.id}"  class="FunctionButton">进入</a>				
						
				</td>
			</tr>
        </c:forEach>
        </tbody>
    </table>
	
  
    <div id="pagination_4"></div>
<script type="text/javascript">
   
   
  
  
 
</script>
</div>
</body>
</html>
