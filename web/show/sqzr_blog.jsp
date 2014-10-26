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
            <div id="comments">
                <ol class="comment-list">
                    <s2:if test="article.comments.size > 0">
                    <h3>已有 <s2:property value="article.comments.size"/> 条评论</h3>
                    <s2:iterator value="article.comments">
                        <li id="comment-<s2:property value="id"/>" class="comment-body comment-parent comment-odd">
                            <div class="comment-author">
                                <img class="avatar"
                                     src="http://1.gravatar.com/avatar/fb5f46e1f4f2dcfe2edace4fd8d45267?s=32&amp;r=G&amp;d="
                                     alt="234234" width="32" height="32"> <cite class="fn">234234</cite>
                            </div>
                            <div class="comment-meta">
                                <a href="#comment-<s2:property value="id"/>51"><s2:date
                                        name="created" format="yyyy-MM-dd HH:mm:ss"/></a>
                            </div>
                            <div class="comment-content"><s2:property value="text"/></div>
                            <div class="comment-reply">
                                <%--<a href="http://typecho.sqzr.cc/index.php/archives/14/?replyTo=12#respond-post-14"--%>
                                   <%--rel="nofollow" onclick="return TypechoComment.reply('comment-12', 12);">回复</a>--%>
                            </div>
                        </li>
                    </s2:iterator>
                </ol>
                </s2:if>
                <div class="comment-add">
                    <p>
                        <label for="author" class="required">称呼</label>
                        <input type="text" name="author" id="author" class="text" value="234234" required="">
                    </p>

                    <p>
                        <label for="mail" class="required">Email</label>
                        <input type="email" name="mail" id="mail" class="text" value="234234@qq.com" required="">
                    </p>

                    <p>
                        <label for="url">网站</label>
                        <input type="url" name="url" id="url" class="text" placeholder="http://" value="">
                    </p>

                    <p>
                        <label for="text" class="required">内容</label>
                        <textarea rows="8" cols="50" name="text" id="text" class="textarea" required=""></textarea>
                    </p>

                    <p>
                        <button id="add-comment"class="button button-rounded button-flat-primary">提交评论</button>
                        <a style="display: none;" id="jump"></a>
                    </p>
                </div>
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
            $("#add-comment").click(function () {
                addComment();
            });
            function addComment(params) {
                var params = {
                    "a_id": <s2:property value="article.id"/>,
                    "parent": 0,
                    "author": $("#author").val(),
                    "mail": $("#mail").val(),
                    "url": $("#url").val(),
                    "text": $("#text").val()
                }
                $.ajax({
                    type: "post",
                    url: "/comment.html",
                    dataType: 'json',
                    data: JSON.stringify(params),
                    contentType: 'application/json',
                    success: function (data) {
                        if(data.status == true) {
//                            $("#jump").attr("href", "#comment-" + data.id);
//                            $("#jump").click();
                            window.location.reload("#comment-"+data.id);
//                            location.href = "#comment-29";
                        }else {
                            swal("Oops..",data.tips, "error")
                        }
                    }
                });
            }
        </script>

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