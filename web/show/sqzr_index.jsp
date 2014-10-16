<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%@ taglib prefix="div" uri="/divtag" %>
<s2:include value="common/sqzr_header.jsp"/>
<div class="container">
    <s2:include value="common/sqzr_sipder.jsp"/>
    <div class="mid-col">
        <div class="mid-col-container">
            <div id="content" class="inner">
                <div itemscope="" itemtype="http://schema.org/Blog">
                    <s2:iterator value="articlePage">
                        <article class="post" itemprop="blogPost" itemscope="" itemtype="http://schema.org/BlogPosting">
                            <div class="meta">
                                <div class="date">
                                    <time datetime="<s2:date name="date" format="yyyy-MM-dd HH:mm:ss"/>" data-updated="true" itemprop="datePublished">
                                        <s2:date name="date" format="yyyy-MM-dd HH:mm"/>
                                    </time>
                                </div>
                                <div class="tags">
                                    <a class="category" href="category/<s2:property value="category.uri"/>.txt"><s2:property value="category.name"/></a>
                                </div>
                            </div>
                            <h1 class="title" itemprop="name"><a
                                    href="blog/<s2:property value="uri"/>.txt"
                                    itemprop="url"><s2:property value="title"/></a></h1>
                            <div class="entry-content" itemprop="articleBody">
                                <div:markdown><div:htmlmoresplit><s2:property value="content" escape="false"/></div:htmlmoresplit></div:markdown>
                                <a href="blog/<s2:property value="uri"/>.txt"
                                   class="more-link">Read on →</a>
                            </div>

                        </article>
                    </s2:iterator>
                </div>
                <nav id="pagenavi">
                    <s2:set name="nextPage" value="articlePage.pageNum + 1"/>
                    <s2:set name="previousPage" value="articlePage.pageNum - 1"/>
                    <s2:if test="articlePage.pageNum > 1">
                        <s2:if test="articlePage.pageNum == 2">
                            <a href="/" class="prev">Prev</a>
                        </s2:if>
                        <s2:else>
                            <a href="page/<s2:property value="#previousPage"/>.txt" class="prev">Prev</a>
                        </s2:else>
                    </s2:if>
                    <s2:if test="articlePage.endRow < articlePage.total">
                    <a href="page/<s2:property value="#nextPage"/>.txt" class="next">Next</a>
                    </s2:if>
                    <div class="center"><a href="blog/archives">Blog Archives</a></div>
                </nav>
            </div>
        </div>
        <footer id="footer" class="inner"><p>
            Copyright © 2014 - sqzr
        </p>

        </footer>
        <script src="//dn-sqzr.qbox.me/javascripts/slash.js"></script>

        <script src="//dn-sqzr.qbox.me/javascripts/jquery.fancybox.pack.js"></script>
        <script type="text/javascript">
            (function ($) {
                $('.fancybox').fancybox();
            })(jQuery);
        </script>
        <!-- Delete or comment this line to disable Fancybox -->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-50395475-1']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();
        </script>

    </div>
</div>

</body>
</html>