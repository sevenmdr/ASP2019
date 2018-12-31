<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageChangePassword.aspx.cs" Inherits="_2018_12_13.Views.Login.pageChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <link rel="icon" href="~/img/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
    <link rel="shortcut icon" href="~/img/favicon.ico" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <meta name="description" content="VTTech Solution" />
    <meta name="keywords" content="html5, ,semantic,ui, library, framework, javascript,jquery,template,blog,stagb,template" />
</head>

<body>
    <div class="ui container" style="padding-top: 10%">
        <div class="ui grid center aligned">
            <div class="row">
                <div class="sixteen wide tablet six wide computer column">
                    <div class="ui left aligned segment">
                        <div id="form1" class="ui form">
                            <h1 class="ui header center aligned">
                                <img src="/img/logo.png" alt="stagblogo" class="ui small image" />
                            </h1>
                            <div class="field">
                                <label>
                                    Email or Username:
                                </label>
                                <div class="ui fluid icon input">
                                    <input name="user_name" id="u_name" type="email" autocomplete="off" style="width: 100%!important; min-width: 100%; width: 100%;" />
                                    <i class="icon mail outline"></i>
                                </div>
                            </div>
                            <div class="field">
                                <label>
                                    Password:
                                </label>
                                <div class="ui fluid icon input">
                                    <input name="password" id="u_pass" type="password" autocomplete="off" style="width: 100%!important; min-width: 100%; width: 100%;" />
                                    <i class="icon key"></i>
                                </div>
                            </div>
                            <div class="field">

                                <a class="ui teal right labeled icon button fluid" href="index.html">Login
                                    <i class="icon sign in"></i>
                                </a>

                                <a class="ui blue right labeled icon button fluid" href="index.html">Sign Up
                                    <i class="icon spy"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--Script--%>
        <script src="/js/jquery-2.1.4.min.js" type="text/javascript"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/main.js"></script>

    <script>
        var colors = ["#F25F5C", "#247BA0", "#8e44ad", "#ED6A5A", "#32936F", "#2c3e50", "#E83F6F", "#32936F", "#2E294E"];
        var rand = Math.floor(Math.random() * colors.length);
        $('body').css("background-color", colors[rand]);
    </script>

</body>

</html>
