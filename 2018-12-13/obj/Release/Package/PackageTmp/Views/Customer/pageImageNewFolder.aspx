﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageImageNewFolder.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageImageNewFolder" %>

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
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>
    <div id="header" class="header">
        Tạo Folder
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="field">
                        <div class="field">
                            <label>Tên Thư Mục</label>
                            <input id="txtName" name="folderName" type="text" />
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" type="submit" onclick="return ExcuteData()">Save</button>
        </div>

    </div>

   

    <script>
        function ExcuteData() {
            var data = new Object();
            data.Content = $('#txtName').val() ? $('#txtName').val() : "";
            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Customer/pageImageNewFolder.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data) }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError();
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            LoadFolderTree();
                        } else {
                            notiError();
                        }
                    }
                });
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
        }
    </script>

     <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
</body>

</html>

