<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageTabDetail.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageTabDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
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
                            <input class="form-control" id="serviceTab" onchange="event.preventDefault();return onChangeServiceTab()" />
                        </div>
                    </div>

                    <div class="field">
                        <div class="field">
                            <label>Khuyến Mãi</label>
                            <input class="form-control" id="discountTab" onchange="event.preventDefault();return onChangeDiscountTab()" />
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
                            <input id="Quanlity" name="numberService" type="text" onchange="ExcuteMoney()" />
                        </div>
                        <div class="field">
                            <label>Tổng Tiền ( Chưa Giảm Giá )</label>
                            <div class="ui input">
                                <div class="ui right disabled labeled fluid input">
                                    <div class="ui label">$</div>
                                    <input id="PriceRoot" type="text" class="money" />
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
                                    <input id="DiscountedAmount" type="text" class="money" />
                                    <div class="ui basic label">VND</div>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Tiền Tự Giảm</label>
                            <div class="ui right labeled fluid input" onchange="ExcuteMoney()">
                                <div class="ui label">$</div>
                                <input id="DiscountedAmountOrder" name="discountOther" type="text" class="money" />
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
                                    <input id="PriceDiscounted" type="text" class="money" />
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


    <script type="text/javascript">
        var dataServiceTab;
        var dataDiscountTab;

        var isExecuteDiscountCombo = 0;
        function onChangeServiceTab() {
            ExcuteMoney();
            LoadDiscount();
            return false;
        }
        function onChangeDiscountTab() {
            if (isExecuteDiscountCombo == 1) {
                ExcuteMoney();
            }
            return false;
        }
        function ExcuteMoney() {
            if (isExecuteDiscountCombo == 1) {
                let Amount = 0;
                let Percent = 0
                let priceDiscountService = 0
                let priceService = 0
                let discounttabChoosen = Number($('#discountTab').val()) ? Number($('#discountTab').val()) : 0;
                if (discounttabChoosen != 0) {
                    Percent = dataDiscountTab.filter(word => word["ID"] == discounttabChoosen)[0]["Percent"];
                    Amount = dataDiscountTab.filter(word => word["ID"] == discounttabChoosen)[0]["Amount"];
                }
                let serviceTabChoosen = Number($('#serviceTab').val());
                priceService = dataServiceTab.filter(word => word["ID"] == serviceTabChoosen)[0]["Price"];
                if (Amount != 0) {
                    priceDiscountService = Amount;
                }
                else {
                    priceDiscountService = Percent * priceService / 100;
                }
                let priceRoot = priceService * Number($('#Quanlity').val() ? $('#Quanlity').val() : 1);
                let discountedAmount = priceDiscountService * Number($('#Quanlity').val() ? $('#Quanlity').val() : 1);
                let priceDiscounted = Number($('#PriceRoot').val() ? $('#PriceRoot').val() : 0) - Number($('#DiscountedAmount').val() ? $('#DiscountedAmount').val() : 0) - Number($('#DiscountedAmountOrder').val() ? $('#DiscountedAmountOrder').val() : 0);

                $('#PriceRoot').val(Number(priceRoot));
                $('#DiscountedAmount').val(Number(discountedAmount));
                $('#PriceDiscounted').val(Number(priceDiscounted));
            }
        }
        function ExcuteData() {
            var data = new Object();
            data.ServiceID = Number($('#serviceTab').val()) ? Number($('#serviceTab').val()) : 0;
            data.Content = $('#note').val() ? $('#note').val() : "";
            data.Quantity = $('#Quanlity').val() ? $('#Quanlity').val() : 0;
            data.Discount_ID = Number($('#discountTab').val()) ? Number($('#discountTab').val()) : 0;
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
            let serviceIDChoosen = $('#serviceTab').val();
            let serviceTypeIDChoosen = Number(dataServiceTab.filter(word => word["ID"] == serviceIDChoosen)[0]["TypeID"]);
            let newDataDiscount = dataDiscountTab;
            let firstDiscount = 0;
            newDataDiscount.forEach(function (element) {
                let rule = element["Rule"];
                let discountType = Number(element["DiscountType"]);
                if (discountType == 3)// All Service
                {
                    element["Show"] = 1;
                    firstDiscount = (firstDiscount == 0) ? Number(element["ID"]) : firstDiscount;
                }
                else if (discountType == 2) // By Service Type
                {
                    let serviceTypeIDChoosenSearch = "-" + serviceTypeIDChoosen + "-";
                    if (rule.includes(serviceTypeIDChoosenSearch)) {
                        element["Show"] = 1;
                        firstDiscount = (firstDiscount == 0) ? Number(element["ID"]) : firstDiscount;
                    }
                    else element["Show"] = 0;
                }
                else // By Service
                {
                    let serviceIDSearch = "-" + serviceIDChoosen + "-";
                    if (rule.includes(serviceIDSearch)) {
                        element["Show"] = 1;
                        firstDiscount = (firstDiscount == 0) ? Number(element["ID"]) : firstDiscount;
                    }
                    else element["Show"] = 0;
                }

            });

            newDataDiscount = newDataDiscount.filter(word => word["Show"] == 1);

            $('#discountTab').inputpicker({
                data: newDataDiscount,
                fields: [
                    { name: 'ID', text: 'Code' },
                    { name: 'Name', text: 'Chương Trình' },
                    { name: 'Percent', text: 'Phần Trăm Giảm' },
                    { name: 'AmountShow', text: 'Tiền Giảm' }
                ],
                headShow: true,
                width: '100%',
                height: '200px',
                autoOpen: false,
                listBackgroundColor: 'rgb(238, 243, 247)',
                listBorderColor: 'white',
                rowSelectedBackgroundColor: 'blue',
                rowSelectedFontColor: 'white',
                fieldText: 'Name',
                fieldValue: 'ID'
            });
            $('#discountTab').val(0);
            if (firstDiscount != 0) $('#discountTab').val(firstDiscount).change();
        }
        function LoadDataUpdate() {
            let dataTab = ([<%=_dataTab%>][0]);
            if (dataTab) {
                $('#serviceTab').val(dataTab[0].Service_ID.toString()).change();
                $('#discountTab').val(dataTab[0].Discount_ID.toString()).change();
                $('#note').val((dataTab[0].Note));
                $('#Quanlity').val(Number(dataTab[0].Quantity));
                $('#DiscountedAmountOrder').val(Number(dataTab[0].Discount_Amount_Doctor));
                $('#DiscountedAmount').val(Number(dataTab[0].Discount_Amount));
                $('#PriceRoot').val(Number(dataTab[0].Price_Root));
                $('#PriceDiscounted').val(Number(dataTab[0].Price_Discounted));
            }
        }

        $(document).ready(function () {
            $('#Quanlity').val(Number(1));
            dataServiceTab = ([<%=_ServiceTab%>][0]);
            dataDiscountTab = ([<%=_DiscountTab%>][0]);
            $('#Quanlity').divide();
            $('#PriceRoot').divide();
            $('#DiscountedAmount').divide();
            $('#DiscountedAmountOrder').divide();
            $('#PriceDiscounted').divide();

            $('#serviceTab').inputpicker({
                data: dataServiceTab,
                fields: [
                    { name: 'ID', text: 'Code' },
                    { name: 'Name', text: 'Tên Dịch Vụ' },
                    { name: 'PriceToShow', text: 'Giá Tiền' }
                ],
                headShow: true,
                width: '100%',
                height: '256px',
                autoOpen: false,
                listBackgroundColor: 'rgb(238, 243, 247)',
                listBorderColor: 'red',
                rowSelectedBackgroundColor: 'blue',
                rowSelectedFontColor: 'white',
                highlightResult: true,
                fieldText: 'Name',
                fieldValue: 'ID'
            });
            LoadDataUpdate();
            isExecuteDiscountCombo = 1;
        });
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

