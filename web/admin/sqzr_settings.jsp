<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/10/7
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/sqzr_header-main.jsp" %>
<link rel="stylesheet" href="/stylesheets/chosen.css">
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
        <li class="active">设置</li>
    </ul>
    <!-- .breadcrumb -->
</div>
<div class="page-content">
<div class="page-header">
    <h1>
        设置
        <small>
            <i class="icon-double-angle-right"></i>
            常规设置
        </small>
    </h1>
</div>
<!-- .page-header -->
<form class="form-horizontal">
    <div class="tabbable">
        <ul class="nav nav-tabs height-33">
            <li class="active" id="infoTab">
                <a data-toggle="tab" href="#edit-basic">
                    <i class="green icon-edit bigger-125"></i>
                    基本信息
                </a>
            </li>

            <li class="" id="settingsTab">
                <a data-toggle="tab" href="#edit-settings">
                    <i class="purple icon-cog bigger-125"></i>
                    设置
                </a>
            </li>

            <li class="" id="passwordTab">
                <a data-toggle="tab" href="#edit-password">
                    <i class="blue icon-key bigger-125"></i>
                    密码
                </a>
            </li>
        </ul>

        <div class="tab-content profile-edit-tab-content">
            <div id="edit-basic" class="tab-pane active">
                <h4 class="header blue bolder smaller">一般</h4>

                <div class="row">
                    <div class="col-xs-12 col-md-3 center">
                        <div>
												<span class="profile-picture">
													<img id="avatar"
                                                         class="editable img-responsive editable-click editable-empty"
                                                         src="<s2:property value="options.avatar"/>"
                                                         style="display: block;height: 190px;width: 190px">
                                                    </img>
                                                    <p id="profile-tips" class="error" style="display:none;"></p>
												</span>

                            <div class="row">
                                <div id="uploader" class="wu-example">
                                    <div id="thelist" class="uploader-list"></div>
                                    <div class="btns">
                                        <div id="picker">选择文件</div>
                                        <label id="ctlBtn" class="btn btn-default"
                                               style="margin-top: 10px;">开始上传</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-9">
                        <div class="profile-user-info profile-user-info-striped">
                            <div class="profile-info-row">
                                <div class="profile-info-name">网站名称</div>

                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text" id="form-field-title"
                                                                                 value="<s2:property value="options.title"/>"> </span>
                                </div>
                            </div>

                            <div class="profile-info-row">
                                <div class="profile-info-name">网站地址</div>

                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text" id="form-field-url"
                                                                                 value="<s2:property value="options.url"/>"></span>
                                </div>
                            </div>

                            <div class="profile-info-row">
                                <div class="profile-info-name"> 附标题</div>

                                <div class="profile-info-value">
                                    <span class="editable editable-click">
                                        <input type="text" id="form-field-subtitle"
                                               value="<s2:property value="options.subtitle"/>">
                                    </span>
                                </div>
                            </div>

                            <div class="profile-info-row">
                                <div class="profile-info-name"> 个人说明</div>

                                <div class="profile-info-value">
                                    <span class="editable editable-click">
                                        <input type="text" id="form-field-description"
                                               value="<s2:property value="options.description"/>">
                                    </span>
                                </div>
                            </div>

                            <div class="profile-info-row">
                                <div class="profile-info-name">作者姓名</div>

                                <div class="profile-info-value">
                                    <span class="editable editable-click"><input type="text" id="form-field-authorname"
                                                                                 value="<s2:property value="options.authorname"/>"></span>
                                </div>
                            </div>

                            <div class="profile-info-row">
                                <div class="profile-info-name"> 作者邮箱</div>

                                <div class="profile-info-value">
                                    <span class="editable editable-click editable-open">
                                        <input type="text" id="form-field-authoremail"
                                               value="<s2:property value="options.authoremail"/>"></span>
                                </div>
                            </div>

                            <div class="profile-info-row">
                                <div class="profile-info-name"> 网站关键词</div>

                                <div class="profile-info-value">
                                    <span class="editable editable-click">
                                        <input type="text" id="form-field-htmlkeyword"
                                               value="<s2:property value="options.htmlkeyword"/>">
                                    </span>
                            </div>
                        </div>

                            <div class="profile-info-row" style="height: 75px;">
                                <div class="profile-info-name"> 网站描述</div>

                                <div class="profile-info-value">
                                    <span class="editable editable-click">
                                        <textarea class="col-xs-12 col-sm-12"
                                                  id="form-field-htmldescription"><s2:property
                                                value="options.htmldescription"/></textarea>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="header blue bolder smaller">社交链接</h4>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="form-field-facebook">Facebook</label>

                    <div class="col-sm-9">
																	<span class="input-icon  col-xs-12 col-sm-5">
																		<input type="text" class="col-xs-12 col-sm-12"
                                                                               value="<s2:property value="options.facebook"/>"
                                                                               id="form-field-facebook"
                                                                               style="margin-left: -12px;">
																		<i class="icon-facebook blue"></i>
																	</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="form-field-twitter">Twitter</label>

                    <div class="col-sm-9">
																	<span class="input-icon col-xs-12 col-sm-5">
																		<input type="text" class="col-xs-12 col-sm-12"
                                                                               value="<s2:property value="options.twitter"/>"
                                                                               id="form-field-twitter"
                                                                               style="margin-left: -12px;">
																		<i class="icon-twitter light-blue"></i>
																	</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="form-field-googleplus">Google+</label>

                    <div class="col-sm-9">
																	<span class="input-icon col-xs-12 col-sm-5">
																		<input class="col-xs-12 col-sm-12" type="text"
                                                                               value="<s2:property value="options.googleplus"/>"
                                                                               id="form-field-googleplus"
                                                                               style="margin-left: -12px;">
																		<i class="icon-google-plus red"></i>
																	</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="form-field-weibo">weibo</label>

                    <div class="col-sm-9">
																	<span class="input-icon col-xs-12 col-sm-5">
																		<input class="col-xs-12 col-sm-12" type="text"
                                                                               value="<s2:property value="options.weibo"/>"
                                                                               id="form-field-weibo"
                                                                               style="margin-left: -12px;">
																		<i class="icon-weibo red"></i>
																	</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="form-field-github">github</label>

                    <div class="col-sm-9">
																	<span class="input-icon col-xs-12 col-sm-5">
																		<input class="col-xs-12 col-sm-12" type="text"
                                                                               value="<s2:property value="options.github"/>"
                                                                               id="form-field-github"
                                                                               style="margin-left: -12px;">
																		<i class="icon-github black"></i>
																	</span>
                    </div>
                </div>

            </div>
            <div id="edit-settings" class="tab-pane">
                <div class="space-10"></div>
                <div>
                    <label class="inline">
                        <span class="lbl"> 每页文章数量:</span>
                    </label>
                    <label class="inline">
                        <span class="space-2 block"></span>
                        <input type="text" class="input-mini" id="form-field-pagenumber" maxlength="2"
                               value="<s2:property value="options.pagenumber"/>">
                    </label>
                </div>
            </div>
            <div id="edit-password" class="tab-pane">
                <div class="space-10"></div>
                <div class="form-group" style="height: 29px;">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-oldPassword">当前密码</label>

                    <div class="col-sm-9">
                        <input type="password" id="form-field-oldPassword">
                    </div>
                </div>
                <div class="space-4"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-newPassword">新密码</label>

                    <div class="col-sm-9">
                        <input type="password" id="form-field-newPassword">
                    </div>
                </div>
                <div class="space-4"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-reqNewPassword">确认密码</label>

                    <div class="col-sm-9">
                        <input type="password" id="form-field-reqNewPassword">
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix form-actions">
            <div style="float: right;">
                <button id="settings-save" class="btn btn-info" type="button">
                    <i class="icon-ok bigger-110"></i>
                    保存
                </button>
            </div>
        </div>

    </div>
</form>
</div>
</div>
</div>
</div>
<script src="/javascripts/ace-editable.min.js"></script>
<script src="/javascripts/bootstrap-editable.min.js"></script>
<script type="text/javascript" src="/javascripts/webuploader.js"></script>
<script type="text/javascript">
    $('#settings-save').click(function () {
        var tab = $(".tabbable .active").attr("id");
        if (tab == "infoTab") {
            var params = {
                "type": "infoTab",
                "title": $("#form-field-title").val(),
                "url":$("#form-field-url").val(),
                "authoremail":$("#form-field-authoremail").val(),
                "authorname":$("#form-field-authorname").val(),
                "subtitle": $("#form-field-subtitle").val(),
                "description": $("#form-field-description").val(),
                "htmlkeyword": $("#form-field-htmlkeyword").val(),
                "htmldescription": $("#form-field-htmldescription").val(),
                "facebook": $("#form-field-facebook").val(),
                "twitter": $("#form-field-twitter").val(),
                "googleplus": $("#form-field-googleplus").val(),
                "weibo": $("#form-field-weibo").val(),
                "github": $("#form-field-github").val()
            };
        }
        if (tab == "passwordTab") {
            var params = {
                "type": "passwordTab",
                "oldPassword": $("#form-field-oldPassword").val(),
                "newPassword": $("#form-field-newPassword").val(),
                "reqNewPassword": $("#form-field-reqNewPassword").val()
            };
        }
        if (tab == "settingsTab") {
            var params = {
                "type": "settingsTab",
                "pagenumber": $("#form-field-pagenumber").val()
            };
        }
        $.ajax({
            type: "post",
            url: "/ajax/admin/main_settings_update.html",
            dataType: 'json',
            data: JSON.stringify(params),
            contentType: 'application/json',
            success: function (data) {
                if (data.status == true) {
                    swal({title: "提示",text: data.tips,type: "success",timer: 1500});
                } else if (data.status == false) {
                    swal({title: "提示",text: data.tips,type: "error",timer: 1500});
                }
            }
        });
    });
    // 定义图片上传提示
    function showTips(tips, status) {
        $(".profile-picture #profile-tips").attr("class", status);
        $(".profile-picture #profile-tips").text(tips);
        $(".profile-picture #profile-tips").fadeIn(1000);
        setInterval(function () {
            $(".profile-picture #profile-tips").fadeOut(1000);
        }, 5000);
    }
    // 初始化Web Uploader
    var uploader = WebUploader.create({
        auto: false,
        fileVal: 'uploadFile',
        server: '/ajax/admin/main_settings_avatar_update.html',
//        fileNumLimit:1,
        pick: {
            id: '#picker',
            multiple: false
        },
        dnd: '.profile-picture',
        disableGlobalDnd: true,
        chunked: true,
        paste: document.body,
        fileSingleSizeLimit: 5 * 1024 * 1024,
        // 只允许选择图片文件。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        }
    });
    // 文件添加进入前删除队列所有文件
    uploader.on('beforeFileQueued', function (file) {
        var currentFiles = uploader.getFiles();
        if (currentFiles.length > 0) {
            $.each(currentFiles, function (key, file) {
                uploader.removeFile(file, true);
            });
        }
    });
    // 加入队列生成缩略图
    uploader.on('fileQueued', function (file) {
        // 隐藏错误信息
        uploader.makeThumb(file, function (error, src) {
            $("#avatar").attr("src", src);
        }, 190, 190);
    });
    // 上传失败
    uploader.on('uploadError', function (file) {
        showTips("上传失败", "error");
    });
    // 上传成功
    uploader.on('uploadSuccess', function (file, data) {
        if (data.status == true) {
            showTips("上传成功", "success");
        } else {
            showTips(data.tips, "error");
        }
    });
    uploader.on('error', function (error) {
        switch (error) {
            case 'Q_EXCEED_NUM_LIMIT':
                errorinfo = '超过限制';
                break;
            case 'Q_EXCEED_SIZE_LIMIT':
                errorinfo = '超过大小';
                break;
            case 'Q_TYPE_DENIED':
                errorinfo = '只能上传图片';
                break;
            default :
                errorinfo = '未知错误';
                break;
        }
        // 显示错误信息
        showTips(errorinfo, "error");
    });
    $("#ctlBtn").on('click', function () {
        uploader.upload();
    });
</script>
</body>
</html>