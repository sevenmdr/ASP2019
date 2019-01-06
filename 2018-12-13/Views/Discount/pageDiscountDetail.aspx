<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageDiscountDetail.aspx.cs" Inherits="_2018_12_13.Views.Discount.pageDiscountDetail" %>
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
        Chương Trình Khuyến Mãi
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3" onsubmit="return false">
                    <div class="field">
                        <div class="field">
                            <div class="field">
                                <label>Tên Chương Trình</label>
                                <input id="txtName" name="name" type="text" />
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Nội Dung</label>
                            <input id="txtContent" name="content" type="text" />
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Phần Trăm(0 - 100)</label>
                            <input id="percentDiscount" name="discountPercent" type="number" onchange="return ExecutePercentDiscount()" />
                        </div>
                        <div class="field">
                            <label>Số Tiền</label>
                            <div class="ui right labeled fluid input">
                                <div class="ui label">$</div>
                                <input id="amountDiscount" name="discountAmount" type="number" class="money" onchange="return ExecuteAmountDiscount()" />
                                <div class="ui basic label">VND</div>
                            </div>
                        </div>
                    </div>
                    <div class="three fields">
                        <div class="field">
                            <label>Loại Khuyến Mãi</label>
                            <div class="ui fluid search selection dropdown" id="TypeDiscountType" onchange="return ChangeDiscountType()">
                                <input type="hidden" name="discountType" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Loại Khuyến Mãi</div>
                                <div id="ccbDiscountType" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Từ</label>
                            <input id="dateFromdetail" class="flatpickr" type="text" placeholder="Date From .." />
                        </div>
                        <div class="field">
                            <label>Đến</label>
                            <input id="dateTodetail" class="flatpickr" type="text" placeholder="Date To .." />
                        </div>
                    </div>
                    <div class="sixteen wide column" style="overflow-y: scroll !important; overflow-x:hidden !important;  max-height: 350px">
                        <div class="ui segments">
                            <div class="ui segment">
                                <h5 class="ui header">Chọn Dịch Vụ / Nhóm Dịch Vụ
                                </h5>
                            </div>
                            <div class="ui segment">
                                <div class="ui two column very relaxed stackable grid">
                                    <div class="column" id="TableContentLeft">
                                        <table class="ui celled padded table" id="dtContentLeft" style="width: 100%;font-size:10px">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center">ID</th>
                                                    <th style="text-align: center">Tên</th>
                                                    <th style="text-align: center; width: 10px;">Chọn</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="ui vertical divider">
                                    </div>
                                    <div class="column" id="TableContentRight">
                                        <table class="ui celled padded table" id="dtContentRight" style="width: 100%;font-size:10px" >
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center">ID</th>
                                                    <th style="text-align: center">Tên</th>
                                                    <th style="text-align: center; width: 10px;">Xóa</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
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
            <button class="ui teal button" form="form3" type="submit" onclick="return ExcuteData()">Save</button>
        </div>

    </div>

    <script type="text/javascript">
        var divCloneLeft;
        var divCloneRight;
        var DataTableServiceLeft;
        var DataTableServiceRight;
        var DataDiscountType;
        var Type = 0;
        function ExecutePercentDiscount() {
            if (Number($('#percentDiscount').val()) != 0) {
                $("#percentDiscount").attr('name', "discountPercent");
                $('#amountDiscount').val(0);
                $("#amountDiscount").attr('name', "NotVali");
            }    
        }
        function ExecuteAmountDiscount() {
            if (Number($('#amountDiscount').val()) != 0) {
                 $("#amountDiscount").attr('name', "discountAmount");
                $('#percentDiscount').val(0);
                
                 $("#percentDiscount").attr('name', "NotVali");
            }

            

        }
        function ChangeDiscountType() {
            DataTableServiceLeft = "";
            DataTableServiceRight = "";
            let discounttype = $('#TypeDiscountType').dropdown('get value');
            switch (discounttype) {
                case "1":
                    LoadLeftRightInitializeByService();
                    Type = 1;
                    break;
                case "2":
                    LoadLeftRightInitializeByServiceType();
                    Type = 2;
                    break;
                case "3":
                    LoadLeftRightInitializeByAll();
                    Type = 3;
                    $('#TableContentLeft').addClass("disabled");
                    $('#TableContentRight').addClass("disabled");
                    break;
                default:
                    break;
            }
            LoadTableLeftAndRight();
        }


        function LoadLeftRightInitializeByService() {

            $.ajax({
                url: "/Views/Discount/pageDiscountDetail.aspx/LoadLeftRightInitializeByService",
                dataType: "json",
                type: "POST",
                data: JSON.stringify({}),
                contentType: 'application/json; charset=utf-8',
                async: false,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    notiError();
                },
                success: function (result) {
                    if (result.d != "0") {
                        DataTableServiceLeft = JSON.parse(JSON.parse(result.d)[0]);
                        DataTableServiceRight = JSON.parse(JSON.parse(result.d)[1]);
                    } else {
                        notiError();
                    }
                }
            });
        }
        function LoadLeftRightInitializeByServiceType() {
            $.ajax({
                url: "/Views/Discount/pageDiscountDetail.aspx/LoadLeftRightInitializeByServiceType",
                dataType: "json",
                type: "POST",
                data: JSON.stringify({}),
                contentType: 'application/json; charset=utf-8',
                async: false,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    notiError();
                },
                success: function (result) {
                    if (result.d != "0") {
                        DataTableServiceLeft = JSON.parse(JSON.parse(result.d)[0]);
                        DataTableServiceRight = JSON.parse(JSON.parse(result.d)[1]);
                    } else {
                        notiError();
                    }
                }
            });
        }
        function LoadLeftRightInitializeByAll() {
            DataTableServiceLeft = "";
            DataTableServiceRight = "";
        }
        function LoadTableLeftAndRight() {

            $('#dtContentLeft').DataTable().destroy();
            $("#TableContentLeft").replaceWith(divCloneLeft.clone());
            $('#dtContentRight').DataTable().destroy();
            $("#TableContentRight").replaceWith(divCloneRight.clone());

            var table = $('#dtContentLeft').DataTable({
                data: DataTableServiceLeft,
                info: false,
                paging: false,
                ordering: false,
                searching: true,
                destroy: true,
                //scrollY:        '50vh',
                scrollCollapse: true,
                pageResize: true,
                "columnDefs": [
                    { "visible": false, "targets": 0, "data": "ID" },
                    { "visible": true, "targets": 1, "data": "Name"},
                    {
                        "targets": -1,
                        "data": null,
                        "defaultContent":
                            "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                            + "'data-value='fade up'><img class='buttonSelectClass' src='/img/ButtonImg/select.png' alt='edit' width='20' height='20'></button>",
                    },
                ],
            });

            document.getElementById("dtContentLeft").className = "ui celled table";
            $('#dtContentLeft tbody ').on('click', '.buttonSelectClass', function (e) {
                e.preventDefault();
                var data = table.row($(this).parents('tr')).data();
                var id;
                if (data == undefined) {

                    var selected_row = $(this).parents('tr');
                    if (selected_row.hasClass('child')) {
                        selected_row = selected_row.prev();
                    }
                    var rowData = $('#dtContentLeft').DataTable().row(selected_row).data();
                    id = rowData.ID;

                } else {

                    id = data.ID;
                }

                ExecuteFromLeft(id);
            });

            var table = $('#dtContentRight').DataTable({
                data: DataTableServiceRight,
                info: false,
                paging: false,
                ordering: false,
                searching: true,
                destroy: true,
                //scrollY:        '50vh',
                //scrollCollapse: true,
                pageResize: true,
                "columnDefs": [
                    { "visible": false, "targets": 0, "data": "ID" },
                    { "visible": true, "targets": 1, "data": "Name"},
                    {
                        "targets": -1,
                        "data": null,
                        "defaultContent":
                            "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                            + "'data-value='fade up'><img class='buttonDeleteClass' src='/img/ButtonImg/delete.png' alt='edit' width='20' height='20'></button>",
                    },
                ],
            });

            document.getElementById("dtContentRight").className = "ui celled table";
            $('#dtContentRight tbody ').on('click', '.buttonDeleteClass', function (e) {
                e.preventDefault();
                var data = table.row($(this).parents('tr')).data();
                var id;
                if (data == undefined) {

                    var selected_row = $(this).parents('tr');
                    if (selected_row.hasClass('child')) {
                        selected_row = selected_row.prev();
                    }
                    var rowData = $('#dtContentRight').DataTable().row(selected_row).data();
                    id = rowData.ID;

                } else {

                    id = data.ID;
                }
                ExecuteFromRight(id);
            });


        }
        function ExecuteFromLeft(id) {
            $.ajax({
                url: "/Views/Discount/pageDiscountDetail.aspx/ExecuteFromLeft",
                dataType: "json",
                type: "POST",
                data: JSON.stringify({ 'id': id, "left": (DataTableServiceLeft == undefined) ? "" : JSON.stringify(DataTableServiceLeft), "right": (DataTableServiceRight == undefined) ? "" : JSON.stringify(DataTableServiceRight) }),
                contentType: 'application/json; charset=utf-8',
                async: false,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    notiError();
                },
                success: function (result) {
                    if (result.d != "0") {
                        DataTableServiceLeft = JSON.parse(JSON.parse(result.d)[0]);
                        DataTableServiceRight = JSON.parse(JSON.parse(result.d)[1]);
                        LoadTableLeftAndRight();
                    } else {
                        notiError();
                    }
                }
            });

        }
        function ExecuteFromRight(id) {
            $.ajax({
                url: "/Views/Discount/pageDiscountDetail.aspx/ExecuteFromRight",
                dataType: "json",
                type: "POST",
                data: JSON.stringify({ 'id': id, "left": (DataTableServiceLeft == undefined) ? "" : JSON.stringify(DataTableServiceLeft), "right": (DataTableServiceRight == undefined) ? "" : JSON.stringify(DataTableServiceRight) }),
                contentType: 'application/json; charset=utf-8',
                async: false,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    notiError();
                },
                success: function (result) {
                    if (result.d != "0") {
                        DataTableServiceLeft = JSON.parse(JSON.parse(result.d)[0]);
                        DataTableServiceRight = JSON.parse(JSON.parse(result.d)[1]);
                        LoadTableLeftAndRight();
                    } else {
                        notiError();
                    }
                }
            });
        }
        function ExcuteData() {
            if (DataTableServiceRight != undefined && Number($('#TypeDiscountType').dropdown('get value'))) {
                var data = new Object();
                data.Type = Number($('#TypeDiscountType').dropdown('get value')) ? Number($('#TypeDiscountType').dropdown('get value')) : 0;
                data.Content = $('#txtContent').val() ? $('#txtContent').val() : "";
                data.Name = $('#txtName').val() ? $('#txtName').val() : "";
                data.Amount = $('#amountDiscount').val() ? $('#amountDiscount').val() : 0;
                data.Percent = $('#percentDiscount').val() ? $('#percentDiscount').val() : 0;
                data.DateFrom = $('#dateFromdetail').val() ? $('#dateFromdetail').val() : new Date();
                data.DateTo = $('#dateTodetail').val() ? $('#dateTodetail').val() : new Date();

                var Rule;
                if (DataTableServiceRight != "") {
                    DataTableServiceRight.forEach(function (x) {
                    if (Rule) { Rule = Rule + '-' + x["ID"]; }
                        else { Rule = x["ID"]; }
                     
                    });
                    Rule=   Rule + "-";
                }
                else {
                    Rule = "";
                }
                data.Rule = Rule;
                $('#form3').form('validate form');
                if ($('#form3').form('is valid')) {
                    debugger
                    $.ajax({
                        url: "/Views/Discount/pageDiscountDetail.aspx/ExcuteData",
                        dataType: "json",
                        type: "POST",
                        data: JSON.stringify({ 'data': JSON.stringify(data) }),
                        contentType: 'application/json; charset=utf-8',
                        async: true,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            notiError("Lỗi Hệ Thống");
                        },
                        success: function (result) {
                            if (result.d == "1") {
                                notiSuccess();
                                LoadDiscountAjax();
                            } else {
                                notiError("Lỗi Thao Tác");
                            }
                        }
                    })
                    $('#divDetailPopup').modal('hide');
                    document.getElementById("divDetailPopup").innerHTML = '';
                }
            }
            else {
                notiError("Vui Lòng Chọn Dịch Vụ Hoặc Nhóm Dịch Vụ Cần Giảm");
            }

            return false;
        }

        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            divCloneLeft = $("#TableContentLeft").clone();
            divCloneRight = $("#TableContentRight").clone();
            DataDiscountType = ([<%=_DataDiscountType%>][0]);
            LoadCombo(DataDiscountType, "ccbDiscountType")
            LoadDataUpdate();

            DataTableServiceLeft = ([<%=_DataTableServiceLeft%>][0]);
            DataTableServiceRight = ([<%=_DataTableServiceRight%>][0]);


            LoadTableLeftAndRight();
        });

        function LoadDataUpdate() {
            let DataDiscount = ([<%=_DataDiscount%>][0]);

            if (DataDiscount) {
                $("#amountDiscount").attr('name', "NotVali");
                 $("#percentDiscount").attr('name', "NotVali");
                $('#percentDiscount').val(DataDiscount[0].Percent);
                $('#amountDiscount').val(DataDiscount[0].Amount);  
                $("#TypeDiscountType ").dropdown("set selected", DataDiscount[0].Type);
                $("#dateFromdetail").flatpickr({ defaultDate: DataDiscount[0].DateForm });
                $("#dateTodetail").flatpickr({ defaultDate: DataDiscount[0].DateTo });
                $('#txtName').val(DataDiscount[0].Name);
                $('#txtContent').val(DataDiscount[0].Content);

            }
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

