<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageTabDetail.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageTabDetail" %>

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
    <script src="/js/simple.money.format.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

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
                            <label>Dịch Vụ</label>
                            <div class="ui fluid search selection dropdown" id="serviceTab">
                                <input type="hidden" name="serviceTab" onchange="ClearDicount()" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Dịch Vụ</div>
                                <div id="ccbServiceTab" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="field">
                        <div class="field">
                            <label>Khuyến Mãi</label>
                            <div class="ui fluid search selection dropdown" id="discountTab">
                                <input type="hidden" name="discountTab" onchange="ExcuteMoney()" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Khuyến Mãi</div>
                                <div id="ccbDiscountTab" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Ghi Chú</label>
                            <input id="note" name="note" type="text" />
                        </div>
                    </div>

                    <div class="two fields">
                        <div class="field">
                            <label>Số Lượng ( 1 - 100 )</label>
                            <input id="Quanlity" name="numberService" type="number" onchange="ExcuteMoney()" />
                        </div>
                        <div class="field">
                            <label>Tổng Tiền ( Chưa Giảm Giá )</label>
                            <div class="ui input">
                                <div class="ui right disabled labeled fluid input">
                                    <div class="ui label">$</div>
                                    <input id="PriceRoot" type="number" class="money" onchange="ExcuteMoney()" />
                                    <div class="ui basic label">VND</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Tiền Giảm ( Theo Chương Trình Khuyến Mãi)</label>
                            <div class="ui input">
                                <div class="ui right disabled labeled fluid input">
                                    <div class="ui label">$</div>
                                    <input id="DiscountedAmount" type="number" class="money" onchange="ExcuteMoney()" />
                                    <div class="ui basic label">VND</div>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Tiền Tự Giảm</label>
                            <div class="ui right labeled fluid input" onchange="ExcuteMoney()">
                                <div class="ui label">$</div>
                                <input id="DiscountedAmountOrder" name="discountOther" type="number" class="money" />
                                <div class="ui basic label">VND</div>
                            </div>
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                        </div>
                        <div class="field">
                            <label>Thành Tiền</label>
                            <div class="ui input">
                                <div class="ui right disabled labeled fluid input">
                                    <div class="ui label">$</div>
                                    <input id="PriceDiscounted" type="number" class="money" />
                                    <div class="ui basic label">VND</div>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" onclick="ExcuteData()">Save</button>
        </div>
    </div>
    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

    <script type="text/javascript">
        var datadiscount;
        var dataService;
        function ClearDicount() {
            $('#discountTab').dropdown('clear');
            ExcuteMoney();
             LoadDiscount();
        }
        function ExcuteMoney() {
           
            var Amount = 0; 
            var Percent = 0
            var priceDiscountService = 0
            var priceService = 0
            if (Number($('#discountTab').dropdown('get value')) != 0) {
                 Percent = datadiscount.filter(word => word["ID"] == Number($('#discountTab').dropdown('get value')))[0]["Percent"];
             Amount = datadiscount.filter(word => word["ID"] == Number($('#discountTab').dropdown('get value')))[0]["Amount"];
             }          
             priceService = dataService.filter(word => word["ID"] == Number($('#serviceTab').dropdown('get value')))[0]["Price"];
             if (Amount != 0)
                {
                    priceDiscountService = Amount;
                }
                else
                {
                    priceDiscountService = Percent * priceService / 100;
                }


            $('#PriceRoot').val(priceService * Number($('#Quanlity').val() ? $('#Quanlity').val() : 1));
            $('#DiscountedAmount').val(priceDiscountService * Number($('#Quanlity').val() ? $('#Quanlity').val() : 1));
            $('#PriceDiscounted').val(Number($('#PriceRoot').val() ? $('#PriceRoot').val() : 0) - Number($('#DiscountedAmount').val() ? $('#DiscountedAmount').val() : 0) - Number($('#DiscountedAmountOrder').val() ? $('#DiscountedAmountOrder').val() : 0));
        }

        function ExcuteData() {
            var data = new Object();
            data.ServiceID = Number($('#serviceTab').dropdown('get value')) ? Number($('#serviceTab').dropdown('get value')) : 0;
            data.Content = $('#note').val() ? $('#note').val() : "";
            data.Quantity = $('#Quanlity').val() ? $('#Quanlity').val() : 0;
            data.Discount_ID = Number($('#discountTab').dropdown('get value')) ? Number($('#discountTab').dropdown('get value')) : 0;
            data.Price_Root = $('#PriceRoot').val() ? $('#PriceRoot').val() : 0;
            data.Discount_Amount = $('#DiscountedAmount').val() ? $('#DiscountedAmount').val() : 0;
            data.Discount_Percent = $('#DiscountedAmount').val() ? $('#DiscountedAmount').val() : 0;
            data.Discount_Amount_Doctor = $('#DiscountedAmountOrder').val() ? $('#DiscountedAmountOrder').val() : 0;
            data.Price_Discounted = $('#PriceDiscounted').val() ? $('#PriceDiscounted').val() : 0;
                        if ($('#form3').form('is valid')) {
                            $.ajax({
                                url: "/Views/Customer/pageTabDetail.aspx/ExcuteData",
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
                                        LoadTabAjax();
                                    } else {
                                        notiError();
                                    }

                                }
                            });
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
        }

        function LoadDiscount() {
          
            GetDataComboServiceCustomerDiscount("/Views/Customer/pageTabDetail.aspx/LoadComboMain", function (data) {
                data.forEach(function (element) {
                    if (CheckServiceInDiscount(Number($('#serviceTab').dropdown('get value')), element["Rule"]) == true) {
                        
                        element["Show"] = 1;
                    }
                });
                datadiscount = data.filter(word => word["Show"] == 1);
                LoadCombo(datadiscount,"ccbDiscountTab")
            });
        }
        function LoadService() {
            GetDataComboServiceCustomer("/Views/Customer/pageTabDetail.aspx/LoadComboMain", function (data) {
                dataService = data;
                LoadComboDetail(data, "ccbServiceTab")
            })
        };
        function CheckServiceInDiscount(serviceID, rule) {
            if (rule == "") {
                return true;
            }
            else {
                var flag = false;
                var word = rule.split("-");

                word.forEach(function (element) {
                    if (element!="" && serviceID == Number(element)) {
                        flag = true;
                    }
                });
                return flag;
            }
        }

        function LoadDataUpdate() {
            let dataTab = ([<%=_dataTab%>][0]);
            if (dataTab) {
                
                $("#serviceTab").dropdown("refresh");
                $("#serviceTab").dropdown("set selected", dataTab[0].Service_ID.toString());
                $("#discountTab").dropdown("refresh");
                $("#discountTab").dropdown("set selected", dataTab[0].Discount_ID);
                $('#note').val((dataTab[0].Note));
                $('#Quanlity').val(Number(dataTab[0].Quantity));
                $('#DiscountedAmountOrder').val(Number(dataTab[0].Discount_Amount_Doctor));
                $('#Discount_Amount').val(Number(dataTab[0].Discount_Amount));
                $('#PriceRoot').val(Number(dataTab[0].Price_Root));
                $('#PriceDiscounted').val(Number(dataTab[0].Price_Discounted));
          
            }
        }

        $(document).ready(function () {
            //document.getElementById("header").focus();
             $('#Quanlity').val(Number(1));
            LoadService();
            LoadDataUpdate();
        });
    </script>
</body>

</html>

