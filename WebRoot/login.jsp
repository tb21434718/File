<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录界面</title>

<link rel="stylesheet" type="text/css" href="css1/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css1/style.css" />
<link rel="stylesheet" href="css/zerogrid.css">
<link rel="stylesheet" href="css/responsive.css">

<script src="js1/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('#login').click(function() {
		var name_state = $('#name');
		var psd_state = $('#psd');
		var name = $('#name').val();
		var psd = $('#psd').val();
		if (name == '') {
			name_state.parent().next().next().css("display", "block");
			return false;
		} else if (psd == '') {
			name_state.parent().next().next().css("display", "none");
			psd_state.parent().next().next().css("display", "block");
			return false;
		} else {
			name_state.parent().next().next().css("display", "none");
			psd_state.parent().next().next().css("display", "none");
			$('.login').submit(function() {
		    if(!validateVerifyCode())return false;
		    return true;
		    });
		}
	});
	$('#register').click(function() {
		var name_r_state = $('#name_r');
		var psd_r_state = $('#psd_r');
		var affirm_psd_state = $('#affirm_psd');
		var name_r = $('#name_r').val();
		var psd_r = $('#psd_r').val();
		var affirm_psd = $('#affirm_psd').val();
		if (name_r == '') {
			name_r_state.parent().next().next().css("display", "block");
			return false;
		} else if (psd_r == '') {
			psd_r_state.parent().next().next().css("display", "block");
			return false;
		} else if (affirm_psd == '') {
			affirm_psd_state.parent().next().next().css("display", "block");
			return false;
		} else if (psd_r != affirm_psd) {
			return false;
		} else {
			$('.register').submit();
		}
	})
})

function ok_or_errorBylogin(l) {
	var content = $(l).val();
	if (content != "") {
		$(l).parent().next().next().css("display", "none");
	}
}

function ok_or_errorByRegister(r) {
	var affirm_psd = $("#affirm_psd");
	var psd_r = $("#psd_r");
	var affirm_psd_v = $("#affirm_psd").val();
	var psd_r_v = $("#psd_r").val();
	var content = $(r).val();
	if (content == "") {
		$(r).parent().next().next().css("display", "block");
		return false;
	} else {
		$(r).parent().next().css("display", "block");
		$(r).parent().next().next().css("display", "none");
		if (psd_r_v == "") {
			$(psd_r).parent().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "block");
			return false;
		}
		if (affirm_psd_v == "") {
			$(affirm_psd_v).parent().next().css("display", "none");
			$(affirm_psd_v).parent().next().next().css("display", "none");
			$(affirm_psd_v).parent().next().next().css("display", "block");
			return false;
		}
		if (psd_r_v == affirm_psd_v) {
			$(affirm_psd).parent().next().css("display", "none");
			$(affirm_psd).parent().next().next().css("display", "none");
			$(psd_r).parent().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "none");
			$(affirm_psd).parent().next().css("display", "block");
			$(psd_r).parent().next().css("display", "block");
		} else {
			$(affirm_psd).parent().next().css("display", "none");
			$(affirm_psd).parent().next().next().css("display", "none");
			$(psd_r).parent().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "none");
			$(psd_r).parent().next().css("display", "block");
			$(affirm_psd).parent().next().next().css("display", "block");
			return false;
		}
	}
}

function barter_btn(bb) {
	$(bb).parent().parent().fadeOut(0);
	$(bb).parent().parent().siblings().fadeIn(2000);
}

function _hyz() {
	/*
	 * 1. 获取<img>元素
	 * 2. 重新设置它的src
	 * 3. 使用毫秒来添加参数
	 */
	$("#vCode").attr("src", "/File/VerifyCodeServlet?a=" + new Date().getTime());
}
/*
 * 校验验证码
 */
function validateVerifyCode() {
	var bool = true;
	//$("#verifyCodeError").css("display", "none");
	$("#verifyCode").parent().next().css("display", "none");
    $("#verifyCode").parent().next().next().css("display", "none");
	var value = $("#verifyCode").val();
	if(!value) {//非空校验
		//$("#verifyCodeError").css("display", "");
		//$("#verifyCodeError").text("验证码不能为空！");
	$("#verifyCode").parent().next().css("display", "none");
	$("#verifyCode").parent().next().css("display", "none");
    $("#verifyCode").parent().next().next().css("display", "block");
    _hyz();
	} else if(value.length != 4) {//长度不为4就是错误的
		//$("#verifyCodeError").css("display", "");
		//$("#verifyCodeError").text("错误的验证码！");
		$("#verifyCode").parent().next().css("display", "none");
	    $("#verifyCode").parent().next().css("display", "none");
        $("#verifyCode").parent().next().next().css("display", "block");
        _hyz();
		bool = false;
	} else {//验证码是否正确
		$.ajax({
			cache: false,
			async: false,
			type: "POST",
			dataType: "json",
			data: {method: "ajaxValidateVerifyCode", verifyCode: value},
			url: "/File/AjaxServlet",
			success: function(flag) {
			
				if(!flag) {
					//$("#verifyCodeError").css("display", "");
					//$("#verifyCodeError").text("错误的验证码！");
					$("#verifyCode").parent().next().css("display", "none");
	                $("#verifyCode").parent().next().css("display", "none");
                    $("#verifyCode").parent().next().next().css("display", "block");
                    _hyz();
					bool = false;					
				}
			}
		});
	}
	return bool;
}
</script>
</head>
<c:if test="${not empty registerfalse}">
   <script type="text/javascript">
   
   $(document).ready(function(){
       
	   $('#register11').trigger('click');
   });
   alert('此用户名已被注册，请重新输入');
 
   </script>
</c:if>
<% String registerornot = request.getParameter("registerornot");
request.setAttribute("registerornot", registerornot);
 %>
<c:if test="${not empty registerornot}">
   <script type="text/javascript">
   
   $(document).ready(function(){
       
	   $('#register11').trigger('click');
   });
   </script>
</c:if>

<body class="login_body">

<div class="login_div">
	<div class="col-xs-12 login_title">登陆</div>
	<form action="login" class="login" method="post">
		<div class="nav">
			<div class="nav login_nav">
				<div class="col-xs-4 login_username">
					用户名:
				</div>
				<div class="col-xs-6 login_usernameInput">
					<input type="text" name="username" id="name" value="" placeholder="&nbsp;&nbsp;用户名/手机号"  onblur="javascript:ok_or_errorBylogin(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav login_psdNav">
				<div class="col-xs-4">
					密&nbsp;&nbsp;&nbsp;码:
				</div>
				<div class="col-xs-6">
					<input type="password" name="password" id="psd" value="" placeholder="&nbsp;&nbsp;密码" onBlur="javascript:ok_or_errorBylogin(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav register_affirm">
			<div id="verify">
				<div class="col-xs-4">
					验证码:
				 </div>
				<div class="col-xs-6">
				  <input  type="text" name="verifyCode" id="verifyCode"  value=""  placeholder="&nbsp;&nbsp;密码"  />
				   <img id="vCode" src="<c:url value='/VerifyCodeServlet'/>"/>
                    <a href="javascript:_hyz()">换张图</a>
                    </div>
				  <div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
 
                        
             <div class="col-xs-4">
                <!--    <label id="verifyCodeError" class="error" ></label></div>  -->
			</div>
			</div>
			<div class="col-xs-12 login_btn_div">
				<input type="submit" class="sub_btn" value="登录" id="login" />
			</div>
			
		</div>
	</form>
    
	<div class="col-xs-12 barter_register">
		<button id="register11" class="barter_registerBtn" onClick="javascript:barter_btn(this)" style="">没有账号?前往注册</button>
	</div>
</div>

<div class="register_body">
	<div class="col-xs-12 register_title">注册</div>
	<form action="register" class="register" method="post">
		<div class="nav">
			<div class="nav register_nav">
				<div class="col-xs-4">
					用户名:
				</div>
				<div class="col-xs-6">
					<input type="text" name="username" id="name_r" value="" placeholder="&nbsp;&nbsp;用户名/手机号" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav register_psdnav">
				<div class="col-xs-4">
					密&nbsp;&nbsp;&nbsp;码:
				</div>
				<div class="col-xs-6">
					<input type="password" name="password" id="psd_r" value="" placeholder="&nbsp;&nbsp;密码" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav register_affirm">
				<div class="col-xs-4">
					确认密码:
				</div>
				<div class="col-xs-6">
					<input type="password" name="" id="affirm_psd" value="" placeholder="&nbsp;&nbsp;确认密码" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="col-xs-12 register_btn_div">
				<input type="submit" class="sub_btn" value="注册" id="register" />
			</div>
		</div>
	</form>
	<div class="col-xs-12 barter_register">
		<button class="barter_registerBtn" onClick="javascript:barter_btn(this)" style="">返回登录</button>
	</div>
</div>

</body>
</html>