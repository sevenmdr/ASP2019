<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_2018_12_13.Views.Login.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" name="viewport" />
    <script src="/js/jquery-2.1.4.min.js" type="text/javascript"></script>
    <link href="/dist/semantic.min.css" rel="stylesheet" />
    <meta name="generator" content="Visual Studio 2015" />
    <title>VTTech Solution</title>
    <meta name="description" content="VTTech Solution" />
    <meta name="keywords" content="html5, ,semantic,ui, library, framework, javascript,jquery,template,blog,stagb,template" />
    <link href="/dist/semantic.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
</head>
<body>
    <div class="ui container" style="padding-top: 10%">
        <div class="ui grid center aligned">
            <div class="row">
                <div class="sixteen wide tablet six wide computer column">
                    <div class="ui left aligned segment">
                        <form runat="server">
                            <div id="form3" class="ui form" runat="server">

                                <h1 class="ui header center aligned">
                                    <img src="/img/logo/logo.ico" alt="stagblogo">
                                </h1>

                                <div class="field">
                                    <label>
                                        Username:
                                    </label>
                                    <div class="ui fluid icon input">
                                        <input runat="server" name="name" id="u_name" type="name" autocomplete="off" style="width: 100%!important; min-width: 100%; width: 100%;">
                                        <i class="icon mail outline"></i>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>
                                        Password:
                                    </label>
                                    <div class="ui fluid icon input">
                                        <input runat="server" name="password" id="u_pass" type="password" autocomplete="off" style="width: 100%!important; min-width: 100%; width: 100%;">
                                        <i class="icon key"></i>
                                    </div>
                                </div>
                                <div class="field">
                          
                                    <span>&nbsp</span>
                                    <asp:Button ID="Button1" runat="server" Text="Đăng Nhập" OnClick="Button1_Click" Style="width: 100%; background-color: #00b5ad; color: white; height: 32px;" />
                                    <span>&nbsp</span>
             
                                    <asp:Label ID="Label1" runat="server" Text="" Style="width: 100%; color: red; height: 50px;"></asp:Label>
            
                                    <span>&nbsp</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
  

    <script>
        var colors = ["#F25F5C", "#247BA0", "#8e44ad", "#ED6A5A", "#32936F", "#2c3e50", "#E83F6F", "#32936F", "#2E294E"];
        var rand = Math.floor(Math.random() * colors.length);
        $('body').css("background-color", colors[rand]);
        $('#Button1').css("background-color", colors[rand]);
        $('#Label1').css("color", colors[rand]);
    </script>
</body>
</html>
