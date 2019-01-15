<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageServiceList.aspx.cs" Inherits="_2018_12_13.Views.Service.pageServiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">
                <div class="sixteen wide tablet ten wide computer column">
                    <div class="ui segments" style="background-color: white">
                        <form class="ui form segment form3" style="height: 65px">
                            <div class="ui segment" style="border: none; box-shadow: none;">
                                <div>
                                    <div style="float: left">
                                        <h3>Danh Sách Dịch Vụ</h3>
                                    </div>
                                    <div style="float: right">
                                        <button class="ui blue basic button" data-value="fade up" onclick="return AddNewService()">Thêm Mới</button>
                                    </div>
                                    <div style="float: right; width: 200px">
                                        <div class="ui fluid search selection dropdown" id="productlist" onchange="LoadServiceAjax()">
                                            <input type="hidden" name="ware" />
                                            <i class="dropdown icon"></i>
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Sản Phẩm/Dịch Vụ</div>
                                            <div id="cbbproductlist" class="menu" tabindex="-1">
                                                <div class="item" data-value="2">Tất Cả</div>
                                                <div class="item" data-value="1">Sản Phẩm</div>
                                                <div class="item" data-value="0">Dịch Vụ</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="float: right; width: 200px">
                                        <div class="ui fluid search selection dropdown" id="TypeServiceList" onchange="LoadServiceAjax()">
                                            <input type="hidden" name="ware" />
                                            <i class="dropdown icon"></i>
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Loại Sản Phẩm</div>
                                            <div id="cbbTypeService" class="menu" tabindex="-1">
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </form>
                        <div class="ui segment" id="TableContent">
                            <table id="dtContent" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">ID</th>
                                        <th style="text-align: center; width: 25px;">STT</th>
                                        <th style="text-align: center">Mã Dịch Vụ</th>
                                        <th style="text-align: center">Tên Dịch Vụ</th>
                                        <th style="text-align: center">Giá Tiền</th>
                                        <th style="text-align: center">Hoa Hồng Tư Vấn</th>
                                        <th style="text-align: center">Hoa Hồng Điều Trị</th>
                                        <th style="text-align: center">Ghi Chú</th>
                                        <th style="text-align: center; width: 30px;">Sửa</th>
                                        <th style="text-align: center; width: 30px;">Xóa</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var divClone;
        var DataListService
        function LoadServiceAjax() {
            GetDataSourceProduct("/Views/Service/pageServiceList.aspx/LoadataService", function (data) {
                if ($('#productlist').dropdown('get value') && $('#productlist').dropdown('get value') != "2") {
                    DataListService = data.filter(word => word["IsProduct"] == $('#productlist').dropdown('get value'));
                }
                else {
                    DataListService = data;
                }
                if ($('#TypeServiceList').dropdown('get value') && $('#TypeServiceList').dropdown('get value') != "0") {
                    DataListService = DataListService.filter(word => word["ServiceCat_ID"] == $('#TypeServiceList').dropdown('get value'));
                }
                $('#dtContent').DataTable().destroy();
                $("#TableContent").replaceWith(divClone.clone());
                var table = $('#dtContent').DataTable({
                    data: DataListService,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": false, "targets": 0, "data": "ID" },
                        { "visible": true, "targets": 1, "data": "STT", width: "50px", "className": "center" },
                        { "visible": true, "targets": 2, "data": "Service_Code", width: "100px", "className": "center" },
                        { "visible": true, "targets": 3, "data": "Name", width: "400px" },
                        { "visible": true, "targets": 4, "data": "Amount" , width: "200px"},
                        { "visible": true, "targets": 5, "data": "PerConsult", width: "200px" },
                        { "visible": true, "targets": 6, "data": "PerTreat", width: "200px" },
                        { "visible": true, "targets": 7, "data": "Content" },
                        {
                            "targets": -2,
                            "data": null,
                            "defaultContent":
                                "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                                + "'data-value='fade up'><img class='buttonEditClass' src='/img/ButtonImg/edit.png' alt='edit' width='20' height='20'></button>",
                        },
                        {
                            "targets": -1,
                            "data": null,
                            "defaultContent":
                                "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                                + "'data-value='fade up'><img class='buttonDeleteClass' src='/img/ButtonImg/delete.png' alt='delete' width='20' height='20'></button>",
                        },

                    ],
                });
                document.getElementById("dtContent").className = "ui celled table";
                $('#dtContent tbody ').on('click', '.buttonEditClass', function () {
                    var data = table.row($(this).parents('tr')).data();
                    EditService(data["ID"]);
                });
                $('#dtContent tbody ').on('click', '.buttonDeleteClass', function () {
                    var data = table.row($(this).parents('tr')).data();
                    DeleteServiceList(data["ID"]);
                });

            })
        }
        function DeleteServiceList(id) {
            const promise = notiConfirm();
            promise.then(function () { ExecuteDeleteService(id); }, function () { });
        }
        function ExecuteDeleteService(id) {
            $.ajax({
                url: "/Views/Service/pageServiceList.aspx/DeleteItem",
                dataType: "json",
                type: "POST",
                data: JSON.stringify({ 'id': id }),
                contentType: 'application/json; charset=utf-8',
                async: false,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    notiError();
                },
                success: function (result) {
                    if (result.d == "1") {
                        notiSuccess();
                        LoadServiceAjax();
                    } else {
                        notiError(result.d);
                    }
                }
            })
        }
        $(document).ready(function () {

            divClone = $("#TableContent").clone();
            LoadServiceAjax();
                    DataComboTypeService = ([<%=_DataComboTypeService%>][0]);
        LoadCombo(DataComboTypeService, "cbbTypeService");
        });
        function AddNewService() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Service/pageServiceDetail.aspx");
            $('#divDetailPopup').modal('show');
            return false;
        }
        function EditService(CurrentID) {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Service/pageServiceDetail.aspx?CurrentID=" + CurrentID);
            $('#divDetailPopup').modal('show');
            return false;
        }
    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>
</asp:Content>
