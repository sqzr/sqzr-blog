<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header.jsp" %>
<body class="login-layout">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <i class="icon-cat"></i>
                            <span class="white">sqzr's blog</span>
                        </h1>
                        <%--<h4 class="blue">&copy; Company Name</h4>--%>
                    </div>

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="icon-coffee green"></i>
                                        Please Enter Your Information
                                    </h4>

                                    <div class="space-6"></div>

                                    <form>
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="username" type="text" class="form-control"
                                                                   placeholder="Username"/>
															<i class="icon-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="password" type="password" class="form-control"
                                                                   placeholder="Password"/>
															<i class="icon-lock"></i>
														</span>
                                            </label>

                                            <div class="space"></div>

                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input type="checkbox" class="ace" id="keepMeLoggedInd"/>
                                                    <span>Remember Me</span>
                                                </label>

                                                <button id="login" type="button"
                                                        class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i class="icon-key"></i>
                                                    Login
                                                </button>
                                            </div>

                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>
                                </div>
                                <!-- /widget-main -->

                                <div class="toolbar clearfix">
                                    <div>

                                    </div>
                                </div>
                            </div>
                            <!-- /widget-body -->
                        </div>
                        <!-- /login-box -->
                    </div>
                    <!-- /position-relative -->
                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
</div>
<!-- /.main-container -->
<script type="text/javascript">
    $(document).ready(function () {
        $("#login").click(function () {
            login();
        });
    });
    function login() { //函数 login();
        var params = {
            username: $("#username").val(),
            password: $("#password").val(),
            keepMeLoggedInd: $("#keepMeLoggedInd").prop("checked")
        };
        $.ajax({
            type: "post",
            url: "/ajax/admin/user_login.html",
            dataType: 'json',
            data: JSON.stringify(params),
            beforeSend: function () {
                $("#login").attr('disabled', "true");
            },
            complete: function () {
                $("#login").removeAttr("disabled");
            },
            contentType: 'application/json',
            success: function (data) {
                if (data.status == false) {
                    //登陆失败
                    myAlert(data.tips, "error");
                } else if (data.status == true) {
                    //登陆成功
                    myAlert(data.tips, "info");
                    window.setTimeout(function () {
                        location.href = '/admin/main_index.html'
                    }, 1000);
                }
            }
        });
    }
</script>
<!-- external javascript -->
<%@include file="common/footer.jsp" %>