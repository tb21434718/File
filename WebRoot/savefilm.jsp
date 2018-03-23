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
	
<title>无线点餐平台</title>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="style/js/jquery.js"></script>
<script type="text/javascript" src="style/js/page_common.js"></script>
<link href="style/css/common_style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style/css/index_1.css" />
</head>
<body>

<!-- 页面标题 -->
<div id="TitleArea">
	<div id="TitleArea_Head"></div>
	<div id="TitleArea_Title">
		<div id="TitleArea_Title_Content">
			
				
				
					<img border="0" width="13" height="13" src="style/images/title_arrow.gif"/> 添加新电影
				
			
		</div>
    </div>
	<div id="TitleArea_End"></div>
</div>

<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
	<!-- 表单内容 -->
	<form action="SaveFilm" method="post" enctype="multipart/form-data" accept-charset="utf-8">
		<!-- 本段标题（分段标题） -->
		<div class="ItemBlock_Title">
        	<img width="4" height="7" border="0" src="style/images/item_point.gif"> 电影信息&nbsp;
        </div>
		<!-- 本段表单字段 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
				<div class="ItemBlock2">
					<table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr>
							<td width="80px">电影名</td>
							<td><input type="text" name="filmname" class="InputStyle" value=""/> *</td>
						</tr>
						<tr>
							<td width="80px">类型</td>
							<td><input type="text" name="filmtype" class="InputStyle" value=""/> *</td>
						</tr>
						<tr>
							<td>评分</td>
							<td><input type="text" name="score" class="InputStyle" value="" readonly/> *</td>
						</tr>
						<tr>
							<td width="80px">导演</td>
							<td><input type="text" name="dector" class="InputStyle" value=""/> *</td>
						</tr>
						<tr>
							<td>编剧</td>
							<td><input type="text" name="writer" class="InputStyle" value=""/> *</td>
						</tr>
						<tr>
							<td>演员</td>
							<td><input type="text" name="actor" class="InputStyle" value=""/> *</td>
						</tr>
                        <tr>
							<td>国家</td>
							<td><input type="text" name="country" class="InputStyle" value=""/> *</td>
						</tr>
						<tr>
							<td>语言</td>
							<td><input type="text" name="language" class="InputStyle" value=""/> *</td>
						</tr>
						<tr>
							<td>链接</td>
							<td><input type="text" name="link" class="InputStyle" value=""/> *</td>
						</tr>
						<tr>
							<td>简介</td>
							<td><textarea name="introduction" class="TextareaStyle"></textarea></td>
						</tr>
					
						<tr>
							<td>上映年份</td>
							<td><input type="text" name="year" class="InputStyle" value=""/>*</td>
						</tr>
						<tr>
							<td width="80px">图片</td>
							<td>	
								<input type="file" name="imagename"/> *
							</td>
						</tr>
						<tr>
							<td><input type="hidden" name="currpage" value="${currpage}"/></td>
						</tr>
					</table>
				</div>
            </div>
        </div>
		
		
		<!-- 表单操作 -->
		<div id="InputDetailBar">

					 <input type="submit" value="添加" class="FunctionButtonInput">
				
			
            
            <a href="javascript:history.go(-1);" class="FunctionButton">返回</a>
        </div>
	</form>
</div>
</body>
</html>
