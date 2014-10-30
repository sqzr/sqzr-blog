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
<s2:include value="sqzr_header-main.jsp"/>


<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="main-container-inner">
        <s2:include value="sqzr_sidebar.jsp"/>
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
												<i class="icon-sitemap"></i>
												404
											</span>
                                    Page Not Found
                                </h1>

                                <hr>

                                <div>
                                    <div class="space"></div>
                                    <h4 class="smaller">请尝试以下操作:</h4>

                                    <ul class="list-unstyled spaced inline bigger-110 margin-15">
                                        <li>
                                            <i class="icon-hand-right blue"></i>
                                            检查url参数是否正常传值
                                        </li>

                                        <li>
                                            <i class="icon-hand-right blue"></i>
                                            联系我们
                                        </li>
                                    </ul>
                                </div>

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
                        </div><!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div>
        </div>
    </div>
</div>
