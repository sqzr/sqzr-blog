<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%@ taglib prefix="div" uri="/divtag" %>
<s2:include value="common/sqzr_header.jsp"/>
<script src="/javascripts/jquery.validator.js"></script>
<script src="/javascripts/zh_CN.js"></script>
<link href="/stylesheets/jquery.validator.css" rel="stylesheet" type="text/css">
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
            <s2:if test="article.allowcomment == true">
            <div id="comments">
                <ol class="comment-list">
                    <s2:if test="article.comments.size > 0">
                    <%--<h3>已有 <s2:property value="article.comments.size"/> 条评论</h3>--%>
                    <s2:iterator value="article.comments">
                        <s2:if test="status == 'approved'">
                        <li id="comment-<s2:property value="id"/>" class="comment-body comment-parent comment-odd">
                            <div class="comment-author">
                                <img class="avatar"
                                     src="https://ruby-china.org/avatar/<div:md5><s2:property value="mail"/></div:md5>?s=32&r=G&d="
                                     alt="<s2:property value="author"/>" width="32" height="32"> <cite class="fn"><s2:property value="author"/></cite>
                            </div>
                            <div class="comment-meta">
                                <a href="#comment-<s2:property value="id"/>"><s2:date
                                        name="created" format="yyyy-MM-dd HH:mm:ss"/></a>
                            </div>
                                <div class="comment-content"><s2:property value="text"/></div>
                            <div class="comment-reply">
                            </div>
                        </li>
                        </s2:if>
                    </s2:iterator>
                </ol>
                </s2:if>
                <form id="comment-form">
                <div class="comment-add">
                    <p>
                        <label for="author" class="required" style="float: left;">称呼</label><span style="float: left;margin-top: 0px;" class="msg-box n-right" for="author"></span>
                        <input type="text" name="author" id="author" class="text" value="${cookie.author.value}"
                               data-rule="称呼:required;filter;length[1~16]">
                    </p>

                    <p>
                        <label for="mail" class="required" style="float: left;">Email</label><span style="float: left;margin-top: 0px;" class="msg-box n-right" for="mail"></span>
                        <input type="email" name="mail" id="mail" class="text" value="${cookie.mail.value}"
                               data-rule="Email:required;email;filter;length[2~50]" data-tip="邮箱不会显示给访客">
                    </p>

                    <p>
                        <label for="url" style="float: left;">网站</label><span style="float: left;margin-top: 0px;" class="msg-box n-right" for="url"></span>
                        <input type="url" name="url" id="url" class="text" value="${cookie.url.value}"
                               placeholder="http://" data-rule="Url:url;filter" data-tip="不是必填项">
                    </p>

                    <p>
                        <label for="text" class="required" style="float: left;">内容</label><span style="float: left;margin-top: 0px;" class="msg-box n-right" for="text"></span>
                        <textarea rows="8" cols="50" name="text" id="text" class="textarea" data-rule="内容:required;length[6~500]"></textarea>
                    </p>

                    <p>
                        <button id="add-comment"class="button button-rounded button-flat-primary">提交评论</button>
                    </p>
                </div>

            </form>
            </div>
            </s2:if>
                        <a style="display: none;" id="jump"></a>
                    </p>
                </div>
            </div>

        </div>
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
                $("#comment-form").on('valid.form',function() {
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
                            if (data.status == true) {
                                window.location.reload("#comment-" + data.id);
                            } else {
                                swal("Oops..", data.tips, "error")
                            }
                        }
                    });
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