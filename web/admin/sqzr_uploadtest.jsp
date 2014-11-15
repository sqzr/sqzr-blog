<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script src="/javascripts/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/javascripts/webuploader.js"></script>
    <link rel="stylesheet" href="/stylesheets/jquery.uploader.css">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
</head>
<body>
<!--dom结构部分-->
<div id="list"></div>
<div id="uploader" class="wu-example">
    <!--用来存放文件信息-->
    <div id="thelist" class="uploader-list"></div>
    <div class="btns">
        <div id="picker">选择图片</div>
        <button id="ctlBtn" class="btn btn-default">开始上传</button>
    </div>
</div>
<%--<img id="test" src="uploads/Chrysanthemum.jpg">--%>
<script type="text/javascript">
    // 初始化Web Uploader
    var uploader = WebUploader.create({
        // 选完文件后，是否自动上传。
        auto: false,
        fileVal: 'uploadFile',
//   disableGlobalDnd:true,
//   paste:document.body,
        // swf文件路径
//   swf: BASE_URL + '/js/Uploader.swf',
        // 文件接收服务端。
        server: '/ajax/admin/uploadtest.html',
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#picker',

        // 只允许选择图片文件。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        },
        fileNumLimit: 1
    });
    // 当有文件被添加进队列的时候
    uploader.on('fileQueued', function (file) {
        var $li = $(
                        '<div id="' + file.id + '" class="file-item thumbnail">' +
                        '<img>' +
                        '<div class="info">' + file.name + '</div>' +
                        '</div>'
                ),
                $img = $li.find('img');


        // $list为容器jQuery实例
        $("#list").append($li);

        // 创建缩略图
        // 如果为非图片文件，可以不用调用此方法。
        // thumbnailWidth x thumbnailHeight 为 100 x 100
        uploader.makeThumb(file, function (error, src) {
            if (error) {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }

            $img.attr('src', src);
        }, 100, 100);
    });
</script>
</body>
</html>
