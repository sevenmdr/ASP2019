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
                <form class="ui form segment form3">

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
                            <input id="dateFrom" class="flatpickr" type="text" placeholder="Date From .." />
                        </div>
                        <div class="field">
                            <label>Đến</label>
                            <input id="dateTo" class="flatpickr" type="text" placeholder="Date To .." />
                        </div>
                    </div>
                    <div class="sixteen wide column">
                        <div class="ui segments">
                            <div class="ui segment">
                                <h5 class="ui header">Chọn Dịch Vụ / Nhóm Dịch Vụ
                                </h5>
                            </div>
                            <div class="ui segment">
                                <div class="ui two column middle aligned very relaxed stackable grid">
                                    <div class="column" id="TableContentLeft" style="height:450px">
                                        <table class="ui celled padded table" id="dtContentLeft" style="width: 100% ">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center">ID</th>
                                                    <th style="text-align: center; width: 10px;">STT</th>
                                                    <th style="text-align: center">Tên</th>
                                                    <th style="text-align: center">Nhóm</th>
                                                    <th style="text-align: center; width: 10px;">Chọn</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>


                                    <div class="ui vertical divider">
                                        Select
                                    </div>
                                    <div class="column" id="TableContentRight"  style="height:450px">
                                        <table class="ui celled padded table" id="dtContentRight" style="width: 100%;">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center">ID</th>
                                                    <th style="text-align: center; width: 10px;">STT</th>
                                                    <th style="text-align: center">Tên</th>
                                                    <th style="text-align: center">Nhóm</th>
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
                searching: false,
                destroy: true,
                "columnDefs": [
                    { "visible": false, "targets": 0, "data": "ID" },
                    { "visible": true, "targets": 1, "data": "STT", width: "50px", "className": "center" },
                    { "visible": true, "targets": 2, "data": "ServiceName", width: "120px" },
                    { "visible": true, "targets": 3, "data": "ServiceTypeName" },
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
                searching: false,
                destroy: true,
                "columnDefs": [
                    { "visible": false, "targets": 0, "data": "ID" },
                    { "visible": true, "targets": 1, "data": "STT", width: "50px", "className": "center" },
                    { "visible": true, "targets": 2, "data": "ServiceName", width: "120px" },
                    { "visible": true, "targets": 3, "data": "ServiceTypeName" },
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
            //var data = new Object();
            //data.TypeHistory_ID = Number($('#TypeHistory').dropdown('get value')) ? Number($('#TypeHistory').dropdown('get value')) : 0;
            //data.TypeCompalint_ID = Number($('#TypeComplain').dropdown('get value')) ? Number($('#TypeComplain').dropdown('get value')) : 0;
            //data.Content = $('#txtNameHistory').val() ? $('#txtNameHistory').val() : "";
            //$('#form3').form('validate form');
            //if ($('#form3').form('is valid')) {
            //    $.ajax({
            //        url: "/Views/Customer/pageHistoryDetail.aspx/ExcuteData",
            //        dataType: "json",
            //        type: "POST",
            //        data: JSON.stringify({ 'data': JSON.stringify(data) }),
            //        contentType: 'application/json; charset=utf-8',
            //        async: true,
            //        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //            notiError("Lỗi Hệ Thống");
            //        },
            //        success: function (result) {
            //            if (result.d == "1") {
            //                notiSuccess();
            //                LoadHistoryAjax();
            //            } else {
            //                notiError("Lỗi Thao Tác");
            //            }
            //        }
            //    })
            //    $('#divDetailPopup').modal('hide');
            //    document.getElementById("divDetailPopup").innerHTML = '';
            //}
            return false;
        }

        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            DataTableServiceLeft = ([<%=_DataTableServiceLeft%>][0]);
            DataTableServiceRight = ([<%=_DataTableServiceRight%>][0]);
            DataDiscountType = ([<%=_DataDiscountType%>][0]);
            divCloneLeft = $("#TableContentLeft").clone();
            divCloneRight = $("#TableContentRight").clone();
            LoadCombo(DataDiscountType, "ccbDiscountType")
            LoadTableLeftAndRight();
        });

        function LoadDataUpdate() {
        <%--    let dataHistory = ([<%=_dataHistory%>][0]);--%>
            //if (dataHistory) {
            //    $("#TypeHistory").dropdown("refresh");
            //    $("#TypeComplain").dropdown("refresh");
            //    $("#TypeHistory").dropdown("set selected", dataHistory[0].Type);
            //    $("#TypeComplain").dropdown("set selected", dataHistory[0].Complaint);
            //    $('#txtNameHistory').val((dataHistory[0].Content));

            //}
        }
    </script>


    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
    <script src="/js/customjs/custom-modal.js"></script>
</body>

</html>

