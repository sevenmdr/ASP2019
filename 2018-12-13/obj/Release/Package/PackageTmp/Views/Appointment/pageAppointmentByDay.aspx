<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageAppointmentByDay.aspx.cs" Inherits="_2018_12_13.Views.Appointment.pageAppointmentByDay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">
                <div class="sixteen wide tablet ten wide computer column">
                    <div class="ui segments" style="background-color: white">
                        <form class="ui form segment form3" id="form3" style="height: 65px">
                            <div class="ui segment" style="border: none; box-shadow: none;">
                                <div>
                                    <div style="float: left">
                                        <h3>Lịch Hẹn Theo Ngày</h3>
                                    </div>
                                    <div style="float: right; width: 200px">
                                        <div class="ui fluid search selection dropdown" id="ScheduleBranchID" onchange="LoadAppointmentListByDayAjax()">
                                            <input type="hidden" name="branch" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Chọn Chi Nhánh</div>
                                            <div id="cbbBranch" class="menu" tabindex="-1">
                                            </div>
                                        </div>
                                    </div>
                                    <div style="float: right; width: 200px">
                                        <div class="ui fluid search selection dropdown" id="ScheduleTypeList" onchange="LoadAppointmentListByDayAjax()">
                                            <input type="hidden" name="branch" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Loại Lịch Hẹn</div>
                                            <div id="cbbAppoinmentType" class="menu" tabindex="-1">
                                            </div>
                                        </div>
                                    </div>
                                    <div style="float: right; width: 200px">
                                        <input id="dateTo" class="flatpickr" type="text" placeholder="Date To .." onchange ="LoadAppointmentListByDayAjax()" />
                                    </div>
                                    <div style="float: right; width: 200px">
                                        <input id="dateFrom" class="flatpickr" type="text" placeholder="Date From ...." onchange="LoadAppointmentListByDayAjax()" />
                                    </div>



                                </div>


                            </div>
                        </form>
                        <div class="ui segment" id="TableContent">
                            <table id="dtContent" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">ID</th>
                                        <th style="text-align: center">STT</th>
                                        <th style="text-align: center">MSKH</th>
                                        <th style="text-align: center">Tên Khách Hàng</th>
                                        <th style="text-align: center">Nội Dung</th>
                                        <th style="text-align: center">Dịch Vụ Quan Tâm</th>
                                        <th style="text-align: center">Trạng Thái</th>
                                        <th style="text-align: center">Thời Gian</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var divClone;
        var dataAppList
        function LoadComboSchedule() {
            GetDataComboAppointmentList("/Views/Appointment/pageAppointmentByDay.aspx/LoadCombo", function (dataScheduleType, Branch) {
                LoadCombo(dataScheduleType, "cbbAppoinmentType")
                LoadCombo(Branch, "cbbBranch")

            });
        }
        function LoadAppointmentListByDayAjax() {
         
            GetDataSourceAppointmentListByDay("/Views/Appointment/pageAppointmentByDay.aspx/LoadataAppointmentList"
                , (Number($('#ScheduleBranchID').dropdown('get value')) ? Number($('#ScheduleBranchID').dropdown('get value')) : 0)
                , $('#dateFrom').val() ? $('#dateFrom').val() : new Date()
                , $('#dateTo').val() ? $('#dateTo').val() : new Date()
                , function (data) {

                if ($('#ScheduleTypeList').dropdown('get value')) {
                    dataAppList = data.filter(word => word["TypeID"] == $('#ScheduleTypeList').dropdown('get value'));
                }
                else {
                    dataAppList = data;
                }
                $('#dtContent').DataTable().destroy();
                $("#TableContent").replaceWith(divClone.clone());
                $('#dtContent').DataTable({
                    data: dataAppList,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": false, "targets": 0, "data": "ID" },
                        { "visible": true, "targets": 1, "data": "STT", width: "50px", "className": "center" },
                        {
                            "visible": true, "targets": 2, "data": "CustCode", width: "120px", "className": "center", "render": function (data, type, row, meta) {
                                if (type === 'display') { data = '<a href="' + "/Views/Customer/MainCustomer.aspx?CustomerID=" + Number(data) + '">' + data + '</a>'; }

                                return data;
                            }
                        },
                        { "visible": true, "targets": 3, "data": "CustName", width: "200px", "className": "center" },
                        { "visible": true, "targets": 4, "data": "Content" },
                        { "visible": true, "targets": 5, "data": "Service_care" },
                        { "visible": true, "targets": 6, "data": "TypeName", width: "150px" },
                        { "visible": true, "targets": 7, "data": "TimeFrom", width: "150px" },
                    ],
                });
                document.getElementById("dtContent").className = "ui celled table";
            })
        }
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            divClone = $("#TableContent").clone();
            LoadComboSchedule();
            LoadAppointmentListByDayAjax();

        });

    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/js/customjs/custom-modal.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>
</asp:Content>
