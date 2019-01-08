<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageProductDetail.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageProductDetail" %>

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
                    <div class="three fields">
                        <div class="field">
                            <label>Tên</label>
                            <input id="txtName" name="name" type="text" />
                        </div>
                        <div class="field">
                            <label>Loại Sản Phẩm</label>
                            <div class="ui fluid search selection dropdown" id="productType">
                                <input type="hidden" name="productType" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Loại Sản Phẩm</div>
                                <div id="cbbproductType" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Đơn Vị Tính Chuẩn</label>
                            <div class="ui fluid search selection dropdown" id="unitCountTypeDefault" onchange="return onchangeCountTypeDefault()">
                                <input type="hidden" name="CountTypeDefault" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Đơn Vị Tính Chuẩn</div>
                                <div id="cbbUnitCountTpyeDefault" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="three fields">
                        <div class="field">
                            <label>Định Mức 1</label>
                            <div class="ui right labeled fluid input">
                                <div class="ui label">|||</div>
                                <input id="txtNorm1" name="Norm" type="number" />
                                <div class="ui basic label" id="Norm1"></div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Định Mức 2</label>
                            <div class="ui right labeled fluid input">
                                <div class="ui label">|||</div>
                                <input id="txtNorm2" name="Norm" type="number" />
                                <div class="ui basic label" id="Norm2"></div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Định Mức 3</label>
                            <div class="ui right labeled fluid input">
                                <div class="ui label">|||</div>
                                <input id="txtNorm3" name="Norm" type="number" />
                                <div class="ui basic label" id="Norm3"></div>
                            </div>

                        </div>
                    </div>

                    <div class="field">
                        <div class="field">
                            <label>Ghi Chú</label>
                            <input id="txtContent" name="content" type="text" />

                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <div class="ui toggle checkbox">
                                <input id="chkIsmanage" type="checkbox" checked="checked" name="newsletter" onchange="return onChangeIsManage()" />
                                <label id="lbQLTK" class="coloring red">Mặt Hàng Quản Lý Tồn Kho</label>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="sixteen wide column">
                            <div class="ui segments">
                                <div class="ui segment">
                                    <h5 class="ui header">Đơn Vị Tính
                                    </h5>
                                </div>
                                <div class="ui segment">
                                    <div class="ui form">
                                        <div class="three fields">
                                            <div class="field">
                                                <div class="ui fluid search selection dropdown" id="unitCountTpye">
                                                    <input type="hidden" name="unitCountTpye" />
                                                    <i class="dropdown icon"></i>
                                                    <input class="search" autocomplete="off" tabindex="0" />
                                                    <div class="default text">Đơn Vị Tính</div>
                                                    <div id="cbbUnitCountTpye" class="menu" tabindex="-1">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <input id="UnitChange" name="UnitChange" type="number" />
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
                                    <div class="column" id="TableUnitCount">
                                        <table class="ui celled table" id="dtContentUnitCount" style="font-size: 11px; max-width: 100%; min-width: 100%">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center">idUnit</th>
                                                    <th style="text-align: center">state</th>
                                                    <th style="text-align: center">idDetail</th>
                                                    <th style="text-align: center; max-width: 150px;">Hệ Số</th>
                                                    <th style="text-align: left">Tên</th>
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
        var divContentUnitCount;
        var DataComboTypeUnitCount; // data don vi tinh
        var DataComboTypeUnitCountDefault; // data don vi tinh
        var DataComboTypeProduct; // Data loai san pham
        var DataunitCountChoosen;
        var DataunitCountChoosenInitialize;

        $(document).ready(function () {

            divContentUnitCount = $("#TableUnitCount").clone();
            document.getElementById("textShowMessage").innerHTML = "";
            DataComboTypeProduct = ([<%=_DataComboTypeProduct%>][0]);
            DataComboTypeUnitCount = ([<%=_DataComboTypeUnitCount%>][0]);
            DataComboTypeUnitCountDefault = ([<%=_DataComboTypeUnitCount%>][0]);

            DataunitCountChoosen = ([<%=_DataunitCountChoosen%>][0]) === undefined ? [] : ([<%=_DataunitCountChoosen%>][0]);
            DataunitCountChoosenInitialize = ([<%=_DataunitCountChoosen%>][0]) === undefined ? [] : ([<%=_DataunitCountChoosen%>][0]);
            LoadCombo(DataComboTypeUnitCount, "cbbUnitCountTpye")
            LoadCombo(DataComboTypeUnitCountDefault, "cbbUnitCountTpyeDefault")
            LoadCombo(DataComboTypeProduct, "cbbproductType")
            LoadDataUpdate();
        });
        function LoadDataTable() {

            DataunitCountChoosen = DataunitCountChoosen.filter(word => word["state"] == "1");
            $('#dtContentUnitCount').DataTable().destroy();
            $("#TableUnitCount").replaceWith(divContentUnitCount.clone());
            var table = $('#dtContentUnitCount').DataTable({
                data: DataunitCountChoosen,
                info: false,
                paging: false,
                ordering: false,
                searching: false,
                destroy: true,
                "columnDefs": [
                    { "visible": false, "targets": 0, "data": "IDUnit" },
                    { "visible": false, "targets": 1, "data": "state" },
                    { "visible": false, "targets": 2, "data": "idDetail" },
                    { "visible": true, "targets": 3, "data": "Number" },
                    { "visible": true, "targets": 4, "data": "Name" },
                    {
                        "targets": -1,
                        "data": null,
                        "defaultContent":
                            "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                            + "'data-value='fade up'><img class='buttonDeleteClass' src='/img/ButtonImg/delete.png' alt='edit' width='20' height='20'></button>",
                    },
                ],
            });
            document.getElementById("dtContentUnitCount").className = "ui celled table";
            // Load lai don vi tinh
            var dataunit = DataComboTypeUnitCount;
            for (var element in DataunitCountChoosen) {
                let x = DataunitCountChoosen[element]["IDUnit"];
                dataunit = dataunit.filter(word => word["ID"] != x);
            }
            LoadCombo(dataunit, "cbbUnitCountTpye")


            $('#dtContentUnitCount tbody ').on('click', '.buttonDeleteClass', function (e) {

                e.preventDefault();
                var data = table.row($(this).parents('tr')).data();
                var row_clicked = $(this).closest('tr');
                var index = table.row(row_clicked).index();
                if (data === undefined) {

                    var selected_row = $(this).parents('tr');
                    if (selected_row.hasClass('child')) {
                        selected_row = selected_row.prev();
                    }
                    var rowData = $('#dtContentUnitCount').DataTable().row(selected_row).data();
                }
                else {

                    DeleteUnitCount(index);
                }

            });

        }

        function DeleteUnitCount(index) {
            DataunitCountChoosen[index].state = "0";
            LoadDataTable();
        }
        function LoadDataUpdate() {

            let DataProductMain = ([<%=_DataProductMain%>][0]);
            LoadDataTable();
            if (DataProductMain) {
                $("#productType").dropdown("refresh");
                $("#unitCountTypeDefault").dropdown("refresh");
                $("#productType").dropdown("set selected", DataProductMain[0].Type);
                $("#unitCountTypeDefault").dropdown("set selected", DataProductMain[0].DefaultUnit);
                $('#txtName').val((DataProductMain[0].Name));
                $('#txtNorm1').val((DataProductMain[0].N1));
                $('#txtNorm2').val((DataProductMain[0].N2));
                $('#txtNorm3').val((DataProductMain[0].N3));
                $('#txtContent').val((DataProductMain[0].Content));
                if ((DataProductMain[0].isManage.toString() === "1")) {
                    $("#chkIsmanage").prop('checked', true);
                   document.getElementById("lbQLTK").innerHTML = "Mặt Hàng Quản Lý Tồn Kho";
                }
                else {
                    $("#chkIsmanage").prop('checked', false);
                    document.getElementById("lbQLTK").innerHTML = "";
                }


                let unitName = DataComboTypeUnitCountDefault.filter(word => word["ID"] == DataProductMain[0].Type)[0]["Name"];
                document.getElementById("Norm1").innerHTML = unitName;
                document.getElementById("Norm2").innerHTML = unitName;
                document.getElementById("Norm3").innerHTML = unitName;
            }
        }
        function onchangeCountTypeDefault() {
            let unitName = $('#unitCountTypeDefault').dropdown('get text');
            document.getElementById("Norm1").innerHTML = unitName;
            document.getElementById("Norm2").innerHTML = unitName;
            document.getElementById("Norm3").innerHTML = unitName;
            return false;
        }
        function onChangeIsManage() {
            if (document.getElementById("chkIsmanage").checked) {
                document.getElementById("lbQLTK").innerHTML = "Mặt Hàng Quản Lý Tồn Kho";
            }
            else {
                document.getElementById("lbQLTK").innerHTML = "";
            }
            return false;
        }
        function ExecuteUnitCount() {

            let unitCountTpye = Number($('#unitCountTpye').dropdown('get value')) ? Number($('#unitCountTpye').dropdown('get value')) : 0;
            let unitCountTypeDefault = Number($('#unitCountTypeDefault').dropdown('get value')) ? Number($('#unitCountTypeDefault').dropdown('get value')) : 0;
            let UnitChange = $('#UnitChange').val() ? $('#UnitChange').val() : 0;
            if (unitCountTpye == 0 || unitCountTypeDefault == 0 || UnitChange <= 0) {
                document.getElementById("textShowMessage").innerHTML = "Chọn Loại Đơn Vị Tính, Đơn Vị Tính Chuẩn Và Hệ Số Quy Đổi";
            }
            else {
                document.getElementById("textShowMessage").innerHTML = "";
                var element = {};
                element.idDetail = "0";
                element.IDUnit = unitCountTpye.toString();
                element.Number = UnitChange.toString();

                element.Name = $('#unitCountTpye').dropdown('get text');
                element.state = "1";
                DataunitCountChoosen.push(element);
                $('#unitCountTpye').dropdown('clear');
                $('#UnitChange').val(0);
                LoadDataTable();
            }

            return false;
        }
        function ExcuteData() {
            var data = new Object();
            data.Type = Number($('#productType').dropdown('get value')) ? Number($('#productType').dropdown('get value')) : 0;
            data.DefaultUnit = Number($('#unitCountTypeDefault').dropdown('get value')) ? Number($('#unitCountTypeDefault').dropdown('get value')) : 0;
            data.Content = $('#txtContent').val() ? $('#txtContent').val() : "";
            data.Name = $('#txtName').val() ? $('#txtName').val() : "";
            data.N1 = $('#txtNorm1').val() ? $('#txtNorm1').val() : "0";
            data.N2 = $('#txtNorm2').val() ? $('#txtNorm2').val() : "0";
            data.N3 = $('#txtNorm3').val() ? $('#txtNorm3').val() : "0";
            data.isManage = (document.getElementById("chkIsmanage").checked) ? "1" : "0";


            // Execute datatable UNIT

            for (var element in DataunitCountChoosen) {
                let idunit = DataunitCountChoosen[element]["IDUnit"];
                let currentElement = DataunitCountChoosenInitialize.filter(word => word["IDUnit"] == idunit);
                if (currentElement == undefined || currentElement == "") // Chua ton tai
                {
                    DataunitCountChoosenInitialize.push(DataunitCountChoosen[element]);
                }
            }

            for (var element in DataunitCountChoosenInitialize) {
                let idunit = DataunitCountChoosenInitialize[element]["IDUnit"];
                let currentElement = DataunitCountChoosen.filter(word => word["IDUnit"] == idunit);
                if (currentElement == undefined || currentElement == "") // Chua ton tai
                {
                    DataunitCountChoosenInitialize[element]["state"] = 0
                    //  DataunitCountChoosenInitialize= DataunitCountChoosenInitialize.filter(word => word["ID"] != idunit);

                }

            }


            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {

                $.ajax({
                    url: "/Views/WareHouse/pageProductDetail.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data), 'dataUnit': JSON.stringify(DataunitCountChoosenInitialize) }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            LoadProductAjax();
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

