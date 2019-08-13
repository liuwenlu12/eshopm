<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>


<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="${path}/css/base.css">
    <link rel="stylesheet" href="${path}/css/register.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(":submit").click(function () {
                var username = $("input[name='username']").val();
                var password = $("input[name='password']").val();
                var telNumber = $("input[name='telNumber']").val();
                var truePass = $("input[name='turePass']").val();
            if(username!=null&&username!=''){
                if(password!=null&&password!=''){
                    if(telNumber!=null&&telNumber!=''){
                if (password === truePass) {
                    var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
                    if (reg.test(telNumber)) {


                        $.ajax({
                            url: "${path}/register",
                            type: "post",
                            data: {
                                username: username,
                                password: password,
                                telNumber: telNumber
                            },

                            success: function (res) {


                                console.log(res);

                                if (res.result) {
                                    layer.msg('注册成功', {
                                        icon: 1,
                                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                    }, function(){
                                      location = "${path}/login"
                                    });
                                } else {
                                    if (res.error === "用户名已存在") {
                                        layer.msg('用户名已存在', {icon: 5});
                                    }
                                    if (res.error === "电话号码已存在") {
                                        layer.msg('电话号码已存在', {icon: 5});
                                    }
                                }
                            }

                        });


                    } else {

                        layer.msg('输入电话号码有误', {icon: 5});
                    }

                } else {
                    layer.msg('两次密码不一致', {icon: 5});
                }
                    }else{
                        layer.msg('请填写手机号');
                    }
                }else{
                    layer.msg('请填写密码');
                }
            }else{
                layer.msg('请填写用户名');
            }


                return false;
            });
        });


    </script>
</head>
<body>
<header id="headNav">
    <div class="innerNav clear">
        <a class="fl" href="#"><img src="${path}/images/loginlogo.jpg" alt=""></a>
        <div class="headFont fr">
            <span style="font-size: large">您好，欢迎光临1号店！<a href="${path}/login">请登录</a></span>

        </div>

        <%--
              <a class="helpLink" href="#"><i class="runbun"></i>帮助中心<i class="turnb"></i></a>
          --%>
        <%--  <div class="headFont fr">
          </div>--%>
       <%-- <div class="outHelp">
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
<section id="secTab">
    <div class="innerTab">
        <h2>1号店注册</h2>


        <form role="form">
            <div class="tableItem">

                <span class="userPhone">账号</span>
                <input type="text" name="username" id="username" placeholder="账号" required/>
            </div>


            <div class="tableItem">
                <span class="setPass">设置密码</span>
                <input type="password" name="password" id="password" placeholder="密码" required/>
            </div>
            <div class="tableItem">
                <span class="turePass">确认密码</span>
                <input type="password" name="turePass" id="turePass" required placeholder="确认密码"/>
            </div>
            <div class="tableItem">
                <span class="userPhone">手机号</span>
                <input type="text" name="telNumber" id="telNumber" placeholder="手机号" required/>
            </div>
            <%--    <div class="clear">
                    <div class="tableItem onlyItem fl">
                        <span class="userPhone">验证码</span>
                        <input class="" type="text" required placeholder="验证码"/>
                    </div>
                    <a class="tableText fr" href="#">获取验证码</a>
                </div>--%>
            <p class="clickRegist">点击注册，表示您同意1号店 <a href="#">《服务协议》</a></p>


            <button class="tableBtn" type="submit">同意协议并注册</button>
        </form>
    </div>
</section>
<footer id="footNav">
    <p><a href="#">沪ICP备13044278号</a>|&nbsp;&nbsp;合字B1.B2-20130004&nbsp;&nbsp;|<a href="#">营业执照</a></p>

    <p>Copyright © 1号店网上超市 2007-2016，All Rights Reserved</p>
</footer>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
</body>
</html>