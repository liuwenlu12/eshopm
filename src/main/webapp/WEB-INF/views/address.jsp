<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>


<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>最家</title>
    <link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/css/mygxin.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        var addressId;

        function doChange(e) {
            addressId = $(e).parent().prev()[0].value;
            $(".mask").show();
            $(".readd").show();
            a();
        }


        function doAdd(e) {
            var province = $("select[name='addProvince']").val()
            var city = $("select[name='addCity']").val();
            var detailAddress = $("textarea[name = 'add-detailAddress']")[0].value;
            var name = $("input[name='add-name']").val();
            var telNumber = $("input[name='add-tel']").val();
            var address = province + city + detailAddress;
            console.log(name);
            console.log(telNumber);
            var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
            if (name != null & name != '') {
                if (telNumber != null & telNumber != '') {
                    if (province != null & province != 0) {
                        if (city != null & city != 0) {
                            if (detailAddress != null) {
                                if (reg.test(telNumber)) {
                                    $.ajax({
                                        url: "${path}/addAddress",
                                        type: "get",
                                        data: {
                                            address: address,
                                            name: name,
                                            telNumber: telNumber
                                        },
                                        success: function (res) {
                                            if (res.success) {
                                                layer.msg('添加成功', {
                                                    icon: 1,
                                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                                }, function () {
                                                    location = "${path}/address";
                                                });
                                            } else {
                                                layer.msg('添加失败', {icon: 5});
                                            }
                                        }
                                    });

                                } else {
                                    layer.msg('输入电话号码有误', {icon: 5});
                                }
                            } else {
                                layer.msg('请填写详细地址');
                            }
                        } else {
                            layer.msg('请选择所在市');
                        }
                    } else {
                        layer.msg('请选择省份');
                    }
                } else {
                    layer.msg('请填写电话号码');
                }
            } else {
                layer.msg('请填写收货人');
            }
        }


        function doUpdate(e) {
            var province = $("select[name='province']").val()
            var city = $("select[name='city']").val();
            var detailAddress = $("textarea[name = 'update-detail-address']")[0].value;
            var name = $("input[name='update-name']").val();
            var telNumber = $("input[name='update-tel']").val();
            var address = province + city + detailAddress;
            var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
            if (name != null & name != '') {
                if (telNumber != null & telNumber != '') {
                    if (province != null) {
                        if (city != null) {
                            if (detailAddress) {
                                if (reg.test(telNumber)) {
                                    $.ajax({
                                        url: "${path}/updateAddress",
                                        type: "get",
                                        data: {
                                            address: address,
                                            addressId: addressId,
                                            name: name,
                                            telNumber: telNumber
                                        },
                                        success: function (res) {
                                            if (res.success) {
                                                layer.msg('修改成功', {
                                                    icon: 1,
                                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                                }, function () {
                                                    location = "${path}/address";
                                                });
                                            } else {

                                                layer.msg('修改失败');
                                            }
                                        }
                                    });
                                } else {
                                    layer.msg('输入电话号码有误', {icon: 5});
                                }
                            } else {
                                layer.msg('请填写详细地址');
                            }
                        } else {
                            layer.msg('请选择所在市');
                        }
                    } else {
                        layer.msg('请选择省份');
                    }
                } else {
                    layer.msg('请填写电话号码');
                }
            } else {
                layer.msg('请填写收货人');
            }
        };

        function doDelete(e) {
            layer.confirm('确定删除吗?', {icon: 3, title: '提示'}, function () {
                var addressId = $(e).parent().prev()[0].value;

                $.ajax({
                    url: "${path}/deleteAddress",
                    type: "get",
                    data: {
                        addressId: addressId
                    },
                    success: function (res) {
                        if (res.success) {
                            layer.msg('删除成功', {
                                icon: 1,
                                time: 1000 //2秒关闭（如果不配置，默认是3秒）
                            }, function () {
                                $(e).parents(".dizhi").remove();
                            });

                        } else {
                            layer.msg('删除失败');
                        }
                    }
                });
            });
        };


        /*	$(function () {

                $("#deladd").click(function () {
                    alert("heh");
                    return false;
                })
            })*/
        function a() {
            $(".bc>input").click(function () {
                if ($(this).val() == "保存") {
                    $(".mask").hide();
                    $(".readd").hide();
                } else {
                    $(".mask").hide();
                    $(".readd").hide();
                }
            });
            /*$(".addp").remove();*/
        }

        cities = new Object();
        cities['河北省'] = new Array('石家庄', '张家口市', '承德市', '秦皇岛市', '唐山市', '廊坊市', '保定市', '沧州市', '衡水市', '邢台市', '邯郸市');
        cities['山西省'] = new Array('太原市', '大同市', '朔州市', '阳泉市', '长治市', '晋城市', '忻州地区', '吕梁地区', '晋中市', '临汾地区', '运城地区');

        function set_city(province, city) {
            var pv, cv;
            var i, ii;

            pv = province.value;
            cv = city.value;

            city.length = 1;

            if (pv == '0') return;
            if (typeof (cities[pv]) == 'undefined') return;

            for (i = 0; i < cities[pv].length; i++) {
                ii = i + 1;
                city.options[ii] = new Option();
                city.options[ii].text = cities[pv][i];
                city.options[ii].value = cities[pv][i];
            }

        }

        function set_city_add(addProvince, addCity) {
            var pv, cv;
            var i, ii;

            pv = addProvince.value;
            cv = addCity.value;

            addCity.length = 1;

            if (pv == '0') return;
            if (typeof (cities[pv]) == 'undefined') return;

            for (i = 0; i < cities[pv].length; i++) {
                ii = i + 1;
                addCity.options[ii] = new Option();
                addCity.options[ii].text = cities[pv][i];
                addCity.options[ii].value = cities[pv][i];
            }

        }


    </script>
</head>
<body>
<!------------------------------head------------------------------>
<%@include file="_header.jsp" %>
<!------------------------------idea------------------------------>
<%--	<div class="address mt">
        <div class="wrapper clearfix">
            <a href="index.jsp" class="fl">首页</a>
            <span>/</span>
            <a href="mygxin.jsp">个人中心</a>
            <span>/</span>
            <a href="address.jsp" class="on">地址管理</a>
        </div>
    </div>--%>

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
                    <li class="on"><a href="${path}/address">地址管理</a></li>
                </ul>
                <h4>账户管理</h4>
                <ul>
                    <li  class="on"><a href="${path}/personalDetails">个人信息</a></li>
                    <li><a href="${path}/updatePassWord">修改密码</a></li>
                </ul>
            </div>
        </div>
        <div class="you fl">
            <h2>收货地址</h2>
            <div class="add">
                <div>
                    <a href="#2" id="addxad"><img src="${path}/img/jia.png"/></a>
                    <span>添加新地址</span>
                </div>
                <c:forEach items="${requestScope.addressList}" var="address">


                    <div class="dizhi">
                        <p>${address.address_name}</p>
                        <p>${address.tel_number}</p>
                            <%--	<p>河北省 唐山市 路北区</p>--%>
                        <p>${address.detailed_address}</p>
                        <input type="hidden" name="aid" value="${address.address_id}">

                        <p><a href="javascript:void (0)" onclick="doChange(this)" id="readd">修改</a><a
                                href="javascript:void (0)" onclick="doDelete(this)" id="deladd">删除</a></p>

                    </div>


                </c:forEach>

            </div>
        </div>
    </div>
</div>

<form action="" method="get">
    <select>

    </select>

</form>


<!--编辑弹框-->
<!--遮罩-->
<div class="mask"></div>
<div class="adddz">
    <form name="form" action="#" method="get">
        <input type="text" name="add-name" placeholder="姓名" class="on"/>
        <input type="text" name="add-tel" placeholder="手机号"/>
        <div class="city">
            <select name="addProvince" onChange="set_city_add(this, this.form.addCity);">
                <%--<option value="省份/自治区">省份/自治区</option>
                <option  value="省份/自治区">省份</option>--%>
                <option value="0">选择省</option>
                <option value="河北省">河北省</option>
                <option value="山西省">山西省</option>
            </select>
            <select name="addCity" id="addCitys">
                <%--<option value="城市/地区">城市/地区</option>--%>
                <option value="0">选择城市</option>

            </select>
            <%--<select>
                <option value="区/县">区/县</option>
            </select>
            <select>
                <option value="配送区域">配送区域</option>
            </select>--%>
        </div>
        <textarea name="add-detailAddress" rows="" cols="" placeholder="详细地址"></textarea>

        <%--<input  type="text" placeholder="邮政编码"/>--%>

        <div class="bc">
            <input type="button" onclick="doAdd(this)" value="保存"/>
            <input type="button" value="取消"/>
        </div>
    </form>
</div>
<div class="readd">
    <form name="form1" action="#" method="get">
        <input type="text" name="update-name" class="on" placeholder="姓名"/>
        <input type="text" name="update-tel" placeholder="手机号"/>
        <div class="city">
            <select name="province" onChange="set_city(this, this.form.city);">
                <option value="0">选择省</option>
                <option value="河北省">河北省</option>
                <option value="山西省">山西省</option>
            </select>
            <select name="city" id="citys">
                <option value="0">选择城市</option>
            </select>
            <%--<select name="select-update-shi">
                <option value="城市/地区">唐山市</option>
            </select>--%>
            <%--	<select name="select-update-xian">
                    <option value="区/县">路北区</option>
                </select>
                <select name="select-update-jiedao">
                    <option value="配送区域">火炬路</option>
                </select>--%>
        </div>
        <textarea name="update-detail-address" rows="" cols="" placeholder="详细地址"></textarea>
<%--
        <input type="text" placeholder="邮政编码" value="063000"/>
--%>
        <div class="bc">
            <input type="button" onclick="doUpdate(this)" value="保存"/>
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
    <a href="mygxin.jsp">
        <dl>
            <dt><img src="${path}/img/gt3.png"/></dt>
            <dd>个人<br/>中心</dd>
        </dl>
    </a>
    <a href="#" class="toptop" style="display: none">
        <dl>
            <dt><img src="${path}/img/gt4.png"/></dt>
            <dd>返回<br/>顶部</dd>
        </dl>
    </a>
    <p>400-800-8200</p>
</div>


<!--footer-->
<%@include file="_bottom.jsp" %>
<script src="${path}/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/user.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
</body>
</html>
