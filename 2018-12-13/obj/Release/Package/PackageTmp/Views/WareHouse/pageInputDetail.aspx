<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageInputDetail.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageInputDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stagb Admin Template</title>
    <meta charset="utf-8" />
    <link rel="icon" href="~/img/favicon.ico" />
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
    <script src="/js/jquery.com/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="/js/simple.money.format.js"></script>
    <script type="text/javascript">
        function LoadDataUpdate() {
            CallWebMethod();
        }
    </script>
</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>
    <div id="header" class="header">
        Thông Tin Nhập Hàng
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="two fields">
                        <div class="field">
                            <label>Tên Hàng</label>
                            <div class="ui fluid search selection dropdown">
                                <input type="hidden" name="product" id="product" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Tên Hàng</div>
                                <div id="ccbProduct" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Nhà Cung Cấp</label>
                            <div class="ui fluid search selection dropdown">
                                <input type="hidden" name="supplier" id="supplier" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Nhà Cung Cấp</div>
                                <div id="ccbSupplier" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Ngày Nhập</label>
                            <input name="date" class="flatpickr" type="text" placeholder="Select Date.." />
                        </div>
                        <div class="field">
                            <label>Đơn Vị Nhập</label>
                            <div class="ui fluid search selection dropdown">
                                <input type="hidden" name="unitProduct" id="unitProduct" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Đơn Vị Nhập</div>
                                <div id="ccbUnitProduct" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="two fields">
                        <div class="field">
                            <label>Số Lượng ( 1 - 100 )</label>
                            <input name="numberProduct" type="text" />
                        </div>
                        <div class="field">
                            <label>Thành Tiền</label>
                            <div class="ui right labeled fluid input">
                                <div class="ui label">$</div>
                                <input name="productPrice" type="text" class="money" />
                                <div class="ui basic label">VND</div>
                            </div>
                        </div>
                    </div>

                    <div class="field">
                        <div class="field">
                            <label>Ghi Chú</label>
                            <input name="note" type="text" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" type="submit">Save</button>
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
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            document.getElementById("header").focus();
            $('.money').simpleMoneyFormat();
        });
    </script>
</body>

</html>

