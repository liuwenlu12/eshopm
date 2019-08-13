<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>


<html>
<head lang="en">
    <title>商品列表</title>
    <link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/css/proList.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/css/fenye.css">
    <style type="text/css">
        .fenye-ul li {
            list-style: none;
            display: inline;
            padding-left: 0px;
        }
    </style>
</head>
<body>

<!------------------------------head------------------------------>
<%--<div class="head">
    <div class="wrapper clearfix">
        <div class="clearfix" id="top">

            <div class="fr clearfix" id="top1">
                <p class="fl">
                    <a href="${path}/login.jsp" id="login">登录</a>
                    <a href="${path}/register.jsp" id="reg">注册</a>
                </p>
                <form action="${path}/list" method="get" class="fl">
                    <input type="text" name="name" value="${param.name}" placeholder="搜索" />
                    <input type="submit" value=""/>
                </form>
                <div class="btn fl clearfix">
                    <a href="${path}/mygxin.jsp"><img src="${path}/img/grzx.png"/></a>
                    <a href="#" class="er1"><img src="${path}/img/ewm.png"/></a>
                    <a href="${path}/cart.jsp"><img src="${path}/img/gwc.png"/></a>
                    <p><a href="#"><img src="${path}/img/smewm.png"/></a></p>
                </div>
            </div>
        </div>--%>
<%@include file="_header.jsp" %>


<%--		<ul class="clearfix" id="bott">
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
                <a href="${path}/flowerDer.jsp">手机</a>
                <div class="sList2">
                    <div class="clearfix">
                        <a href="">三星</a>
                        <a href="">华为</a>
                        <a href="">小米</a>
                    </div>
                </div>
            </li>
            <li>
                <a href="${path}/decoration.jsp">笔记本</a>
                <div class="sList2">
                    <div class="clearfix">
                        <a href="">三星</a>
                        <a href="">华为</a>
                        <a href="">小米</a>
                    </div>
                </div>
            </li>
            <li>
                <a href="${path}/decoration.jsp">手表</a>
                <div class="sList2">
                    <div class="clearfix">
                        <a href="">三星</a>
                        <a href="">华为</a>
                        <a href="">小米</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
--%>


<!-------------------current---------------------->
<div class="current">
    <div class="wrapper clearfix">


        <c:forEach items="${requestScope.brands}" var="brand">
            <a class="name-brand "
               href="${path}/list?<c:if test="${param.typeId!=null}">typeId=${param.typeId}&</c:if>brandId=${brand.brand_id}">${brand.brand_name}</a>

        </c:forEach>


        <div class="fr choice">
            <p class="default">
                <c:if test="${param.saleDesc==null&&param.saleUp==null&&param.priceDesc==null&&param.priceUp==null}">排序方式</c:if>
                <c:if test="${param.saleDesc!=null}">销量从高到低</c:if>
                <c:if test="${param.saleUp!=null}">销量从低到高</c:if>
                <c:if test="${param.priceDesc!=null}">价格从高到低</c:if>
                <c:if test="${param.priceUp!=null}">价格从低到高</c:if>
            </p>
            <ul class="select">
                <%--<li>新品上市</li>--%>
                <a href="${path}/list?<c:if test="${param.brandId!=null}">brandId=${param.brandId}&</c:if><c:if test="${param.typeId!=null}">typeId=${param.typeId}&</c:if><c:if test="${param.name!=null}">name=${param.name}&</c:if>saleDesc=1">
                    <li>销量从高到低</li>
                </a>
                <a href="${path}/list?<c:if test="${param.brandId!=null}">brandId=${param.brandId}&</c:if><c:if test="${param.typeId!=null}">typeId=${param.typeId}&</c:if><c:if test="${param.name!=null}">name=${param.name}&</c:if>saleUp=1">
                    <li>销量从低到高</li>
                </a>
                <a href="${path}/list?<c:if test="${param.brandId!=null}">brandId=${param.brandId}&</c:if><c:if test="${param.typeId!=null}">typeId=${param.typeId}&</c:if><c:if test="${param.name!=null}">name=${param.name}&</c:if>priceDesc=1">
                    <li>价格从高到低</li>
                </a>
                <a href="${path}/list?<c:if test="${param.brandId!=null}">brandId=${param.brandId}&</c:if><c:if test="${param.typeId!=null}">typeId=${param.typeId}&</c:if><c:if test="${param.name!=null}">name=${param.name}&</c:if>priceUp=1">
                    <li>价格从低到高</li>
                </a>
            </ul>
        </div>
    </div>
</div>
<!----------------proList------------------------->
<ul class="proList wrapper clearfix">
    <c:forEach items="${requestScope.products}" var="product">


        <li>
            <a href="${path}/detail?productId=${product.product_id}">
                <dl>
                    <dt><img src="${path}/${product.img_url}"></dt>

                    <a href="${path}/detail?productId=${product.product_id}"
                       title="${product.product_name}">${product.product_name}</a>
                    <dd><fmt:formatNumber value="${product.price}" type="CURRENCY"/></dd>

                    <dd>销量：${product.sales_volume}</dd>
                </dl>
            </a>
        </li>

    </c:forEach>


</ul>
<!----------------mask------------------->
<div class="mask"></div>
<!-------------------mask内容------------------->
<div class="proDets">
    <img class="off" src="${path}/img/temp/off.jpg"/>
    <div class="tit clearfix">
        <h4 class="fl">【最家】非洲菊仿真花干花</h4>
        <span class="fr">￥17.90</span>
    </div>
    <div class="proCon clearfix">
        <div class="proImg fl">
            <img class="list" src="${path}/img/temp/proDet.jpg"/>
            <div class="smallImg clearfix">
                <img src="${path}/img/temp/proDet01.jpg" data-src="${path}/img/temp/proDet01_big.jpg">
                <img src="${path}/img/temp/proDet02.jpg" data-src="${path}/img/temp/proDet02_big.jpg">
                <img src="${path}/img/temp/proDet03.jpg" data-src="${path}/img/temp/proDet03_big.jpg">
                <img src="${path}/img/temp/proDet04.jpg" data-src="${path}/img/temp/proDet04_big.jpg">
            </div>
        </div>
        <div class="fr">
            <div class="proIntro">
                <p>颜色分类</p>
                <div class="smallImg clearfix categ">
                    <p class="fl"><img src="${path}/img/temp/prosmall01.jpg" alt="白瓷花瓶+20支快乐花"
                                       data-src="${path}/img/temp/proBig01.jpg"></p>
                    <p class="fl"><img src="${path}/img/temp/prosmall02.jpg" alt="白瓷花瓶+20支兔尾巴草"
                                       data-src="${path}/img/temp/proBig02.jpg"></p>
                    <p class="fl"><img src="${path}/img/temp/prosmall03.jpg" alt="20支快乐花"
                                       data-src="${path}/img/temp/proBig03.jpg"></p>
                    <p class="fl"><img src="${path}/img/temp/prosmall04.jpg" alt="20支兔尾巴草"
                                       data-src="${path}/img/temp/proBig04.jpg"></p>
                </div>
                <p>数量&nbsp;&nbsp;库存<span>2096</span>件</p>
                <div class="num clearfix">
                    <img class="fl sub" src="${path}/img/temp/sub.jpg">
                    <span class="fl" contentEditable="true">1</span>
                    <img class="fl add" src="${path}/img/temp/add.jpg">
                    <p class="please fl">请选择商品属性!</p>
                </div>
            </div>
            <div class="btns clearfix">
                <a href="#2"><p class="buy fl">立即购买</p></a>
                <a href="#2"><p class="cart fr">加入购物车</p></a>
            </div>
        </div>
    </div>
    <a class="more" href="${path}/WEB-INF/views/proDetail.jsp">查看更多细节</a>
</div>
<!--返回顶部-->
<div class="gotop">
    <a href="${path}/WEB-INF/views/cart.jsp">
        <dl class="goCart">
            <dt><img src="${path}/img/gt1.png"/></dt>
            <dd>去购<br/>物车</dd>
            <span>1</span>
        </dl>
    </a>
    <a href="#" class="dh">
        <dl>
            <dt><img src="${path}/img/gt2.png"/></dt>
            <dd>联系<br/>客服</dd>
        </dl>
    </a>
    <a href="${path}/WEB-INF/views/mygxin.jsp">
        <dl>
            <dt><img src="${path}/img/gt3.png"/></dt>
            <dd>个人<br/>中心</dd>
        </dl>
    </a>
    <a href="#" class="toptop" style="display: none;">
        <dl>
            <dt><img src="${path}/img/gt4.png"/></dt>
            <dd>返回<br/>顶部</dd>
        </dl>
    </a>
    <p>400-800-8200</p>
</div>
<div class="msk"></div>

<div class="container large">
    <div class="pagination">
        <ul class="fenye-ul">
            <c:forEach begin="1" end="${requestScope.pages}" varStatus="status">
                <li class="<c:if test="${requestScope.pageNum==status.count}">active</c:if> "><a
                        href="${path}/list?<c:if test="${param.saleDesc!=null}">saleDesc=${param.saleDesc}&</c:if><c:if test="${param.saleUp!=null}">saleUp=${param.saleUp}&</c:if><c:if test="${param.priceDesc!=null}">priceDesc=${param.priceDesc}&</c:if><c:if test="${param.priceUp!=null}">priceUp=${param.priceUp}&</c:if><c:if test="${param.brandId!=null}">brandId=${param.brandId}&</c:if><c:if test="${param.typeId!=null}">typeId=${param.typeId}&</c:if><c:if test="${param.name!=null}">name=${param.name}&</c:if>page=${status.count}">${status.count}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
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
<%@include file="_bottom.jsp" %>

<script src="${path}/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/cart.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
<script src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
</body>
</html>
