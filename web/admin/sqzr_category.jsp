<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/9/18
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/sqzr_header-main.jsp" %>
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
                <div class="row">
                    <div class="col-xs-12">
                        <div class="col-xs-7">
                            <div class="widget-box">
                                <div class="widget-header header-color-blue">
                                    <h4 class="smaller">
                                        分类列表
                                    </h4>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main" style="padding: 0px;">
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
                                                    <th>文章数</th>
                                                    <th></th>
                                                </tr>
                                                </thead>

                                                <tbody>
                                                <s2:iterator value="categories">
                                                <tr class="category-<s2:property value="id"/>">
                                                    <td class="category-name">
                                                            <span class="value"><s2:property value="name"/></span>
                                                            <span class="label label-sm label-inverse arrowed-in default"><s2:if test="type == 'default'">默认</s2:if></span>
                                                    </td>
                                                    <td class="category-uri"><span class="value"><s2:property value="uri"/></span></td>
                                                    <td class="category-count"><a href="/admin/main_category_list.html?id=<s2:property value="id"/>"><s2:property value="count"/></a></td>
                                                    <td>
                                                        <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                                            <a href="javascript:void(0)"
                                                               onclick="update(<s2:property value="id"/>)" class="green">
                                                                <i class="icon-pencil bigger-100"></i>
                                                            </a>
                                                            <a href="javascript:void(0)"
                                                               onclick="setDefault(<s2:property value="id"/>)" class="orange">
                                                                <i class="icon-flag bigger-100"></i>
                                                            </a>
                                                            <a href="javascript:void(0)"
                                                               onclick="deleteCategoryConfirm(<s2:property value="id"/>)" class="red">
                                                                <i class="icon-trash bigger-100"></i>
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
                                                                           title="" data-original-title="edit">
																				<span class="blue">
																					<i class="icon-edit bigger-120"></i>
																				</span>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:void(0)"
                                                                           onclick="setDefault(<s2:property value="id"/>)" class="tooltip-error"
                                                                           data-rel="tooltip"
                                                                           title="" data-original-title="Delete">
																				<span class="red">
																					<i class="icon-flag bigger-120"></i>
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
                                <div class="widget-header header-color-blue">
                                    <h4 id="update-tips">添加分类</h4>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <form id="target" class="form-horizontal"
                                              style="background-color: rgb(255, 255, 255);">
                                            <fieldset>
                                                <div id="legend" class="component" rel="popover" trigger="manual"
                                                     data-original-title="Form Title"
                                                     style="border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;">

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
                                                            <span id="button-text">保存</span>
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
            swal({   title: "提示", text: "确定要删除么?(如果分类下有文章,则自动移动到默认分类)", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "删除", cancelButtonText: "离开", closeOnConfirm: true, closeOnCancel: true }, function (isConfirm) {
                if (isConfirm) {
                    var params = {
                        "id": id
                    };
                    $.ajax({
                        type: "post",
                        url: "/ajax/admin/main_category_delete.html",
                        dataType: 'json',
                        data: JSON.stringify(params),
                        contentType: 'application/json',
                        success: function (data) {
                            if (data.status == true) {
                                location.reload(true);
                            } else if (data.status == false) {
                                swal({title: "错误信息",text: data.tips,type: "error",timer: 1500});
                            }
                        }
                    });
                }
            });
        }
        function setDefault(id){
            var params = {
                "id": id
            };
            $.ajax({
                type: "post",
                url: "/ajax/admin/main_category_setdefault.html",
                dataType: 'json',
                data: JSON.stringify(params),
                contentType: 'application/json',
                success: function (data) {
                    if (data.status == true) {
                        swal({title: "提示",text: data.tips,type: "success",timer: 1500});
                        $(".default").html("");
                        $(".category-"+id+" .category-name .default").html("默认");
                    } else if (data.status == false) {
                        swal({title: "提示",text: data.tips,type: "error",timer: 1500});
                    }
                    $('body,html').animate({scrollTop:0},1000);
                }
            });
        }

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
                    if (data.status == true) {
                        //添加成功
                        location.reload(true);
                    } else if (data.status == false) {
                        swal({title: "添加成功",text: data.tips,type: "error",timer: 1500});
                    }
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
                    if (data.status == true) {
                        swal({title: "修改成功",text: data.tips,type: "success",timer: 1500});
                        $(".category-"+params['id']+" .category-uri .value").text(params['uri']);
                        $(".category-"+params['id']+" .category-name .value").text(params['name']);
                    } else if (data.status == false) {
                        swal({title: "修改成功",text: data.tips,type: "error",timer: 1500});
                    }
                }
            });
        }

        function update(id) {
            var name = $(".category-"+id+" .category-name .value").text().trim();
            var uri = $(".category-"+id+" .category-uri .value").text().trim();
            $("#update-tips").text("修改分类 id:"+id);
            $("#update-tips").append("&nbsp;&nbsp;<a style='font-size: 10px;color:#FFF;' href='javascript:void(0)' onclick='switchAdd()'>切换到添加</a>");
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