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
                <li class="active">分类</li>
            </ul>
            <!-- .breadcrumb -->
        </div>
        <div class="page-content">
            <div class="page-header">
                <h1>
                    <a href="/admin/main_article_list.html">分类</a>
                    <small>
                        <i class="icon-double-angle-right"></i>
                        名称:<s2:property value="category.name"/>
                    </small>
                </h1>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive" style="border: 2px solid #307ecc;">
                                <s2:if test="articles.size()==0">
                                    <div class="error-container">
                                        <div class="well">
                                            <h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="icon-sitemap"></i>
												此分类还没有文章
											</span>
                                            </h1>
                                            <hr>
                                            <div class="space"></div>

                                            <div class="center">
                                                <a href="javascript:history.back(-1)" class="btn btn-grey">
                                                    <i class="icon-arrow-left"></i>
                                                    返回
                                                </a>

                                                <a href="/admin/main_article_add.html" class="btn btn-primary">
                                                    <i class="icon-dashboard"></i>
                                                    写文章
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- PAGE CONTENT ENDS -->
                                </s2:if>
                                <s2:else>
                                    <div class="table-header" style="height: 10px;">
                                    </div>
                                        <div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div id="sample-table-2_length" class="dataTables_length">
                                                        <label>
                                                            <div class="btn-group">
                                                                <button data-toggle="dropdown"
                                                                        class="btn btn-primary btn-sm dropdown-toggle">
                                                                    Action
                                                                    <span class="icon-caret-down icon-on-right"></span>
                                                                </button>
                                                                <ul class="dropdown-menu dropdown-default">
                                                                    <li>
                                                                        <a href="javascript:void(0)" id="batch-delete">删除</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </label></div>
                                                </div>
                                                    <%--                                                    <div class="col-sm-6">
                                                                                                            <div class="dataTables_filter" id="sample-table-2_filter">
                                                                                                                <label>Search: <input type="text"
                                                                                                                                      aria-controls="sample-table-2"></label>
                                                                                                            </div>
                                                                                                        </div>--%>
                                            </div>
                                            <table id="sample-table-1"
                                                   class="table table-striped table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th class="center">
                                                        <label>
                                                            <input type="checkbox" class="ace">
                                                        </label>
                                                    </th>
                                                    <th>标题</th>
                                                    <th>分类</th>
                                                    <th>
                                                        <i class="icon-time bigger-110 hidden-480"></i>
                                                        发表时间
                                                    </th>
                                                    <th></th>
                                                </tr>
                                                </thead>

                                                <tbody>
                                                <s2:iterator value="articles">
                                                    <tr class="selected">
                                                        <td class="center">
                                                            <label>
                                                                <input type="checkbox" class="ace" value="<s2:property value="id"/>">
                                                            </label>
                                                        </td>
                                                        <td><s2:property value="title"/><s2:if
                                                                test="type == 'post_draft'">&nbsp;<span class="label label-sm label-inverse arrowed-in">草稿</span></s2:if>
                                                        </td>
                                                        </td>
                                                        <td><s2:property value="category.name"/></td>
                                                        <td><s2:date name="date" format="yyyy-MM-dd HH:mm"/></td>
                                                        <td>
                                                            <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                                                <a href="/admin/main_article_update.html?id=<s2:property value="id"/>"
                                                                   class="btn btn-xs btn-info">
                                                                    <i class="icon-edit bigger-120"></i>
                                                                </a>
                                                                <a href="javascript:void(0)"
                                                                   onclick="deleteConfirm(<s2:property value="id"/>)"
                                                                   class="btn btn-xs btn-danger">
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
                                                                            <a href="/admin/main_article_update.html?id=<s2:property value="id"/>"
                                                                               class="tooltip-success"
                                                                               data-rel="tooltip"
                                                                               title="" data-original-title="Edit">
                                                                                    <span class="green">
                                                                                        <i class="icon-edit bigger-120"></i>
                                                                                    </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:void(0)"
                                                                               onclick="deleteConfirm(<s2:property
                                                                                       value="id"/>)"
                                                                               class="tooltip-error"
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
                                                <div class="modal hidd">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">
                                                                    <span aria-hidden="true">&times;</span><span
                                                                        class="sr-only">Close</span></button>
                                                                <h4 class="modal-title">删除确认</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>您确认要删除此条吗？</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default"
                                                                        data-dismiss="modal">取消
                                                                </button>
                                                                <a href="#" id="btn-delete-confirm"
                                                                   class="btn btn-primary">确定</a>
                                                            </div>
                                                        </div>
                                                        <!-- /.modal-content -->
                                                    </div>
                                                    <!-- /.modal-dialog -->
                                                </div>
                                                <!-- /.modal -->
                                            </table>
                                        </div>
                                </s2:else>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /span -->
                    </div>
                    <!-- /row -->

                </div>
            </div>
        </div>
    </div>
</div>
<script src="/javascripts/bootbox.min.js"></script>
<script type="text/javascript">
    $('table th input:checkbox').on('click', function () {
        var that = this;
        $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });
    });
    $("#batch-delete").click(function(){
        var batch = new Array();
        $("tbody input:checkbox").each(function () {
            if ($(this).prop("checked")) {
                batch.push($(this).val());
            }
        });
        if(batch.length != 0){
            bootbox.dialog({
                message: "确定要删除所勾选项么?",
                title: "提示",
                buttons: {
                    no: {
                        label: "离开",
                        className: "btn-default"
                    },
                    ok: {
                        label: "删除",
                        className: "btn-primary",
                        callback: function () {
                            var params = {
                                "batch": batch
                            };
                            $.ajax({
                                type: "post",
                                url: "/ajax/admin/main_article_delete_batch.html",
                                dataType: 'json',
                                data: JSON.stringify(params),
                                contentType: 'application/json',
                                success: function (data) {
                                    if (data.status == true) {
                                        location.reload(true);
                                    } else if (data.status == false) {
                                        myAlert(data.tips, "error");
                                    }
                                }
                            });
                        }
                    }
                }
            });
        }else {
            myAlert("没有文章被删除", "error");
        }

    });
    function deleteConfirm(id) {
        bootbox.dialog({
            message: "确定要删除么?",
            title: "提示",
            buttons: {
                no: {
                    label: "离开",
                    className: "btn-default"
                },
                ok: {
                    label: "删除",
                    className: "btn-primary",
                    callback: function () {
                        var params = {
                            "id": id
                        };
                        $.ajax({
                            type: "post",
                            url: "/ajax/admin/main_article_delete.html",
                            dataType: 'json',
                            data: JSON.stringify(params),
                            contentType: 'application/json',
                            success: function (data) {
                                if (data.status == true) {
                                    location.reload(true);
                                } else if (data.status == false) {
                                    myAlert(data.tips, "error");
                                }
                            }
                        });
                    }
                }
            }
        });
    }
</script>
</div>