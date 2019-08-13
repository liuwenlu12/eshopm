<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="${path}/css/base.css">
    <link rel="stylesheet" href="${path}/css/load.css">

    <script type="text/javascript" src="${path}/static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(":submit").click(function () {
                var username = $("input[name='username']").val();
                var password = $("input[name='password']").val();
                if(username!=null&&username!=''){
                    if(password!=null&&password!=''){
                $.ajax({
                    url: "${pageContext.request.contextPath}/login",
                    type: "post",
                    data: {
                        username: username,
                        password: password
                    },

                    success: function (res) {

                        if (res.result) {
                            location = "${path}/index";
                        } else {

                            if (res.error === "密码错误") {
                                layer.msg('密码错误', {icon: 5});

                            } else if (res.error === "用户名不存在") {
                                layer.msg('用户名不存在', {icon: 5});
                            }
                        }
                    }
                });
                    }else{
                        layer.msg('请输入密码');
                    }
                }else{
                    layer.msg('请输入用户名');
                }
                return false;
            });
        });
    </script>

</head>
<body>
<header id="headNav">
    <div class="innerNav clear">
        <a class="fl" href="#"><img src="${path}/images/loginlogo.jpg" alt=""/></a>
       <%--<div class="headFont fr">
            <span>您好，欢迎光临1号店！<a href="${path}/login.jsp">请登录</a></span>
         &lt;%&ndash;   <a class="helpLink" href="#"><i class="runbun"></i>帮助中心<i class="turnb"></i></a>&ndash;%&gt;
        </div>
        <div class="outHelp">
            <ul class="helpYou" style="display: none;">
                <li><a href="#">包裹跟踪</a></li>
                <li><a href="#">常见问题</a></li>
                <li><a href="#">在线退换货</a></li>
                <li><a href="#">在线投诉</a></li>
                <li><a href="#">配送范围</a></li>
            </ul>
        </div>--%>
    </div>
</header>
<section id="secBody">
    <div class="innerBody clear">
        <img class="fl" src="${path}/images/loadimg.jpg" alt=""/>
        <div class="tableWrap fr">
            <form role="form">
                <div class="tableTap clear">
                    <h3 class="fl">1号店用户登录</h3>
                    <a class="fr" href="${path}/register">注册账号</a>
                </div>
                <div class="tableItem">
                    <i class="userHead"></i>
                    <input type="text" name="username" id="username" placeholder="邮箱/手机/用户名" required/>
                    <p></p>
                </div>

                <div class="tableItem">
                    <i class="userLock"></i>
                    <input type="password" name="password" id="password" placeholder="密码" required/>
                    <p></p>
                </div>

                <div class="tableAuto clear">
                    <a class="autoMatic fl" href="#">
                        <input class="loadGiet" type="checkbox"/>自动登录</a>
                    <a class="fr" href="${path}/forget">忘记密码？</a>
                </div>
                <button class="tableBtn" type="submit">登录</button>
            </form>
            <h2 class="moreWeb">更多合作网站账号登录</h2>
            <div class="outType clear">
                <ul class="loadType clear">
                    <li class="fl"><a href="#"></a></li>
                    <li class="fl"><a href="#"></a></li>
                    <li class="fl"><a href="#"></a></li>
                    <li class="fl"><a href="#"></a></li>
                    <li class="loadMore fr">更多合作网站<i></i></li>
                </ul>
            </div>
            <ul class="typeWeb clear">
                <li class="fl"><i></i><a href="#">百度</a></li>
                <li class="fl"><i></i><a href="#">百度</a></li>
                <li class="fl"><i></i><a href="#">百度</a></li>
                <li class="fl"><i></i><a href="#">百度</a></li>
                <li class="fl"><i></i><a href="#">百度</a></li>
            </ul>
        </div>
    </div>
</section>
<footer id="footNav">
    <p><a href="#">沪ICP备13044278号</a>|&nbsp;&nbsp;合字B1.B2-20130004&nbsp;&nbsp;|<a href="#">营业执照</a></p>
    <p>Copyright © 1号店网上超市 2007-2016，All Rights Reserved</p>
</footer>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
</body>
</html>