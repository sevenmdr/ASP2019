<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageUserGroupDetail.aspx.cs" Inherits="_2018_12_13.Views.Employee.pageUserGroupDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />
    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
    <link href="/css/main.custom.css" rel="stylesheet" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />

</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" />
    </form>
    <div class="header">
      Nhóm Phân Quyền
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                  <form class="ui form segment form3" id="form3">
                       <div class="field">
                                <label>Nhóm Phân Quyền</label>
                                <input id="Group" name="name" type="text" />
                            </div>

                    <div class="field">
                        <div class="field">
                            <label>Ghi Chú</label>
                            <textarea id="NoteGroup" name="content"></textarea>
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

    <script type="text/javascript">
        function ExcuteData() {
            var data = new Object();
            data.Name = $('#Group').val() ? $('#Group').val() : "";
           data.Note = $('#NoteGroup').val() ? $('#NoteGroup').val() : "";
            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Employee/pageUserGroupDetail.aspx/ExcuteData",
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
                            LoadUserGroupAjax();
                        } else {
                            notiError(result.d);
                        }

                    }
                });
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
        }

        $(document).ready(function () {
            LoadDataUpdateGroup();
        });


            function LoadDataUpdateGroup() {
            let dataGroupUser = ([<%=_dataGroupUser%>][0]);
            if (dataGroupUser) {

                $('#Group').val((dataGroupUser[0].Name));
                 $('#NoteGroup').val((dataGroupUser[0].Note));
            }
        }
    </script>

    
    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
        <script src="/js/customjs/custom-validation.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
 <%--   <script src="/js/customjs/custom-modal.js"></script>--%>
</body>

</html>

