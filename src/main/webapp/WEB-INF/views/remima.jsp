<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="${path}/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/css/mygrxx.css"/>
    <style type="text/css">
        form.remima p input[type=password] {
            display: inline-block;
            width: 240px;
            height: 30px;
            line-height: 30px;
            border: 1px solid #E0E0E0;
            text-indent: 10px;
        }
    </style>
    <script type="text/javascript" src="${path}/static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(":submit").click(function () {

                var password = $("input[name='password']").val();
                var telNumber = $("input[name='telNumber']").val();
                var newPassWord = $("input[name='newPassWord']").val();
                var newPassWordAgain = $("input[name='newPassWordAgain']").val();
                if (password != null && password != '') {
                    if (newPassWord != null && newPassWord != '') {
                        if (telNumber != null && telNumber != '') {
                            if (newPassWord === newPassWordAgain) {
                                var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
                                if (reg.test(telNumber)) {
                                    $.ajax({
                                        url: "${path}/updatePassWord",
                                        type: "post",
                                        data: {
                                            password: password,
                                            telNumber: telNumber,
                                            newPassWord: newPassWord
                                        },
                                        success: function (res) {

                                            if (res.result) {
                                                layer.msg('修改成功', {
                                                    icon: 1,
                                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                                }, function () {
                                                    layer.confirm('要重新登陆吗?', {icon: 3, title:'提示'}, function(){
                                                        location = "${path}/logout"
                                                    });
                                                    });
                                            } else {
                                                if (res.error === "输入原密码不正确") {

                                                    layer.msg('输入原密码不正确');

                                                }
                                                if (res.error === "输入号码不正确") {

                                                    layer.msg('输入号码不正确');

                                                }
                                                if (res.error === "修改失败") {

                                                    layer.msg('修改失败');
                                                }
                                            }
                                        }
                                    });
                                } else {
                                    layer.msg('输入号码格式不正确');
                                }
                            } else {
                                layer.msg('两次密码输入不一致');

                            }
                        } else {
                            layer.msg('请输入手机号');
                        }
                    } else {
                        layer.msg('请输入新密码');
                    }
                } else {
                    layer.msg('请输入原密码');
                }
                return false;
            });


        });


    </script>
</head>
<body>
<!------------------------------head------------------------------>
<%@include file="_header.jsp" %>
<!------------------------------idea------------------------------>

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
                    <li class="on"><a href="${path}/updatePassWord">修改密码</a></li>
                </ul>
            </div>
        </div>
        <div class="you fl">
            <h2>修改密码</h2>
            <form action="#" method="get" class="remima">
                <p><span>选择验证身份方式：</span><input type="checkbox"/>密码验证 <input type="checkbox"/></p>
                <p><span>原密码：</span><input type="password" name="password" id="password"/></p>
                <p class="op">输入原密码</p>
                <p><span>新密码：</span><input type="password" name="newPassWord" id="newPassWord"/></p>
                <p class="op">输入新密码</p>
                <p><span>重复新密码：</span><input type="password" name="newPassWordAgain" id="newPassWordAgain"
                /></p>
                <p class="op">请再次输入密码</p>
                <p><span>手机号：</span><input type="text" name="telNumber" id="telNumber"/></p>
                <p class="op">请输入手机号</p>
                <input type="submit" value="提交"/>
            </form>
        </div>
    </div>
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
