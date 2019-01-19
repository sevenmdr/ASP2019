<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageLiability.aspx.cs" Inherits="_2018_12_13.Views.Account.pageLiability" %>

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
                                        <h3>Danh Sách Công Nợ</h3>
                                    </div>
                                    <div style="float: right">
                                        <input id="dateFrom" class="flatpickr" type="text" placeholder="Đến Ngày.." onchange="LoadLiabilityAjax()" />
                                    </div>
                                    <div style="float: right">
                                        <input id="dateTo" class="flatpickr" type="text" placeholder="Từ Ngày.." onchange="LoadLiabilityAjax()" />
                                    </div>

                                </div>


                            </div>
                        </form>
                        <div class="ui segment" id="TableContent">
                            <table id="dtContent" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">STT</th>
                                        <th style="text-align: center">MSKH</th>
                                        <th style="text-align: center">Tên</th>
                                        <th style="text-align: center">Tổng Tiền Đã Trả </th>
                                        <th style="text-align: center">Tổng Tiền Dịch Vụ </th>
                                        <th style="text-align: center">Tổng Tiền Còn Lại </th>
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

        function LoadLiabilityAjax() {
            let dateFrom = $('#dateFrom').val() ? $('#dateFrom').val() : new Date();
            let dateTo = $('#dateTo').val() ? $('#dateTo').val() : new Date()
            GetDataAccount("/Views/Account/pageLiability.aspx/LoadatapageLiability", dateFrom, dateTo, function (data) {


                $('#dtContent').DataTable().destroy();
                $("#TableContent").replaceWith(divClone.clone());
                var table = $('#dtContent').DataTable({
                    data: data,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": true, "targets": 0, "data": "STT", width: "120px", },
                        {
                            "visible": true, "targets": 1, "data": "CustCode", width: "120px", "className": "center", "render": function (data, type, row, meta) {
                                if (type === 'display') { data = '<a href="' + "/Views/Customer/MainCustomer.aspx?CustomerID=" + Number(data) + '">' + data + '</a>'; }

                                return data;
                            }
                        },
                        { "visible": true, "targets": 2, "data": "Name" },
                        { "visible": true, "targets": 3, "data": "Amountpayment", width: "250px" },
                        { "visible": true, "targets": 4, "data": "AmountService", width: "250px" },
                        { "visible": true, "targets": 5, "data": "TotalOwn", width: "250px" },


                    ],
                });
                document.getElementById("dtContent").className = "ui celled table";
            })
        }
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
               dateFormat: 'Y-m-d',
                enableTime: false,
                defaultDate: new Date(),
            });
            divClone = $("#TableContent").clone();
            LoadLiabilityAjax();
        });

    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/customjs/custom-datatable.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
</asp:Content>
