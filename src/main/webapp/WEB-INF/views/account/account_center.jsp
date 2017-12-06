<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/2
  Time: 1:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <title>个人中心 - 首页-member_index.html</title>
    <link href="css/forward_201503262210.css" type="text/css" rel="stylesheet" />

    <link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon.png?v=2" />

    <script type="text/javascript" src="js/head_201503262210.js"></script>
</head>

<body>

<link href="css/background.css?v=5" type="text/css" rel="stylesheet" />
<div id="background" style="background-position:1px -10689.583333333px;background-color:#C0DEED;" class=" night ">
    <div id="sun"></div>
    <div id="moon"></div>
    <div id="clouds">
        <div id="cloudGroup1">
            <img src="images/clouds.png" alt="" id="cloudPiece1" class="cloudPiece" />
            <img src="images/clouds.png" alt="" id="cloudPiece2" class="cloudPiece" />
            <img src="images/clouds.png" alt="" id="cloudPiece3" class="cloudPiece" />
        </div>
        <div id="cloudGroup2">
            <img src="images/clouds.png" alt="" id="cloudPiece4" class="cloudPiece" />
            <img src="images/clouds.png" alt="" id="cloudPiece5" class="cloudPiece" />
            <img src="images/clouds.png" alt="" id="cloudPiece6" class="cloudPiece" />
        </div>
        <div id="cloudGroup3">
            <img src="images/clouds.png" alt="" id="cloudPiece7" class="cloudPiece" />
            <img src="images/clouds.png" alt="" id="cloudPiece8" class="cloudPiece" />
        </div>
    </div>
    <div id="bg_stars">
        <div class="star_type_1_big">
            <div class="bg_star" id="star1_1"></div>
            <div class="bg_star" id="star1_2"></div>
            <div class="bg_star" id="star1_3"></div>
            <div class="bg_star" id="star1_4"></div>
        </div>
        <div class="star_type_1_normal">
            <div class="bg_star" id="star1_7"></div>
            <div class="bg_star" id="star1_8"></div>
            <div class="bg_star" id="star1_9"></div>
            <div class="bg_star" id="star1_10"></div>
            <div class="bg_star" id="star1_11"></div>
            <div class="bg_star" id="star1_12"></div>
        </div>
        <div class="star_type_1_small">
            <div class="bg_star" id="star1_13"></div>
            <div class="bg_star" id="star1_14"></div>
            <div class="bg_star" id="star1_15"></div>
            <div class="bg_star" id="star1_16"></div>
            <div class="bg_star" id="star1_17"></div>
            <div class="bg_star" id="star1_18"></div>
        </div>
        <div class="star_type_2_big">
            <div class="bg_star" id="star2_1"></div>
            <div class="bg_star" id="star2_2"></div>
            <div class="bg_star" id="star2_3"></div>
            <div class="bg_star" id="star2_4"></div>
        </div>
        <div class="star_type_2_normal">
            <div class="bg_star" id="star2_7"></div>
            <div class="bg_star" id="star2_8"></div>
            <div class="bg_star" id="star2_9"></div>
            <div class="bg_star" id="star2_10"></div>
            <div class="bg_star" id="star2_11"></div>
            <div class="bg_star" id="star2_12"></div>
        </div>
        <div class="star_type_2_small">
            <div class="bg_star" id="star2_13"></div>
            <div class="bg_star" id="star2_14"></div>
            <div class="bg_star" id="star2_15"></div>
            <div class="bg_star" id="star2_16"></div>
            <div class="bg_star" id="star2_17"></div>
            <div class="bg_star" id="star2_18"></div>
        </div>
    </div>
</div>
<div class="full-content-wrapper">
    <header id="topbar" role="banner">
        <div class="container clearfix">
            <a id="logo" href="index.html" title="饿了么" alt="饿了么" role="logo"> <i class="default-logo"></i> </a>
            <div class="mobile-wrap">

                <div id="topbar_search" class="topbar-search" role="search">
                    <form id="tsearch_form" class="tsearch-form clearfix" action="/search" method="get">
                        <i class="icon-tsearch"></i>
                        <input id="tsearch_input" class="tsearch-input" type="text" name="kw" autocomplete="off" placeholder="搜索餐厅，美食…" />
                        <i id="ts_loading" class="icon-tloading hide"></i>
                        <a id="ts_clear" class="icon-tclear hide"></a>
                    </form>
                    <div id="tsearch_autocomplete" class="tsearch-autocomplete"></div>
                </div>
                <nav class="topbar-nav" role="navigation">
                    <ul class="topbar-site-nav">
                        <li><a class="tnav-link current" rel="nofollow" href="member_order.html">我的饿单</a></li>
                        <li><a class="tnav-link" rel="nofollow" href="gift.html">回到主页</a></li>
                        <li><a class="tnav-link" rel="nofollow" href="support.html">联系客服</a></li>
                    </ul>

                    <div class="eleme_dropdown topbar-user-nav">
                        <a class="e_toggle tnav-link tnav-username" data-id="175519">hjl416148..<i class="caret"></i></a>
                        <ul class="e_dropdown topbar-user-dropdown">
                            <li><a rel="nofollow" href="member_index.html"><i class="icon-profile"></i>个人中心</a></li>
                            <li><a rel="nofollow" href="member_collect_shop.html"><i class="icon-fav"></i>我的收藏</a></li>
                            <li><a rel="nofollow" href="member_addr.html"><i class="icon-address"></i>我的地址</a></li>
                            <li><a rel="nofollow" href="member_safe_set.html"><i class="icon-config"></i>安全设置</a></li>
                            <li class="divider"></li>
                            <li><a rel="nofollow" href="/logout"><i class="icon-logout"></i>退出登录</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <div class="container">
        <nav class="breadcrumb" data-geohash="wtw3equp">
            <a href="/place/-615736186413943440">登科保洁(长寿路店)</a>
            <a class="breadcrumb-switch" href="city.html">[切换地址]</a>
            <span class="breadcrumb-divider">/</span> 个人中心
        </nav>
        <div class="wash-paper clearfix" id="profile">
            <nav class="profile-nav">
                <ul class="nav nav-list">
                    <li class="active"> <a href="member_index.html"> <i class="icon-user icon-white"></i> 个人中心 </a> </li>
                    <li class="divider"></li>
                    <li class="nav-header">饿单中心</li>
                    <li> <a href="member_order.html"> <i class="icon-calendar"></i> 最近一个月 </a> </li>
                    <li> <a href="member_order_month.html"> <i class="icon-list-alt"></i> 一个月之前 </a> </li>
                    <li> <a href="member_comments.html"> <i class="icon-star-empty"></i> 未点评饿单 </a> </li>
                    <li> <a href="member_order_refund.html"> <i class="icon-file"></i> 退单中饿单 </a> </li>
                    <li class="divider"></li>
                    <li class="nav-header">我的收藏</li>
                    <li> <a href="member_collect_shop.html"> <i class="icon-heart"></i> 我收藏的餐厅 </a> </li>

                    <li class="divider"></li>
                    <li class="nav-header">账户相关</li>
                    <li> <a href="member_addr.html"> <i class="icon-list"></i> 我的地址 </a> </li>

                    <li class="divider"></li>
                    <li class="nav-header">安全中心</li>
                    <li> <a href="member_pwd.html"> <i class="icon-cog"></i> 修改密码 </a> </li>
                    <li> <a href="member_safe_set.html"> <i class="icon-lock"></i> 安全设置 </a> </li>
                    <li class="divider"></li>
                    <li class="nav-header">在线支付</li>
                    <li> <a href="member_schedule.html"> <i class="icon-eye-open"></i> 收支明细 </a> </li>
                </ul>
            </nav>
            <div class="main-content">
                <div class="content-header">
                    <h2>个人中心</h2>
                </div>
                <div class="content-inner profile-index">
                    <div class="account-status clearfix">
                        <div class="clearfix">
                            <div class="col-left">
                                <div class="avatar">
                                    <a href="/profile/set_avatar">上传<br />头像</a>
                                </div>
                                <div class="safety-level-wrapper">
                                    <h5>hjl416148489</h5>
                                    <p> <span class="text-gray">安全等级：</span> <a class="user-safety-level full" href="member_safe_set.html" title="太棒了，您已达到最高安全等级"> 高 </a> </p>
                                </div>
                            </div>

                            <ul class="related-info clearfix">

                                <li> <i class="icon-star"></i>收藏： <a href="member_collect_shop.html">25</a>家餐厅
                            </ul>
                        </div>
                        <div class="latest-orders tab_wrapper">
                            <ul class="tab_header">
                                <li class="active">最近饿单</li>
                                <li>最近在线交易<span class="tip">1</span> </li>
                            </ul>
                            <div class="tab_body">
                                <div class="food-orders">
                                    <a class="more" href="member_order.html">更多饿单&gt;&gt;</a>
                                    <table>
                                        <thead>
                                        <tr>
                                            <th>饿单号</th>
                                            <th>下单时间</th>
                                            <th>餐厅</th>
                                            <th>饿单详情</th>
                                            <th>饿单状态</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="sn"><a href="/profile/order/filter/single/id/12266119358749105" target="_blank">12266119358749105</a></td>
                                            <td class="time">3-9 23:03</td>
                                            <td class="restaurant">臻好时酸奶…</td>
                                            <td>原味炒酸奶1份/抹茶炒酸奶1份/巧克力…</td>
                                            <td class="status"><span class="
                  gray"> 无效订单 </span> </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="deal-orders hide">
                                    <a class="more" href="member_schedule.html">更多在线交易&gt;&gt;</a>
                                    <table>
                                        <thead>
                                        <tr>
                                            <th>创建时间</th>
                                            <th>交易类型</th>
                                            <th>交易详情</th>
                                            <th>金额</th>
                                            <th>交易状态</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <tr>
                                            <td class="time">9-24 13:25</td>
                                            <td class="type">饿了么外卖</td>
                                            <td>【半价+赠饮】功夫手擀面（原胡一刀） - 订单号：12757021601751831</td>
                                            <td class="price amount"><span class="green">-58.00</span></td>
                                            <td class="status readable-status"> <span>失败</span> </td>
                                        </tr>
                                        <tr>
                                            <td class="time">3-11 11:36</td>
                                            <td class="type">饿了么外卖</td>
                                            <td>康博煲仔饭 - 订单号：12446256481122141</td>
                                            <td class="price amount"><span class="green">-28.00</span></td>
                                            <td class="status readable-status"> <span>失败</span> </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="site_fixed" class="site-fixed">
            <a id="back_top" class="btn-back-top ui_invisible" role="button" title="回顶部"><i class="icon-backtop"></i></a>
        </div>
        <footer class="site-footer">
            <p class="sfooter-link-list"> <a class="sfooter-link" href="http://kaidian.ele.me">我要开店</a> <a class="sfooter-link" href="contact.html">联系我们</a> <a class="sfooter-link" href="agreement.html">服务条款和协议</a>
        </footer>
    </div>
    <script type="text/javascript" src="js/foot_201503262210.js"></script>
    <script src="js/profile_201503262210.js"></script>

</body>
</html>
