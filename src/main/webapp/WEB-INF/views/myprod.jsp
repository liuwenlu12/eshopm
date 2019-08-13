<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>


<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>最家</title>
		<link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/css/myorder.css" />
		<style type="text/css">
	.img-appraise{
		width: 280px;
		height: 280px;
	}

		</style>
		<script type="text/javascript" src="${path}/static/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			$(function () {
				$("#a-appraise").click(function () {
				  var content =	$("textarea[name = 'appraise']")[0].value;
				var productId =	$(":hidden[name='pid']")[0].value;
				var detailId =	$(":hidden[name='did']")[0].value;
				$.ajax({
					url:"${path}/appraise",
					type:"post",
					data:{
						content:content,
						productId:productId,
						detailId:detailId
					},
					success:function (res) {
						if(res.success){
							layer.msg('评价成功', {
								icon: 1,
								time: 1000 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
								location = "${path}/personalOrder";
							});

						}else{
							layer.msg('评价成功');
						}
					}

				});

				});
				return false;

			});


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
						<p class="clearfix" style="font-size: large">${sessionScope.user.username}</p>
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
						<h2 class="fl">商品评价</h2>
					</div>
					<div class="dlist">
						<ul class="clearfix" id="pro">
							<li class="on"><a href="#2">待评价商品</a></li>
						<%--	<li><a href="#2">已评价商品</a></li>
							<li><a href="#2">评价失效商品</a></li>--%>
						</ul>
					</div>
					<div class="sx clearfix">
						<div class="clearfix">


							<dl class="fl">
								<input type="hidden" name="pid" value="${requestScope.detailMap.product_id}">
								<input type="hidden" name="did" value="${requestScope.detailMap.detail_id}">

								<dt><a href="#"><img class="img-appraise" src="${path}/${requestScope.detailMap.img_url}"/></a></dt>
								<dd><a href="#">${requestScope.detailMap.name}</a></dd>
								<dd><fmt:formatNumber value="${requestScope.detailMap.price}" type="CURRENCY"/></dd>
							<%--	<dd>16000人评价</dd>--%>
								<c:if test="${requestScope.detailMap.status==0}">
									<dd><a  href="#2">评价</a></dd>
								</c:if>
								<c:if test="${requestScope.detailMap.status==1}">
									<dd><a>已评价</a></dd>
								</c:if>
							</dl>
						<%--	<dl class="fl">
								<dt><a href="#"><img src="${path}/img/nav3.jpg"/></a></dt>
								<dd><a href="#">家用创意壁挂  釉下彩复古</a></dd>
								<dd>¥199.00</dd>
								<dd>16000人评价</dd>
								<dd><a href="#2">评价</a></dd>
							</dl>--%>
						</div>
						<div class="clearfix">
							<dl class="fl">
								<dt><a href="#"><img src="${path}/img/nav3.jpg"/></a></dt>
								<dd><a href="#">家用创意壁挂  釉下彩复古</a></dd>
								<dd>¥199.00</dd>
								<dd>16000人评价</dd>
								<dd><a href="#2">查看评价</a></dd>							
							</dl>
						</div>
						<div class="clearfix" >
							<dl class="fl">
								<dt><a href="#"><img src="${path}/img/nav3.jpg"/></a></dt>
								<dd><a href="#">家用创意壁挂  釉下彩复古</a></dd>
								<dd>¥199.00</dd>
								<dd>16000人评价</dd>
								<dd><a href="#2">暂不能评价</a></dd>							
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<!--<dl class="fl">
								<dt><a href="#"><img src="img/nav3.jpg"/></a></dt>
								<dd><a href="#">家用创意壁挂  釉下彩复古</a></dd>
								<dd>¥199.00</dd>
								<dd>16000人评价</dd>
								<dd><a href="#">待评价</a></dd>
							</dl>
							<dl class="fl">
								<dt><a href="#"><img src="img/nav3.jpg"/></a></dt>
								<dd><a href="#">家用创意壁挂  釉下彩复古</a></dd>
								<dd>¥199.00</dd>
								<dd>16000人评价</dd>
								<dd><a href="#">待评价</a></dd>
							</dl>-->
			
			<!--遮罩-->
			<div class="mask"></div>
			<!--评价弹框-->
			<div class="pj">
				<div class="clearfix"><a href="#" class="fr gb"><img src="${path}/img/icon4.png"/></a></div>
				<h3>商品评分</h3>
				<form action="#" method="get">
					<%--<div class="clearfix">
						<p class="fl">请打分：</p>
						<p class="fl" id="xin">
							<a href="#2"><img src="${path}/img/xin.png"/></a>
							<a href="#2"><img src="${path}/img/xin.png"/></a>
							<a href="#2"><img src="${path}/img/xin.png"/></a>
							<a href="#2"><img src="${path}/img/xin.png"/></a>
							<a href="#2"><img src="${path}/img/xin.png"/></a>
						</p>
					</div>--%>
					<textarea name="appraise" rows="" cols="" placeholder="请输入评价" ></textarea>
					<div class="bc">
						<input id="a-appraise" type="button" value="保存"  />
						<input type="button" value="取消" />
					</div>
				</form>
			</div>
			<!--查看评价-->
			<div class="chak">
				<div class="clearfix"><a href="#" class="fr gb"><img src="${path}/img/icon4.png"/></a></div>
				<h3>商品评分</h3>
				<form action="#" method="get">
					<div class="clearfix">
						<p class="fl">请打分：</p>
						<p class="fl" id="xin">
							<a href="#2"><img src="${path}/img/hxin.png"/></a>
							<a href="#2"><img src="${path}/img/hxin.png"/></a>
							<a href="#2"><img src="${path}/img/hxin.png"/></a>
							<a href="#2"><img src="${path}/img/hxin.png"/></a>
							<a href="#2"><img src="${path}/img/hxin.png"/></a>
						</p>
					</div>
					<textarea name="" rows="" cols="" placeholder="请输入评价" >挺好的挺好的挺好的~五分好评</textarea>
					<div class="bc">
						<input type="button" value="保存"  />
						<input type="button" value="取消" />
					</div>
				</form>
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
