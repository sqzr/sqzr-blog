<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/10/27
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/sqzr_header-main.jsp" %>
<%@ taglib prefix="div" uri="/divtag" %>
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
                    <li class="active">评论管理</li>
                </ul>
                <!-- .breadcrumb -->
            </div>
            <div class="page-content">
                <div class="page-header">
                    <h1>
                        评论
                        <small>
                            <i class="icon-double-angle-right"></i>
                            评论管理
                        </small>
                    </h1>
                </div>
                <!-- .page-header -->
                <div class="tabbable">
                    <ul class="nav nav-tabs nav-blue height-33">
                        <li <s2:if test="info['menu'] == 'comment_approved'">class="active"</s2:if> id="approved-tab">
                            <a href="?type=approved">
                                已通过
                            </a>
                        </li>

                        <li <s2:if test="info['menu'] == 'comment_waiting'">class="active"</s2:if> id="waiting-tab">
                            <s2:if test="info['waitingCount'] != 0">
                            <a href="?type=waiting">
                                待审核&nbsp;<span class="badge"><s2:property value="info['waitingCount']"/></span>
                            </a>
                            </s2:if>
                            <s2:else>
                                <a href="#">
                                    待审核
                                </a>
                            </s2:else>
                        </li>

                        <li <s2:if test="info['menu'] == 'comment_spam'">class="active"</s2:if> id="spam-tab">
                            <s2:if test="info['spamCount'] != 0">
                            <a href="?type=spam">
                                垃圾&nbsp;<span class="badge"><s2:property value="info['spamCount']"/></span>
                            </a>
                            </s2:if>
                            <s2:else>
                                <a href="#">
                                    垃圾
                                </a>
                            </s2:else>
                        </li>
                    </ul>
                    <div class="tab-content no-border no-padding">
                        <div id="approved" class="tab-pane active">
                            <div class="message-container">
                                <s2:if test="comments.size > 0">
                                <div class="message-list-container">
                                    <table class="table no-border">
                                        <thead>
                                        <tr class="message-navbar"
                                            style="background-color:#f1f5fa;background-image:none;">
                                            <th class="center" style="border-bottom:1px solid #d6e1ea!important;">
                                                <label>
                                                    <input type="checkbox" class="ace">
                                                </label>
                                            </th>
                                            <th style="border-bottom:1px solid #d6e1ea!important;">
                                                <div class="inline position-relative" style="margin-left: -22px;">
                                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                                                        <i class="icon-caret-down bigger-125 middle"></i>
                                                    </a>

                                                    <ul class="dropdown-menu dropdown-lighter dropdown-100">
                                                        <li>
                                                            <a href="javascript:void(0)" onclick="batchDeleteComment()">删除</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </th>
                                            <th class="blue no-border-bottom" style="border-bottom:1px solid #d6e1ea!important;">作者</th>
                                            <th class="blue no-border-bottom" style="border-bottom:1px solid #d6e1ea!important;">内容</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <div class="message-list" id="message-list">
                                            <s2:iterator value="comments">
                                                    <tr class="message-item" id="comment-<s2:property value="id"/>" data-comment='<div:json>author:<s2:property value="author"/></div:json>'>
                                                        <td class="center no-border-top">
                                                            <label>
                                                                <input type="checkbox" class="ace"
                                                                       value="<s2:property value="id"/>">
                                                            </label>
                                                        </td>
                                                        <td valign="top" style="width: 70;" class="no-border-top">
                                                            <div class="comment-avatar">
                                                                <img class="avatar"
                                                                     src="https://ruby-china.org/avatar/<div:md5><s2:property value="mail"/></div:md5>?s=40&r=G&d="
                                                                     alt="<s2:property value="author"/>" width="40"
                                                                     height="40"></div>
                                                        </td>
                                                        <td valign="top" class="comment-head no-border-top">
                                                            <div class="comment-meta">
                                                                <strong class="comment-author"><a
                                                                        href="<s2:property value="url"/>"
                                                                        rel="external nofollow"
                                                                        target="_blank"><s2:property
                                                                        value="author"/></a></strong>
                                                                <br><span><a href="mailto:<s2:property value="mail"/>"
                                                                             target="_blank"><s2:property
                                                                    value="mail"/></a></span>
                                                                <br><span><s2:property value="ip"/></span>
                                                            </div>
                                                        </td>
                                                        <td valign="top" class="comment-body no-border-top">
                                                            <div class="comment-date"><s2:date name="created"
                                                                                               format="yyyy-MM-dd HH:mm:ss"/>
                                                                <a href="/blog/<s2:property value="article.uri"/>.shtml"
                                                                   target="_blank"><s2:property
                                                                        value="article.title"/></a></div>
                                                            <div class="comment-content">
                                                                <p><s2:property value="text"/></p></div>
                                                            <div class="comment-action hidden-by-mouse">
                                                                <s2:if test="#parameters.type[0] == 'approved'">
                                                                <span class="weak">通过</span>
                                                                </s2:if>
                                                                <s2:else>
                                                                <a onclick="move(<s2:property value="id"/>,'approved')"
                                                                   href="javascript:void(0);"
                                                                   class="operate-waiting">通过</a>
                                                                </s2:else>

                                                                <s2:if test="#parameters.type[0] == 'waiting'">
                                                                    <span class="weak">待审核</span>
                                                                </s2:if>
                                                                <s2:else>
                                                                <a onclick="move(<s2:property value="id"/>,'waiting')"
                                                                   href="javascript:void(0);"
                                                                   class="operate-waiting">待审核</a>
                                                                </s2:else>

                                                                <s2:if test="#parameters.type[0] == 'spam'">
                                                                    <span class="weak">垃圾</span>
                                                                </s2:if>
                                                                <s2:else>
                                                                <a onclick="move(<s2:property value="id"/>,'spam')"
                                                                   href="javascript:void(0);"
                                                                   class="operate-spam">垃圾</a>
                                                                </s2:else>

                                                                <a href="#comment-15"
                                                                   rel="http://typecho.sqzr.cc/index.php/action/comments-edit?do=edit&amp;coid=15"
                                                                   class="operate-edit">编辑</a>

                                                                <a href="#comment-15"
                                                                   rel="http://typecho.sqzr.cc/index.php/action/comments-edit?do=reply&amp;coid=15"
                                                                   class="operate-reply">回复</a>

                                                                <a onclick="deleteComment(<s2:property value="id"/>)"
                                                                   href="javascript:void(0);"
                                                                   class="red">删除</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                            </s2:iterator>
                                        </div>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="message-footer clearfix">
                                    <div class="pull-left"> <s2:property value="comments.total"/> comment total </div>
                                    <div class="pull-right">
                                        <s2:set name="curpage" value="comments.pageNum"/>
                                        <s2:set name="pagecount" value="comments.pages"/>
                                        <s2:set name="uri" value="info['uri']"/>
                                        <div:pager uri="${uri}" curpage="${curpage}" pagecount="${pagecount}" rowcount="10"/>
                                    </div>
                                </div>
                                </s2:if>
                                <s2:else>
                                    <div class="error-container">
                                        <div class="well">
                                            <h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="icon-sitemap"></i>
												此分栏下还没有评论
											</span>
                                            </h1>
                                            <hr>
                                            <div class="space"></div>

                                            <div class="center">
                                                <a href="javascript:history.back(-1)" class="btn btn-grey">
                                                    <i class="icon-arrow-left"></i>
                                                    返回
                                                </a>

                                                <a href="/admin/main_index.html" class="btn btn-primary">
                                                    <i class="icon-dashboard"></i>
                                                    控制台
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </s2:else>
                            </div>
                        </div>
                        <div id="waiting" class="tab-pane">
                            <div class="space-10"></div>
                        </div>
                        <div id="spam" class="tab-pane">
                            <div class="space-10"></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<s2:debug/>
<script type="text/javascript">
    $('table th input:checkbox').on('click', function () {
        var that = this;
        $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });
    });
    function deleteComment(id) {
        swal({   title: "提示", text: "确定要删除么?", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "删除", cancelButtonText: "离开", closeOnConfirm: true, closeOnCancel: true }, function (isConfirm) {
            if (isConfirm) {
                var params = {
                    "id": id
                };
                $.ajax({
                    type: "post",
                    url: "/ajax/admin/main_comment_delete.html",
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
    function batchDeleteComment() {
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
                        url: "/ajax/admin/main_comment_delete_batch.html",
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
            swal({title: "错误信息",text: "没有评论被删除",type: "error",timer: 1500});
        }
    }
    function move(id,status) {
        var params = {
            "id": id,
            "status":status
        };
        $.ajax({
            type: "post",
            url: "/ajax/admin/main_comment_move.html",
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
</script>
</body>
</html>
