<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>


<html>
<head>
    <meta charset="UTF-8">
    <title>详情页</title>
    <link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/css/proList.css"/>
    <style type="text/css">
        .img-detail-appraise {
            width: 60px;
            height: 60px;
        }
    </style>

    <script type="text/javascript" src="${path}/static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var color;
            var inventory;
            $(".img-color").click(function () {
                color = $(this)[0].title;

                var data = {
                    color: color,
                    productId: "${requestScope.detail.product_id}"
                };
                $.ajax({
                    url: "${path}/inventory",
                    type: "get",
                    data: data,
                    success: function (res) {
                        inventory=   res.inventory.inventory;
                        $(".inventory").text("库存:" + res.inventory.inventory);
                    }

                });
            });

            /*	var amount = $("#add-cart-amount").text();
                $("#add-cart-amount").parent().children(":first").click(function () {
                    $("#add-cart-amount").text(--amount);
                })
                $("#add-cart-amount").parent().children(":eq(2)").click(function () {
                    $("#add-cart-amount").text(++amount);
                })*/

            $(".to-buy").click(function () {
                var productId = "${param.productId}";
                var amount = $("#add-cart-amount").text();
                if (color != null) {
                    if(amount<=inventory){
                    var url = "${path}/buy?";
                    url+= "productId="+productId+"&"
                    url+= "amount="+amount+"&"
                    url+= "color="+color+"&"
                        url+= "buy="+1+"&"
                    location = url;
                    }else {
                        layer.msg('超库存了');
                    }
                } else {
                    return false;
                }
            });



            $(".add-cart").click(function () {
                var productId = "${param.productId}";
                var amount = $("#add-cart-amount").text();
                if (color != null) {
                    $.ajax({

                        url: "${path}/add2cart",
                        type: "get",
                        data: {
                            productId: productId,
                            amount: amount,
                            color: color
                        },
                        success: function (res) {

                                    if (res.success) {
                                        /* layer.msg('添加成功', {icon: 6});*/
                                        layer.msg('添加成功', {
                                            icon: 1,
                                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                        }, function () {
                                            location = "${path}/cart";
                                        });
                                    }else if(!res.error){
                                        layer.msg('超库存啦,购物车有很多了,快去看看');
                                    }else{
                                        layer.msg('添加失败');
                                    }
                        }
                    })
                } else {
                    return false;
                }
            });
        });


    </script>


</head>
<body>
<!------------------------------head------------------------------>
<%@include file="_header.jsp" %>
<%--	<div class="head">
        <div class="wrapper clearfix">
            <div class="clearfix" id="top">
                <h1 class="fl"><a href="index.jsp"><img src="${path}/img/logo.png"/></a></h1>
                <div class="fr clearfix" id="top1">
                    <p class="fl">
                        <a href="#" id="login">登录</a>
                        <a href="#" id="reg">注册</a>
                    </p>
                    <form action="#" method="get" class="fl">
                        <input type="text" placeholder="搜索" />
                        <input type="button" />
                    </form>
                    <div class="btn fl clearfix">
                        <a href="${path}/mygxin.jsp"><img src="${path}/img/grzx.png"/></a>
                        <a href="#" class="er1"><img src="${path}/img/ewm.png"/></a>
                        <a href="${path}/cart.jsp"><img src="${path}/img/gwc.png"/></a>
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
    </div>--%>
<!-----------------address------------------------------->
<div class="address">
    <div class="wrapper clearfix">
        <a href="${path}/index">首页</a>
        <span>/</span>
        <a href="${path}/list?typeId=${requestScope.detail.type.type_id}">${requestScope.detail.type.type_name}</a>
        <span>/</span>
        <a href="${path}/list?brandId=${requestScope.detail.brand.brand_id}">${requestScope.detail.brand.brand_name}</a>
        <span>/</span>
        <a href="${path}/list?productId=${requestScope.detail.product_id}"
           class="on">${requestScope.detail.product_name}</a>
    </div>
</div>
<!-----------------------Detail------------------------------>
<div class="detCon">
    <div class="proDet wrapper">
        <div class="proCon clearfix">
            <div class="proImg fl">
                <img class="det" src="${path}/${requestScope.detail.img_url}"/>
                <%--	<div class="smallImg clearfix">
                        <img src="${path}/img/temp/proDet02.jpg" data-src="img/temp/proDet02_big.jpg">
                        <img src="${path}/img/temp/proDet03.jpg" data-src="img/temp/proDet03_big.jpg">
                        <img src="${path}/img/temp/proDet04.jpg" data-src="img/temp/proDet04_big.jpg">
                    </div>--%>
            </div>
            <div class="fr intro">
                <div class="title">
                    <h4>${requestScope.detail.product_name}</h4>
                    <p style="letter-spacing: 2px">${requestScope.detail.describe}</p>

                    <span><fmt:formatNumber value="${requestScope.detail.price}" type="CURRENCY"/></span>
                    <span style="color: #6c757d; font-size: larger;  text-decoration:line-through"><fmt:formatNumber
                            value="${requestScope.detail.old_price}" type="CURRENCY"/> </span>
                </div>
                <div class="proIntro">
                    <p>颜色分类</p>
                    <div class="color smallImg clearfix categ">
                        <c:forEach items="${requestScope.detail.property}" var="property">
                            <p class="fl"><img class="img-color" src="${path}/${property.img_url}"
                                               alt="${property.color}" data-src="${path}/${property.img_url}"
                                               title="${property.color}"></p>

                        </c:forEach>
                        <%--<p class="fl"><img src="${path}/img/temp/prosmall01.jpg" alt="白瓷花瓶+20支快乐花" data-src="img/temp/proBig01.jpg"></p>
                        <p class="fl"><img src="${path}/img/temp/prosmall02.jpg" alt="白瓷花瓶+20支兔尾巴草" data-src="img/temp/proBig02.jpg"></p>
                        <p class="fl"><img src="${path}/img/temp/prosmall03.jpg" alt="20支快乐花" data-src="img/temp/proBig03.jpg"></p>
                        <p class="fl"><img src="${path}/img/temp/prosmall04.jpg" alt="20支兔尾巴草" data-src="img/temp/proBig04.jpg"></p>--%>
                    </div>
                    <p class="inventory">库存:请选择规格</p>
                    <div class="num clearfix">
                        <img class="fl sub" src="${path}/img/temp/sub.jpg">
                        <span class="fl" id="add-cart-amount" contentEditable="true">1</span>
                        <img class="fl add" src="${path}/img/temp/add.jpg">
                        <p class="please fl">请选择商品属性!</p>
                    </div>
                </div>
                <div class="btns clearfix">

                    <a class="to-buy"><p class="buy fl">立即购买</p></a>

                    <a class="add-cart"><p class="cart fr">加入购物车</p></a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="introMsg wrapper clearfix">
    <div class="msgL fl">
        <div class="msgTit clearfix">
            <a class="on">商品详情</a>
            <a>所有评价</a>
        </div>
        <div class="msgAll">
            <div align="center" class="msgImgs">
                <c:forEach items="${requestScope.detail.picture}" var="picture">
                    <img src="${path}/${picture.img_url}">

                </c:forEach>

                <%--	<img src="${path}/img/temp/det01.jpg">
                    <img src="${path}/img/temp/det02.jpg">
                    <img src="${path}/img/temp/det03.jpg">
                    <img src="${path}/img/temp/det04.jpg">
                    <img src="${path}/img/temp/det05.jpg">
                    <img src="${path}/img/temp/det06.jpg">
                    <img src="${path}/img/temp/det07.jpg">--%>
            </div>
            <div class="eva">

                <c:forEach items="${requestScope.appraiseList}" var="appraise">


                    <div class="per clearfix">


                        <div class="perR fl">
                            <p>用户名:${appraise.username}</p>
                            <p>评价内容:${appraise.content}</p>
                            <div class="clearfix">
                                <p><img class="img-detail-appraise" src="${path}/${appraise.img_url}"></p>

                            </div>
                            <p><span>${appraise.add_time}</span><span>颜色分类：${appraise.color}</span></p>
                        </div>
                    </div>


                </c:forEach>


                <%-- <div class="per clearfix">
                       <img class="fl" src="${path}/img/temp/per02.jpg">
                       <div class="perR fl">
                           <p>么***周</p>
                           <p>花瓶超级棒，我看图以为是光面的，收货发现是磨砂，但感觉也超有质感，很喜欢。磨砂上面还有点纹路，不过觉得挺自然的，不影响美观。包装也很好，绝对不会磕碎碰坏，好评！</p>
                           <p><span>2016年12月27日08:31</span><span>颜色分类：大中小三件套（不含花）</span></p>
                       </div>
                   </div>--%>
                <%--
               <div class="per clearfix">
                   <img class="fl" src="${path}/img/temp/per01.jpg">
                   <div class="perR fl">
                       <p>馨***呀</p>
                       <p>不好意思评价晚了，产品很好，价格比玻璃品便宜，没有我担心的杂色，发货快，包装好，全5分</p>
                       <div class="clearfix">
                           <p><img src="${path}/img/temp/eva01.jpg"></p>
                           <p><img src="${path}/img/temp/eva02.jpg"></p>
                           <p><img src="${path}/img/temp/eva03.jpg"></p>
                           <p><img src="${path}/img/temp/eva04.jpg"></p>
                           <p><img src="${path}/img/temp/eva05.jpg"></p>
                       </div>
                       <p><span>2016年12月27日08:31</span><span>颜色分类：大中小三件套（不含花）</span></p>
                   </div>
               </div>
               <div class="per clearfix">
                   <img class="fl" src="${path}/img/temp/per02.jpg">
                   <div class="perR fl">
                       <p>么***周</p>
                       <p>花瓶超级棒，我看图以为是光面的，收货发现是磨砂，但感觉也超有质感，很喜欢。磨砂上面还有点纹路，不过觉得挺自然的，不影响美观。包装也很好，绝对不会磕碎碰坏，好评！</p>
                       <p><span>2016年12月27日08:31</span><span>颜色分类：大中小三件套（不含花）</span></p>
                   </div>
               </div>
               <div class="per clearfix">
                   <img class="fl" src="${path}/img/temp/per01.jpg">
                   <div class="perR fl">
                       <p>馨***呀</p>
                       <p>不好意思评价晚了，产品很好，价格比玻璃品便宜，没有我担心的杂色，发货快，包装好，全5分</p>
                       <div class="clearfix">
                           <p><img src="${path}/img/temp/eva01.jpg"></p>
                           <p><img src="${path}/img/temp/eva02.jpg"></p>
                           <p><img src="${path}/img/temp/eva03.jpg"></p>
                           <p><img src="${path}/img/temp/eva04.jpg"></p>
                           <p><img src="${path}/img/temp/eva05.jpg"></p>
                       </div>
                       <p><span>2016年12月27日08:31</span><span>颜色分类：大中小三件套（不含花）</span></p>
                   </div>
               </div>
               <div class="per clearfix">
                   <img class="fl" src="${path}/img/temp/per02.jpg">
                   <div class="perR fl">
                       <p>么***周</p>
                       <p>花瓶超级棒，我看图以为是光面的，收货发现是磨砂，但感觉也超有质感，很喜欢。磨砂上面还有点纹路，不过觉得挺自然的，不影响美观。包装也很好，绝对不会磕碎碰坏，好评！</p>
                       <p><span>2016年12月27日08:31</span><span>颜色分类：大中小三件套（不含花）</span></p>
                   </div>
               </div>
               <div class="per clearfix">
                   <img class="fl" src="${path}/img/temp/per01.jpg">
                   <div class="perR fl">
                       <p>馨***呀</p>
                       <p>不好意思评价晚了，产品很好，价格比玻璃品便宜，没有我担心的杂色，发货快，包装好，全5分</p>
                       <div class="clearfix">
                           <p><img src="${path}/img/temp/eva01.jpg"></p>
                           <p><img src="${path}/img/temp/eva02.jpg"></p>
                           <p><img src="${path}/img/temp/eva03.jpg"></p>
                           <p><img src="${path}/img/temp/eva04.jpg"></p>
                           <p><img src="${path}/img/temp/eva05.jpg"></p>
                       </div>
                       <p><span>2016年12月27日08:31</span><span>颜色分类：大中小三件套（不含花）</span></p>
                   </div>
               </div>
               <div class="per clearfix">
                   <img class="fl" src="${path}/img/temp/per02.jpg">
                   <div class="perR fl">
                       <p>么***周</p>
                       <p>花瓶超级棒，我看图以为是光面的，收货发现是磨砂，但感觉也超有质感，很喜欢。磨砂上面还有点纹路，不过觉得挺自然的，不影响美观。包装也很好，绝对不会磕碎碰坏，好评！</p>
                       <p><span>2016年12月27日08:31</span><span>颜色分类：大中小三件套（不含花）</span></p>
                   </div>
               </div>
               <div class="per clearfix">
                   <img class="fl" src="${path}/img/temp/per01.jpg">
                   <div class="perR fl">
                       <p>馨***呀</p>
                       <p>不好意思评价晚了，产品很好，价格比玻璃品便宜，没有我担心的杂色，发货快，包装好，全5分</p>
                       <div class="clearfix">
                           <p><img src="${path}/img/temp/eva01.jpg"></p>
                           <p><img src="${path}/img/temp/eva02.jpg"></p>
                           <p><img src="${path}/img/temp/eva03.jpg"></p>
                           <p><img src="${path}/img/temp/eva04.jpg"></p>
                           <p><img src="${path}/img/temp/eva05.jpg"></p>
                       </div>
                       <p><span>2016年12月27日08:31</span><span>颜色分类：大中小三件套（不含花）</span></p>
                   </div>
               </div>
               <div class="per clearfix">
                   <img class="fl" src="${path}/img/temp/per02.jpg">
                   <div class="perR fl">
                       <p>么***周</p>
                       <p>花瓶超级棒，我看图以为是光面的，收货发现是磨砂，但感觉也超有质感，很喜欢。磨砂上面还有点纹路，不过觉得挺自然的，不影响美观。包装也很好，绝对不会磕碎碰坏，好评！</p>
                       <p><span>2016年12月27日08:31</span><span>颜色分类：大中小三件套（不含花）</span></p>
                   </div>
               </div>--%>
            </div>
        </div>
    </div>
    <%--	<div class="msgR fr">
            <h4>为你推荐</h4>
            <div class="seeList">
                <a href="#">
                    <dl>
                        <dt><img src="${path}/img/temp/see01.jpg"></dt>
                        <dd>【最家】复古文艺风玻璃花瓶</dd>
                        <dd>￥193.20</dd>
                    </dl>
                </a>
                <a href="#">
                    <dl>
                        <dt><img src="${path}/img/temp/see02.jpg"></dt>
                        <dd>【最家】复古文艺风玻璃花瓶</dd>
                        <dd>￥193.20</dd>
                    </dl>
                </a>
                <a href="#">
                    <dl>
                        <dt><img src="${path}/img/temp/see03.jpg"></dt>
                        <dd>【最家】复古文艺风玻璃花瓶</dd>
                        <dd>￥193.20</dd>
                    </dl>
                </a>
                <a href="#">
                    <dl>
                        <dt><img src="${path}/img/temp/see04.jpg"></dt>
                        <dd>【最家】复古文艺风玻璃花瓶</dd>
                        <dd>￥193.20</dd>
                    </dl>
                </a>
            </div>

        </div>--%>
</div>
<div class="like">
    <h4>猜你喜欢</h4>
    <div class="bottom">
        <div class="hd">
            <span class="prev"><img src="${path}/img/temp/prev.png"></span>
            <span class="next"><img src="${path}/img/temp/next.png"></span>
        </div>
        <div class="imgCon bd">
            <div class="likeList clearfix">
                <div>
                    <c:forEach items="${requestScope.productLick}" var="product">

                        <a href="${path}/detail?productId=${product.product_id}">
                            <dl>
                                <dt><img src="${path}/${product.img_url}"></dt>
                                <dd>${product.product_name}</dd>
                                <dd><fmt:formatNumber value="${product.price}" type="CURRENCY"/></dd>
                            </dl>
                        </a>
                    </c:forEach>


                    <%--<a href="proDetail.jsp">
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
                    </a>--%>
                </div>
            </div>
        </div>
    </div>
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
<script src="${path}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/cart.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    jQuery(".bottom").slide({
        titCell: ".hd ul",
        mainCell: ".bd .likeList",
        autoPage: true,
        autoPlay: false,
        effect: "leftLoop",
        autoPlay: true,
        vis: 1
    });
</script>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
</body>
</html>
