<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%--<s2:debug/>--%>
<html>
<head>
    <meta charset="utf-8">
    <title><s2:property value="options.title.value"/></title>
    <meta name="author" content="<s2:property value="options.author.value"/>">
    <meta name="description" content="<s2:property value="options.htmldescription.value"/>">
    <!-- http://t.co/dKP3o1e -->
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<s2:property value="options.url.value"/>/atom.xml" rel="alternate" title="sqzr's blog" type="application/atom+xml">
    <link href="<s2:property value="options.url.value"/>/favicon.ico" rel="shortcut icon">
    <link href="/stylesheets/screen.css" media="screen, projection" rel="stylesheet"
          type="text/css">
    <link rel="canonical" href="<s2:property value="options.url.value"/>">
    <!--[if IE]>
    <script src="//dn-sqzr.qbox.me/javascript/html5.js"></script>
    < ![endif]-->
    <%--<script type="text/javascript" async="" src="//ssl.google-analytics.com/ga.js"></script>--%>
    <script src="//dn-sqzr.qbox.me/javascript/jquery.js"></script>
    <script src="//dn-sqzr.qbox.me/javascript/pace.js"></script>
    <script src="//dn-sqzr.qbox.me/javascript/highlight.js"></script>
    <link href="//dn-sqzr.qbox.me/stylesheet/github.css" rel="stylesheet" type="text/css">
    <link href="//dn-sqzr.qbox.me/pace.css" rel="stylesheet" type="text/css">
</head>

<script>hljs.initHighlightingOnLoad();</script>
<body class="pace-done">
<div class="pace  pace-inactive">
    <div class="pace-progress" data-progress-text="100%" data-progress="99" style="width: 100%;">
        <div class="pace-progress-inner"></div>
    </div>
    <div class="pace-activity"></div>
</div>