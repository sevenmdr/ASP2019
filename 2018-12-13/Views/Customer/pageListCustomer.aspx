<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageListCustomer.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageListCustomer" %>

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
                                        <a class="ui teal image label" style="height: 30px!important; font-size: 13px;">Tổng Khách Hàng<div class="detail" id="totalCustomer">0</div>
                                        </a>
<%--                                        <a class="ui blue image label" style="height: 30px!important; font-size: 13px;">Tổng Chi<div class="detail" id="totalInvoice">0</div>
                                        </a>
                                        <a class="ui yellow image label" style="height: 30px!important; font-size: 13px;">Còn Lại<div class="detail" id="totalLeft">0</div>
                                        </a>--%>
                                    </div>

                                    <div style="float: right">
                                        <input id="dateTo" class="flatpickr" type="text" placeholder="Đến Ngày.." onchange="LoadReceiPaymentAjax()" />
                                    </div>
                                    <div style="float: right">
                                        <input id="dateFrom" class="flatpickr" type="text" placeholder="Từ Ngày.." onchange="LoadReceiPaymentAjax()" />
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
                                        <th style="text-align: center">Tên KH</th>
                                        <th style="text-align: center">Số Điện Thoại</th>
                                        <th style="text-align: center">Tổng Tiền SDDV</th>
                                        <th style="text-align: center">Tổng Tiền Thanh Toán</th>
                                        <th style="text-align: center">Tổng Tiền Nợ</th>
                                        <th style="text-align: center">Tổng Số DVSD</th>
                                        <th style="text-align: center">DV Mua Gần Nhất</th>
                                        <th style="text-align: center">Ngày Mua DV Gần Nhất</th>
                                        <th style="text-align: center">Còn/Hết LT</th>
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
        var DataListReceiptPayment;
        function LoadReceiPaymentAjax() {
            let dateFrom = $('#dateFrom').val() ? $('#dateFrom').val() : new Date();
            let dateTo = $('#dateTo').val() ? $('#dateTo').val() : new Date()
            GetListCustomer("/Views/Customer/pageListCustomer.aspx/LoadataCustomer", dateFrom, dateTo, function (dataList, dataTotal) {


                $('#dtContent').DataTable().destroy();
                $("#TableContent").replaceWith(divClone.clone());
                var table = $('#dtContent').DataTable({
                    data: dataList,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": true, "targets": 0, "data": "STT", width: "50px", },
                        {
                            "visible": true, "targets": 1, "data": "Cust_Code", width: "120px", "className": "center", "render": function (data, type, row, meta) {
                                if (type === 'display') { data = '<a href="' + "/Views/Customer/MainCustomer.aspx?CustomerID=" + Number(data) + '">' + data + '</a>'; }

                                return data;
                            }
                        },
                        { "visible": true, "targets": 2, "data": "Name", width: "200px", },
                        { "visible": true, "targets": 3, "data": "Phone", width: "120px", },                      
                        { "visible": true, "targets": 4, "data": "Price_Discouted", width: "200px", },
                        { "visible": true, "targets": 5, "data": "Amount", width: "350px", },   
                        { "visible": true, "targets": 6, "data": "Own", width: "200px",},                      
                        { "visible": true, "targets": 7, "data": "Number", width: "200px", },
                        { "visible": true, "targets": 8, "data": "ServiceLast", width: "200px", },
                        { "visible": true, "targets": 9, "data": "Createdstring", width: "350px", },
                        { "visible": true, "targets": 10, "data": "Status", width: "200px" },


                    ],
                });
                document.getElementById("dtContent").className = "ui celled table";
                document.getElementById("totalCustomer").innerHTML = !dataTotal[0] ? 0 : dataTotal[0].TotalCustomer;
                //document.getElementById("totalInvoice").innerHTML = !dataTotal[0] ? 0 : dataTotal[0].totalInvoice;
                //document.getElementById("totalLeft").innerHTML = !dataTotal[0] ? 0 : dataTotal[0].totalLeft;
            })
        }
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'Y-m-d',
                enableTime: false,
                defaultDate: new Date(),
            });


            divClone = $("#TableContent").clone();
            LoadReceiPaymentAjax();
        });

    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/customjs/custom-datatable.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
</asp:Content>
