<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>

<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>个人信息</title>
		<link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/css/mygxin.css" />
		<style type="text/css">
			.user-img{
				width: 80px;
				height: 80px;
			}
		</style>

	</head>
	<body>
		<!------------------------------head------------------------------>
		<%@include file="_header.jsp"%>

		<!------------------------------Bott------------------------------>
		<div class="Bott">
			<div class="wrapper clearfix">
				<div class="zuo fl">
					<h3>
						<c:if test="${sessionScope.user!=null}">
							<a href="#"><img class="user-img" src="${path}/<c:if test="${requestScope.userAccountPicture==null}">static/images/userPicture/morentouxiang.jpeg</c:if><c:if test="${requestScope.userAccountPicture!=null}">${requestScope.userAccountPicture.img_url}</c:if>"/></a>
							<p style="font-size: large">${sessionScope.user.username}</p>
							<%--<p><a href="${path}/logout">[退出登录]</a></p>--%>
						</c:if>
						<c:if test="${sessionScope.user==null}">
							<p><a href="login.jsp">[去登陆]</a></p>
						</c:if>
					</h3>
					<div>
						<h4>我的交易</h4>
						<ul>
							<li><a href="${path}/cart">我的购物车</a></li>
							<li><a href="${path}/personalOrder">我的订单</a></li>
						</ul>
						<h4>个人中心</h4>
						<ul>
							<li  class="on"><a href="${path}/personalCenter">我的中心</a></li>
							<li><a href="${path}/address">地址管理</a></li>
						</ul>
						<h4>账户管理</h4>
						<ul>
							<li><a href="${path}/personalDetails">个人信息</a></li>
							<li><a href="${path}/updatePassWord">修改密码</a></li>
						</ul>
					</div>
				</div>
				<div class="you fl">
					<div class="tx clearfix">
						<div class="fl clearfix">
							<a href="#" class="fl"><img class="user-img" src="${path}/<c:if test="${requestScope.userAccountPicture==null}">static/images/userPicture/morentouxiang.jpeg</c:if><c:if test="${requestScope.userAccountPicture!=null}">${requestScope.userAccountPicture.img_url}</c:if>"/></a>
							<p class="fl"><span>${sessionScope.user.username}</span><a href="${path}/personalDetails">修改个人信息></a></p>
						</div>
						<div class="fr">绑定手机号：${sessionScope.user.tel_number}</div>
					</div>
					<div class="bott">
						<div class="clearfix">
							<a href="#" class="fl"><img src="img/gxin1.jpg"/></a>
							<p class="fl"><span>全部订单：<strong>${requestScope.countOrder}</strong></span>
								<a href="${path}/personalOrder">查看全部订单></a>
							</p>
						</div>
						<div class="clearfix">
							<a href="#" class="fl"><img src="img/gxin2.jpg"/></a>
							<p class="fl"><span>待收货的订单：<strong>${requestScope.countOrderNoConfirm}</strong></span>
								<a href="${path}/personalOrder?isConfirm=1">查看待收货订单></a>
							</p>
						</div>
						<div class="clearfix">
							<a href="#" class="fl"><img src="img/gxin3.jpg"/></a>
							<p class="fl"><span>待评价的商品：<strong>${requestScope.countOrderNoAppraise}</strong></span>
								<a href="${path}/personalOrder?isAppraise=1">查看待评价订单></a>
							</p>
						</div>
						<%--<div class="clearfix">
							<a href="#" class="fl"><img src="img/gxin4.jpg"/></a>
							<p class="fl"><span>喜欢的商品：<strong>0</strong></span>
								<a href="#">查看喜欢的商品></a>
							</p>
						</div>--%>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<!--返回顶部-->
		<div class="gotop">
			<a href="cart.jsp">
			<dl>
				<dt><img src="${path}/img/gt1.png"/></dt>
				<dd>去购<br />物车</dd>
			</dl>
			</a>
			<a href="#" class="dh">
			<dl>
				<dt><img src="${path}/img/gt2.png"/></dt>
				<dd>联系<br />客服</dd>
			</dl>
			</a>
			<a href="mygxin.jsp">
			<dl>
				<dt><img src="${path}/img/gt3.png"/></dt>
				<dd>个人<br />中心</dd>
			</dl>
			</a>
			<a href="#" class="toptop" style="display: none">
			<dl>
				<dt><img src="${path}/img/gt4.png"/></dt>
				<dd>返回<br />顶部</dd>
			</dl>
			</a>
			<p>400-800-8200</p>
		</div>
		<%@include file="_bottom.jsp"%>
		<%--<div class="footer">
			<div class="top">
				<div class="wrapper">
					<div class="clearfix">
						<a href="#2" class="fl"><img src="${path}/img/foot1.png"/></a>
						<span class="fl">7天无理由退货</span>
					</div>
					<div class="clearfix">
						<a href="#2" class="fl"><img src="${path}/img/foot2.png"/></a>
						<span class="fl">15天免费换货</span>
					</div>
					<div class="clearfix">
						<a href="#2" class="fl"><img src="${path}/img/foot3.png"/></a>
						<span class="fl">满599包邮</span>
					</div>
					<div class="clearfix">
						<a href="#2" class="fl"><img src="${path}/img/foot4.png"/></a>
						<span class="fl">手机特色服务</span>
					</div>
				</div>
			</div>
			<p class="dibu">最家家居&copy;2013-2017公司版权所有 京ICP备080100-44备0000111000号<br />
			违法和不良信息举报电话：400-800-8200，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</p>
		</div>--%>
		<script src="${path}/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/user.js" type="text/javascript" charset="utf-8"></script>
		
	</body>
</html>
