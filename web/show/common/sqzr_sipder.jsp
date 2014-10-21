<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/10/7
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<div class="left-col">
    <div class="intrude-less">
        <header id="header" class="inner">
            <div class="profilepic">
                <img src="//dn-sqzr.qbox.me/2014-3-14.jpg" alt="sqzr" style="width: 160px;">

            </div>
            <hgroup>
                <h1><a href="<s2:property value="options.url.value"/>"><s2:property value="options.title.value"/></a></h1>
                <p class="subtitle"><s2:property value="options.subtitle.value"/></p>
            </hgroup>
            <nav id="main-nav">
                <ul class="main-navigation">
                    <li><a href="<s2:property value="options.url.value"/>">Blog</a></li>
                    <li><a href="<s2:property value="options.url.value"/>/blog/archives.shtml">Archives</a></li>
                </ul>
                <section class="aboutme">
                    <p>
                        <s2:property value="options.description.value"/>
                    </p>
                </section>
            </nav>
            <nav id="sub-nav">
                <div class="social">
                    <s2:if test="options.weibo.value != ''">
                    <a class="weibo" href="http://www.weibo.com/<s2:property value="options.weibo.value"/>" title="Weibo">新浪微博</a>
                    </s2:if>
                    <s2:if test="options.facebook.value != ''">
                        <a class="facebook" href="https://www.facebook.com/profile.php?id=<s2:property value="options.facebook.value"/>" title="Facebook">Facebook</a>
                    </s2:if>
                    <s2:if test="options.github.value != ''">
                        <a class="github" href="https://github.com/<s2:property value="options.github.value"/>" title="Github">Github</a>
                    </s2:if>
                    <s2:if test="options.twitter.value != ''">
                        <a class="twitter" href="https://twitter.com/<s2:property value="options.twitter.value"/>" title="Twitter">Twitter</a>
                    </s2:if>
                    <s2:if test="options.google.value != ''">
                        <a class="google" href="https://plus.google.com/<s2:property value="options.google.value"/>" title="Google">Google</a>
                    </s2:if>
                    <a class="rss" href="<s2:property value="options.url.value"/>/atom.xml" title="RSS">RSS</a>
                </div>
            </nav>
        </header>
    </div>
</div>