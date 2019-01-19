<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageInvoicePayment.aspx.cs" Inherits="_2018_12_13.Views.Account.pageInvoicePayment" %>

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
                                        <a class="ui teal image label" style="height: 30px!important; font-size: 13px;">Tổng Thu<div class="detail" id="totalPayment">0</div>
                                        </a>
                                        <a class="ui blue image label" style="height: 30px!important; font-size: 13px;">Tổng Chi<div class="detail" id="totalInvoice">0</div>
                                        </a>
                                        <a class="ui yellow image label" style="height: 30px!important; font-size: 13px;">Còn Lại<div class="detail" id="totalLeft">0</div>
                                        </a>
                                    </div>
                                    <div style="float: right">
                                        <div class="ui fluid search selection dropdown" id="TypeTranfer" style="width: 200px;" onchange="LoadReceiPaymentAjax()">
                                            <input type="hidden" name="branch" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Loại Thu Chi</div>
                                            <div id="cbbPaymentMethod" class="menu" tabindex="-1">
                                                <div class="item" data-value="0">Tất Cả</div>
                                                <div class="item" data-value="3">Thu</div>
                                                <div class="item" data-value="1">Chi</div>
                                            </div>
                                        </div>
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
                                        <th style="text-align: center">Loại</th>
                                        <th style="text-align: center">Nội Dung</th>
                                        <th style="text-align: center">Số Tiền</th>
                                        <th style="text-align: center">Ngày Tạo</th>
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
            GetDataAccount("/Views/Account/pageInvoicePayment.aspx/LoadataReceipt", dateFrom, dateTo, function (dataList, dataTotal) {
                if ($('#TypeTranfer').dropdown('get value') && $('#TypeTranfer').dropdown('get value') != "0") {
                    DataListReceiptPayment = dataList.filter(word => word["TYPE_ID"] == $('#TypeTranfer').dropdown('get value'));
                }
                else {
                    DataListReceiptPayment = dataList;
                }

                $('#dtContent').DataTable().destroy();
                $("#TableContent").replaceWith(divClone.clone());
                var table = $('#dtContent').DataTable({
                    data: DataListReceiptPayment,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": true, "targets": 0, "data": "type", width: "120px", },
                        { "visible": true, "targets": 1, "data": "Content", "className": "center" },
                        { "visible": true, "targets": 2, "data": "Amount", width: "170px" },
                        { "visible": true, "targets": 3, "data": "Createdstring", width: "250px" },


                    ],
                });
                document.getElementById("dtContent").className = "ui celled table";
                document.getElementById("totalPayment").innerHTML = !dataTotal[0] ? 0 : dataTotal[0].totalPayment;
                document.getElementById("totalInvoice").innerHTML = !dataTotal[0] ? 0 : dataTotal[0].totalInvoice;
                document.getElementById("totalLeft").innerHTML = !dataTotal[0] ? 0 : dataTotal[0].totalLeft;
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
