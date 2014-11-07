<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/9/13
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="div" uri="/divtag" %>
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
        <div class="row">
            <div class="col-xs-5">
                <div class="widget-box">
                    <div class="widget-header header-color-blue">
                        <h4 class="smaller">
                            最近发表的文章
                        </h4>
                    </div>

                    <div class="widget-body">
                        <div class="widget-main">
                            <div class="main-index-recent-post">
                            <ul>
                                <s2:iterator value="articlePage">
                                    <li>
                                        <span><s2:date name="date" format="MM.dd"/></span>
                                        <s2:if test="type == 'post_draft'">
                                            <a href="/admin/main_article_update.html?id=<s2:property value="id"/>" title="点击编辑"><div:length num="25"><s2:property value="title"/></div:length></a>
                                            <span style="border:0px;margin:0;padding:0;">草稿</span>
                                        </s2:if>
                                        <s2:if test="type == 'post'">
                                                <a href="/blog/<s2:property value="uri"/>.shtml" target="_blank" title="点击游览"><div:length num="25"><s2:property value="title"/></div:length></a>
                                        </s2:if>
                                    </li>
                                </s2:iterator>
                            </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /span -->
            <div class="col-xs-5">
                <div class="widget-box">
                    <div class="widget-header header-color-blue">
                        <h4 class="smaller">最近得到的回复</h4>
                    </div>

                    <div class="widget-body">
                        <div class="widget-main">
                            <div class="main-index-recent-comment">
                            <ul>
                                <s2:iterator value="comments">
                                    <li>
                                        <span><s2:date name="created" format="MM.dd"/></span>
                                        <s2:if test="status == 'approved'">
                                            <a href="/blog/<s2:property value="article.uri"/>.shtml" target="_blank">
                                                <div:length num="14"><s2:property value="article.title"/></div:length>
                                            </a>:
                                        </s2:if>
                                        <s2:else>
                                            <a href="/admin/main_comment.html?aid=<s2:property value="article.id"/>&type=approved">
                                                <div:length num="14"><s2:property value="article.title"/></div:length>
                                            </a>:
                                        </s2:else>
                                        <div:length num="15"><s2:property value="text"/></div:length>
                                        <s2:if test="status == 'waiting'">
                                            <span style="border:0px;margin:0;padding:0;">待审核</span>
                                        </s2:if>
                                        <s2:if test="status == 'spam'">
                                            <span style="border:0px;margin:0;padding:0;">垃圾</span>
                                        </s2:if>
                                    </li>
                                </s2:iterator>
                            </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /span -->
        </div>
    </div>
</div>
</div>
</body>
</html>