<%@ page language="java" import="java.util.*" pageEncoding="gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html>
<html lang="en">
<head>

    <base href="<%=basePath%>">
    <title>��ҳ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>
    <script src="assets/jquery.min.js"></script>

    <spring:url value="manager/getManagerInfo" var="getManagerInfo"></spring:url>
    <spring:url value="manager/changePwd" var="changePwd"></spring:url>
    <spring:url value="manager/logout" var="logout"></spring:url>
    <spring:url value="manager/getwelcome" var="getwelcome"></spring:url>
    <spring:url value="manager/getManagerList" var="getManagerList"></spring:url>
    <spring:url value="manager/addManager" var="addManager"></spring:url>
    <spring:url value="manageLog/showManagelog" var="showManagelog"></spring:url>
    <spring:url value="manageLog/showAccountlog" var="showAccountlog"></spring:url>
    <spring:url value="manageLog/goLogs" var="goLogs"></spring:url>
    <spring:url value="manageAcc/getAccountList" var="getAccountList"></spring:url>
    <spring:url value="manageShop/getNotSettledBusiness" var="getNotSettledBusiness"></spring:url>
    <spring:url value="manageShop/findBusiness" var="findBusiness"></spring:url>
    <spring:url value="ordermanage/findOrdersList" var="findOrdersList"></spring:url>
    <spring:url value="manageData/getOrders?type=1" var="getOrders1"></spring:url>
    <spring:url value="manageData/getOrders?type=2" var="getOrders2"></spring:url>
    <spring:url value="manageData/getOrders?type=3" var="getOrders3"></spring:url>
    <spring:url value="manageData/getShops?type=1" var="getShops1"></spring:url>
    <spring:url value="manageData/getShops?type=2" var="getShops2"></spring:url>
    <spring:url value="manageData/getShops?type=3" var="getShops3"></spring:url>
    <spring:url value="ManageCom/findAllComp" var="findAllComp"></spring:url>

</head>

<body>

<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small><i
                        class="icon-leaf"></i> RuFull��̨����
                </small>
            </a>
            <!-- /.brand -->
        </div>
        <!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">


                <li class="light-blue"><a data-toggle="dropdown" href="#"
                                          class="dropdown-toggle"> <img class="nav-user-photo" style="width: 40px;height: 40px;"
                                                                        src="${pageContext.request.contextPath}/upload/manager/${manager.photo}"/>
                    <span
                            class="user-info"> <strong>${manager.username}</strong>
						</span> <i class="icon-caret-down"></i>
                </a>
                    <ul
                            class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

                        <li><a href="${getManagerInfo}" target="mainframe"> <i class="icon-user"></i> ��������
                        </a></li>
                        <li><a href="${changePwd}" target="mainframe"> <i class="icon-user"></i> �޸�����
                        </a></li>
                        <li><a href="${logout}"> <i class="icon-off"></i> �˳�
                        </a></li>
                        <li class="divider"></li>

                    </ul>
                </li>
            </ul>
            <!-- /.ace-nav -->
        </div>
        <!-- /.navbar-header -->
    </div>
    <!-- /.container -->
</div>


<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#"> <span
                class="menu-text"></span> </a>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>

            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <button class="btn btn-success">
                        <i class="icon-signal"></i></button>

                    <button class="btn btn-info">
                        <i class="icon-pencil"></i></button>

                    <button class="btn btn-warning">
                        <i class="icon-group"></i></button>

                    <button class="btn btn-danger">
                        <i class="icon-cogs"></i></button>
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span> <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span> <span class="btn btn-danger"></span></div>
            </div>
            <!-- #sidebar-shortcuts -->

            <ul class="nav nav-list">
                <li class="active"><a
                        href="${getwelcome}" target="mainframe">
                    <i class="icon-dashboard"></i> <span class="menu-text">
								��ӭʹ�� </span>
                </a></li>
				<c:if test="${manager.role==1}">
                <li><a href="javascript:void(0)" target="mainframe"
                       class="dropdown-toggle"> <i class="icon-desktop"></i> <span
                        class="menu-text"> �������Ա </span> <b class="arrow icon-angle-down"></b>
                </a>

                    <ul class="submenu">

                        <li><a href="${getManagerList}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> �鿴����Ա
                        </a></li>
                        <li><a href="${addManager}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> ��ӹ���Ա
                        </a></li>

                    </ul>
                </li>

                <li><a href="javascript:void(0)" target="mainframe"
                       class="dropdown-toggle"> <i class="icon-desktop"></i> <span
                        class="menu-text"> ��־���� </span> <b class="arrow icon-angle-down"></b>
                </a>

                    <ul class="submenu">

                        <li><a href="${showManagelog}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> ϵͳ��־
                        </a></li>
                        <li><a href="${showAccountlog}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> �û���־
                        </a></li>
                        <li><a href="${goLogs}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> ��ѯ��־
                        </a></li>

                    </ul>
                </li>
                </c:if>

                <li><a href="javascript:void(0)" target="mainframe"
                       class="dropdown-toggle"> <i class="icon-desktop"></i> <span
                        class="menu-text"> �û����� </span> <b class="arrow icon-angle-down"></b>
                </a>

                    <ul class="submenu">

                        <li><a href="${getAccountList}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> ��ѯ�û�
                        </a></li>

                    </ul>
                </li>
                <li><a href="javascript:void(0)" target="mainframe"
                       class="dropdown-toggle"> <i class="icon-desktop"></i> <span
                        class="menu-text"> �̼ҹ��� </span> <b class="arrow icon-angle-down"></b>
                </a>

                    <ul class="submenu">

                        <li><a href="${getNotSettledBusiness}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> �����פ
                        </a></li>
                        <li><a href="${findBusiness}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> ��ѯ�̼�
                        </a></li>

                    </ul>
                </li>

                <li><a href="javascript:void(0)" target="mainframe"
                       class="dropdown-toggle"> <i class="icon-desktop"></i> <span
                        class="menu-text"> �������� </span> <b class="arrow icon-angle-down"></b>
                </a>

                    <ul class="submenu">

                        <li><a href="${findOrdersList}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> ��ѯ����
                        </a></li>
                    </ul>
                </li>
                <li><a href="javascript:void(0)" target="mainframe"
                       class="dropdown-toggle"> <i class="icon-desktop"></i> <span
                        class="menu-text"> �������ݷ��� </span> <b class="arrow icon-angle-down"></b>
                </a>

                    <ul class="submenu">
                        <li><a href="${getOrders1}" target="mainframe"> <i
                                class="icon-double-angle-right"></i>���η���
                        </a></li>
                        <li><a href="${getOrders2}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> ���η���
                        </a></li>
                        <li><a href="${getOrders3}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> ���߷���
                        </a></li>
                    </ul>
                </li>

                <li><a href="javascript:void(0)" target="mainframe"
                       class="dropdown-toggle"> <i class="icon-desktop"></i> <span
                        class="menu-text"> �̵����ַ��� </span> <b class="arrow icon-angle-down"></b>
                </a>

                    <ul class="submenu">
                        <li><a href="${getShops1}" target="mainframe"> <i
                                class="icon-double-angle-right"></i>���η���
                        </a></li>
                        <li><a href="${getShops2}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> ���η���
                        </a></li>
                        <li><a href="${getShops3}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> ���߷���
                        </a></li>
                    </ul>
                </li>

                <li><a href="javascript:void(0)" target="mainframe"
                       class="dropdown-toggle"> <i class="icon-desktop"></i> <span
                        class="menu-text"> �ٱ����� </span> <b class="arrow icon-angle-down"></b>
                </a>

                    <ul class="submenu">
                        <li><a href="${findAllComp}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> δ������Ϣ
                        </a></li>
                        <li><a href="${findAllComp}" target="mainframe"> <i
                                class="icon-double-angle-right"></i> �Ѵ�����Ϣ
                        </a></li>

                    </ul>
                </li>

                <!-- /.nav-list -->

                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="icon-double-angle-left"
                       data-icon1="icon-double-angle-left"
                       data-icon2="icon-double-angle-right"></i></div>

                <script type="text/javascript">
                    try {
                        ace.settings.check('sidebar', 'collapsed')
                    } catch (e) {
                    }
                </script>
            </ul>
        </div>

        <div class="main-content" id="mains">
            <iframe id="mainframe" name="mainframe" src="${getwelcome}"
                    style="width: 100%;border: 0px;height: 700px;"></iframe>
        </div>

        <script type="text/javascript">
            var height = jQuery(window).height() - 50;
            jQuery("#mainframe").attr("height", "" + height + "px;");
        </script>

        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn"
                 id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i></div>

            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; ѡ��Ƥ��</span></div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2"
                           id="ace-settings-navbar"/> <label class="lbl"
                                                             for="ace-settings-navbar"> �̶�������</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2"
                           id="ace-settings-sidebar"/> <label class="lbl"
                                                              for="ace-settings-sidebar"> �̶�������</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2"
                           id="ace-settings-breadcrumbs"/> <label class="lbl"
                                                                  for="ace-settings-breadcrumbs">�̶����м</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2"
                           id="ace-settings-rtl"/> <label class="lbl"
                                                          for="ace-settings-rtl">�л������</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2"
                           id="ace-settings-add-container"/> <label class="lbl"
                                                                    for="ace-settings-add-container"> �л�խ�� <b></b>
                </label>
                </div>
            </div>
        </div>
        <!-- /#ace-settings-container -->
    </div>
    <!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up"
       class="btn-scroll-up btn btn-sm btn-inverse"> <i
            class="icon-double-angle-up icon-only bigger-110"></i> </a></div>
<!-- /.main-container -->
<!-- basic scripts -->


<script type="text/javascript">
    if ("ontouchend" in document)
        document
            .write("<script src='${pageContext.request.contextPath}/assets/js/jquery.mobile.custom.min.js'>"
                + "<" + "script>");
</script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->


<script src="${pageContext.request.contextPath}/assets/js/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/flot/jquery.flot.resize.min.js"></script>

<!-- ace scripts -->

<script src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/indexJs.js">

</script>

</body>
</html>

