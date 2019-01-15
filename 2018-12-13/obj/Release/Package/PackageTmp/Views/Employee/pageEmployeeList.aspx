<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageEmployeeList.aspx.cs" Inherits="_2018_12_13.Views.Employee.pageEmployeeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">
                <div class="sixteen wide tablet ten wide computer column">
                    <div class="ui segments" style="background-color: white">
                        <form class="ui form segment form3">
                            <div class="ui segment" style="border: none;">
                                <div class="four fields" style="margin: 0px;">
                                    <div class="field">
                                        <h5>Thông Tin Nhân Viên</h5>
                                    </div>
                                    <div class="field">
                                    </div>
                                    <div class="field">
                                    </div>
                                    <div class="field">
                                        <div style="float: right; width: 200px">
                                            <div class="ui fluid search selection dropdown" id="StateID" onchange="LoadEmployeeAjax()">
                                                <input type="hidden" name="branch" />
                                                <input class="search" autocomplete="off" tabindex="0" />
                                                <div class="default text">Trạng Thái</div>
                                                <div class="menu" tabindex="-1">
                                                    <div class="item" data-value="2">Tất Cả</div>
                                                    <div class="item" data-value="1">Đang Làm Việc</div>
                                                    <div class="item" data-value="0">Đã Nghỉ Việc</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="float: right; width: 150px">
                                        <button class="ui blue basic button" data-value="fade up" onclick="return AddNewEmployee()">Thêm Mới</button>
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
                                        <th style="text-align: center; width: 100px;">Hình</th>
                                        <th style="text-align: center">Mã Nhân Viên</th>
                                        <th style="text-align: center">Tên Nhân Viên</th>
                                        <th style="text-align: center">Số Điện Thoại</th>
                                        <th style="text-align: center">Email</th>
                                        <th style="text-align: center">Giới Tính</th>
                                        <th style="text-align: center">Bộ Phận</th>
                                        <th style="text-align: center">Sinh Nhật</th>
                                        <th style="text-align: center">Địa Chỉ</th>
                                        <th style="text-align: center">Trạng Thái</th>
                                        <th style="text-align: center; width: 30px;">Sửa</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script type="text/javascript">
            var divClone;
            var dataEmployee;
            function LoadEmployeeAjax() {

                GetDataSourceEmployee("/Views/Employee/pageEmployeeList.aspx/Loadata", function (data) {
                    dataEmployee = data;
                    if ($('#StateID').dropdown('get value') != "" && $('#StateID').dropdown('get value') != "2") {
                        dataEmployee = data.filter(word => word["State"] == Number($('#StateID').dropdown('get value')));
                    }
                    $('#dtContent').DataTable().destroy();
                    $("#TableContent").replaceWith(divClone.clone());
                    var table = $('#dtContent').DataTable({
                        data: dataEmployee,
                        info: false,
                        paging: false,
                        ordering: false,
                        searching: false,
                        destroy: true,
                        "columnDefs": [
                            { "visible": false, "targets": 0, "data": "ID" },
                            { "visible": true, "targets": 1, "data": "STT", width: "50px", "className": "center" },
                            { "visible": true, "targets": 2, "data": "Avatar", width: "50px", "className": "center" },
                            { "visible": true, "targets": 3, "data": "Emp_Code", width: "130px" },
                            { "visible": true, "targets": 4, "data": "Name", width: "250px" },
                            { "visible": true, "targets": 5, "data": "Phone", width: "150px" },
                            { "visible": true, "targets": 6, "data": "Email", width: "150px" },
                            { "visible": true, "targets": 7, "data": "GioiTinh", width: "120px" },
                            { "visible": true, "targets": 8, "data": "GroupName", width: "200px" },
                            { "visible": true, "targets": 9, "data": "Brithday", width: "150px" },
                            { "visible": true, "targets": 10, "data": "Address" },
                            { "visible": true, "targets": 11, "data": "StateName", width: "200px" },
                            {
                                "targets": -1,
                                "data": null,
                                "defaultContent":
                                    "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                                    + "'data-value='fade up'><img class='buttonEditClass' src='/img/ButtonImg/edit.png' alt='edit' width='20' height='20'></button>",
                            },
                        ],
                    });

                    document.getElementById("dtContent").className = "ui celled table";
                    $('#dtContent tbody ').on('click', '.buttonEditClass', function () {
                        var data = table.row($(this).parents('tr')).data();
                        EditEmployee(data["ID"]);
                    });


                })
            }


            $(document).ready(function () {
                divClone = $("#TableContent").clone();
                $("#StateID").dropdown("refresh");
                $("#StateID").dropdown("set selected", 2);
            });
            function AddNewEmployee() {
                document.getElementById("divDetailPopup").innerHTML = '';
                $("#divDetailPopup").load("/Views/Employee/pageEmployeeDetail.aspx");
                $('#divDetailPopup').modal('show');
                return false;
            }
            function EditEmployee(CurrentID) {
                document.getElementById("divDetailPopup").innerHTML = '';
                $("#divDetailPopup").load("/Views/Employee/pageEmployeeDetail.aspx?CurrentID=" + CurrentID);
                $('#divDetailPopup').modal('show');
                return false;
            }
        </script>

        <script src="/dist/semantic.min.js"></script>
        <script src="/js/comon/load_datasource.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>
</asp:Content>
