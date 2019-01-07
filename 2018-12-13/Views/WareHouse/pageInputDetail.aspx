<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageInputDetail.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageInputDetail" %>

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
        Sản Phẩm
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="three fields">
                        <div class="field">
                            <label>Mã Nhập Hàng</label>
                            <input id="txtCode" name="name" type="text" disabled />
                        </div>
                        <div class="field">
                            <label>Ngày Nhập</label>
                            <input id="dateInput" class="flatpickr" type="text" placeholder="Select Date.." />
                        </div>
                        <div class="field">
                            <label>Tổng Tiền</label>
                            <input id="TotalAmount" name="UnitChange" type="number" disabled />
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Ghi Chú</label>
                            <input id="txtContent" name="content" type="text" />

                        </div>
                    </div>

                    <div class="row">
                        <div class="sixteen wide column">
                            <div class="ui segments">
                                <div class="ui segment">
                                    <h5 class="ui header">Chi Tiết Nhập Hàng
                                    </h5>
                                </div>
                                <div class="ui segment">
                                    <div class="ui form">
                                        <div class="two fields">
                                            <div class="field">
                                                <label>Tên Hàng</label>
                                                <div class="ui fluid search selection dropdown" id="product">
                                                    <input type="hidden" name="product" />
                                                    <i class="dropdown icon"></i>
                                                    <input class="search" autocomplete="off" tabindex="0" />
                                                    <div class="default text">Tên Hàng</div>
                                                    <div id="cbbProduct" class="menu" tabindex="-1">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label>Nhà Cung Cấp</label>
                                                <div class="ui fluid search selection dropdown" id="supplier">
                                                    <input type="hidden" name="supplier" />
                                                    <i class="dropdown icon"></i>
                                                    <input class="search" autocomplete="off" tabindex="0" />
                                                    <div class="default text">Nhà Cung Cấp</div>
                                                    <div id="cbbSupplier" class="menu" tabindex="-1">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="three fields">
                                            <div class="field">
                                                <label>Số Lượng</label>
                                                <input id="numberProduct" name="numberProduct" type="number" />
                                            </div>
                                            <div class="field">
                                                <label>Đơn Vị Nhập</label>
                                                <div class="ui fluid search selection dropdown" id="productDetailUnit">
                                                    <input type="hidden" name="productDetailUnit" />
                                                    <i class="dropdown icon"></i>
                                                    <input class="search" autocomplete="off" tabindex="0" />
                                                    <div class="default text">Đơn Vị Nhập</div>
                                                    <div id="cbbProductDetailUnit" class="menu" tabindex="-1">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label>Thành Tiền</label>
                                                <input id="amountProduct" name="amountProduct" type="number" />
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
                                                    <th style="text-align: center">SupplierID</th>
                                                    <th style="text-align: center">UnitCountID</th>
                                                    <th style="text-align: center">state</th>
                                                    <th style="text-align: center">idDetail</th>
                                                    <th style="text-align: center">Sản Phẩm</th>
                                                    <th style="text-align: center; max-width: 100px;">Số Lượng</th>
                                                    <th style="text-align: center; max-width: 100px;">Đơn Vị</th>
                                                    <th style="text-align: center; max-width: 150px;">Thành Tiền</th>
                                                    <th style="text-align: center">Nhà Cung Cấp</th>
                                                    <th style="text-align: center; max-width: 60px;">Xóa</th>
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
        var divContentProductDetail;

        var DataComboSupplier; // Data nha cung cap
        var DataComboUnitCount; // Data dvt
        var DataComboProduct; // Data sp


        var DataProductChoosen;


        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            divContentProductDetail = $("#TableProductDetail").clone();
            document.getElementById("textShowMessage").innerHTML = "";
            DataComboSupplier = ([<%=_DataComboSupplier%>][0]);
            DataComboProduct = ([<%=_DataComboProduct%>][0]);
            DataComboUnitCount = ([<%=_DataComboUnitCount%>][0]);
            DataProductChoosen = ([<%=_DataProductChoosen%>][0]) === undefined ? [] : ([<%=_DataProductChoosen%>][0]);

            LoadCombo(DataComboSupplier, "cbbSupplier")
            LoadCombo(cbbProduct, "cbbUnitCountTpyeDefault")
            LoadCombo(DataComboUnitCount, "cbbProductDetailUnit")

            LoadDataUpdate();
        });
        function LoadDataTable() {
            var _DataProductChoosen = DataProductChoosen.filter(word => word["state"] == "1");

            $('#dtTableProductDetail').DataTable().destroy();
            $("#TableProductDetail").replaceWith(divContentProductDetail.clone());
            var table = $('#dtTableProductDetail').DataTable({
                data: _DataProductChoosen,
                info: false,
                paging: false,
                ordering: false,
                searching: false,
                destroy: true,
                "columnDefs": [
                    { "visible": false, "targets": 0, "data": "idProduct" },
                    { "visible": false, "targets": 1, "data": "SupplierID" },
                    { "visible": false, "targets": 2, "data": "UnitCountID" },
                    { "visible": false, "targets": 3, "data": "state" },
                    { "visible": false, "targets": 4, "data": "idDetail" },
                    { "visible": true, "targets": 5, "data": "NameProduct" },
                    { "visible": true, "targets": 6, "data": "Number" },
                    { "visible": true, "targets": 7, "data": "NameUnit" },
                    { "visible": true, "targets": 8, "data": "Amount" },
                    { "visible": true, "targets": 9, "data": "NameSupplier" },

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
            let DataInputMain = ([<%=_DataInputMain%>][0]);
            LoadDataTable();
            if (DataInputMain) {
                //$("#productType").dropdown("refresh");
                //$("#unitCountTypeDefault").dropdown("refresh"); 
                //$("#productType").dropdown("set selected", DataProductMain[0].Type);
                //$("#unitCountTypeDefault").dropdown("set selected", DataProductMain[0].DefaultUnit);
                //$('#txtName').val((DataProductMain[0].Name));
                //$('#txtContent').val((DataProductMain[0].Content));
            }
        }

        function ExecuteProductDetail() {
            let product = Number($('#product').dropdown('get value')) ? Number($('#product').dropdown('get value')) : 0;
            let supplier = Number($('#supplier').dropdown('get value')) ? Number($('#supplier').dropdown('get value')) : 0;
            let productDetailUnit = Number($('#productDetailUnit').dropdown('get value')) ? Number($('#productDetailUnit').dropdown('get value')) : 0;
            let numberProduct = $('#numberProduct').val() ? $('#numberProduct').val() : 0;
            let amountProduct = $('#amountProduct').val() ? $('#amountProduct').val() : 0;
            if (product == 0 || supplier == 0 || productDetailUnit == 0 || numberProduct < 1 || amountProduct < 0) {
                document.getElementById("textShowMessage").innerHTML = "Đơn Vị Nhập, Số Lượng Nhập,Tiền Nhập,Nhà Cung Cấp,Hàng Nhập";
            }
            else {

                document.getElementById("textShowMessage").innerHTML = "";
                var element = {};
                element.idProduct = product;
                element.SupplierID = supplier;
                element.NameProduct = $('#product').dropdown('get text');
                element.NameSupplier = $('#supplier').dropdown('get text');
                element.UnitCountID = productDetailUnit;
                element.NameUnit = $('#productDetailUnit').dropdown('get text');
                element.Number = numberProduct;
                element.Amount = amountProduct;
                element.idDetail = "0";
                element.state = "1";
                DataProductChoosen.push(element);

                $('#product').dropdown('clear');
                $('#supplier').dropdown('clear');
                $('#productDetailUnit').dropdown('clear');
                $('#numberProduct').val(0);
                $('#amountProduct').val(0);
                LoadDataTable();
            }

            return false;
        }
        function ExcuteData() {
            //var data = new Object();
            //data.Type = Number($('#productType').dropdown('get value')) ? Number($('#productType').dropdown('get value')) : 0;
            //data.DefaultUnit = Number($('#unitCountTypeDefault').dropdown('get value')) ? Number($('#unitCountTypeDefault').dropdown('get value')) : 0;
            //data.Content = $('#txtContent').val() ? $('#txtContent').val() : "";
            //data.Name = $('#txtName').val() ? $('#txtName').val() : "";
            //$('#form3').form('validate form');
            //if ($('#form3').form('is valid')) {

            //    $.ajax({
            //        url: "/Views/WareHouse/pageProductDetail.aspx/ExcuteData",
            //        dataType: "json",
            //        type: "POST",
            //        data: JSON.stringify({ 'data': JSON.stringify(data), 'dataUnit': JSON.stringify(DataProductChoosen) }),
            //        contentType: 'application/json; charset=utf-8',
            //        async: true,
            //        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //            notiError("Lỗi Hệ Thống");
            //        },
            //        success: function (result) {
            //            if (result.d == "1") {
            //                notiSuccess();
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

