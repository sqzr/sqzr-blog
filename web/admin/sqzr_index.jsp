<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/9/13
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/sqzr_header-main.jsp" %>
<div class="main-container" id="main-container">
<script type="text/javascript">
    try {
        ace.settings.check('main-container', 'fixed')
    } catch (e) {
    }
</script>
<div class="main-container-inner">
    <%@ include file="common/sqzr_sidebar.jsp" %>
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
                <li class="active">控制台</li>
            </ul><!-- .breadcrumb -->
        </div>
    </div>
</div>
</div>