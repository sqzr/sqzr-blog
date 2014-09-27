<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/9/13
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header-main.jsp" %>
<link rel="stylesheet" href="/stylesheets/chosen.css">
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
                <div class="form-group" style="height: 50px;">
                    <div class="row" style="height: 40px;">
                    <div class="col-xs-12 titleFrom">
                        <input type="text" placeholder="标题" id="title" class="col-xs-12" />
                    </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="widget-box editor">
                            <div class="widget-header widget-header-small header-color-blue"></div>

                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <div class="md-editor active" id="1410666678137">
                                        <textarea id="content" class="span12 md-input" name="content"
                                                  data-provide="markdown"
                                                  rows="30" style="resize: none;"></textarea></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="widget-box">
                            <div class="widget-header">
                                <h4>属性</h4>
                                <span class="widget-toolbar">
														<a href="#" data-action="settings">
                                                            <i class=""></i>
                                                        </a>
														<a href="#" data-action="reload">
                                                            <i class="icon-refresh category-refresh"></i>
                                                        </a>

														<%--<a href="#" data-action="collapse">--%>
                                                            <%--<i class="icon-chevron-up"></i>--%>
                                                        <%--</a>--%>

														<%--<a href="#" data-action="close">--%>
                                                            <%--<i class="icon-remove"></i>--%>
                                                        <%--</a>--%>
								</span>
                            </div>

                            <div class="widget-body"><div class="widget-body-inner" style="display: block;">
                                <div class="widget-main">
                                    <div>
                                        <label for="uri">URI:</label>
                                        <input class="form-control black" type="text" id="uri">
                                    </div>
                                    <hr>
                                    <div>
                                        <label for="c_id">分类:&nbsp;<a target="view_window" style="font-size: 8px;" href="/admin/main_category.html">管理分类</a></label>
                                        <br>
                                        <s2:if test="categories.size()==0">
                                        <select disabled class="width-80 chosen-select" id="c_id" data-placeholder="Choose a Country..." style="display: none;">
                                            <option value="">还没有分类</option>
                                        </select>
                                        </s2:if>
                                        <s2:else>
                                        <select class="width-80 chosen-select" id="c_id" data-placeholder="Choose a Country..." style="display: none;">
                                            <option value="">&nbsp;</option>
                                            <s2:iterator value="categories">
                                                <option value="<s2:property value="id"/>"><s2:property value="name"/></option>
                                            </s2:iterator>
                                        </select>
                                        </s2:else>
                                    </div>
                                    <hr>
                                    <div class="clearfix">
                                        <div style="text-align: right;">
                                            <button id="btn-save" class="btn btn-info" type="button">
                                                <i class="icon-ok bigger-110"></i>
                                                Save
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div></div>
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
<script src="/javascripts/chosen.jquery.min.js"></script>
<script type="text/javascript">
    $(".chosen-select").chosen({width: "100%"});
    $(document).ready(function () {
        $("#btn-save").click(function () {
            add();
        });
        $("#close-add-tips").click(function () {
            $("#add-tips").addClass("hidden");
        });
        $(".category-refresh").click(
                function(){
                    $.ajax({
                        type:"get",
                        url:"/ajax/admin/main_category_list.html",
                        success: function (data) {
                            $(".chosen-select").html("");
                            $(".chosen-select").append("<option value=\"\">&nbsp;</option>");
                            for (var category in data.categories)
                            {
                                $(".chosen-select").append("<option value=\""+data.categories[category].id+"\">"+data.categories[category].name+"</option>");
                            }
                            $(".chosen-select").trigger("chosen:updated");
                        }
                    });
                }
        )
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
                    $("#add-icon").attr("class", "icon-remove red");
                }
                $('body,html').animate({scrollTop:0},1000);
            }
        });
    }
</script>
</div>