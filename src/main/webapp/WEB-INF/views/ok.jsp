<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>


<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>ok</title>
		<link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/css/proList.css" />

	</head>
	<body>
		<!----------------------------------------order------------------>
	<%@include file="_header.jsp"%>
		<div class="order mt cart">
			<div class="site">
				<p class="wrapper clearfix">
					<span class="fl">支付成功</span>
					<img class="top" src="${path}/img/temp/cartTop03.png">
				</p>
			</div>
			<p class="ok">支付成功！剩余<span>5</span>秒<a href="${path}/personalOrder">返回订单页</a></p>
		</div>
		<div class="like">
			<%--<h4>猜你喜欢</h4>
			<div class="bottom">
				<div class="hd">
					<span class="prev"><img src="${path}/img/temp/prev.png"></span>
					<span class="next"><img src="${path}/img/temp/next.png"></span>
				</div>
				<div class="imgCon wrapper bd">
					<div class="likeList clearfix">
						<div>
							<a href="proDetail.jsp">
								<dl>
									<dt><img src="${path}/img/temp/like01.jpg"></dt>
									<dd>【最家】复古文艺风玻璃花瓶</dd>
									<dd>￥193.20</dd>
								</dl>
							</a>
							<a href="proDetail.jsp">
								<dl>
									<dt><img src="${path}/img/temp/like02.jpg"></dt>
									<dd>【最家】复古文艺风玻璃花瓶</dd>
									<dd>￥193.20</dd>
								</dl>
							</a>
							<a href="proDetail.jsp">
								<dl>
									<dt><img src="${path}/img/temp/like03.jpg"></dt>
									<dd>【最家】复古文艺风玻璃花瓶</dd>
									<dd>￥193.20</dd>
								</dl>
							</a>
							<a href="proDetail.jsp">
								<dl>
									<dt><img src="${path}/img/temp/like04.jpg"></dt>
									<dd>【最家】复古文艺风玻璃花瓶</dd>
									<dd>￥193.20</dd>
								</dl>
							</a>
							<a href="proDetail.jsp" class="last">
								<dl>
									<dt><img src="${path}/img/temp/like05.jpg"></dt>
									<dd>【最家】复古文艺风玻璃花瓶</dd>
									<dd>￥193.20</dd>
								</dl>
							</a>
						</div>
						<div>
							<a href="proDetail.jsp">
								<dl>
									<dt><img src="${path}/img/temp/like01.jpg"></dt>
									<dd>【最家】复古文艺风玻璃花瓶</dd>
									<dd>￥193.20</dd>
								</dl>
							</a>
							<a href="proDetail.jsp">
								<dl>
									<dt><img src="${path}/img/temp/like02.jpg"></dt>
									<dd>【最家】复古文艺风玻璃花瓶</dd>
									<dd>￥193.20</dd>
								</dl>
							</a>
							<a href="proDetail.jsp">
								<dl>
									<dt><img src="${path}/img/temp/like03.jpg"></dt>
									<dd>【最家】复古文艺风玻璃花瓶</dd>
									<dd>￥193.20</dd>
								</dl>
							</a>
							<a href="proDetail.jsp">
								<dl>
									<dt><img src="${path}/img/temp/like04.jpg"></dt>
									<dd>【最家】复古文艺风玻璃花瓶</dd>
									<dd>￥193.20</dd>
								</dl>
							</a>
							<a href="proDetail.jsp" class="last">
								<dl>
									<dt><img src="${path}/img/temp/like05.jpg"></dt>
									<dd>【最家】复古文艺风玻璃花瓶</dd>
									<dd>￥193.20</dd>
								</dl>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>--%>
		<!--footer-->
		<%@include file="_bottom.jsp"%>
		<script src="${path}/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/pro.js" type="text/javascript" charset="utf-8"></script>
		<script src="${path}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
            $(function () {
                var seconds = $(".ok span").text();
                function time(){
                    seconds--;
                    $(".ok span").text(seconds);
                    if(seconds==0){
                        window.location.href=("${path}/personalOrder");
                    }

                }
                setInterval(time,1000);
            });
			jQuery(".bottom").slide({titCell:".hd ul",mainCell:".bd .likeList",autoPage:true,autoPlay:false,effect:"leftLoop",autoPlay:true,vis:1});
		</script>
	</body>
</html>
