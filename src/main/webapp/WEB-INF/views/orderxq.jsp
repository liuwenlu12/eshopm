<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>


<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>个人信息</title>
		<link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/css/myorder.css" />
		<style type="text/css">

			.img-orderDetail{
				width: 80px;
				height: 80px;
			}
		</style>
	</head>
	<body>
		<!------------------------------head------------------------------>
		<%@include file="_header.jsp"%>
		<!------------------------------idea------------------------------>

		
		<!------------------------------Bott------------------------------>
		<div class="Bott">
			<div class="wrapper clearfix">
				<div class="zuo fl">
					<h3>

						<p class="clearfix"><span style="font-size: large" class="fl">[${sessionScope.user.username}]</span><a href="${path}/logout" class="fr">[退出登录]</a></p>
					</h3>
					<div>
						<h4>我的交易</h4>
						<ul>
							<li><a href="${path}/cart">我的购物车</a></li>
							<li class="on"><a href="${path}/personalOrder">我的订单</a></li>
						</ul>
						<h4>个人中心</h4>
						<ul>
							<li><a href="${path}/personalCenter">我的中心</a></li>
							<li><a href="${path}/address">地址管理</a></li>
						</ul>
						<h4>账户管理</h4>
						<ul>
							<li><a href="${path}/updatePassWord">修改密码</a></li>
						</ul>
					</div>
				</div>
				<div class="you fl">

					<c:forEach items="${requestScope.orderDetailList}" var="orderDetail" varStatus="status">
					<c:if test="${status.first}">
						<div class="my clearfix">
							<h2>订单详情<a href="#"></a></h2>
							<br>
							<h3>订单号：<span>${orderDetail.order_id}</span></h3>
						</div>

					</c:if>





						<div class="orderList">
							<div class="orderList1">
								<c:if test="${orderDetail.status == 1}">
									<h3>已收货</h3>
								</c:if>
								<c:if test="${orderDetail.status == 0}">
									<h3>未收货</h3>
								</c:if>
								<div class="clearfix">
									<a href="#" class="fl"><img class="img-orderDetail" src="${path}/${orderDetail.img_url}"/></a>
									<p class="fl"><a href="#">${orderDetail.name}</a><a href="#">单价:<fmt:formatNumber value="${orderDetail.price}" type="CURRENCY"/></a></p>
									<br><br><br>
									<p class="fl">颜色分类:<a href="#">${orderDetail.color}</a><a href="#">数量:${orderDetail.amount}</a></p>

								</div>
							</div>
							<c:if test="${status.last}">
								<div class="orderList1">
									<h3>收货信息</h3>
									<p>姓名：<span>${orderDetail.address_name}</span></p>
									<p>联系电话：<span>${orderDetail.tel_number}</span></p>
									<p>收货地址：<span>${orderDetail.detailed_address}</span></p>
								</div>
								<div class="orderList1">
									<h3>支付方式及送货时间</h3>
									<p>支付方式：<span>${orderDetail.payment}</span></p>
									<p>快递：<span>${orderDetail.logistics}</span></p>

									<p>送货时间：<span>不限送货时间</span></p>
								</div>
								<div class="orderList1 hei">
									<h3><strong>商品总价：</strong><span><fmt:formatNumber value="${requestScope.orderDetailPrice}" type="CURRENCY"/></span></h3>
									<p><strong>订单金额：</strong><span><fmt:formatNumber value="${requestScope.orderDetailPrice}" type="CURRENCY"/></span></p>
									<p><strong>实付金额：</strong><span><fmt:formatNumber value="${requestScope.orderDetailPrice}" type="CURRENCY"/></span></p>

									<p><strong>运费：</strong><span>免运费</span></p>
								</div>


							</c:if>



						</div>





					</c:forEach>



					
					
				</div>
			</div>
		</div>
		<
		
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
		<!--footer-->
	<%@include file="_bottom.jsp"%>
		<script src="${path}/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/user.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
