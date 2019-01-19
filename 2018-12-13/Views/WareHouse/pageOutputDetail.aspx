<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageOutputDetail.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageOutputDetail" %>

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
        Xuất Hàng
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="two fields">
                        <div class="field">
                            <label>Mã Xuất Hàng</label>
                            <input id="txtCode" name="name" type="text" disabled />
                        </div>
                        <div class="field">
                            <label>Ngày Xuất</label>
                            <input id="dateOutput" class="flatpickr" type="text" placeholder="Select Date.." />
                        </div>
                    </div>
                    <div class="two field">
                        <div class="field">
                            <label>Ghi Chú</label>
                            <input id="txtContent" name="content" type="text" />
                        </div>
                        <div class="field">
                            <label>Kho</label>
                            <div class="ui fluid search selection dropdown" id="Ware">
                                <input type="hidden" name="ware" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Kho</div>
                                <div id="cbbWare" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="sixteen wide column">
                            <div class="ui segments">
                                <div class="ui segment">
                                    <h5 class="ui header">Chi Tiết Xuất Hàng
                                    </h5>
                                </div>
                                <div class="ui segment">
                                    <div class="ui form">
                                        <div class="three fields">
                                            <div class="field">
                                                <label>Tên Hàng</label>
                                                <div class="ui fluid search selection dropdown" id="product" onchange="LoadComboUnit()">
                                                    <input type="hidden" />
                                                    <i class="dropdown icon"></i>
                                                    <input class="search" autocomplete="off" tabindex="0" />
                                                    <div class="default text">Tên Hàng</div>
                                                    <div id="cbbProduct" class="menu" tabindex="-1">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label>Số Lượng</label>
                                                <input id="numberProduct" type="number" name="numberProduct" />
                                            </div>
                                            <div class="field">
                                                <label>Đơn Vị Xuất</label>
                                                <div class="ui fluid search selection dropdown" id="productDetailUnit">
                                                    <input type="hidden" />
                                                    <i class="dropdown icon"></i>
                                                    <input class="search" autocomplete="off" tabindex="0" />
                                                    <div class="default text">Đơn Vị Xuất</div>
                                                    <div id="cbbProductDetailUnit" class="menu" tabindex="-1">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="field">
                                        <div class="ui blue button" onclick="return ExecuteProductDetail()">Thêm</div>
                                    </div>
                                    <div class="field">
                                        <div class="field">
                                            <div style="font-size: 10px; color: red" id="textShowMessage"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ui divider"></div>
                                <div class="column" id="TableProductDetail">
                                    <table class="ui celled table" id="dtTableProductDetail" style="font-size: 11px; max-width: 100%; min-width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center">idProduct</th>
                                                <th style="text-align: center">UnitCountID</th>
                                                <th style="text-align: center">state</th>
                                                <th style="text-align: center">idDetail</th>
                                                <th style="text-align: center">Sản Phẩm</th>
                                                <th style="text-align: center; max-width: 100px;">Số Lượng</th>
                                                <th style="text-align: center; max-width: 100px;">Đơn Vị</th>
                                                <th style="text-align: center; max-width: 60px;">Xóa</th>
                                            </tr>
                                        </thead>
                                    </table>
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
        var divContentProductDetail;
        var DataComboUnitCount; // Data dvt
        var DataComboProduct; // Data sp
        var DataComboWare; // Data sp

        var DataProductChoosen;
        var DataProductChoosenInitialize;
        function LoadComboUnit() {
            var _DataComboUnitCount = DataComboUnitCount.filter(word => word["Product_ID"] == Number($('#product').dropdown('get value')));
            LoadCombo(_DataComboUnitCount, "cbbProductDetailUnit")
        }
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'Y-m-d',
                enableTime: false,
                defaultDate: new Date(),
            });
            $('#numberProduct').val(1);
            divContentProductDetail = $("#TableProductDetail").clone();
            document.getElementById("textShowMessage").innerHTML = "";
            DataComboProduct = ([<%=_DataComboProduct%>][0]);
            DataComboProductInitialize = ([<%=_DataComboProduct%>][0]);
            DataComboUnitCount = ([<%=_DataComboUnitCount%>][0]);
            DataComboWare = ([<%=_DataComboWare%>][0]);


            DataProductChoosen = ([<%=_DataProductChoosen%>][0]) === undefined ? [] : ([<%=_DataProductChoosen%>][0]);
            DataProductChoosenInitialize = ([<%=_DataProductChoosen%>][0]) === undefined ? [] : ([<%=_DataProductChoosen%>][0]);
            LoadCombo(DataComboProduct, "cbbProduct")
            LoadCombo(DataComboWare, "cbbWare")

            LoadDataUpdate();
        });
        function LoadDataTable() {
            DataProductChoosen = DataProductChoosen.filter(word => word["state"] == "1");

            $('#dtTableProductDetail').DataTable().destroy();
            $("#TableProductDetail").replaceWith(divContentProductDetail.clone());
            var table = $('#dtTableProductDetail').DataTable({
                data: DataProductChoosen,
                info: false,
                paging: false,
                ordering: false,
                searching: false,
                destroy: true,
                "columnDefs": [
                    { "visible": false, "targets": 0, "data": "idProduct" },
                    { "visible": false, "targets": 1, "data": "UnitCountID" },
                    { "visible": false, "targets": 2, "data": "state" },
                    { "visible": false, "targets": 3, "data": "idDetail" },
                    { "visible": true, "targets": 4, "data": "NameProduct" },
                    { "visible": true, "targets": 5, "data": "Number" },
                    { "visible": true, "targets": 6, "data": "NameUnit" },

                    {
                        "targets": -1,
                        "data": null,
                        "defaultContent":
                            "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                            + "'data-value='fade up'><img class='buttonDeleteClass' src='/img/ButtonImg/delete.png' alt='edit' width='20' height='20'></button>",
                    },
                ],
            });
            document.getElementById("dtTableProductDetail").className = "ui celled table";

            // Load lai product
            var dataProduct = DataComboProduct;
            for (var element in DataProductChoosen) {
                let x = DataProductChoosen[element]["idProduct"];
                dataProduct = dataProduct.filter(word => word["ID"] != x);
            }
            LoadCombo(dataProduct, "cbbProduct")




            $('#dtTableProductDetail tbody ').on('click', '.buttonDeleteClass', function (e) {

                e.preventDefault();

                var data = table.row($(this).parents('tr')).data();
                var row_clicked = $(this).closest('tr');
                var index = table.row(row_clicked).index();
                if (data === undefined) {

                    var selected_row = $(this).parents('tr');
                    if (selected_row.hasClass('child')) {
                        selected_row = selected_row.prev();
                    }
                    var rowData = $('#dtTableProductDetail').DataTable().row(selected_row).data();
                }
                else {
                    DeleteProductDetail(index);
                }

            });
           
        }

        function DeleteProductDetail(index) {
            DataProductChoosen[index].state = "0"
            LoadDataTable();
        }
        function LoadDataUpdate() {
            let DataOutputMain = ([<%=_DataOutputMain%>][0]);
            LoadDataTable();
            if (DataOutputMain) {
                $('#txtCode').val((DataOutputMain[0].Code));
                $('#dateOutput').val((DataOutputMain[0].DateExport));
                $('#txtContent').val((DataOutputMain[0].Content));
                $("#Ware").dropdown("refresh");
                $("#Ware").dropdown("set selected", DataOutputMain[0].Ware);

            }
        }

        function ExecuteProductDetail() {
            let product = Number($('#product').dropdown('get value')) ? Number($('#product').dropdown('get value')) : 0;
            let productDetailUnit = Number($('#productDetailUnit').dropdown('get value')) ? Number($('#productDetailUnit').dropdown('get value')) : 0;
            let numberProduct = $('#numberProduct').val() ? $('#numberProduct').val() : 0;
            if (product == 0 || productDetailUnit == 0 || numberProduct < 1 ) {
                document.getElementById("textShowMessage").innerHTML = "Đơn Vị Xuất, Số Lượng Xuất,Hàng Xuất";
            }
            else {

                document.getElementById("textShowMessage").innerHTML = "";
                var element = {};
                element.idProduct = product;
                element.NameProduct = $('#product').dropdown('get text');
                element.UnitCountID = productDetailUnit;
                element.NameUnit = $('#productDetailUnit').dropdown('get text');
                element.Number = numberProduct.toString();;
                element.state = "1";
                element.idDetail = "0";
                DataProductChoosen.push(element);

                $('#product').dropdown('clear');
                $('#productDetailUnit').dropdown('clear');
                $('#numberProduct').val(1);
                LoadDataTable();
            }

            return false;
        }
        function ExcuteData() {
            var data = new Object();
            data.OutputCode = "";
            data.DateOutput = $('#dateOutput').val() ? $('#dateOutput').val() : "";
            data.Content = $('#txtContent').val() ? $('#txtContent').val() : "";
            data.Ware = Number($('#Ware').dropdown('get value')) ? Number($('#Ware').dropdown('get value')) : 0;


            // Execute datatable Product

            for (var element in DataProductChoosen) {
                let idProduct = DataProductChoosen[element]["idProduct"];
                let currentElement = DataProductChoosenInitialize.filter(word => word["idProduct"] == idProduct);
                if (currentElement == undefined || currentElement == "") // Chua ton tai
                {
                    DataProductChoosenInitialize.push(DataProductChoosen[element]);
                }
            }

            for (var element in DataProductChoosenInitialize) {
                let idProduct = DataProductChoosenInitialize[element]["idProduct"];
                let currentElement = DataProductChoosen.filter(word => word["idProduct"] == idProduct);
                if (currentElement == undefined || currentElement == "") // Chua ton tai
                {
                    DataProductChoosenInitialize[element]["state"] = 0
                    //  DataunitCountChoosenInitialize= DataunitCountChoosenInitialize.filter(word => word["ID"] != idProduct);

                }

            }




            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {

                $.ajax({
                    url: "/Views/WareHouse/pageOutputDetail.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data), 'dataProduct': JSON.stringify(DataProductChoosenInitialize) }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            LoadOutputAjax();
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

