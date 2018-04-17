<%@ page import="entity.Admin" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>济南大学ACM实验室管理系统</title>
    <meta name="keywords"  content="设置关键词..." />
    <meta name="description" content="设置描述..." />
    <meta name="author" content="Scalpel" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <script src="/javascript/jquery.js"></script>
    <script src="/javascript/plug-ins/customScrollbar.min.js"></script>
    <script src="/javascript/plug-ins/echarts.min.js"></script>
    <script src="/javascript/plug-ins/layerUi/layer.js"></script>
    <script src="/editor/ueditor.config.js"></script>
    <script src="/editor/ueditor.all.js"></script>
    <script src="/javascript/plug-ins/pagination.js"></script>
    <script src="/javascript/public.js"></script>
</head>
<body>
<div class="main-wrap">
    <div class="side-nav">
        <div class="side-logo">
            <div class="logo">
                <span class="logo-ico">
                    <i class="i-l-1"></i>
                    <i class="i-l-2"></i>
                    <i class="i-l-3"></i>
                </span>
                <strong>济大ACM实验室管理系统</strong>
            </div>
        </div>

        <nav class="side-menu content mCustomScrollbar" data-mcs-theme="minimal-dark">
            <h2>
                <a href="/admin/admin.jsp" class="InitialPage"><i class="icon-dashboard"></i>系统首页</a>
            </h2>
            <ul>
                <li>
                    <dl>
                        <dt>
                            <i class="icon-table"></i>信息管理<i class="icon-angle-right"></i>
                        </dt>
                        <dd>
                            <a href="/admin/modifyInfo.jsp">修改个人信息</a>
                        </dd>
                        <dd>
                            <a href="/admin/modifyPassword.jsp">修改密码</a>
                        </dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>
                            <i class="icon-columns"></i><a href="/viewAllStudents">成员管理</a>
                        </dt>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>
                            <i class="icon-list-alt"></i>考勤管理<i class="icon-angle-right"></i>
                        </dt>
                        <dd>
                            <a href="/admin/addAttendance.jsp">录入考勤信息</a>
                        </dd>
                        <dd>
                            <a href="/listAttendance?startDate=<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>&endDate=<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>">
                                查看考勤
                            </a>
                        </dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>
                            <i class="icon-inbox"></i>训练计划<i class="icon-angle-right"></i>
                        </dt>
                        <dd>
                            <a href="trainPre">分配训练计划</a>
                        </dd>
                        <dd>
                            <a href="/listTrains">查看训练计划</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </nav>
        <footer class="side-footer">© 济南大学ACM实验室 版权所有</footer>
    </div>
    <div class="content-wrap">
        <header class="top-hd">
            <div class="hd-lt">
                <a class="icon-reorder"></a>
            </div>
            <div class="hd-rt">
                <ul>
                    <li>
                        <a><i class="icon-user"></i>管理员:<em><%= ((Admin)session.getAttribute("admin")).getName() %></em></a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" id="JsSignOut"><i class="icon-signout"></i>退出</a>
                    </li>
                </ul>
            </div>
        </header>
        <main class="main-cont content mCustomScrollbar">
            <!--开始::内容-->
            <div class="page-wrap">
                <section class="page-hd">
                    <header>
                        <h2 class="title">修改学生信息</h2>
                    </header>
                    <hr>
                </section>
                ${modifyError}
                <form action="modifyStudent" method="post">
                    <input type="hidden" name="student.scholar" value="<%= request.getParameter("scholar") %>" />
                    <div class="form-group-col-2">
                        <div class="form-label">密码：</div>
                        <div class="form-cont">
                            <input type="password" name="student.passwd" placeholder="输入密码" class="form-control form-boxed" style="width:300px;" />
                        </div>
                        ${errors.passwd[0]}
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label">姓名：</div>
                        <div class="form-cont">
                            <input type="text" name="student.name" placeholder="输入姓名" class="form-control form-boxed" style="width:300px;" />
                        </div>
                        ${errors.name[0]}
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label">班级：</div>
                        <div class="form-cont">
                            <input type="text" name="student.stdclass" placeholder="输入班级" class="form-control form-boxed" style="width:300px;" />
                        </div>
                        ${errors.stdclass[0]}
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label">性别：</div>
                        <div class="form-cont">
                            <select name="student.sex" style="width:auto;">
                                <option selected value="0">男</option>
                                <option value="1">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label">手机号：</div>
                        <div class="form-cont">
                            <input type="text" name="student.phone" placeholder="输入手机号" class="form-control form-boxed" style="width:300px;" />
                        </div>
                        ${errors.phone[0]}
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label">杭电账号：</div>
                        <div class="form-cont">
                            <input type="text" name="student.hdu" placeholder="输入杭电OJ账号" class="form-control form-boxed" style="width:300px;" />
                        </div>
                        ${errors.hdu[0]}
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label"></div>
                        <div class="form-cont">
                            <input type="submit" class="btn btn-primary" value="修改" />
                            <input type="reset" class="btn btn-primary" value="重置" />
                        </div>
                    </div>
                </form>
            </div>
            <!--开始::结束-->
        </main>
        <footer class="btm-ft">
            <p class="clear">
                <span class="fl">©Copyright 2018 <a href="">University of Jinan ACM-ICPC Laboratory</a></span>
                <span class="fr text-info">
                    <em class="uppercase">
                        <i class="icon-user"></i>
                        author:Yongpeng Xie
                    </em> |
                    <em class="uppercase"><i class="icon-envelope-alt"></i>
                        xieyongpeng@mail.ujn.edu.cn
                    </em>
                </span>
            </p>
        </footer>
    </div>
</div>
</body>
</html>
