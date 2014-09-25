<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/9/13
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Title and other stuffs -->
    <title>尼玛,出错了 - sqzr's blog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Stylesheets -->
    <link href="/stylesheets/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/stylesheets/font-awesome.min.css" />
    <link rel="stylesheet" href="/stylesheets/ace.min.css" />
    <link rel="stylesheet" href="/stylesheets/ace-rtl.min.css" />
    <link rel="stylesheet" href="/stylesheets/messenger-theme-air.css" />
    <link rel="stylesheet" href="/stylesheets/messenger.css" />
    <link rel="stylesheet" href="/stylesheets/diy-style.css" />
    <link rel="stylesheet" href="/stylesheets/dropzone.css" />

    <!-- js -->
    <script src="http://cdn.staticfile.org/jquery/2.0.3/jquery.min.js"></script>
    <script src="/javascripts/messenger.min.js"></script>
    <script src="/javascripts/bootstrap.min.js"></script>
    <script src="/javascripts/typeahead-bs2.min.js"></script>
    <script src="/javascripts/dropzone.min.js"></script>
    <script src="/javascripts/ace-elements.min.js"></script>
    <script src="/javascripts/ace.min.js"></script>
</head>
<body>
<div class="navbar navbar-default" id="navbar" style="height: 10px;">
    <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed')}catch(e){}
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="/admin/main_index.html" class="navbar-brand">
                <small>
                    ( ˘ ³˘) 后台管理哒
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">

                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="<s2:property value="#session.user.avatar"/> " alt="Jason's Photo" />
								<span class="user-info">
									<small>欢迎光临,</small>
									<s2:property value="#session.user.username" />
								</span>

                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="icon-cog"></i>
                                设置
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="icon-user"></i>
                                个人资料
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="/admin/user_logout.html">
                                <i class="icon-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul><!-- /.ace-nav -->
        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>


<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed');
                } catch (e) {
                }
            </script>
            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <a class="btn btn-success" href="#">
                        <i class="icon-signal"></i>
                    </a>

                    <a class="btn btn-info" href="/admin/main_article_add.html">
                        <i class="icon-pencil"></i>
                    </a>

                    <a class="btn btn-warning" href="#">
                        <i class="icon-group"></i>
                    </a>
                </div>
            </div>
            <!-- #sidebar-shortcuts -->

            <ul class="nav nav-list">
                <li>
                    <a href="/admin/main_index.html">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text"> 控制台 </span>
                    </a>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-edit"></i>
                        <span class="menu-text"> 文章管理 </span>
                        <b class="arrow icon-angle-down"></b>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a href="/admin/main_article_list.html">
                                <i class="icon-double-angle-right"></i>
                                文章列表
                            </a>
                        </li>

                        <li>
                            <a href="/admin/main_article_add.html">
                                <i class="icon-double-angle-right"></i>
                                添加文章
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/admin/main_category.html">
                        <i class="icon-list"></i>
                        <span class="menu-text"> 分类管理 </span>
                    </a>
                </li>
            </ul>
            <!-- /.nav-list -->

        </div>
        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="/admin/main_index.html">首页</a>
                    </li>
                    <li class="active">错误</li>
                </ul><!-- .breadcrumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <div class="error-container">
                            <div class="well">
                                <h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="icon-random"></i>
												500
											</span>
                                    系统错误
                                </h1>

                                <hr>
                                <h3 class="lighter smaller">
                                    <i class="icon-wrench icon-animated-wrench bigger-125"></i>
                                    如果为正常操作,请务必联系我:monkeysqzr@gmail.com
                                </h3>

                                <div class="space"></div>
                                <hr>
                                <div class="space"></div>

                                <div class="center">
                                    <a href="javascript:history.back(-1)" class="btn btn-grey">
                                        <i class="icon-arrow-left"></i>
                                        返回
                                    </a>

                                    <a href="/admin/main_index.html" class="btn btn-primary">
                                        <i class="icon-dashboard"></i>
                                        控制台
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div>
        </div>
    </div>
</div>
