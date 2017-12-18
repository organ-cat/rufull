<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/17
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link href="${pageContext.request.contextPath}/css/bootstrap-table.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/business/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/business/bootstrapValidator.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/business/styleTable.css" />
    <style>
        .back:hover{cursor: pointer;}
        .fixed-table-toolbar .btn-group>.btn-group:last-child>.btn {
            border-top-right-radius: 0px;
            border-bottom-right-radius: 0px;
        }
        label{width:100px;}
        .popup_de{
            background-color:rgba(0,0,0,0.3);
            width:100%;
            height: 100%;
            position:fixed;
            z-index:999;
            top:0;
            left:0;
            display:none;
        }
        .bbox{
            display: -webkit-box;   /* 老版本语法: Safari, iOS, Android browser, older WebKit browsers. */
            display: -moz-box;      /* 老版本语法: Firefox (buggy) */
            display: -ms-flexbox;   /* 混合版本语法: IE 10 */
            display: -webkit-flex;  /* 新版本语法: Chrome 21+ */
            display: -moz-flex;
            display: flex;          /* 新版本语法: Opera 12.1, Firefox 22+ */
        }
        .bbox.xycenter{
            -moz-box-pack: center; /*Firefox*/
            -webkit-box-pack: center; /*Safari,Opera,Chrome*/
            box-pack: center;
            -moz-justify-content: center;
            -webkit-justify-content: center;
            justify-content: center;
            -moz-box-align: center; /*Firefox*/
            -webkit-box-align:center; /*Safari,Opera,Chrome*/
            box-align: center;
            -moz-align-items: center;
            -webkit-align-items: center;
            align-items:center;
        }
        .popup_de .popup_box{
            width:300px;
            height:150px;
            font-family: '微软雅黑';
            background-color: #fff;
            border-radius:5px;
            color:#333;
        }
        .popup_de .popup_btn{
            display: inline-block;
            width:100px;
            height:30px;
            border-radius: 3px;
            border:1px solid #1ab394;
            font-size:15px;
            text-align: center;
            line-height: 30px;
            margin-right:15px;
            cursor: pointer;
        }
        .popup_de .show_msg{
            display: block;
            width:100%;
            text-align: center;
            font-size:18px;
            margin-top:40px;
            margin-bottom: 20px;
            padding:10px;
        }
        .popup_de .popup_close{
            width:30px;
            height:30px;
            font-size:25px;
            text-align: center;
            display: inline-block;
            cursor:pointer;
            float: right;
            border-top-right-radius: 5px;
            line-height:30px;
        }
        .popup_de .popup_close:hover{
            background-color: #1ab394;
            color:#fff;
        }
        .popup_de .btn_submit{
            background-color: #1ab394;
            color:#fff;
        }
        .popup_de .btn_box{
            text-align: center;
        }
    </style>


</head>
<body>
<div class="tableBody">
    <div class="panel panel-default">
        <div class="panel-heading">
            查询条件
        </div>
        <div class="panel-body form-group" style="margin-bottom:0px;">
            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">姓名：</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="Name" id="search_name"/>
            </div>
            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">手机号：</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="Name" id="search_tel"/>
            </div>
            <div class="col-sm-2 pull-right">
                <button class="btn btn-primary" id="search_btn">查询</button>
            </div>

        </div>
    </div>
    <table id="mytab" class="table table-hover"></table>
    <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
        <button id="btn_edit" type="button" class="btn btn-default" style="display: none; border-radius: 0">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改
        </button>
        <button id="btn_delete" type="button" class="btn btn-default" style="display: none;">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
        <button id="btn_add" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
    </div>
</div>
<div class="addBody" style="width:100%; display: none;position: absolute;top:10px">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>新增用户</h5>
            </div>
            <div class="ibox-content">
                <form id="addForm" method="post" class="form-horizontal" action="target.php">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登录名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="LoginName" id="add_LoginName"/>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="Name" id="add_Name"/>
                        </div>
                    </div>
                    <div class="hr-line-dashed" style="display:none"></div>
                    <div class="form-group" style="display:none">
                        <label class="col-sm-2 control-label">角色</label>
                        <div class="col-sm-10 role add">
                        </div>
                    </div>
                    <div id="pwd">
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Pwd" id="add_Pwd"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">手机号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Tel" id="add_Tel"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Email" id="add_Email"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-10">
                                <label>
                                    <input type="radio" name="Attribute"  value=1 /> 正常
                                </label>
                                <label>
                                    <input type="radio" name="Attribute"  value=2 /> 锁定
                                </label>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-2 col-sm-offset-2">
                                <button type="button" class="btn btn-primary btn-block"  id="add_saveBtn">保存</button>
                            </div>
                            <div class="col-sm-2 col-sm-offset-1">
                                <button type="button" class="btn btn-default btn-block"  id="add_backBtn">返回</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<div class="changeBody" style="width:100%; height:500px; display: none;position: absolute;top:10px;">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>修改用户信息</h5>
            </div>
            <div class="ibox-content">
                <form id="editForm" method="post" class="form-horizontal">
                    <div class="form-group" style="display:none" >
                        <label class="col-sm-2 control-label">ID</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="ID" id="edit_ID"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登录名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="LoginName" id="edit_LoginName" readonly/>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="Name" id="edit_Name"/>
                        </div>
                    </div>
                    <div class="hr-line-dashed" style="display:none"></div>
                    <div class="form-group" style="display:none">
                        <label class="col-sm-2 control-label">角色</label>
                        <div class="col-sm-10 role edit"></div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="Tel" id="edit_Tel"/>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="Email" id="edit_Email"/>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-10">
                            <label>
                                <input type="radio" name="Attribute" value=1  id="edit_Attribute"/> 正常
                            </label>
                            <label>
                                <input type="radio" name="Attribute" value=2 id="edit_Attribute"/> 锁定
                            </label>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-2 col-sm-offset-2">
                            <button type="button" class="btn btn-primary btn-block"  id="edit_saveBtn">保存</button>
                        </div>
                        <div class="col-sm-2 col-sm-offset-1">
                            <button type="button" class="btn btn-default btn-block"  id="edit_backBtn">返回</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="popup_de xycenter">
    <div class="popup_box">
        <span class="popup_close" value="关闭">×</span>
        <span class="show_msg">确定要删除该权限吗？</span>
        <div class="btn_box">
            <div class="popup_btn btn_submit" value="确定">确定</div>
            <div class="popup_btn btn_cancel" value="取消">取消</div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/userManagement.js"></script>
</html>