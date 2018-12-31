<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pagePaymentDetail.aspx.cs" Inherits="_2018_12_13.Views.Customer.pagePaymentDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
        <div id="header" class="header">
        Thanh Toán
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">


                    <div class="field">
                        <div class="field">
                            <label>Hình Thức Thanh Toán</label>
                            <div class="ui fluid search selection dropdown" id="Method">
                                <input type="hidden" name="discountTab" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Hình Thức Thanh Toán</div>
                                <div id="ccbMethod" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>
                   

                        <div class="field">
                            <label>Số Tiền</label>
                            <div class="ui right labeled fluid input">
                                <div class="ui label">$</div>
                                <input id="AmountPayment" name="discountOther" type="number" class="money" />
                                <div class="ui basic label">VND</div>
                            </div>
                        </div>
                     <div class="field">
                        <div class="field">
                             <label>Nội Dung</label>
                            <textarea id="txtNamePayment" name="content"></textarea>
                        </div>
                    </div>
          

                </form>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" onclick="return ExcuteData()">Save</button>
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
            data.Method_ID = Number($('#Method').dropdown('get value')) ? Number($('#Method').dropdown('get value')) : 0;
            data.Content = $('#txtNamePayment').val() ? $('#txtNamePayment').val() : "";
            data.Amount = $('#AmountPayment').val() ? $('#AmountPayment').val() : 0;
            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Customer/pagePaymentDetail.aspx/ExcuteData",
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
                            LoadPaymentAjax();
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
        var DataComboPayment;
        function LoadComboPayment() {
            GetDataComboTypeStatus("/Views/Customer/pagePaymentDetail.aspx/LoadComboMain", function (data) {
                DataComboPayment = data
                LoadCombo(data, "ccbMethod")
            });
        }

        $(document).ready(function () {
            LoadComboPayment();
            LoadDataUpdate();
        });
        function LoadDataUpdate() {
     
            let dataPayment = ([<%=_dataPayment%>][0]);
            if (dataPayment) {
                $("#Method").dropdown("refresh");
                $("#Method").dropdown("set selected", dataPayment[0].Method);
                $('#AmountPayment').val(Number(dataPayment[0].Amount));
                $('#txtNamePayment').val((dataPayment[0].Content));
            }
        }
    </script>

</body>
</html>
