
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>forget</title>
		<link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/css/proList.css" />
		<link rel="stylesheet" type="text/css" href="${path}/css/forget.css" />
		<style type="text/css">
			form.one input[type="button"]{
				background: #c10000;
			}
			.forCon form input[type="password"]{
				border:1px solid #DBDBDB;
				width:250px;
				padding-left:10px;
			}
		</style>
		<script type="text/javascript" src="${path}/static/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			var username;

			function findName(e) {
				 username = $(e).prev().prev().prev()[0].value;
				$.ajax({
					url:"${path}/findName",
					type:"post",
					data:{
						username:username
					},
					success:function (res) {
						if(res.success){
								$(".two").show();
								$(".one").hide();
								$(".forCon ul li").eq(1).addClass("on").siblings("li").removeClass("on");

						}else{
							layer.msg("用户名不存在");

						}
					}
				})

			};

			function findTelNumber(e) {
				var telNumber = $(e).prev().prev().prev()[0].value;
				var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
				if(reg.test(telNumber)){
				$.ajax({
					url:"${path}/findTelNumber",
					type:"post",
					data:{
						telNumber:telNumber,
						username:username
					},
					success:function (res) {
						if(res.success){
								$(".three").show();
								$(".two").hide();
								$(".forCon ul li").eq(2).addClass("on").siblings("li").removeClass("on");
						}else{
							layer.msg("绑定手机号输入错误");

						}
					}
				});
				}else{
					layer.msg("手机号格式错误");
				}

			};
			function forgetPassWord(e) {
					var newPassWord = $(e).prev().prev()[0].value;
			    	var password = $(e).prev().prev().prev().prev().prev()[0].value;
			    	if(password!=null && password!=''){
			    	if(password===newPassWord){
					$.ajax({
						url:"${path}/updateForgetPassWord",
						type:"post",
						data:{
							password:password,
							username:username
						},
						success:function (res) {
							if(res.success){
								layer.msg('修改成功', {
									icon: 1,
									time: 1000 //2秒关闭（如果不配置，默认是3秒）
								}, function(){
									location = "${path}/login"
								});

							}else{
								layer.msg("修改失败");

							}
						}

					});
					}else{
						layer.msg("两次密码不一致");

					}
					}else{
						layer.msg("请输入密码");
					}
			};







		</script>
	</head>
	<body>
		<!----------------------------------------order------------------>
		<div class="order cart">
			<!-----------------logo------------------->
			<div class="logo">
				<h1 class="wrapper clearfix">
					<a href="index.jsp"><img class="fl" src="${path}/img/temp/logo.png"></a>
				</h1>

			</div>
			<div class="forCon">
				<p>安全设置-找回密码</p>
				<ul>
					<li class="on"><span>01/</span>输入登录名</li>
					<li><span>02/</span>验证信息</li>
					<li><span>03/</span>重置密码</li>
				</ul>
				<div class="formCon">
					<!--步骤1-->
					<form action="#" method="post" class="one">
						<input type="text" value="" placeholder="用户名"><label>用户名</label><br />
				<%--		<input type="text" value="" placeholder="验证码"><label>请输入验证码</label><br />
						<img src="${path}/img/temp/code.jpg"><br>--%>
						<input type="button" onclick="findName(this)" value="下一步" class="next">
					</form>
					<!--步骤2-->
					<form action="#" method="post" class="two">
						<%--<p>电子邮箱：<span>114081*****qq.com</span></p>
						<p class="tip">验证邮件已发往你的电子邮箱，请点击邮件中的链接完成验证</p>--%>
							<input type="text" value="" placeholder="电话号码"><label>电话号码</label><br />

							<input type="button" onclick="findTelNumber(this)" value="电话号码验证" class="next1">
					</form>
					<!--步骤3-->
					<form action="#" method="post" class="three">
						<label>新密码：</label><input type="password" value=""><br />
						<label>确认密码：</label><input type="password" value=""><br />
						<input type="button" onclick="forgetPassWord(this)" value="完成">
					</form>

				</div>
			</div>
		</div>
		
		<script src="${path}/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/pro.js" type="text/javascript" charset="utf-8"></script>
		<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
	</body>
</html>
