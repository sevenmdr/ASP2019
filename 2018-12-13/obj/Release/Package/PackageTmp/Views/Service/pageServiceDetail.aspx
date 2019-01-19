<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageServiceDetail.aspx.cs" Inherits="_2018_12_13.Views.Service.pageServiceDetail" %>

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
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" />
    </form>
    <div class="header">
        Sản Phẩm
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="field">
                        <div class="field">
                            <label>Tên</label>
                            <input id="txtName" name="name" type="text" />
                        </div>
                    </div>
                    <div class="three fields">
                        <div class="field">
                            <label>Loại Dịch Vụ</label>
                            <div class="ui fluid search selection dropdown" id="serviceType">
                                <input type="hidden" name="serviceType" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Loại Sản Phẩm</div>
                                <div id="cbbserviceType" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Giá Tiền</label>
                            <div class="ui right labeled fluid input">
                                <div class="ui label">$</div>
                                <input id="txtAmount" name="discountAmount" type="text" />
                                <div class="ui basic label">VND</div>
                            </div>
                        </div>
                                                <div class="field">
                           <label>Số Lần Điều trị</label>
                            <input id="spTotalTreatment" name="Notvalid" type="number" onchange="return ExecuteAmountTreat()" />
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <div class="row">
                                <div class="sixteen wide column">
                                    <div class="ui segments">
                                        <div class="ui segment">
                                            <h5 class="ui header">Hoa Hồng Tư Vấn
                                            </h5>
                                        </div>
                                        <div class="ui segment">
                                            <div class="ui right labeled fluid input">
                                                <div class="ui label">Tiến Hoa Hồng</div>
                                                <input id="txtPerConsulAmount" name="Notvalid" type="text" onchange="return ExecuteAmountConsult()" />
                                                <div class="ui basic label">VND</div>
                                            </div>
                                            <div class="ui divider"></div>
                                            <div class="ui right labeled fluid input">
                                                <div class="ui label">Phần Trăm Giá</div>
                                                <input id="txtPerConsulPercent" name="Notvalid" type="number" onchange="return ExecutePercentConsult()" />
                                                <div class="ui basic label">%</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <div class="row">
                                <div class="sixteen wide column">
                                    <div class="ui segments">
                                        <div class="ui segment">
                                            <h5 class="ui header">Hoa Hồng Điều Trị
                                            </h5>
                                        </div>
                                        <div class="ui segment">
                                            <div class="ui right labeled fluid input">
                                                <div class="ui label">Tiến Hoa Hồng</div>
                                                <input id="txtPerTreatAmount" name="Notvalid" type="text" onchange="return ExecuteAmountTreat()" />
                                                <div class="ui basic label">VND</div>
                                            </div>
                                            <div class="ui divider"></div>
                                            <div class="ui right labeled fluid input">
                                                <div class="ui label">Phần Trăm Giá</div>
                                                <input id="txtPerTreatPercent" name="Notvalid" type="number" onchange="return ExecutePercentTreat()" />
                                                <div class="ui basic label">%</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                        <div class="field">
                            <label>Ghi Chú</label>
                            <input id="txtContent" name="content" type="text" />

                        </div>

                    <div class="field">
                        <div class="field">
                            <div class="ui toggle checkbox">
                                <input id="chkIsproduct" type="checkbox" checked="checked" name="newsletter" onchange="return onChangeIsProduct()" />
                                <label id="lbProductIS" class="coloring red">Là Sản Phẩm</label>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="sixteen wide column">
                            <div class="ui segments">
                                <div class="ui segment">
                                    <h5 class="ui header">Danh Sách Vật Liệu Tiêu Hao
                                    </h5>
                                </div>
                                <div class="ui segment">
                                    <div class="ui form">
                                        <div class="four fields">
                                            <div class="field">
                                                <div class="ui fluid search selection dropdown" id="productDetail" onchange="LoadComboUnit()">
                                                    <input type="hidden" name="productDetail" />
                                                    <i class="dropdown icon"></i>
                                                    <input class="search" autocomplete="off" tabindex="0" />
                                                    <div class="default text">Vật Liệu</div>
                                                    <div id="cbbproductDetail" class="menu" tabindex="-1">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <div class="ui fluid search selection dropdown" id="unitCount">
                                                    <input type="hidden" name="unitCount" />
                                                    <i class="dropdown icon"></i>
                                                    <input class="search" autocomplete="off" tabindex="0" />
                                                    <div class="default text">Đơn Vị Tính</div>
                                                    <div id="cbbunitCount" class="menu" tabindex="-1">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <input id="numberProduct" name="numberProduct" type="number" />
                                            </div>
                                            <div class="field">
                                                <div class="ui blue button" onclick="return ExecuteUnitCount()">Thêm</div>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <div class="field">
                                                <div style="font-size: 10px; color: red" id="textShowMessage"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ui divider"></div>
                                    <div class="column" id="TableProductDetail">
                                        <table class="ui celled table" id="dtContentProductDetail" style="font-size: 11px; max-width: 100%; min-width: 100%">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center">idProduct</th>
                                                    <th style="text-align: center">idUnit</th>
                                                    <th style="text-align: center">state</th>
                                                    <th style="text-align: center">idDetail</th>
                                                    <th style="text-align: left">Tên Vật Liệu</th>
                                                    <th style="text-align: center; max-width: 150px;">Số Lượng</th>
                                                    <th style="text-align: left">Đơn Vị Tính</th>
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
        var DataComboTypeUnitCount; // data don vi tinh
        var DataComboProduct; // data vat lieu
        var DataComboTypeService; // Data loai dịch vụ

        var DataproductChoosen;
        var DataProductChoosenInitialize;
        function ExecuteAmountConsult() {
            if (Number($('#txtPerConsulAmount').val()) != 0) {
                $("#txtPerConsulAmount").attr('name', "discountAmount");
                $('#txtPerConsulPercent').val(0);

                //$("#txtPerConsulPercent").attr('name', "NotVali");
            }
        }
        function ExecutePercentConsult() {
            if (Number($('#txtPerConsulPercent').val()) != 0) {
                $("#txtPerConsulPercent").attr('name', "discountPercent");
                $('#txtPerConsulAmount').val(0);
                // $("#txtPerConsulAmount").attr('name', "NotVali");
            }
        }
        function ExecuteAmountTreat() {
            if (Number($('#txtPerTreatAmount').val()) != 0) {
                $("#txtPerTreatAmount").attr('name', "discountAmount");
                $('#txtPerTreatPercent').val(0);

                //   $("#txtPerTreatPercent").attr('name', "NotVali");
            }
        }
        function ExecutePercentTreat() {
            if (Number($('#txtPerTreatPercent').val()) != 0) {
                $("#txtPerTreatPercent").attr('name', "discountPercent");
                $('#txtPerTreatAmount').val(0);
                //   $("#txtPerTreatAmount").attr('name', "NotVali");
            }
        }
        function LoadComboUnit() {
            var _DataComboUnitCount = DataComboTypeUnitCount.filter(word => word["Product_ID"] == Number($('#productDetail').dropdown('get value')));
            LoadCombo(_DataComboUnitCount, "cbbunitCount")
        }
        $(document).ready(function () {

            divContentProductDetail = $("#TableProductDetail").clone();
            document.getElementById("textShowMessage").innerHTML = "";
            $('#numberProduct').val(1);
             $('#spTotalTreatment').val(1);
            DataComboTypeService = ([<%=_DataComboTypeService%>][0]);
            DataComboTypeUnitCount = ([<%=_DataComboTypeUnitCount%>][0]);
            DataComboProduct = ([<%=_DataComboProduct%>][0]);

            DataproductChoosen = ([<%=_DataproductChoosen%>][0]) === undefined ? [] : ([<%=_DataproductChoosen%>][0]);
            DataProductChoosenInitialize = ([<%=_DataproductChoosen%>][0]) === undefined ? [] : ([<%=_DataproductChoosen%>][0]);

            $('#txtAmount').divide();
            $('#txtPerConsulAmount').divide();
            $('#txtPerTreatAmount').divide();

            LoadCombo(DataComboTypeService, "cbbserviceType")
            // Load test unit name
            LoadCombo(DataComboProduct, "cbbproductDetail")
            LoadDataUpdate();
        });
        function LoadDataTable() {

            DataproductChoosen = DataproductChoosen.filter(word => word["state"] == "1");
            $('#dtContentProductDetail').DataTable().destroy();
            $("#TableProductDetail").replaceWith(divContentProductDetail.clone());
            var table = $('#dtContentProductDetail').DataTable({
                data: DataproductChoosen,
                info: false,
                paging: false,
                ordering: false,
                searching: false,
                destroy: true,
                "columnDefs": [
                    { "visible": false, "targets": 0, "data": "idProduct" },
                    { "visible": false, "targets": 1, "data": "idUnit" },
                    { "visible": false, "targets": 2, "data": "state" },
                    { "visible": false, "targets": 3, "data": "idDetail" },
                    { "visible": true, "targets": 4, "data": "ProductName" },
                    { "visible": true, "targets": 5, "data": "Number" },
                    { "visible": true, "targets": 6, "data": "UnitName" },

                    {
                        "targets": -1,
                        "data": null,
                        "defaultContent":
                            "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                            + "'data-value='fade up'><img class='buttonDeleteClass' src='/img/ButtonImg/delete.png' alt='edit' width='20' height='20'></button>",
                    },
                ],
            });
            document.getElementById("dtContentProductDetail").className = "ui celled table";
            // Load lai Sản Phẩm
            var dataunit = DataComboProduct;
            for (var element in DataproductChoosen) {
                let x = DataproductChoosen[element]["idProduct"];
                dataunit = dataunit.filter(word => word["ID"] != x);
            }
            LoadCombo(dataunit, "cbbproductDetail")


            $('#dtContentProductDetail tbody ').on('click', '.buttonDeleteClass', function (e) {

                e.preventDefault();
                var data = table.row($(this).parents('tr')).data();
                var row_clicked = $(this).closest('tr');
                var index = table.row(row_clicked).index();
                if (data === undefined) {

                    var selected_row = $(this).parents('tr');
                    if (selected_row.hasClass('child')) {
                        selected_row = selected_row.prev();
                    }
                    var rowData = $('#dtContentProductDetail').DataTable().row(selected_row).data();
                }
                else {

                    DeleteProductDetail(index);
                }

            });

        }
        function DeleteProductDetail(index) {
            DataproductChoosen[index].state = "0";
            LoadDataTable();
        }
        function LoadDataUpdate() {

            let DataProductMain = ([<%=_DataProductMain%>][0]);
            LoadDataTable();
            if (DataProductMain) {
                
                $("#txtPerConsulAmount").attr('name', "NotVali");
                $("#txtPerConsulPercent").attr('name', "NotVali");
                $("#txtPerTreatAmount").attr('name', "NotVali");
                $("#txtPerTreatPercent").attr('name', "NotVali");
                $("#serviceType").dropdown("refresh");
                $("#serviceType").dropdown("set selected", DataProductMain[0].ServiceType); //ServiceType
                  $('#spTotalTreatment').val((DataProductMain[0].TimeToTreatment));
                $('#txtName').val((DataProductMain[0].Name));  //Name
                $('#txtAmount').val((DataProductMain[0].Amount)); //Amount
                $('#txtPerConsulAmount').val((DataProductMain[0].PerConsulAmount)); //PerConsulAmount
                $('#txtPerConsulPercent').val((DataProductMain[0].PerConsulPercent)); //PerConsulPercent
                $('#txtPerTreatAmount').val((DataProductMain[0].PerTreatAmount)); //PerTreatAmount
                $('#txtPerTreatPercent').val((DataProductMain[0].PerTreatPercent)); //PerTreatPercent

                $('#txtContent').val((DataProductMain[0].Content)); //Content

                if ((DataProductMain[0].IsPro.toString() === "SP")) {  // IsPro
                    $("#chkIsproduct").prop('checked', true);
                    document.getElementById("lbProductIS").innerHTML = "Là Sản Phẩm";
                }
                else {
                    $("#chkIsproduct").prop('checked', false);
                    document.getElementById("lbProductIS").innerHTML = "";
                }

            }
        }

        function onChangeIsProduct() {
            if (document.getElementById("chkIsproduct").checked) {
                document.getElementById("lbProductIS").innerHTML = "Là Sản Phẩm";
            }
            else {
                document.getElementById("lbProductIS").innerHTML = "";
            }
            return false;
        }
        function ExecuteUnitCount() {

            let productDetail = Number($('#productDetail').dropdown('get value')) ? Number($('#productDetail').dropdown('get value')) : 0;
            let unitCount = Number($('#unitCount').dropdown('get value')) ? Number($('#unitCount').dropdown('get value')) : 0;
            let numberProduct = parseFloat($('#numberProduct').val()) ? parseFloat($('#numberProduct').val()) : 0;
            if (productDetail == 0 || unitCount == 0 || numberProduct <= 0) {
                document.getElementById("textShowMessage").innerHTML = "Chọn Vật Liệu, Đơn Vị Tính Và Số Lượng";
            }
            else {
                document.getElementById("textShowMessage").innerHTML = "";
                var element = {};
                element.idProduct = productDetail;
                element.idUnit = unitCount;
                element.state = "1";
                element.idDetail = "0";
                element.ProductName = $('#productDetail').dropdown('get text');
                element.Number = numberProduct.toString();
                element.UnitName = $('#unitCount').dropdown('get text');
                DataproductChoosen.push(element);
                $('#productDetail').dropdown('clear');
                $('#unitCount').dropdown('clear');
                $('#numberProduct').val(1);
                LoadDataTable();
            }

            return false;
        }
        function ExcuteData() {
            var data = new Object();
            data.ServiceType = Number($('#serviceType').dropdown('get value')) ? Number($('#serviceType').dropdown('get value')) : 0;
            data.PerConsulAmount = $('#txtPerConsulAmount').val() ? $('#txtPerConsulAmount').val() : 0;
            data.PerConsulPercent = $('#txtPerConsulPercent').val() ? $('#txtPerConsulPercent').val() : 0;
            data.Amount = $('#txtAmount').val() ? $('#txtAmount').val() : 0;
            data.PerTreatAmount = $('#txtPerTreatAmount').val() ? $('#txtPerTreatAmount').val() : 0;
            data.PerTreatPercent = $('#txtPerTreatPercent').val() ? $('#txtPerTreatPercent').val() : 0;
            data.Content = $('#txtContent').val() ? $('#txtContent').val() : "";
            data.Name = $('#txtName').val() ? $('#txtName').val() : "";
            data.IsPro = (document.getElementById("chkIsproduct").checked) ? "1" : "0";
            data.TimeToTreatment = Number($('#spTotalTreatment').val()) ? Number($('#spTotalTreatment').val()) : 1;


            // Execute datatable UNIT
            for (var element in DataproductChoosen) {
                let idunit = DataproductChoosen[element]["idProduct"];
                let currentElement = DataProductChoosenInitialize.filter(word => word["idProduct"] == idunit);
                if (currentElement == undefined || currentElement == "") // Chua ton tai
                {
                    DataProductChoosenInitialize.push(DataproductChoosen[element]);
                }
            }

            for (var element in DataProductChoosenInitialize) {
                let idunit = DataProductChoosenInitialize[element]["idProduct"];
                let currentElement = DataproductChoosen.filter(word => word["idProduct"] == idunit);
                if (currentElement == undefined || currentElement == "") // Chua ton tai
                {
                    DataProductChoosenInitialize[element]["state"] = 0
                    //  DataProductChoosenInitialize= DataProductChoosenInitialize.filter(word => word["ID"] != idunit);

                }

            }

            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {

                $.ajax({
                    url: "/Views/Service/pageServiceDetail.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data), 'dataService': JSON.stringify(DataProductChoosenInitialize) }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            LoadServiceAjax();
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

