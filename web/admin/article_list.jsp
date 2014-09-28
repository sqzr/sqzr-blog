<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/myTag" prefix="pre" %>
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
                            列表
                        </small>
                    </h1>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-responsive">
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
                                        </div><!-- PAGE CONTENT ENDS -->
                                    </s2:if>
                                    <s2:else>
                                        <table id="sample-table-1"
                                               class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th>标题</th>
                                                <th>分类</th>
                                                <th>
                                                    <i class="icon-time bigger-110 hidden-480"></i>
                                                    日期
                                                </th>
                                                <th></th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <s2:iterator value="articles" id="article">
                                                <tr class="selected">
                                                    <td><s2:property value="title"/><s2:if test="type == 'post_draft'"><em class="status">草稿</em></s2:if></td>
                                                    <td><a href="/admin/main_category_list.html?id=<s2:property value="category.id"/>"><s2:property value="category.name"/></a></td>
                                                    <td><pre:myTag><s2:date name="date" format="yyyy-MM-dd HH:mm:ss"/> </pre:myTag></td>
                                                    <%--<td><s2:date name="date" format="yyyy-MM-dd HH:mm"/></td>--%>
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
                                                                           class="tooltip-success" data-rel="tooltip"
                                                                           title="" data-original-title="Edit">
                                                                                    <span class="green">
                                                                                        <i class="icon-edit bigger-120"></i>
                                                                                    </span>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:void(0)"
                                                                           onclick="deleteConfirm(<s2:property
                                                                                   value="id"/>)" class="tooltip-error"
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
                                                            <button type="button" class="close" data-dismiss="modal">
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
                                                            <a href="#" id="btn-delete-confirm" class="btn btn-primary">确定</a>
                                                        </div>
                                                    </div>
                                                    <!-- /.modal-content -->
                                                </div>
                                                <!-- /.modal-dialog -->
                                            </div>
                                            <!-- /.modal -->
                                        </table>
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
<script src="/javascripts/bootbox.min.js"></script>
<script type="text/javascript">
    function deleteConfirm(id) {
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
                        window.location.href='/admin/main_article_delete.html?id=' + id;
                    }
                }
            }
        });
    }
</script>
