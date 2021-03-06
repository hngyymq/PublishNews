<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>注册</title>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/particles/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/sweetalert2/sweetalert2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
</head>
<body>
	<!-- particles.js container -->
	<div id="particles-js"></div>
	<div id="wrapper">
		<div>
			<h1 style="font-size: 44px;">修改个人信息</h1>
		</div>
		<nav class="switch_nav">
			<h3>修改下列信息并提交</h3>
		</nav>
		
		<form method="post" action="javascript:;">
			<ul class="group_input">
				<li>
					<input type="hidden" id="id" value="${user.id}"/>
				</li>
				<li>
					<input type="text" placeholder="账号" class="mobile required" id="mobile" value="${user.userAccount}" readonly="readonly"/>
				</li>
				<li>
					<input type="text" placeholder="姓名" class="name required" value="${user.userName}" id="name"  />
				</li>
				<li>
					<input type="password" placeholder="密码(不少于6位)" class="psd required"  id="psd" />
				</li>
				<li>
					<input type="password" placeholder="确认密码" class="psd required" id="psd1" />
				</li>
			</ul>
			<button type="submit" class="submit_btn" id="btnSubmit">修改信息</button>
		</form>
	
		<div id="footer">
			<span>&copy;SIAS</span>
		</div>
	</div>
	<script src=" ${pageContext.request.contextPath}/assets/libs/jquery-1.12.4/jquery.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/assets/libs/sweetalert2/sweetalert2.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/assets/libs/particles/particles.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/assets/libs/particles/js/app.js"></script>
	<!-- <script src="	assets/libs/particles/js/lib/stats.js"></script> -->
	<script>
		
		//为表单元素添加失去焦点事件
		$("form :input").blur(function(){
			var $parent = $(this).parent();
			$parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
			//验证姓名
			if($(this).is("#name")){
				var nameVal = $.trim(this.value);
				var regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;
				if(nameVal == "" || nameVal.length < 2 || regName.test(nameVal)){
					var errorMsg = " 姓名非空，长度2-20位，不包含特殊字符！";
					$parent.append("<span class='msg onError'>" + errorMsg + "</span>");
				} else{
					var okMsg=" 输入正确";
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
				}
			}
			
			
			//验证密码
            if($(this).is("#psd1")){
                var psdVal = $.trim(this.value);
                var psdVal1 = $("#psd").val();
                if(psdVal!=psdVal1 ){
                    var errorMsg = " 两次密码不一致";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
			
    		//验证密码是否一致
            if($(this).is("#psd")){
                var psdVal = $.trim(this.value);
                var regPsd = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
                if(psdVal== "" || !regPsd.test(psdVal)){
                    var errorMsg = " 密码为6-20位字母、数字的组合！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
		}).keyup(function(){
			//triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
			$(this).triggerHandler("blur"); 
		}).focus(function(){
			$(this).triggerHandler("blur");
		});
		


				//点击重置按钮时，通过trigger()来触发文本框的失去焦点事件
		$("#btnSubmit").click(function(){
    		//trigger 事件执行完后，浏览器会为submit按钮获得焦点
    		$("form .required:input").trigger("blur"); 
    		var numError = $("form .onError").length;
    		if(numError){
    			return false;
    		}
			var userName =$("#name").val();
			var userPsw =$("#psd").val();
			var id= $("#id").val();			
    		$.ajax({
    			"url":"${pageContext.request.contextPath}/user/editUser",
                "data":{
                	"id":id,
                	"userName":userName,
                	"userPsw":userPsw
                },
                dataType: 'json',
                "type":"POST",
                "success":function(data){
                	alert(data.flag);
                	if(data.flag){
                		window.location.href="toLogin";
                	}else{
                		window.location.href="index";
                	}
	            },
                "error":function(jqXHR, textStatus, errorThrown){
                	 /*jqXHR对象的信息*/
                    console.log('jqXHR.responseText --> ',jqXHR.responseText);
                    console.log('jqXHR.status --> ',jqXHR.status);
                    console.log('jqXHR.readyState --> ',jqXHR.readyState);
                    console.log('jqXHR.statusText --> ',jqXHR.statusText);
                    /*其他两个参数的信息*/
                    console.log('textStatus --> ',textStatus);
                    console.log('errorThrown --> ',errorThrown);
                }
    		});
    		//alert('注册成功！')
    		});
		
		
	</script>
	<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
</body>
</html>

