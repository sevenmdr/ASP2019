<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageImageDetail.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageImageDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <link rel="icon" href="/img/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />
    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
    <link href="/css/main.custom.css" rel="stylesheet" />
    <link rel="shortcut icon" href="/img/favicon.ico" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />

</head>

<body>
    <%--    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>--%>
    <div id="header" class="header">
        Hình Ảnh
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <img id="imgImageDetail" src="" alt="" style="border-radius: 8px;width: 500px;height: 500px;display: block;margin-left: auto;margin-right: auto;"/>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        $(document).ready(function () {
            var urlImg = ("<%=_urlImage %>");
            $("#imgImageDetail").attr("src", urlImg);
        });

    </script>
    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/main.js"></script>
<%--    <script src="/js/customjs/custom-modal.js"></script>--%>





</body>

</html>
