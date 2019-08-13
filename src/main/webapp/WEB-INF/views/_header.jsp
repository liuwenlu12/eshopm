
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
    <link rel="shortcut icon" href="${path}/images/favicon.ico">
<!-- 收藏夹图标 -->
<link rel="shortcut icon" href="${path}/images/favicon.ico">

<!-- 先引入重置的CSS样式文件 -->
<link rel="stylesheet" href="${path}/css/reset.css">

<!-- 引入字体图标的css文件 -->
<link rel="stylesheet" href="${path}/css/iconfont.css">

<!-- 引入当前页面的CSS文件 -->
<link rel="stylesheet" href="${path}/css/index.css">


<!-- 顶部导航 start -->
<div class="header_bar">
    <div class="header con_width">
        <!-- 左侧菜单 -->
        <div class="header_nav">
            <ul>
                <li><a href="${path}/index">原点商城</a></li>
                <li><a href="#">MIUI</a></li>
                <li><a href="#">IoT</a></li>
                <li><a href="#">云服务</a></li>
                <li><a href="#">金融</a></li>
                <li><a href="#">有品</a></li>
                <li><a href="#">小爱开放平台</a></li>
                <li><a href="#">政企服务</a></li>
                <li><a href="#">Select Region</a></li>
            </ul>
        </div>
        <!-- 右侧购物车 -->
        <div class="header_shopcart">
            <div class="shopcart_logo">
                <a href="${path}/cart?">
                    <i class="iconfont icon-cart"></i>
                    购物车（0）
                </a>
                <div class="shopcart-info">
                    <p>

                        购物车中还没有商品，赶紧选购吧!
                    </p>
                </div>
            </div>
        </div>
        <!--右侧登录、注册-->
        <div class="user-auction">



            <ul>
                <c:if test="${sessionScope.user==null}" >
                    <li><a href="${path}/login">登录</a></li>
                    <li><a href="${path}/register">注册</a></li>
                </c:if>
                <c:if test="${sessionScope.user!=null}" >
                    <li>欢迎：${sessionScope.user.username}</li>

                    <li><a href="${path}/personalCenter">个人中心</a></li>


                    <li><a href="#">消息通知</a></li>
                    <li><a href="${path}/logout">退出</a></li>
                </c:if>

            </ul>
        </div>
    </div>
</div>
<!-- 顶部导航 end -->
<!-- 主体导航 start -->
<div class="main_nav con_width">
    <div class="logo">
        <img class="logo-img" src="${path}/static/images/yuandian3.jpg" alt="logo" title="原点官网">
    </div>
    <div class="nav">
        <ul>
           <%-- <li><a href="#">小米手机</a>
                <div class="nav_item">
                    <div class="nav_item_con con_width">
                        <ul>
                            <li>
                                <label>新品</label>
                                <a href="#" class="nav_item_con_img">
                                    <img src="${path}/images/mix2320-220.png" />
                                </a>
                                <a href="#" class="nav_item_con_name">小米8</a>
                                <p>2699元起</p>
                            </li>
                            <li>
                                <label>新品</label>
                                <a href="#" class="nav_item_con_img">
                                    <img src="${path}/images/mix2320-220.png" />
                                </a>
                                <a href="#" class="nav_item_con_name">小米8</a>
                                <p>2699元起</p>
                            </li>
                            <li>
                                <label>新品</label>
                                <a href="#" class="nav_item_con_img">
                                    <img src="${path}/images/mix2320-220.png" />
                                </a>
                                <a href="#" class="nav_item_con_name">小米8</a>
                                <p>2699元起</p>
                            </li>
                            <li>
                                <label>新品</label>
                                <a href="#" class="nav_item_con_img">
                                    <img src="${path}/images/mix2320-220.png" />
                                </a>
                                <a href="#" class="nav_item_con_name">小米8</a>
                                <p>2699元起</p>
                            </li>
                            <li>
                                <label>新品</label>
                                <a href="#" class="nav_item_con_img">
                                    <img src="${path}/images/mix2320-220.png" />
                                </a>
                                <a href="#" class="nav_item_con_name">小米8</a>
                                <p>2699元起</p>
                            </li>
                            <li>
                                <label>新品</label>
                                <a href="#" class="nav_item_con_img">
                                    <img src="${path}/images/mix2320-220.png" />
                                </a>
                                <a href="#" class="nav_item_con_name">小米8</a>
                                <p>2699元起</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>--%>
            <c:forEach items="${requestScope.nav}" var="nav">
                <li ><a href="${path}/list?typeId=${nav.type_id}">${nav.type_name}</a>

                    <div class="nav_item">
                        <div class="nav_item_con con_width">
                            <ul>
                    <c:forEach items="${nav.products}" var="product">

                        <li>

                            <a href="${path}/detail?productId=${product.product_id}" >
                                <img src="${path}/${product.img_url}" />
                            </a>
                            <a href="${path}/detail?productId=${product.product_id}" class="nav_item_con_name">${product.product_name}</a>
                            <p>${product.price}元</p>
                        </li>


                    </c:forEach>
                            </ul>
                       </div>
                    </div>


                </li>
            </c:forEach>
            <li><a href="${path}/list">全部商品</a></li>



         <%--  <li><a href="#">笔记本</a>
                <div class="nav_item">
                    <div class="nav_item_con con_width">
                        <ul>
                            <li>
                                <label>新品</label>
                                <a href="#" class="nav_item_con_img">
                                    <img src="${path}/images/bijiben320.jpg" />
                                </a>
                                <a href="#" class="nav_item_con_name">小米8</a>
                                <p>2699元起</p>
                            </li>
                            <li>
                                <label>新品</label>
                                <a href="#" class="nav_item_con_img">
                                    <img src="${path}/images/bijiben320.jpg" />
                                </a>
                                <a href="#" class="nav_item_con_name">小米8</a>
                                <p>2699元起</p>
                            </li>
                            <li>
                                <label>新品</label>
                                <a href="#" class="nav_item_con_img">
                                    <img src="${path}/images/bijiben320.jpg" />
                                </a>
                                <a href="#" class="nav_item_con_name">小米8</a>
                                <p>2699元起</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>--%>
          <%--  <li><a href="#">盒子</a></li>--%>
           <%-- <li><a href="${path}/list?saleDesc=1">热门排行</a></li>
            <li><a href="${path}/list?priceLow=1">低价排行</a></li>--%>
           <%-- <li><a href="#">社区</a></li>--%>
        </ul>
    </div>
    <!-- 搜索部分 start -->
    <div class="search_box">
        <form action="${path}/list" method="get">
            <input type="search" name="name" value="${param.name}"  class="search"  />

            <button>
                <i class="iconfont icon-sousuo"></i>
            </button>
            <!-- 默认搜索内容 -->
            <div class="search_default">
                <ul>
                    <li><a href="${path}/detail?productId=4002">S10</a></li>
                    <li><a href="${path}/detail?productId=4012">P30PRO</a></li>
                </ul>
            </div>
            <!-- 下拉列表内容 -->
           <%-- <div class="datalist">
                <ul>
                    <li><a href="#">小米6X<span>约有6件</span></a></li>
                    <li><a href="#">小米MIX 2S<span>约有5件</span></a></li>
                    <li><a href="#">黑鲨游戏手机<span>约有3件</span></a></li>
                    <li><a href="#">红米Note 5<span>约有6件</span></a></li>
                    <li><a href="#">红米5A<span>约有13件</span></a></li>
                    <li><a href="#">小米电话4C<span>约有5件</span></a></li>
                    <li><a href="#">电视32英寸<span>约有3件</span></a></li>
                </ul>
            </div>--%>
        </form>
    </div>
    <!-- 搜索部分 end -->

</div>