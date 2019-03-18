<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageServiceDetailStage.aspx.cs" Inherits="_2018_12_13.Views.Service.pageServiceDetailStage" %>

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
                    <div class="ui accordion field">
                        <div class="title active">
                            <i class="icon dropdown"></i>Thông Tin Dịch Vụ
                        </div>
                        <div class="content field active">
                            <div class="field">
                                <div class="field">
                                    <label>Tên</label>
                                    <input id="txtName" name="name" type="text" />
                                </div>
                            </div>
                            <div class="four fields">
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

                                <div class="field">
                                    <label>Sản Phẩm / Dịch Vụ</label>
                                    <div class="ui toggle checkbox">
                                        <input id="chkIsproduct" type="checkbox" checked="checked" name="newsletter" onchange="return onChangeIsProduct()" />
                                        <label id="lbProductIS" class="coloring red">Là Sản Phẩm</label>
                                    </div>
                                </div>

                            </div>
                            <div class="four fields">
                                <div class="field">
                                    <label>Hoa Hồng Tư Vấn </label>
                                    <div class="ui right labeled fluid input">
                                        <div class="ui label">$</div>
                                        <input id="txtPerConsulAmount" name="Notvalid" type="text" onchange="return ExecuteAmountConsult()" />
                                        <div class="ui basic label">VND</div>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Hoa Hồng Tư Vấn </label>
                                    <div class="ui right labeled fluid input">
                                        <div class="ui label">%</div>
                                        <input id="txtPerConsulPercent" name="Notvalid" type="number" onchange="return ExecutePercentConsult()" />
                                        <div class="ui basic label"></div>
                                    </div>
                                </div>

                                <div class="field">
                                    <label>Hoa Hồng Điều Trị </label>
                                    <div class="ui right labeled fluid input">
                                        <div class="ui label">$</div>
                                        <input id="txtPerTreatAmount" name="Notvalid" type="text" onchange="return ExecuteAmountTreat()" />
                                        <div class="ui basic label">VND</div>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Hoa Hồng Điều Trị </label>
                                    <div class="ui right labeled fluid input">
                                        <div class="ui label">%</div>
                                        <input id="txtPerTreatPercent" name="Notvalid" type="number" onchange="return ExecutePercentTreat()" />
                                        <div class="ui basic label"></div>
                                    </div>
                                </div>

                            </div>
                            <div class="field">
                                <label>Ghi Chú</label>
                                <input id="txtContent" name="content" type="text" />

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="ui accordion field">
                            <div class="title active">
                                <i class="icon dropdown"></i>Các Bước Thực Hiện
                            </div>
                            <div class="content field active">
                                <div class="sixteen wide column">
                                    <div class="ui segments">
                                        <div class="ui segment">
                                            <div class="ui form">
                                                <div class="two fields">
                                                    <div class="field">
                                                        <input id="txtServiceStageName" name="ServiceStageName" type="text" />
                                                    </div>
                                                    <div class="field">
                                                        <div class="ui blue button" onclick="return ExecuteServiceStage()">Thêm</div>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <div class="field">
                                                        <div style="font-size: 10px; color: red" id="textShowMessage"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ui divider"></div>
                                            <div class="column" id="TableServiceStageDetail">
                                                <table class="ui celled table" id="dtContentServiceStageDetail" style="font-size: 11px; max-width: 100%; min-width: 100%">
                                                    <thead>
                                                        <tr>
                                                            <th style="text-align: center">state</th>
                                                            <th style="text-align: center">ID</th>
                                                            <th style="text-align: center">Bước Thực Hiện</th>
                                                            <th style="text-align: center; max-width: 60px;">Xóa</th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </div>
                                        </div>
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
        var divContentServiceStageDetail;
        //var DataServiceStage; // data vat lieu
        var DataComboTypeService; // Data loai dịch vụ

        var DataServiceStageChoosen;
        var DataServiceStageChoosenInitialize;
        function ExecuteAmountConsult() {
            if (Number($('#txtPerConsulAmount').val()) != 0) {
                $("#txtPerConsulAmount").attr('name', "discountAmount");
                $('#txtPerConsulPercent').val(0);
            }
        }
        function ExecutePercentConsult() {
            if (Number($('#txtPerConsulPercent').val()) != 0) {
                $("#txtPerConsulPercent").attr('name', "discountPercent");
                $('#txtPerConsulAmount').val(0);
            }
        }
        function ExecuteAmountTreat() {
            if (Number($('#txtPerTreatAmount').val()) != 0) {
                $("#txtPerTreatAmount").attr('name', "discountAmount");
                $('#txtPerTreatPercent').val(0);
            }
        }
        function ExecutePercentTreat() {
            if (Number($('#txtPerTreatPercent').val()) != 0) {
                $("#txtPerTreatPercent").attr('name', "discountPercent");
                $('#txtPerTreatAmount').val(0);
            }
        }
        $(document).ready(function () {

            divContentServiceStageDetail = $("#TableServiceStageDetail").clone();
            document.getElementById("textShowMessage").innerHTML = "";

            $('#spTotalTreatment').val(1);
            DataComboTypeService = ([<%=_DataComboTypeService%>][0]);

            DataServiceStageChoosen = ([<%=_DataServiceStage%>][0]) === undefined ? [] : ([<%=_DataServiceStage%>][0]);
            DataServiceStageChoosenInitialize = ([<%=_DataServiceStage%>][0]) === undefined ? [] : ([<%=_DataServiceStage%>][0]);

            $('#txtAmount').divide();
            $('#txtPerConsulAmount').divide();
            $('#txtPerTreatAmount').divide();
            LoadCombo(DataComboTypeService, "cbbserviceType")
            LoadDataUpdate();
        });
        function LoadDataTable() {

            if (DataServiceStageChoosen != undefined)
                DataServiceStageChoosen = DataServiceStageChoosen.filter(word => word["state"] == "1");
            $('#dtContentServiceStageDetail').DataTable().destroy();
            $("#TableServiceStageDetail").replaceWith(divContentServiceStageDetail.clone());
            var table = $('#dtContentServiceStageDetail').DataTable({
                data: DataServiceStageChoosen,
                info: false,
                paging: false,
                ordering: false,
                searching: false,
                scrollY: "200px",
                scrollCollapse: true,
                destroy: true,
                "columnDefs": [
                    { "visible": false, "targets": 0, "data": "state" },
                    { "visible": false, "targets": 1, "data": "ID" },
                    { "visible": true, "targets": 2, "data": "Name" },
                    {
                        "targets": -1,
                        "data": null,
                        "defaultContent":
                            "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                            + "'data-value='fade up'><img class='buttonDeleteClass' src='/img/ButtonImg/delete.png' alt='edit' width='20' height='20'></button>",
                    },
                ],
            });
            document.getElementById("dtContentServiceStageDetail").className = "ui celled table";
            $('#dtContentServiceStageDetail tbody ').on('click', '.buttonDeleteClass', function (e) {

                e.preventDefault();
                var data = table.row($(this).parents('tr')).data();
                var row_clicked = $(this).closest('tr');
                var index = table.row(row_clicked).index();
                if (data === undefined) {

                    var selected_row = $(this).parents('tr');
                    if (selected_row.hasClass('child')) {
                        selected_row = selected_row.prev();
                    }
                    var rowData = $('#dtContentServiceStageDetail').DataTable().row(selected_row).data();
                }
                else {

                    DeleteProductDetail(index);
                }

            });

        }
        function DeleteProductDetail(index) {
            let idStage= DataServiceStageChoosen[index].ID;
            $.ajax({
                url: "/Views/Service/pageServiceDetailStage.aspx/CheckDeleStage",
                dataType: "json",
                type: "POST",
                data: JSON.stringify({'idStage': idStage }),
                contentType: 'application/json; charset=utf-8',
                async: true,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    notiError("Lỗi Hệ Thống");
                },
                success: function (result) {
                    if (result.d == "1") {
                        DataServiceStageChoosen[index].state = "0";
                        LoadDataTable();
                    } else {
                        notiError("Không thể xóa bước thực hiện. Đã có vật liệu tiêu hao ứng với bước thực hiện này");
                    }
                }
            })


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
        function ExecuteServiceStage() {

            let servicestageDetail = $('#txtServiceStageName').val() ? $('#txtServiceStageName').val() : "";

            if (servicestageDetail == "") {
                document.getElementById("textShowMessage").innerHTML = "Nhập nội dung bước thực hiện";
            }
            else {
                document.getElementById("textShowMessage").innerHTML = "";
                var element = {};
                element.state = "1";
                element.ID = "0";
                element.Name = servicestageDetail;
                DataServiceStageChoosen.push(element);

                $('#txtServiceStageName').val("");
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
            for (var element in DataServiceStageChoosen) {
                let idunit = DataServiceStageChoosen[element]["ID"];
                //let currentElement = DataServiceStageChoosenInitialize.filter(word => word["ID"] == idunit);
                if (idunit==0) // Chua ton tai
                {
                    DataServiceStageChoosenInitialize.push(DataServiceStageChoosen[element]);
                }
            }

            for (var element in DataServiceStageChoosenInitialize) {
                let idunit = DataServiceStageChoosenInitialize[element]["ID"];
                let currentElement = DataServiceStageChoosen.filter(word => word["ID"] == idunit);
                if (currentElement == undefined || currentElement == "") // Chua ton tai
                {
                    DataServiceStageChoosenInitialize[element]["state"] = 0


                }

            }

            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {

                $.ajax({
                    url: "/Views/Service/pageServiceDetailStage.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data), 'dataServiceStage': JSON.stringify(DataServiceStageChoosenInitialize) }),
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

