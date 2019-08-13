<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>


<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>cart</title>
		<link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/css/proList.css" />
		<link href="https://cdn.bootcss.com/layer/2.3/skin/layer.css" rel="stylesheet">
		<style type="text/css">
			.cart-img{
				width: 120px;
				height: 120px;
			}

		</style>

		<script type="text/javascript" src="${path}/static/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			$(function () {
				if($(".th").length==0){
					$(".table .goOn").show();
				}

				$("#select-all").click(function () {

					$(":checkbox[name='cid']").prop("checked",this.checked);
					queryTotal();
					count();
				});
				$(":checkbox[name='cid']").click(function () {
					$("#select-all").prop("checked",$(":checkbox[name='cid']").length===$(":checkbox[name='cid']:checked").length);
					queryTotal();
					count();
				})
                $(".count").click(function () {

					var inputs = $(":checkbox[name='cid']:checked");
					if(inputs.length===0){
						layer.msg("请至少选择一个商品");
						return;
					}
					var url = "${path}/checkout?";
					inputs.each(function () {
						url+= "cartId="+this.value+"&"
					});
					location = url;
                })

			});

			function count() {
				if($("#sl").text()>0){
					$(".count").css("background","#c10000");
				}else{
					$(".count").css("background","#8e8e8e");
				}
			}

			function queryTotal() {
				var inputs = $(":checkbox[name='cid']:checked");
				if(inputs.length===0){
					$("#sl").text(0);
					$("#all").text("￥0.00");
					return;
				}
				var url = "${path}/cartTotal?";
				inputs.each(function () {
					url+= "cartId="+this.value+"&"
				});
				$.ajax({
					url:url,
					type:"get",
					success:function (res) {

						$("#sl").text(res.total_amount);
						$("#all").text('￥'+res.total_price.toFixed(2));
						count();
					}
				})
			}

			function del(e) {
				var remove = $(e).parent().parent();
				var productId =  $(e).parent().parent().children(":first").children(":eq(1)").children(":eq(0)").children(":eq(1)").children(":eq(1)").text();
				var color = $(e).parent().parent().children(":first").children(":eq(1)").children(":eq(0)").children(":eq(1)").children(":eq(3)").text();

				layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(){

					$.ajax({
						url:"${path}/cart/delete",
						type:"get",
						data: {
							productId: productId,
							color: color
						},
						success:function (res) {
							queryTotal();
							count();
							if(res.success){
								layer.msg('删除成功', {
									icon: 1,
									time: 1000 //2秒关闭（如果不配置，默认是3秒）
								}, function(){
									remove.remove();
									if($(".th").length==0){
										$(".table .goOn").show();
									}
								});


							}else{
								layer.msg("删除失败");
							}
						}
					})

				});


				};
				function updateAmount(e) {
					 var input = $(e).parent().parent().parent().children().children().children("input");
					input.prop("checked",true);


					 var countPrice = $(e).parent().parent().parent().children(":last").prev();
					var productId = $(e).parent().parent().parent().children().children(":eq(1)").children().children(":eq(1)").children(":eq(1)").text();
					var color = $(e).parent().parent().parent().children().children(":eq(1)").children().children(":eq(1)").children(":eq(3)").text();
					var action = "add";
					if(e.name==="sub"){
						action="sub";
					}
					var span = $(e).parent().children(":eq(1)");
					var price = $(e).parent().parent().parent().children(":eq(1)").text();
					var cartId = $(e).parent().parent().parent().children().children().children()[0].value;


					if(span.text()==1 && action==="sub"){
						layer.msg("不能再减了");
						return false;
					}
					$.ajax({

						url:"${path}/updateAmount",
						type:"get",
						data:{
							productId:productId,
							color:color,
							action:action,
							cartId:cartId

						},
						success:function (res) {
							queryTotal();
							count();
							if(res.success){
								var amount = span.text();


									if (action === "add") {
										span.text(++amount);
										countPrice.text('￥'+(amount*price).toFixed(2));
									} else {
										span.text(--amount);
										countPrice.text('￥'+(amount*price).toFixed(2));
									}
							}else{
								layer.msg("超库存了");
							}
						}

					})

				};


		</script>


	</head>
	<body>
		<!--------------------------------------cart--------------------->
		<%@include file="_header.jsp"%>
	<%--	<div class="head ding">
			<div class="wrapper clearfix">
				<div class="clearfix" id="top">
					<h1 class="fl"><a href="index.jsp"><img src="${path}/img/logo.png"/></a></h1>
					<div class="fr clearfix" id="top1">
						<p class="fl">
							<a href="${path}/login.jsp" id="login">登录</a>
							<a href="${path}/reg.jsp" id="reg">注册</a>
						</p>
						<form action="#" method="get" class="fl">
							<input type="text" placeholder="搜索" />
							<input type="button" />
						</form>
						<div class="btn fl clearfix">
							<a href="${path}/mygxin.jsp"><img src="${path}/img/grzx.png"/></a>
							<a href="#" class="er1"><img src="${path}/img/ewm.png"/></a>
							<a href="cart.jsp"><img src="${path}/img/gwc.png"/></a>
							<p><a href="#"><img src="${path}/img/smewm.png"/></a></p>
						</div>
					</div>
				</div>
				<ul class="clearfix" id="bott">
					<li><a href="index.jsp">首页</a></li>
					<li>
						<a href="#">所有商品</a>
						<div class="sList">
							<div class="wrapper  clearfix">
								<a href="${path}/paint.jsp">
									<dl>
										<dt><img src="${path}/img/nav1.jpg"/></dt>
										<dd>浓情欧式</dd>
									</dl>
								</a>
								<a href="${path}/paint.jsp">
									<dl>
										<dt><img src="${path}/img/nav2.jpg"/></dt>
										<dd>浪漫美式</dd>
									</dl>
								</a>
								<a href="${path}/paint.jsp">
									<dl>
										<dt><img src="${path}/img/nav3.jpg"/></dt>
										<dd>雅致中式</dd>
									</dl>
								</a>
								<a href="${path}/paint.jsp">
									<dl>
										<dt><img src="${path}/img/nav6.jpg"/></dt>
										<dd>简约现代</dd>
									</dl>
								</a>
								<a href="${path}/paint.jsp">
									<dl>
										<dt><img src="${path}/img/nav7.jpg"/></dt>
										<dd>创意装饰</dd>
									</dl>
								</a>
							</div>
						</div>
					</li>
					<li>
						<a href="${path}/flowerDer.jsp">装饰摆件</a>
						<div class="sList2">
							<div class="clearfix">
								<a href="${path}/proList.jsp">干花花艺</a>
								<a href="${path}/vase_proList.jsp">花瓶花器</a>
							</div>
						</div>
					</li>
					<li>
						<a href="${path}/decoration.jsp">布艺软饰</a>
						<div class="sList2">
							<div class="clearfix">
								<a href="zbproList.jsp">桌布罩件</a>
								<a href="${path}/bzproList.jsp">抱枕靠垫</a>
							</div>
						</div>
					</li>
					<li><a href="${path}/paint.jsp">墙式壁挂</a></li>
					<li><a href="${path}/perfume.jsp">蜡艺香薰</a></li>
					<li><a href="${path}/idea.jsp">创意家居</a></li>
				</ul>
			</div>
		</div>
		<div class="cart mt">--%>
			<!-----------------logo------------------->
			<!--<div class="logo">
				<h1 class="wrapper clearfix">
					<a href="index.html"><img class="fl" src="img/temp/logo.png"></a>
					<img class="top" src="img/temp/cartTop01.png">
				</h1>
			</div>-->
			<!-----------------site------------------->
			<div class="site">
				<p class=" wrapper clearfix">
				<%--	<span class="fl">购物车</span>--%>
					<img class="top" src="${path}/img/temp/cartTop01.png">
					<a href="index.jsp" class="fr">继续购物&gt;</a>
				</p>
			</div>
			<!-----------------table------------------->
			<div class="table wrapper">
				<div class="tr">
					<div>商品</div>
					<div>单价</div>
					<div>数量</div>
					<div>小计</div>
					<div>操作</div>
				</div>



				<c:forEach items="${requestScope.products}" var="product" >
					<div align="center" class="th">
						<div class="pro clearfix">
							<label class="fl">
								<input type="checkbox" name="cid" value="${product.cart_id}"/>
								<span></span>
							</label>
							<a class="fl" href="#">
								<dl class="clearfix">
									<dt class="fl"><img class="cart-img" src="${path}/${product.img_url}"></dt>
									<dd class="fl">
										<p>${product.product_name}</p>
										<p hidden>${product.product_id}</p>
										<p>颜色分类:</p>
										<p >${product.color}</p>

									</dd>
								</dl>
							</a>
						</div>
						<div class="price">${product.price}</div>
						<div class="number">
							<p class="num clearfix">
								<img name="sub" onclick="updateAmount(this)" class="fl sub" src="${path}/img/temp/sub.jpg">
								<span class="fl">${product.amount}</span>
								<img name="add" onclick="updateAmount(this)" class="fl add" src="${path}/img/temp/add.jpg">
							</p>
						</div>
						<div class="price sAll">￥${product.price*product.amount}</div>
						<div class="price"><a onclick="del(this)" class="del" href="javascript:void(0)">删除</a></div>
					</div>


				</c:forEach>






				<%--<div class="th">
					<div class="pro clearfix">
						<label class="fl">
							<input type="checkbox"/>
    						<span></span>
						</label>
						<a class="fl" href="#">
							<dl class="clearfix">
								<dt class="fl"><img src="${path}/img/temp/cart01.jpg"></dt>
								<dd class="fl">
									<p>创意现代简约干花花瓶摆件</p>
									<p>颜色分类:</p>
									<p>白色瓷瓶+白色串枚</p>
								</dd>
							</dl>
						</a>
					</div>
					<div class="price">￥20.00</div>
					<div class="number">
						<p class="num clearfix">
							<img class="fl sub" src="${path}/img/temp/sub.jpg">
							<span class="fl">1</span>
							<img class="fl add" src="${path}/img/temp/add.jpg">
						</p>
					</div>
					<div class="price sAll">￥20.00</div>
					<div class="price"><a class="del" href="#2">删除</a></div>
				</div>
				<div class="th">
					<div class="pro clearfix">
						<label class="fl">
							<input type="checkbox"/>
    						<span></span>
						</label>
						<a class="fl" href="#">
							<dl class="clearfix">
								<dt class="fl"><img src="${path}/img/temp/cart02.jpg"></dt>
								<dd class="fl">
									<p>创意现代简约干花花瓶摆件</p>
									<p>颜色分类:</p>
									<p>白色瓷瓶+白色串枚</p>
								</dd>
							</dl>
						</a>
					</div>
					<div class="price">￥30.00</div>
					<div class="number">
						<p class="num clearfix">
							<img class="fl sub" src="${path}/img/temp/sub.jpg">
							<span class="fl">1</span>
							<img class="fl add" src="${path}/img/temp/add.jpg">
						</p>
					</div>
					<div class="price sAll">￥30.00</div>
					<div class="price"><a class="del" href="#2">删除</a></div>
				</div>
				<div class="th">
					<div class="pro clearfix">
						<label class="fl">
							<input type="checkbox"/>
    						<span></span>
						</label>
						<a class="fl" href="#">
							<dl class="clearfix">
								<dt class="fl"><img src="${path}/img/temp/cart03.jpg"></dt>
								<dd class="fl">
									<p>创意现代简约干花花瓶摆件</p>
									<p>颜色分类:</p>
									<p>白色瓷瓶+白色串枚</p>
								</dd>
							</dl>
						</a>
					</div>
					<div class="price">￥59.99</div>
					<div class="number">
						<p class="num clearfix">
							<img class="fl sub" src="${path}/img/temp/sub.jpg">
							<span class="fl">1</span>
							<img class="fl add" src="${path}/img/temp/add.jpg">
						</p>
					</div>
					<div class="price sAll">￥59.99</div>
					<div class="price"><a class="del" href="#2">删除</a></div>
				</div>
				<div class="th">
					<div class="pro clearfix">
						<label class="fl">
							<input type="checkbox"/>
    						<span></span>
						</label>
						<a class="fl" href="#">
							<dl class="clearfix">
								<dt class="fl"><img src="${path}/img/temp/cart01.jpg"></dt>
								<dd class="fl">
									<p>创意现代简约干花花瓶摆件</p>
									<p>颜色分类:</p>
									<p>白色瓷瓶+白色串枚</p>
								</dd>
							</dl>
						</a>
					</div>
					<div class="price">￥20.00</div>
					<div class="number">
						<p class="num clearfix">
							<img class="fl sub" src="${path}/img/temp/sub.jpg">
							<span class="fl">1</span>
							<img class="fl add" src="${path}/img/temp/add.jpg">
						</p>
					</div>
					<div class="price sAll">￥20.00</div>
					<div class="price"><a class="del" href="#2">删除</a></div>
				</div>
				<div class="th">
					<div class="pro clearfix">
						<label class="fl">
							<input type="checkbox"/>
    						<span></span>
						</label>
						<a class="fl" href="#">
							<dl class="clearfix">
								<dt class="fl"><img src="${path}/img/temp/cart02.jpg"></dt>
								<dd class="fl">
									<p>创意现代简约干花花瓶摆件</p>
									<p>颜色分类:</p>
									<p>白色瓷瓶+白色串枚</p>
								</dd>
							</dl>
						</a>
					</div>
					<div class="price">￥30.00</div>
					<div class="number">
						<p class="num clearfix">
							<img class="fl sub" src="${path}/img/temp/sub.jpg">
							<span class="fl">1</span>
							<img class="fl add" src="${path}/img/temp/add.jpg">
						</p>
					</div>
					<div class="price sAll">￥30.00</div>
					<div class="price"><a class="del" href="#2">删除</a></div>
				</div>
				<div class="th">
					<div class="pro clearfix">
						<label class="fl">
							<input type="checkbox"/>
    						<span></span>
						</label>
						<a class="fl" href="#">
							<dl class="clearfix">
								<dt class="fl"><img src="${path}/img/temp/cart03.jpg"></dt>
								<dd class="fl">
									<p>创意现代简约干花花瓶摆件</p>
									<p>颜色分类:</p>
									<p>白色瓷瓶+白色串枚</p>
								</dd>
							</dl>
						</a>
					</div>
					<div class="price">￥59.99</div>
					<div class="number">
						<p class="num clearfix">
							<img class="fl sub" src="${path}/img/temp/sub.jpg">
							<span class="fl">1</span>
							<img class="fl add" src="${path}/img/temp/add.jpg">
						</p>
					</div>
					<div class="price sAll">￥59.99</div>
					<div class="price"><a class="del" href="#2">删除</a></div>
				</div>--%>

				<div class="goOn"><img src="${path}/static/images/haha.jpg">空空如也~<a href="${path}/list">去逛逛</a></div>
				<div class="tr clearfix">
					<label class="fl">
						<input id="select-all" class="checkAll" type="checkbox"/>
						<span></span>
					</label>
					<p class="fl">
						<a  href="#">全选</a>
						<a href="#" class="del">删除</a>
					</p>
					<p class="fr">
						<span>共<small id="sl">0</small>件商品</span>
						<span>合计:&nbsp;<small id="all"><fmt:formatNumber value="0.00" type="CURRENCY"/></small></span>
						<a  href="javascript:void (0)" class="count">结算</a>
					</p>
				</div>
			</div>
		</div>
		<div class="mask"></div>
		<div class="tipDel">
			<p>确定要删除该商品吗？</p>
			<p class="clearfix">
				<a class="fl cer"  href="#">确定</a>
				<a class="fr cancel" href="#">取消</a>
			</p>
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
			<a href="${path}/WEB-INF/views/mygxin.jsp">
			<dl>
				<dt><img src="${path}/img/gt3.png"/></dt>
				<dd>个人<br />中心</dd>
			</dl>
			</a>
			<a href="#" class="toptop" style="display: none;">
			<dl>
				<dt><img src="${path}/img/gt4.png"/></dt>
				<dd>返回<br />顶部</dd>
			</dl>
			</a>
			<p>400-800-8200</p>
		</div>
		<!--footer-->
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
			违法和不良信息举报电话：188-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</p>
		</div>--%>
		<%@include file="_bottom.jsp"%>
		<!----------------mask------------------->
		<div class="mask"></div>
		<!-------------------mask内容------------------->
		<div class="proDets">
			<img class="off" src="${path}/img/temp/off.jpg" />
			<div class="proCon clearfix">
				<div class="proImg fr">
					<img class="list" src="${path}/img/temp/proDet.jpg"  />
					<div class="smallImg clearfix">
						<img src="${path}/img/temp/proDet01.jpg" data-src="img/temp/proDet01_big.jpg">
						<img src="${path}/img/temp/proDet02.jpg" data-src="img/temp/proDet02_big.jpg">
						<img src="${path}/img/temp/proDet03.jpg" data-src="img/temp/proDet03_big.jpg">
						<img src="${path}/img/temp/proDet04.jpg" data-src="img/temp/proDet04_big.jpg">
					</div>
				</div>
				<div class="fl">
					<div class="proIntro change">
						<p>颜色分类</p>
						<div class="smallImg clearfix">
							<p class="fl on"><img src="${path}/img/temp/prosmall01.jpg" alt="白瓷花瓶+20支快乐花" data-src="img/temp/proBig01.jpg"></p>
							<p class="fl"><img src="${path}/img/temp/prosmall02.jpg" alt="白瓷花瓶+20支兔尾巴草" data-src="img/temp/proBig02.jpg"></p>
							<p class="fl"><img src="${path}/img/temp/prosmall03.jpg" alt="20支快乐花" data-src="img/temp/proBig03.jpg"></p>
							<p class="fl"><img src="${path}/img/temp/prosmall04.jpg" alt="20支兔尾巴草" data-src="img/temp/proBig04.jpg"></p>
						</div>
					</div>
					<div class="changeBtn clearfix">
						<a href="#2" class="fl"><p class="buy">确认</p></a>
						<a href="#2" class="fr"><p class="cart">取消</p></a>
					</div>
				</div>
			</div>
		</div>
		<div class="pleaseC">
			<p>请选择宝贝</p>
			<img class="off" src="${path}/img/temp/off.jpg" />
		</div>
		<script src="${path}/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/pro.js" type="text/javascript" charset="utf-8"></script>
		<%--<script src="${path}/js/cart.js" type="text/javascript" charset="utf-8"></script>--%>
		<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
	</body>
</html>
