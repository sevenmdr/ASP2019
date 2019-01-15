<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageTicketSourceDetail.aspx.cs" Inherits="_2018_12_13.Views.Marketing.pageTicketSourceDetail" %>

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
        Nguồn Khách Hàng
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                  <form class="ui form segment form3" id="form3">
                       <div class="field">
                                <label>Nguồn Khách Hàng</label>
                                <input id="SourceCount" name="name" type="text" />
                            </div>

                    <div class="field">
                        <div class="field">
                            <label>Ghi Chú</label>
                            <textarea id="NoteSourceCount" name="content"></textarea>
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
            data.Name = $('#SourceCount').val() ? $('#SourceCount').val() : "";
           data.Note = $('#NoteSourceCount').val() ? $('#NoteSourceCount').val() : "";
            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Marketing/pageTicketSourceDetail.aspx/ExcuteData",
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
                            LoadTicketSourceAjax();
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
            LoadDataUpdateProductType();
        });


            function LoadDataUpdateProductType() {
            let dataUnit = ([<%=_dataUnit%>][0]);
            if (dataUnit) {

                $('#SourceCount').val((dataUnit[0].Name));
                 $('#NoteSourceCount').val((dataUnit[0].Note));
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

