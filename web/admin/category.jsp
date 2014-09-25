<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/9/18
  Time: 11:33
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
                    <li class="active">分类管理</li>
                </ul>
                <!-- .breadcrumb -->
            </div>
            <div class="page-content">
                <div class="page-header">
                    <h1>
                        分类
                        <small>
                            <i class="icon-double-angle-right"></i>
                            管理
                        </small>
                    </h1>
                </div>
                <div class="alert alert-block hidden" id="add-tips">
                    <button type="button" class="close" id="close-add-tips">
                        <i class="icon-remove"></i>
                    </button>
                    <i class="icon-ok green"></i>
                    <font id="add-tips-text">
                    </font>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="col-xs-7">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="smaller">
                                        分类列表
                                    </h4>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">
                                        <div class="table-responsive">
                                            <s2:if test="categories.size()==0">
                                                <div class="error-container">
                                                    <div class="well">
                                                        <h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="icon-sitemap"></i>
												你还没有分类呢
											</span>
                                                        </h1>
                                                        <hr>
                                                        <div class="space"></div>

                                                    </div>
                                                </div><!-- PAGE CONTENT ENDS -->
                                                </s2:if>
                                            <s2:else>
                                            <table id="sample-table-1"
                                                   class="table table-striped table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th>名称</th>
                                                    <th>URI</th>
                                                    <th></th>
                                                </tr>
                                                </thead>

                                                <tbody>
                                                <s2:iterator value="categories">
                                                <tr class="category-<s2:property value="id"/>">
                                                    <td class="category-name">
                                                        <s2:property value="name"/>
                                                    </td>
                                                    <td class="category-uri"><s2:property value="uri"/> </td>
                                                    <td>
                                                        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                                            <a href="javascript:void(0)"
                                                               onclick="update(<s2:property value="id"/>)" class="btn btn-xs btn-info">
                                                                <i class="icon-edit bigger-120"></i>
                                                            </a>

                                                            <a href="javascript:void(0)"
                                                               onclick="deleteCategoryConfirm(<s2:property value="id"/>)" class="btn btn-xs btn-danger">
                                                                <i class="icon-trash bigger-120"></i>
                                                            </a>
                                                        </div>

                                                        <div class="visible-xs visible-sm hidden-md hidden-lg">
                                                            <div class="inline position-relative">
                                                                <button class="btn btn-minier btn-primary dropdown-toggle"
                                                                        data-toggle="dropdown">
                                                                    <i class="icon-cog icon-only bigger-110"></i>
                                                                </button>

                                                                <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                                                                    <li>
                                                                        <a href="javascript:void(0)"
                                                                           onclick="update(<s2:property value="id"/>)" class="tooltip-info"
                                                                           data-rel="tooltip"
                                                                           title="" data-original-title="View">
																				<span class="blue">
																					<i class="icon-zoom-in bigger-120"></i>
																				</span>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)"
                                                                           onclick="deleteCategoryConfirm(<s2:property value="id"/>)" class="tooltip-error"
                                                                           data-rel="tooltip"
                                                                           title="" data-original-title="Delete">
																				<span class="red">
																					<i class="icon-trash bigger-120"></i>
																				</span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </s2:iterator>
                                                </tbody>
                                            </table>
                                            </s2:else>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /span -->

                        <div class="col-xs-5">
                            <div class="widget-box">
                                <div class="widget-body">
                                    <div class="widget-main" style="border-top: 1px solid #CCC;">
                                        <form id="target" class="form-horizontal"
                                              style="background-color: rgb(255, 255, 255);">
                                            <fieldset>
                                                <div id="legend" class="component" rel="popover" trigger="manual"
                                                     data-original-title="Form Title"
                                                     style="border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;">
                                                    <legend class="valtype" id="update-tips" data-valtype="text">添加分类</legend>
                                                </div>
                                                <div class="control-group component" data-type="text" rel="popover"
                                                     trigger="manual"
                                                     style="border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;">

                                                    <!-- Text input-->
                                                    <label class="control-label valtype" for="name"
                                                           data-valtype="label">名称</label>

                                                    <div class="space-4"></div>
                                                    <div class="controls">
                                                        <input id="update-id" type="hidden" name="id" value="" />
                                                        <input type="text" placeholder="" id="name"
                                                               class="input-xlarge valtype" data-valtype="placeholder"  style="width: 100%">

                                                        <p class="help-block valtype" data-valtype="help"></p>
                                                    </div>
                                                </div>

                                                <div class="control-group component" data-type="text" rel="popover"
                                                     trigger="manual"
                                                     style="border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;">

                                                    <!-- Text input-->
                                                    <label class="control-label valtype" for="uri" data-valtype="label">URI</label>

                                                    <div class="space-4"></div>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" id="uri"
                                                               class="input-xlarge valtype" data-valtype="placeholder" style="width: 100%">

                                                        <p class="help-block valtype" data-valtype="help"></p>
                                                    </div>
                                                </div>

                                                <div class="control-group component" rel="popover" trigger="manual">
                                                    <label class="control-label valtype" data-valtype="label"></label>

                                                    <!-- Button -->
                                                    <div style="float:right;" class="controls valtype" data-valtype="button">
                                                        <button onclick="work_add()" class="btn btn-info category-add" id="category-button" type="button">
                                                            <i class="icon-ok bigger-110"></i>
                                                            <span id="button-text">Save</span>
                                                        </button>
                                                    </div>
                                                </div>

                                            </fieldset>
                                         </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /span -->
                </div>
            </div>
        </div>
    </div>
    <script src="/javascripts/bootbox.min.js"></script>
    <script type="text/javascript">
        function deleteCategoryConfirm(id) {
            bootbox.dialog({
                message:"确定要删除么?",
                title:"提示",
                buttons:{
                    no : {
                        label: "离开",
                        className: "btn-default"
                    },
                    ok : {
                        label: "删除",
                        className: "btn-primary",
                        callback: function() {
                            window.location.href='/admin/main_category_delete.html?id=' + id;
                        }
                    }
                }
            });
        }

        $(document).ready(function () {
            $("#close-add-tips").click(function () {
                $("#add-tips").addClass("hidden");
            });
        });

        function work_add(){
            var params = {
                "name": $("#name").val(),
                "uri": $("#uri").val()
            };
            $.ajax({
                type: "post",
                url: "/ajax/admin/main_category_add.html",
                dataType: 'json',
                data: JSON.stringify(params),
                beforeSend: function () {
                    $(".category-add").attr('disabled', "true");
                },
                complete: function () {
                    $(".category-add").removeAttr("disabled");
                },
                contentType: 'application/json',
                success: function (data) {
                    $("#add-tips").removeClass("hidden");
                    if (data.status == true) {
                        //添加成功
                        $("#add-tips").addClass("alert-success");
                        $("#add-tips-text").text("");
                        $("#add-tips-text").append(data.tips+"&nbsp;&nbsp;<a href='#' onclick='window.location.reload()'>点击刷新</a>");

                    } else if (data.status == false) {
                        //添加失败
                        $("#add-tips").addClass("alert-error");
                        $("#add-tips-text").text("");
                        $("#add-tips-text").append(data.tips);
                    }
                    $('body,html').animate({scrollTop:0},1000);
                }
            });
        }

        function work_update(){
            var params = {
                "name": $("#name").val(),
                "uri": $("#uri").val(),
                "id": $("#update-id").val()
            };
            $.ajax({
                type: "post",
                url: "/ajax/admin/main_category_update.html",
                dataType: 'json',
                data: JSON.stringify(params),
                beforeSend: function () {
                    $(".category-update").attr('disabled', "true");
                },
                complete: function () {
                    $(".category-update").removeAttr("disabled");
                },
                contentType: 'application/json',
                success: function (data) {
                    $("#add-tips").removeClass("hidden");
                    if (data.status == true) {
                        //修改成功
                        $("#add-tips").addClass("alert-success");
                        $("#add-tips-text").text("");
                        $(".category-"+params['id']+" .category-uri").text(params['uri']);
                        $(".category-"+params['id']+" .category-name").text(params['name']);
                        $("#add-tips-text").append(data.tips+"&nbsp;&nbsp;<a href='#' onclick='window.location.reload()'>点击刷新</a>");

                    } else if (data.status == false) {
                        //添加失败
                        $("#add-tips").addClass("alert-error");
                        $("#add-tips-text").text("");
                        $("#add-tips-text").append(data.tips);
                    }
                    $('body,html').animate({scrollTop:0},1000);
                }
            });
        }

        function update(id) {
            var name = $(".category-"+id+" .category-name").text().trim();
            var uri = $(".category-"+id+" .category-uri").text().trim();
            $("#update-tips").text("修改分类 id:"+id);
            $("#update-tips").append("&nbsp;&nbsp;<a style='font-size: 10px' href='javascript:void(0)' onclick='switchAdd()'>切换到添加</a>");
            $("#update-id").val(id);
            $("#name").val(name);
            $("#uri").val(uri);
            $("#button-text").text("修改");
            $("#category-button").attr("onclick","work_update()");
        }

        function switchAdd() {
            $("#update-tips").text("添加分类");
            $("#name").val("");
            $("#uri").val("");
            $("#button-text").text("添加");
            $("#category-button").attr("onclick","work_add()");
        }

   
    </script>
</div>