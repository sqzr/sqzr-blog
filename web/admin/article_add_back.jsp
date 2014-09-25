<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/9/13
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header-main.jsp" %>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="main-container-inner">
        <%@ include file="common/sidebar.jsp" %>
        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="/admin/main_index.html">首页</a>
                    </li>
                    <li class="active">添加文章</li>
                </ul>
                <!-- .breadcrumb -->
            </div>
            <div class="page-content">
                <div class="page-header">
                    <h1>
                        文章
                        <small>
                            <i class="icon-double-angle-right"></i>
                            添加文章
                        </small>
                    </h1>
                </div>
                <div class="alert alert-block hidden" id="add-tips">
                    <button type="button" class="close" id="close-add-tips">
                        <i class="icon-remove"></i>
                    </button>
                    <i class="icon-ok green" id="add-icon"></i>
                    <font id="add-tips-text">
                    </font>
                </div>
                <div class="form-group" style="height: 70px;">
                    <div class="row" style="height: 40px;">
                    <div class="col-xs-12 titleFrom">
                        <input type="text" placeholder="标题" id="title" class="col-xs-12" />
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-xs-12 titleFrom" style="text-align: right;">
                        <input class="uriFrom col-xs-4" type="text" id="uri" placeholder="uri" name="uri"/>
                        <s2:if test="categories.size()==0">
                            <div class="col-xs-3"><div style="text-align: center;height: 32px;padding: 5px;font-size: 13px;" class="alert alert-danger" role="alert">你还没有分类&nbsp;<a href="/admin/main_category.html">管理分类</a></div></div>
                        </s2:if>
                        <s2:else>
                        <div class="col-xs-1"><label class="control-label" for="c_id">分类:</label></div>
                        <select id="c_id" name="c_id" class="categoryFrom col-xs-2" style="background-color: rgba(48, 126, 204, 0.07);">
                            <s2:iterator value="categories">
                            <option value="<s2:property value="id"/>"><s2:property value="name"/></option>
                            </s2:iterator>
                        </select>
                        </s2:else>
                    </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="widget-box editor">
                            <div class="widget-header widget-header-small header-color-blue"></div>

                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <div class="md-editor active" id="1410666678137">
                                        <textarea id="content" class="span12 md-input" name="content"
                                                  data-provide="markdown"
                                                  rows="30" style="resize: none;"></textarea></div>
                                </div>

                                <div class="widget-toolbox padding-4 clearfix">
                                    <div class="btn-group pull-right">
                                        <button id="btn-save" class="btn btn-sm btn-purple">
                                            <i class="icon-save bigger-125"></i>
                                            Save
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<script src="/javascripts/markdown.min.js"></script>
<script src="/javascripts/bootstrap-markdown.min.js"></script>
<script src="/javascripts/bootbox.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btn-save").click(function () {
            add();
        });
        $("#close-add-tips").click(function () {
            $("#add-tips").addClass("hidden");
        });
    });
    function add() { //函数 add();
        var params = {
            "title": $("#title").val(),
            "content": $("#content").val(),
            "uri":$("#uri").val(),
            "c_id":$("#c_id").val()
        };
        $.ajax({
            type: "post",
            url: "/ajax/admin/main_article_add.html",
            dataType: 'json',
            data: JSON.stringify(params),
            beforeSend: function () {
                $("#btn-save").attr('disabled', "true");
            },
            complete: function () {
                $("#btn-save").removeAttr("disabled");
            },
            contentType: 'application/json',
            success: function (data) {
                $("#add-tips").removeClass("hidden");
                $("#add-tips-text").html(data.tips);
                if (data.status == true) {
                    //添加成功
                    $("#add-tips").attr("class", "alert alert-block alert-success fade in");
                    $("#add-icon").attr("class", "icon-ok green");
                    $("#add-tips-text").append("&nbsp;&nbsp;<a href='/admin/main_article_update.html?id="+data.article_id+"'>点击编辑</a>");
                } else {
                    //添加失败
                    $("#add-tips").attr("class", "alert alert-block alert-danger fade in");
                    $("#add-icon").attr("class", "icon-warning-sign red");
                }
                $('body,html').animate({scrollTop:0},1000);
            }
        });
    }
</script>
</div>