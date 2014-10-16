<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/10/12
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<s2:include value="common/header.jsp"/>
<div class="container">
    <s2:include value="common/sipder.jsp"/>
    <div class="mid-col">
        <div class="mid-col-container">
            <div id="content" class="inner">
                <section class="archives">
                    <s2:iterator value="articles">
                        <article itemprop="blogPost" itemscope="" itemtype="https://schema.org/BlogPosting">
                            <div class="meta">
                            <span class="date"><time datetime="<s2:date name="date" format="yyyy-MM-dd HH:mm:ss"/>" itemprop="datePublished"><s2:date name="date" format="yyyy-MM-dd"/>
                            </time></span>
                                <br>
		<span class="tags">
	<a class="category" href="/category/<s2:property value="category.uri"/>.txt"><s2:property value="category.name"/></a>
</span>
                            </div>
                            <h1 class="title" itemprop="name"><a href="/blog/<s2:property value="uri"/>.txt"><s2:property value="title"/></a>
                            </h1>
                        </article>
                    </s2:iterator>
                </section>
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