<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="div" uri="/divtag" %>
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
                <li class="active">文章列表</li>
            </ul>
            <!-- .breadcrumb -->
        </div>
        <div class="page-content">
            <div class="page-header">
                <h1>
                    文章
                    <small>
                        <i class="icon-double-angle-right"></i>
                        所有文章
                    </small>
                </h1>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive" style="border: 2px solid #438eb9;">
                                <s2:if test="articles.size()==0">
                                    <div class="error-container">
                                        <div class="well">
                                            <h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="icon-sitemap"></i>
												你还没有文章呢
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
                                    <div class="table-responsive">
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
                                                <div class="col-sm-6">
                                                    <s2:set name="curpage" value="articlePage.pageNum"/>
                                                    <s2:set name="pagecount" value="articlePage.pages"/>
                                                    <s2:set name="uri" value="info['uri']"/>
                                                    <div:pager uri="${uri}" curpage="${curpage}" pagecount="${pagecount}" rowcount="10"/>
                                                </div>
                                            </div>
                                            <table id="sample-table-1"  class="table table-striped table-bordered table-hover" style="table-layout:fixed;word-break:break-all;">
                                                <thead>
                                                <tr>
                                                    <th class="center" width="8%">
                                                        <label>
                                                            <input type="checkbox" class="ace">
                                                                <%--<span class="lbl"></span>--%>
                                                        </label>
                                                    </th>
                                                    <th width="65%">标题</th>
                                                    <th width="9%">分类</th>
                                                    <th width="8%">
                                                        <i class="icon-time bigger-110 hidden-480" style="width: 10px;margin-right: 2px;"></i>
                                                        日期
                                                    </th>
                                                    <th width="8%"></th>
                                                </tr>
                                                </thead>
                                                <tbody valign="bottom">
                                                <s2:iterator value="articlePage" id="article">
                                                    <tr>
                                                        <td class="center">
                                                            <label>
                                                                <input type="checkbox" class="ace"
                                                                       value="<s2:property value="id"/>">
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <a href="/admin/main_article_update.html?id=<s2:property value="id"/>"><s2:property
                                                                    value="title"/></a>
                                                            <s2:if test="type == 'post_draft'"><span
                                                                    class="label label-sm label-inverse">草稿</span></s2:if>
                                                            <s2:else><a href="/blog/<s2:property value="uri"/>.shtml"
                                                                        target="_blank"><i
                                                                    class="i-exlink"></i></a></s2:else>
                                                            <a href="/admin/main_comment.html?aid=<s2:property value="id"/>&type=approved"><span class="badge"><s2:property value="commentsnum"/></span></a>
                                                        </td>
                                                        <td>
                                                            <a href="/admin/main_category_list.html?id=<s2:property value="category.id"/>"><s2:property
                                                                    value="category.name"/></a></td>
                                                        <td><div:dateformat><s2:date name="date"
                                                                                     format="yyyy-MM-dd HH:mm:ss"/></div:dateformat></td>
                                                        <td>
                                                            <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                                                <a href="/admin/main_article_update.html?id=<s2:property value="id"/>"
                                                                   class="green">
                                                                    <i class="icon-pencil bigger-100"></i>
                                                                </a>
                                                                <a href="javascript:void(0)"
                                                                   onclick="deleteConfirm(<s2:property
                                                                           value="id"/>)"
                                                                   class="red">
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
                                                                               title=""
                                                                               data-original-title="Delete">
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
                                        </div>
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
</div>
</body>
<script src="/javascripts/bootbox.min.js"></script>
<script type="text/javascript">
    $(".pagination .disabled a").attr("href","#");
    $(".pagination .active a").attr("href","#");
    $('table th input:checkbox').on('click', function () {
        var that = this;
        $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });
    });

    $("#batch-delete").click(function () {
        var batch = new Array();
        $("tbody input:checkbox").each(function () {
            if ($(this).prop("checked")) {
                batch.push($(this).val());
            }
        });
        if (batch.length != 0) {
            swal({   title: "提示", text: "确定要删除所勾选项么?", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "删除", cancelButtonText: "离开", closeOnConfirm: true, closeOnCancel: true }, function (isConfirm) {
                if (isConfirm) {
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
                                swal({title: "错误信息",text: data.tips,type: "error",timer: 1500});
                            }
                        }
                    });
                }
            });
        } else {
            swal({title: "错误信息",text: "没有文章被删除",type: "error",timer: 1500});
        }

    });

    function deleteConfirm(id) {
        swal({   title: "提示", text: "确定要删除么?", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "删除", cancelButtonText: "离开", closeOnConfirm: true, closeOnCancel: true }, function (isConfirm) {
            if (isConfirm) {
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
                            swal({title: "错误信息",text: data.tips,type: "error",timer: 1500});
                        }
                    }
                });
            }
        });
    }
</script>
</html>
