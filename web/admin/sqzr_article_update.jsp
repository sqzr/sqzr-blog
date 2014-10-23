<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/9/13
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/sqzr_header-main.jsp" %>
<link rel="stylesheet" href="/stylesheets/chosen.css">
<link rel="stylesheet" href="/stylesheets/jquery-ui.css">
<link rel="stylesheet" href="/stylesheets/jquery-ui-timepicker-addon.css">
<script src="/javascripts/jquery-ui.js"></script>
<script src="/javascripts/jquery-ui-timepicker-addon.js"></script>
<script src="/javascripts/jquery-ui-timepicker-zh-CN.js"></script>
<script src="/javascripts/bootstrap-datepicker.zh-CN.js"></script>

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
                    <li class="active">修改文章</li>
                </ul>
                <!-- .breadcrumb -->
            </div>
            <div class="page-content">
                <div class="page-header">
                    <h1>修改文章<small><i class="icon-double-angle-right"></i>  id:<s2:property value="id"/></small></h1>
                </div>
                <div class="form-group" style="height: 50px;">
                    <div class="row" style="height: 40px;">
                        <div class="col-xs-12 titleFrom">
                            <input type="hidden" value="<s2:property value="article.id"/>" id="articleId" />
                            <input type="text" value="<s2:property value="article.title"/>" placeholder="标题" id="title" class="col-xs-12" />
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
                                                  rows="30" style="resize: none;"><s2:property value="article.content"/></textarea></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="widget-box">
                            <div class="widget-header header-color-blue">
                                <h4>属性</h4>
                                 <span class="widget-toolbar">
														<a href="#" data-action="settings">
                                                            <i class=""></i>
                                                        </a>
														<a href="#" data-action="reload">
                                                            <i class="icon-refresh category-refresh"></i>
                                                        </a>
								</span>
                            </div>

                            <div class="widget-body"><div class="widget-body-inner" style="display: block;">
                                <div class="widget-main">
                                    <div>
                                        <label for="date">发表日期:</label>
                                        <input class="form-control black" value="<s2:date name="article.date" format="yyyy-MM-dd HH:mm"/>" type="text" id="date">
                                    </div>
                                    <hr>
                                    <div>
                                        <label for="uri">URI:</label>
                                        <input class="form-control black" value="<s2:property value="article.uri"/>" type="text" id="uri">
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
                                            <input type="hidden" value="<s2:property value='article.category.id'/>" id="oldcid"/>
                                            <input type="hidden" value="<s2:property value="article.category.id"/>" id="currentid"/>
                                            <input type="hidden" value="<s2:property value="article.category.name"/>" id="currentname"/>
                                            <select class="width-80 chosen-select" id="c_id" data-placeholder="" style="display: none;">
                                                <option value=""></option>
                                                <s2:iterator value="categories">
                                                    <option value="<s2:property value="id"/>"><s2:property value="name"/></option>
                                                </s2:iterator>
                                            </select>
                                        </s2:else>
                                    </div>
                                    <hr>
                                    <div class="clearfix">
                                        <div style="text-align: right;">
                                            <button id="btn-draft" class="btn" type="button">
                                                保存草稿
                                            </button>
                                            <button id="btn-update" class="btn btn-info" type="button">
                                                发布文章
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
</div>
<script type="text/javascript">
    $(function() {
        $( "#date" ).datetimepicker({
            language: "zh-CN",
            constrainInput: true,
            showMonthAfterYear: true,
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            gotoCurrent: true,
            dateFormat: "yy-mm-dd"
        });
    });
    $(".chosen-select").chosen({
        width: "100%",
        no_results_text: "没有找到!"
    });
    $("#c_id option[value='<s2:property value="article.category.id"/>']").attr("selected", true);
    $(".chosen-single span").text("<s2:property value="article.category.name"/>");
    $(document).ready(function () {
        $("#btn-update").click(function () {
            update();
        });
        $("#btn-draft").click(function(){
           draft();
        });
        $(".category-refresh").click(
                function(){
                    $.ajax({
                        type:"get",
                        url:"/ajax/admin/main_category_list.html",
                        success: function (data) {
                            $(".chosen-select").html("");
                            for (var category in data.categories)
                            {
                                $(".chosen-select").append("<option value=\""+data.categories[category].id+"\">"+data.categories[category].name+"</option>");
                            }
                            $(".chosen-select").trigger("chosen:updated");
                            var currentid = $("#oldcid").val();
                            var currentname = $("#currentname").val();
                            $("#c_id option[value='"+currentid+"']").attr("selected", true);
                            $(".chosen-single span").text(""+currentname+"");
                        }
                    });
                }
        )
    });
    function update() {
        var params = {
            "title": $("#title").val(),
            "content": $("#content").val() ,
            "uri":$("#uri").val(),
            "id":$("#articleId").val(),
            "date":$("#date").val(),
            "oldcid":$("#oldcid").val(),
            "newcid":$("#c_id").val()
        };
        $.ajax({
            type: "post",
            url: "/ajax/admin/main_article_update.html",
            dataType: 'json',
            data: JSON.stringify(params),
            beforeSend: function () {
                $("#btn-update").attr('disabled', "true");
            },
            complete: function () {
                $("#btn-update").removeAttr("disabled");
            },
            contentType: 'application/json',
            success: function (data) {
                if (data.status == true) {
                    myAlert(data.tips,"info");
                    $("#oldcid").val($("#c_id").val());
                    $("#currentname").val($(".chosen-single span").text());
                }else if(data.status == false){
                    myAlert(data.tips, "error");
                }
                $('body,html').animate({scrollTop:0},1000);
            }
        });
    }
    function draft() {
        var params = {
            "title": $("#title").val(),
            "content": $("#content").val() ,
            "uri":$("#uri").val(),
            "id":$("#articleId").val(),
            "date":$("#date").val(),
            "oldcid":$("#oldcid").val(),
            "newcid":$("#c_id").val(),
            "type":"post_draft"
        };
        $.ajax({
            type: "post",
            url: "/ajax/admin/main_article_update.html",
            dataType: 'json',
            data: JSON.stringify(params),
            beforeSend: function () {
                $("#btn-draft").attr('disabled', "true");
            },
            complete: function () {
                $("#btn-draft").removeAttr("disabled");
            },
            contentType: 'application/json',
            success: function (data) {
                if (data.status == true) {
                    myAlert(data.tips,"info");
                    $("#oldcid").val($("#c_id").val());
                    $("#currentname").val($(".chosen-single span").text());
                }else if(data.status == false){
                    myAlert(data.tips, "error");
                }
                $('body,html').animate({scrollTop:0},1000);
            }
        });
    }
</script>