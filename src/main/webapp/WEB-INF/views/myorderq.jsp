<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>最家</title>
		<link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/css/myorder.css" />
		<script type="text/javascript" src="${path}/static/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
		function changeStatus(e) {
				console.log($(e).parent().children(":eq(1)")[0].value);
			var orderId = $(e).parent().children(":eq(1)")[0].value;
			layer.confirm('确定收货吗?', {icon: 3, title:'提示'}, function(){
				$.ajax({
					url:"${path}/order/changeStatus",
					type:"get",
					data:{
					orderId:orderId
					},
					success:function (res) {
						if(res.success){
							layer.msg('确认收货成功', {
								icon: 1,
								time: 1000 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
								location = "${path}/personalOrder";
							});
						}else{
							layer.msg("确定收货失败");
						}
					}


				})


			});

		}




		</script>
	</head>
	<body>
		<!------------------------------head------------------------------>
		<%@include file="_header.jsp"%>
		<!------------------------------Bott------------------------------>
		<div class="Bott">
			<div class="wrapper clearfix">
				<div class="zuo fl">
					<h3>

						<p class="clearfix" style="font-size: large">${sessionScope.user.username}<%--<a href="${path}/logout">[退出登录]</a>--%></p>
					</h3>
					<div>
						<h4>我的交易</h4>
						<ul>
							<li><a href="${path}/cart">我的购物车</a></li>
							<li><a href="${path}/personalOrder">我的订单</a></li>
						</ul>
						<h4>个人中心</h4>
						<ul>
							<li><a href="${path}/personalCenter">我的中心</a></li>
							<li><a href="${path}/address">地址管理</a></li>
						</ul>
						<h4>账户管理</h4>
						<ul>
							<li  class="on"><a href="${path}/personalDetails">个人信息</a></li>
							<li><a href="${path}/updatePassWord">修改密码</a></li>
						</ul>
					</div>
				</div>
				<div class="you fl">
					<div class="my clearfix">
						<h2 class="fl">我的订单</h2>
						<%--<a href="#" class="fl">请谨防钓鱼链接或诈骗电话，了解更多&gt;</a>--%>
					</div>
					<div class="dlist clearfix">
						<ul class="fl clearfix" id="wa">
							<li class="on"><a href="#2">全部有效订单</a></li>
						<%--	<li><a href="#2">待支付</a></li>
							<li><a href="#2l">待收货</a></li>
							<li><a href="#2">已关闭</a></li>--%>
						</ul>
						<%--<form action="#" method="get" class="fr clearfix">
							<input type="text" name="" id="" value="" placeholder="请输入商品名称、订单号" />
							<input type="button" name="" id="" value="" />
						</form>--%>
					</div>

				<c:forEach items="${requestScope.ordersList}" var="order">


						<c:if test="${order.status==1}">
							<div class="dkuang">
							<p class="one">已收货</p>
						</c:if>
						<c:if test="${order.status==0}">
								<div class="dkuang clearfix deng">
							<p class="one">待收货</p>
						</c:if>
						<div class="word clearfix">
							<ul class="fl clearfix">
								<li>${order.add_time}</li>
								<li></li>
								<li></li>
								<li>在线支付</li>
							</ul>

							<p class="fr">订单金额：<span>${order.totalPrice}</span>元</p>
						</div>

						<c:forEach items="${order.products}" var="product"	varStatus="status">
						<div class="shohou clearfix">
							<a href="#" class="fl"><img src="${path}/${product.img_url}"/></a>
							<p class="fl"><a href="#">${product.name}</a><a ><fmt:formatNumber value="${product.price}" type="CURRENCY"/></a><br><a>颜色分类:${product.color}</a><br><a>数量:${product.amount}</a></p>



							<p class="fr">
								<c:if test="${order.status==1}">
									<c:if test="${product.status==0}">
										<a href="${path}/appraise?detailId=${product.detail_id}">待评价</a>
										<c:if test="${status.index==0}">
											<a href="${path}/orderDetail?orderId=${order.order_id}">订单详情</a>

										</c:if>
									</c:if>
									<c:if test="${product.status==1}">
										<a >已评价</a>
										<c:if test="${status.index==0}">
											<a href="${path}/orderDetail?orderId=${order.order_id}">订单详情</a>

										</c:if>
									</c:if>

								</c:if>

								<c:if test="${order.status==0}">
									<c:if test="${status.index==0}">
								<a onclick="changeStatus(this)" href="#">确认收货</a>
										<input type="hidden" name="oid" value="${order.order_id}">
										<a href="${path}/orderDetail?orderId=${order.order_id}">订单详情</a>
									</c:if>
							</c:if>
							</p>

						</div>
						</c:forEach>


					</div>





				</c:forEach>










				<%--	<div class="dkuang">
						<p class="one">已收货</p>
						<div class="word clearfix">
							<ul class="fl clearfix">
								<li>2016年12月1日 18:53</li>
								<li>杨小黄</li>
								<li>订单号:5160513358520018</li>
								<li>在线支付</li>
							</ul>
							<p class="fr">订单金额：<span>99.00</span>元</p>
						</div>
						<div class="shohou clearfix">
							<a href="#" class="fl"><img src="${path}/img/g1.jpg"/></a>
							<p class="fl"><a href="#">家用创意菜盘子圆盘 釉下彩复古</a><a href="#">¥99.00×1</a></p>
							<p class="fr">
								<a href="${path}/myprod.jsp">待评价</a>
								<a href="${path}/orderxq.jsp">订单详情</a>
							</p>
						</div>
					</div>--%>
				<%--	<div class="dkuang clearfix deng">
						<p class="one fl">待收货</p>
						<div  class="clearfix">
							<div class="fl vewwl">
								<a href="${path}/wuliu.jsp" class="ckwl">查看物流</a>
								<div class="wuliu">
									<h4>圆通速递：858888888888888</h4>
									<ul>
										<li>
											<p>妥投投递并签收，已签收。签收人：本人签收</p>
											<p>2016-12-03 17:30:00</p>
										</li>
										<li>
											<p>深圳市南油速递营销部安排投递（投递员姓名：六六六。联系电话：14243452522;</p>
											<p>2016-12-03 08:50:00</p>
										</li>
										<li>
											<p>到达广东省邮政速递物流有限公司深圳航空邮件处理中心处理中心（经转）</p>
											<p>2016-12-03 02:20:00</p>
										</li>
										<li>以上为最新跟踪信息<a href="${path}/wuliu.jsp">查看全部</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="word clearfix">
							<ul class="fl clearfix">
								<li>2016年12月1日 18:53</li>
								<li>杨小黄</li>
								<li>订单号:5160513358520018</li>
								<li>在线支付</li>
							</ul>
							<p class="fr">订单金额：<span>99.00</span>元</p>
						</div>
						<div class="shohou clearfix">
							<a href="#" class="fl"><img src="${path}/img/g1.jpg"/></a>
							<p class="fl"><a href="#">家用创意菜盘子圆盘 釉下彩复古</a><a href="#">¥99.00×1</a></p>
							<p class="fr">
								<a href="#">确认收货</a>
								<a href="${path}/WEB-INF/views/orderxq.jsp">订单详情</a>
							</p>
						</div>
					</div>--%>
				<%--	<div class="dkuang deng">
						<p class="one">待支付</p>
						<div class="word clearfix">
							<ul class="fl clearfix">
								<li>2016年12月1日 18:53</li>
								<li>杨小黄</li>
								<li>订单号:5160513358520018</li>
								<li>在线支付</li>
							</ul>
							<p class="fr">订单金额：<span>99.00</span>元</p>
						</div>
						<div class="shohou clearfix">
							<a href="#" class="fl"><img src="${path}/img/g1.jpg"/></a>
							<p class="fl"><a href="#">家用创意菜盘子圆盘 釉下彩复古</a><a href="#">¥99.00×1</a></p>
							<p class="fr">
								<a href="#">立即支付</a>
								<a href="${path}/WEB-INF/views/orderxq.jsp">订单详情</a>
							</p>
						</div>
					</div>--%>
				<%--	<div class="dkuang">
						<p class="one">已关闭</p>
						<div class="word clearfix">
							<ul class="fl clearfix">
								<li>2016年12月1日 18:53</li>
								<li>杨小黄</li>
								<li>订单号:5160513358520018</li>
								<li>在线支付</li>
							</ul>
							<p class="fr">订单金额：<span>99.00</span>元</p>
						</div>
						<div class="shohou clearfix">
							<a href="#" class="fl"><img src="${path}/img/g1.jpg"/></a>
							<p class="fl"><a href="#">家用创意菜盘子圆盘 釉下彩复古</a><a href="#">¥99.00×1</a></p>
							<p class="fr">
								<a href="#">交易失败</a>
								<a href="${path}/WEB-INF/views/orderxq.jsp">订单详情</a>
							</p>
						</div>
					</div>--%>
					<div class="fenye clearfix">
						<a href="#"><img src="${path}/img/zuo.jpg"/></a>
						<a href="#">1</a>
						<a href="#"><img src="${path}/img/you.jpg"/></a>
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
		<!--footer-->
		<%@include file="_bottom.jsp"%>
		<script src="${path}/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/user.js" type="text/javascript" charset="utf-8"></script>
			<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>

	</body>
</html>
