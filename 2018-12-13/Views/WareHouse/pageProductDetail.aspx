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
                <form class="ui form segment form3">
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
                            <div class="ui fluid search selection dropdown" id="unitCountTypeDefault">
                                <input type="hidden" name="CountTypeDefault" onchange="return onchangeCountTypeDefault()" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Đơn Vị Tính Chuẩn</div>
                                <div id="cbbUnitCountTpyeDefault" class="menu" tabindex="-1">
                                </div>
                            </div>
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
                                                    <th style="text-align: center">Number</th>
                                                    <th style="text-align: center">Tên</th>
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
        var DataComboTypeProduct; // Data loai san pham
        var DataunitCountChoosen;

        $(document).ready(function () {
            divCloneLeft = $("#dtContentUnitCount").clone();
            document.getElementById("textShowMessage").innerHTML = "";
            DataComboTypeProduct = ([<%=_DataComboTypeProduct%>][0]);
            DataComboTypeUnitCount = ([<%=_DataComboTypeUnitCount%>][0]);
            DataunitCountChoosen = ([<%=_DataunitCountChoosen%>][0]);

            LoadCombo(DataComboTypeUnitCount, "cbbUnitCountTpye")
            LoadCombo(DataComboTypeUnitCount, "cbbUnitCountTpyeDefault")
            LoadCombo(DataComboTypeProduct, "cbbproductType")
            LoadDataUpdate();
        });
        function LoadDataTable() {
            debugger
     
             var  _DataunitCountChoosen = DataunitCountChoosen.filter(word => word["state"] == "1");
            // select state =1
            $('#dtContentUnitCount').DataTable().destroy();
            $("#TableUnitCount").replaceWith(divCloneLeft.clone());
            var table = $('#dtContentUnitCount').DataTable({
                data: _DataunitCountChoosen,
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
            $('#dtContentUnitCount tbody ').on('click', '.buttonDeleteClass', function (e) {
                e.preventDefault();
                var data = table.row($(this).parents('tr')).data();
                var id;
                if (data == undefined) {

                    var selected_row = $(this).parents('tr');
                    if (selected_row.hasClass('child')) {
                        selected_row = selected_row.prev();
                    }
                    var rowData = $('#dtContentUnitCount').DataTable().row(selected_row).data();
                    id = rowData.ID;

                } else {

                    id = data.ID;
                }
                DeleteUnitCount(id);
            });

        }

        function DeleteUnitCount(id) {
            //DataunitCountChoosen.forEach(function (result, index) {
            //    if (result["ID"] === id) {
            //        DataunitCountChoosen.splice(index, 1);
            //    }
            //});
            // set  DataunitCountChoosen state = 0
            debugger
           let objIndex = DataunitCountChoosen.findIndex((obj => obj.id == id));
            //Update object's name property.
            DataunitCountChoosen[objIndex].state = "0"
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
                $('#txtContent').val((DataProductMain[0].Content));
            }
        }
        function onchangeCountTypeDefault() {
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
                element.ID = unitCountTpye.toString();
                element.Number = UnitChange;
                element.idDetail = "0";
                element.state = "1";
                element.Name = $('#unitCountTpye').dropdown('get text');
                DataunitCountChoosen.push(element);
                LoadDataTable();
            }
            $('#unitCountTpye').dropdown('clear');
            $('#UnitChange').val(0);
            return false;
        }
        function ExcuteData() {
            var data = new Object();
            data.Type = Number($('#productType').dropdown('get value')) ? Number($('#productType').dropdown('get value')) : 0;
            data.DefaultUnit = Number($('#unitCountTypeDefault').dropdown('get value')) ? Number($('#unitCountTypeDefault').dropdown('get value')) : 0;
            data.Content = $('#txtContent').val() ? $('#txtContent').val() : "";
            data.Name = $('#txtName').val() ? $('#txtName').val() : "";
            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {

                $.ajax({
                    url: "/Views/WareHouse/pageProductDetail.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data), 'dataUnit': JSON.stringify(DataunitCountChoosen) }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
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

