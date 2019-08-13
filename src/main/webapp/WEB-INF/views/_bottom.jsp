
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

<!-- 底部 start -->
<div class="footer">
    <!--服务 start-->
    <div class="footer_nav con_width clearfix">
        <ul>
            <li><a href="#"><i class="iconfont icon-buoumaotubiao46"></i>预约维修服务</a></li>
            <li><a href="#"><i class="iconfont icon-7"></i>7天无理由退货</a></li>
            <li><a href="#"><i class="iconfont icon-15"></i>15天免费换货</a></li>
            <li><a href="#"><i class="iconfont icon-liwu1"></i>满150元包邮</a></li>
            <li><a href="#"><i class="iconfont icon-dingwei"></i>520余家售后网点</a></li>
        </ul>
    </div>
    <!--服务 end-->
    <!-- 底部列表 start-->
    <div class="footer_item con_width clearfix">
        <div class="footer_item_left">
            <ul>
                <li>
                    <p>帮助中心</p>
                    <ul>
                        <li><a href="#">账户管理</a></li>
                        <li><a href="#">购物指南</a></li>
                        <li><a href="#">订单操作</a></li>
                    </ul>
                </li>
                <li>
                    <p>服务支持</p>
                    <ul>
                        <li><a href="#">售后政策</a></li>
                        <li><a href="#">自助服务</a></li>
                        <li><a href="#">相关下载</a></li>
                    </ul>
                </li>
                <li>
                    <p>线下门店</p>
                    <ul>
                        <li><a href="#">小米之家</a></li>
                        <li><a href="#">服务网点</a></li>
                        <li><a href="#">授权体验店</a></li>
                    </ul>
                </li>
                <li>
                    <p>关于小米</p>
                    <ul>
                        <li><a href="#">了解小米</a></li>
                        <li><a href="#">加入小米</a></li>
                        <li><a href="#">投资者关系</a></li>
                    </ul>
                </li>
                <li>
                    <p>关注我们</p>
                    <ul>
                        <li><a href="#">新浪微博</a></li>
                        <li><a href="#">官方微信</a></li>
                        <li><a href="#">联系我们</a></li>
                    </ul>
                </li>
                <li>
                    <p>特色服务</p>
                    <ul>
                        <li><a href="#">F码通道</a></li>
                        <li><a href="#">礼物码</a></li>
                        <li><a href="#">防伪查询</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="footer_item_right">
            <p class="phone">400-100-5678</p>
            <p class="date">周一至周日 8:00-12:00<br/>(仅收市话费)</p>
            <a href="#" class="btn-relative"><i class="iconfont icon-lianxi1"></i> 联系客服</a>
        </div>
    </div>
    <!-- 底部列表 end-->
    <!-- 底部说明 start -->
    <div class="footer_desc">
        <div class="footer_desc_con con_width">
            <div class="logo">
                <img src="${path}/images/mi-logo.png" alt="MIlogo" title="小米官网">
            </div>
            <div class="desc_con_item">
                <div class="desc_con_item_detail clearfix">
                    <ul>
                        <li><a href="#">小米商城</a></li>
                        <li><a href="#">MIUI</a></li>
                        <li><a href="#">米家</a></li>
                        <li><a href="#">多看</a></li>
                        <li><a href="#">游戏</a></li>
                        <li><a href="#">路由器</a></li>
                        <li><a href="#">米粉卡</a></li>
                        <li><a href="#">政企服务</a></li>
                        <li><a href="#">小米天猫店</a></li>
                        <li><a href="#">隐私政策</a></li>
                        <li><a href="#">问题反馈</a></li>
                        <li><a href="#">廉正举报</a></li>
                        <li><a href="#">Select Region</a></li>
                    </ul>
                </div>
                <p class="desc_con_txt">
                    &copy;<a href="#">mi.com</a> 京ICP证110507号
                    <a href="#">京ICP备10046444号</a>
                    <a href="#">京公网安备11010802020134号 </a>
                    <a href="#">京网文[2017]1530-131号</a>
                    <br/>
                    违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试
                </p>
            </div>
            <div class="desc_con_links">
                <img src="${path}/images/links/truste.png"/>
                <img src="${path}/images/links/v-logo-2.png"/>
                <img src="${path}/images/links/v-logo-1.png"/>
                <img src="${path}/images/links/v-logo-3.png"/>
                <img src="${path}/images/links/ba10428a4f9495ac310fd0b5e0cf8370.png"/>
            </div>
        </div>
        <div class="slogan ir con_width">探索黑科技，小米为发烧而生</div>
    </div>
    <!-- 底部说明 end -->
</div>
<!-- 底部 end -->