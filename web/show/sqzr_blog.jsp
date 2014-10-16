<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%@ taglib prefix="div" uri="/divtag" %>
<s2:include value="common/sqzr_header.jsp"/>
<div class="container">
    <s2:include value="common/sqzr_sipder.jsp"/>
    <div class="mid-col">
        <div class="mid-col-container">
            <div id="content" class="inner">
                <article class="post" itemscope="" itemtype="https://schema.org/BlogPosting">
                    <h1 class="title" itemprop="name"><s2:property value="article.title"/></h1>

                    <div class="entry-content" itemprop="articleBody">
                        <div:markdown><s2:property value="article.content" escape="false"/></div:markdown>
                    </div>
                </article>
            </div>
        </div>
        <footer id="footer" class="inner"><p>
            Copyright © 2014 - sqzr
        </p>
        </footer>
        <script src="https://dn-sqzr.qbox.me/javascripts/slash.js"></script>
        <script src="https://dn-sqzr.qbox.me/javascripts/jquery.fancybox.pack.js"></script>
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