<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageInvoiceDetail.aspx.cs" Inherits="_2018_12_13.Views.Account.pageInvoiceDetail" %>

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
    <%--        <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>--%>
</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>
    <div id="header" class="header">
        Dịch Vụ Khách Hàng
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="field">
                        <div class="field">
                            <label>Loại Chi</label>
                            <div class="ui fluid search selection dropdown" id="accountType">
                                <input type="hidden" name="name"  />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Loại Chi</div>
                                <div id="ccbAccountType" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="two fields">
                        <div class="field">
                            <label>Hình Thức Chi</label>
                            <div class="ui fluid search selection dropdown" id="accountMethod">
                                <input type="hidden" name="name"  />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Hình Thức Chi</div>
                                <div id="ccbAccountMethod" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Số Tiền</label>
                            <div class="ui right labeled fluid input">
                                <div class="ui label">$</div>
                                <input id="accountMoney"  type="number" class="money" />
                                <div class="ui basic label">VND</div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Người Nhận</label>
                            <input id="txtReceitent" name="name" type="text" />
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Ghi Chú</label>
                            <input id="content" name="note" type="text" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" onclick="return ExcuteData()" type="submit">Save</button>
        </div>

    </div>
    <script>
        var DataComboReceiptype;
        var DataComboMethod;
        $(document).ready(function () {
            debugger
            DataComboReceiptype = ([<%=_DataComboReceiptype%>][0]);
            DataComboMethod = ([<%=_DataComboMethod%>][0]);
            LoadCombo(DataComboReceiptype, "ccbAccountType")
            LoadCombo(DataComboMethod, "ccbAccountMethod")
            LoadDataUpdate();
        });
        function LoadDataUpdate() {
            let AccountMainDetail = ([<%=_AccountMainDetail%>][0]);
            if (AccountMainDetail) {
                debugger
                $('#content').val((AccountMainDetail[0].ReceiptsContent));
                $('#accountMoney').val((AccountMainDetail[0].Amount));
                $('#txtReceitent').val((AccountMainDetail[0].Recipient));
                $("#accountType").dropdown("refresh");
                $("#accountType").dropdown("set selected", AccountMainDetail[0].ReceiptsType);
                $("#accountMethod").dropdown("refresh");
                $("#accountMethod").dropdown("set selected", AccountMainDetail[0].Transfer_Type);

            }
        }
        function ExcuteData() {
            var data = new Object();
            
            data.Recipient = $('#txtReceitent').val() ? $('#txtReceitent').val() : "";
            data.ReceiptsContent = $('#content').val() ? $('#content').val() : "";
            data.ReceiptsType = Number($('#accountType').dropdown('get value')) ? Number($('#accountType').dropdown('get value')) : 0;
            data.Amount = Number($('#accountMoney').val()) ? Number($('#accountMoney').val()) : 0;
            data.Transfer_Type = Number($('#accountMethod').dropdown('get value')) ? Number($('#accountMethod').dropdown('get value')) : 0;


            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {

                $.ajax({
                    url: "/Views/Account/pageInvoiceDetail.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data) }),
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            LoadAccountAjax();
                        } else {
                            notiError("Lỗi Thao Tác");
                        }
                    }
                })
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
    <script src="/js/main.js"></script>
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
</body>

</html>


