<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>


<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>order</title>
    <link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/css/proList.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/css/mygxin.css"/>
    <style type="text/css">
        .product-img {
            width: 80px;
            height: 80px;
        }
    </style>
    <script type="text/javascript" src="${path}/static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var payment;
            var logistics;
            $(".dis span").click(function () {
                logistics = $(this).text();
            });
            $(".way img").click(function () {
                payment = $(this).attr("alt");
            });
            $("#submit").click(function () {
                if(${param.buy==null}){
                if ($(".addre").hasClass("on")) {
                    if($(".way img").hasClass("on")){
                        if($(".dis span").hasClass("on")){
                    layer.confirm('确认付款吗?', {icon: 3, title: '提示'}, function () {

                        var url = "${path}/submit?";
                        var addressId = $(".on").children()[0].value;
                        url += "addressId=" + addressId + "&";
                        url += "payment=" + payment + "&";
                        url += "logistics=" + logistics + "&";
                        $(":hidden[name='pid']").each(function () {
                            url += "productId=" + this.value + "&"
                        });
                        $.ajax({
                            url: url,
                            type: "get",
                            success: function (res) {
                                if (res.success) {
                                    location = "${path}/ok";
                                } else {
                                    layer.msg('支付失败');
                                }
                            }
                        })
                    })
                        }else{
                            layer.msg('请选择一个快递');
                        }
                    }else{
                        layer.msg('请选择一个支付方式');
                    }
                } else {
                    layer.msg('请选择一个地址');
                }
                }else{
                    if ($(".addre").hasClass("on")) {
                        if($(".way img").hasClass("on")){
                            if($(".dis span").hasClass("on")){
                                layer.confirm('确认付款吗?', {icon: 3, title: '提示'}, function () {
                                    var url = "${path}/submit/buy?";
                                    var addressId = $(".on").children()[0].value;
                                    url += "addressId=" + addressId + "&";
                                    url += "payment=" + payment + "&";
                                    url += "logistics=" + logistics + "&";

                                    $(":hidden[name='pid']").each(function () {
                                        url += "productId=" + this.value + "&"
                                    });
                                     url+="name=" +  $(":hidden[name='pid']").next().text() +"&"
                                    url+="color=" +  $(":hidden[name='pid']").next().next().children().text()+"&"
                                    url+="amount=" +   $(":hidden[name='pid']").next().next().next().children().text()+"&"
                                    url+="price=" + $(":hidden[name='price']").val() +"&"
                                    url+="img_url=" +  $(":hidden[name='price']").next().attr("alt")+"&"
                                    console.log(url);
                                    $.ajax({
                                        url: url,
                                        type: "get",
                                        success: function (res) {
                                            if (res.success) {
                                                location = "${path}/ok";
                                            } else {
                                                layer.msg('支付失败');
                                            }
                                        }
                                    })
                                })
                            }else{
                                layer.msg('请选择一个快递');
                            }
                        }else{
                            layer.msg('请选择一个支付方式');
                        }
                    } else {
                        layer.msg('请选择一个地址');
                    }
                }
            });


        });


    </script>
</head>
<body>
<!----------------------------------------order------------------>
<%@include file="_header.jsp" %>

<div class="order cart mt">
    <!-----------------site------------------->
    <div class="site">
        <p class="wrapper clearfix">
            <span class="fl">订单确认</span>
            <img class="top" src="${path}/img/temp/cartTop02.png">
        </p>
    </div>
    <!-----------------orderCon------------------->
    <div class="orderCon wrapper clearfix">
        <div class="orderL fl">
            <!--------h3---------------->

            <h3>收件信息<a href="${path}/address" class="fr">新增地址</a></h3>

            <!--------addres---------------->
            <div class="addres clearfix">
                <c:forEach items="${requestScope.addressList}" var="address">
                    <c:if test="${address.is_default==1}">
                        <div class="addre fl on">
                            <input type="hidden" name="aid" value="${address.address_id}">
                           <%-- <div class="tit clearfix">
                                <p class="fl">${address.address_name}
                                    <span class="default">[默认地址]</span>
                                </p>
                                <p class="fr">
                                    <a href="#">删除</a>
                                    <span>|</span>
                                    <a href="#" class="edit">编辑</a>
                                </p>
                            </div>--%>
                            <div class="addCon">
                                <p>${address.detailed_address}</p>
                                <p>${address.tel_number}</p>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${address.is_default==0}">
                        <div class="addre fl">
                            <input type="hidden" name="/aid" value="${address.address_id}">
                            <div class="tit clearfix">
                                <p class="fl">${address.address_name}
                                </p>
                              <%--  <p class="fr">
                                    <a href="#" class="setDefault">设为默认</a>
                                    <span>|</span>
                                    <a href="#">删除</a>
                                    <span>|</span>
                                    <a href="#" class="edit">编辑</a>
                                </p>--%>
                            </div>
                            <div class="addCon">
                                <p>${address.detailed_address}</p>
                                <p>${address.tel_number}</p>
                            </div>
                        </div>
                    </c:if>

                </c:forEach>

            </div>
            <!--------addres end---------------->

            <h3>支付方式</h3>
            <!--------way---------------->
            <div class="way clearfix">
                <img  src="${path}/img/temp/way01.jpg" alt="支付宝支付">
                <img src="${path}/img/temp/way02.jpg" alt="微信支付">
                <img src="${path}/img/temp/way03.jpg" alt="银联支付">
                <img src="${path}/img/temp/way04.jpg" alt="货到付款">
            </div>
            <h3>选择快递</h3>
            <!--------dis---------------->
            <div class="dis clearfix">
                <span >顺风快递</span>
                <span>百世汇通</span>
                <span>圆通快递</span>
                <span>中通快递</span>
            </div>
        </div>

        <div class="orderR fr">

            <div class="msg">
                <h3>订单内容<a href="${path}/cart" class="fr">返回购物车</a></h3>
                <!--------ul---------------->
                <c:forEach items="${requestScope.productList}" var="product">
                    <ul class="clearfix">
                        <li class="fl">
                            <input type="hidden" name="price" value="${product.price}">
                            <img class="product-img" src="${path}/${product.img_url}" alt="${product.img_url}">
                        </li>
                        <li class="fl">
                            <input type="hidden" name="pid" value="${product.product_id}">
                            <p>${product.product_name}</p>
                            <p>颜色分类：<span>${product.color}</span></p>
                            <p>数量：<span>${product.amount}</span></p>
                        </li>
                        <li class="fr"><fmt:formatNumber value="${product.price}" type="CURRENCY"/></li>
                    </ul>
                </c:forEach>


                <%--	<ul class="clearfix">
                    <li class="fl">
                        <img src="${path}/img/temp/order01.jpg">
                    </li>
                    <li class="fl">
                        <p>创意现代简约干花花瓶摆件</p>
                        <p>颜色分类：烟灰色玻璃瓶</p>
                        <p>数量：1</p>
                    </li>
                    <li class="fr">￥69.90</li>
                </ul>
                    <ul class="clearfix">
                        <li class="fl">
                            <img src="${path}/img/temp/order02.jpg">
                        </li>
                        <li class="fl">
                            <p>创意现代简约干花花瓶摆件</p>
                            <p>颜色分类：烟灰色玻璃瓶</p>
                            <p>数量：1</p>
                        </li>
                        <li class="fr">￥69.90</li>
                    </ul>--%>
            </div>
            <!--------tips---------------->
            <div class="tips">
                <p><span class="fl">商品金额：</span><span class="fr"><fmt:formatNumber
                        value="${requestScope.total.total_price}" type="CURRENCY"/></span></p>
                <p><span class="fl">优惠金额：</span><span class="fr"><fmt:formatNumber
                        value="${requestScope.total.total_discounts}" type="CURRENCY"/></span></p>
                <p><span class="fl">运费：</span><span class="fr">免运费</span></p>
            </div>
            <!--------tips count---------------->
            <div class="count tips">
                <p><span class="fl">合计：<fmt:formatNumber value="${requestScope.total.total_price}"
                                                         type="CURRENCY"/></span><span class="fr"></span></p>
            </div>
            <!--<input type="button" name="" value="去支付"> -->
            <a href="javascript:void(0)" id="submit" class="pay">去支付</a>

        </div>

    </div>
</div>
<!--编辑弹框-->
<!--遮罩-->
<div class="mask"></div>
<div class="adddz editAddre">
    <form action="#" method="get">
        <input type="text" placeholder="姓名" class="on"/>
        <input type="text" placeholder="手机号"/>
        <div class="city">
            <select name="">
                <option value="省份/自治区">省份/自治区</option>
            </select>
            <select>
                <option value="城市/地区">城市/地区</option>
            </select>
            <select>
                <option value="区/县">区/县</option>
            </select>
            <select>
                <option value="配送区域">配送区域</option>
            </select>
        </div>
        <textarea name="" rows="" cols="" placeholder="详细地址"></textarea>
        <input type="text" placeholder="邮政编码"/>
        <div class="bc">
            <input type="button" value="保存"/>
            <input type="button" value="取消"/>
        </div>
    </form>
</div>
<!--返回顶部-->
<div class="gotop">
    <a href="cart.jsp">
        <dl>
            <dt><img src="${path}/img/gt1.png"/></dt>
            <dd>去购<br/>物车</dd>
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
<!--footer-->
<%@include file="_bottom.jsp" %>
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
<script src="${path}/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/user.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
</body>
</html>
