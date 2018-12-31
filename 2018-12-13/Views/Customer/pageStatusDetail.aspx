<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageStatusDetail.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageStatusDetail" %>

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
    <link rel="shortcut icon" href="~/img/favicon.ico" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>
    <div id="header" class="header">
        Tư Vấn Khách Hàng
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="field">
                        <div class="field">
                            <label>Tình Trạng Tư Vấn</label>
                            <div class="ui fluid search selection dropdown" id="TypeStatus">
                                <input type="hidden" name="statusType" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Tình Trạng Tư Vấn</div>
                                <div id="ccbStatus" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="field">
                        <div class="field">
                            <label>Nội Dung</label>
                            <textarea id="txtName" name="content"></textarea>
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

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

    <script>
        function ExcuteData() {
            var data = new Object();
            data.TypeStatus_ID = Number($('#TypeStatus').dropdown('get value')) ? Number($('#TypeStatus').dropdown('get value')) : 0;
            data.Content = $('#txtName').val() ? $('#txtName').val() : "";
            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Customer/pageStatusDetail.aspx/ExcuteData",
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
                            LoadStatusAjax();
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
        // Loadcombo status type
        var DataComboStatus;
        function LoadComboStatus() {
            GetDataComboTypeStatus("/Views/Customer/pageStatusDetail.aspx/LoadComboMain", function (data) {
                DataComboStatus = data
                LoadCombo(data, "ccbStatus")
            });
        }

        $(document).ready(function () {
            LoadComboStatus();
            LoadDataUpdate();
        });
        function LoadDataUpdate() {
     
            let dataStatus = ([<%=_dataStatus%>][0]);
            if (dataStatus) {
                $("#TypeStatus").dropdown("refresh");
                $("#TypeStatus").dropdown("set selected", dataStatus[0].TypeID);
                $('#txtName').val((dataStatus[0].Content));
            }
        }
    </script>



</body>

</html>
