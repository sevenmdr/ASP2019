<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageInvoiceList.aspx.cs" Inherits="_2018_12_13.Views.Account.pageInvoiceList" %>

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
                                        <a class="ui blue image label" style="height: 30px!important; font-size: 13px;">Tổng Chi<div class="detail" id="totalInvoice">0</div>
                                        </a>
                                    </div>
                                    <div style="float: right">
                                        <button class="ui blue basic button modalfour" data-value="fade up" onclick="event.preventDefault();AddNewAccount()">Thêm Mới</button>
                                    </div>
                                    <div style="float: right">
                                        <input id="dateTo" class="flatpickr" type="text" placeholder="Đến Ngày.." onchange="LoadAccountAjax()" />
                                    </div>
                                    <div style="float: right">
                                        <input id="dateFrom" class="flatpickr" type="text" placeholder="Từ Ngày.." onchange="LoadAccountAjax()" />
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
                                        <th style="text-align: center">Mã Phiếu</th>
                                        <th style="text-align: center">Ngày Tạo</th>
                                        <th style="text-align: center">Loại</th>
                                        <th style="text-align: center">Người Nhận</th>
                                        <th style="text-align: center">Nội Dung</th>
                                        <th style="text-align: center">Số Tiền</th>
                                        <th style="text-align: center">Hình Thúc</th>
                                        <th style="text-align: center; width: 30px;">In</th>
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
        function LoadAccountAjax() {
            let dateFrom = $('#dateFrom').val() ? $('#dateFrom').val() : new Date();
            let dateTo = $('#dateTo').val() ? $('#dateTo').val() : new Date()
            GetDataAccountList("/Views/Account/pageInvoiceList.aspx/LoadataAccount", dateFrom, dateTo, function (data) {
   
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
                        { "visible": false, "targets": 0, "data": "ID" },
                        { "visible": true, "targets": 1, "data": "STT", width: "50px", "className": "center" },
                        { "visible": true, "targets": 2, "data": "ReceiptsCode", width: "170px" },
                        { "visible": true, "targets": 3, "data": "ReceiptsDate", width: "150px" },
                        { "visible": true, "targets": 4, "data": "ReceiptsType", width: "250px" },
                        { "visible": true, "targets": 5, "data": "Recipient", width: "200px" },
                        { "visible": true, "targets": 6, "data": "ReceiptsContent" },

                        { "visible": true, "targets": 7, "data": "Amount", width: "120px", "className": "center" },
                        { "visible": true, "targets": 8, "data": "Transfer_Type", width: "120px", },
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
                                             {
                        "targets": -3,
                        "data": null,
                        "defaultContent":
                            "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                            + "'data-value='fade up'><img class='buttonPrintClass' src='/img/ButtonImg/printer.png' alt='delete' width='20' height='20'></button>",
                    },

                    ],
                });
                debugger
                document.getElementById("totalInvoice").innerHTML = !data[0] ? 0 : data[0].totalInvoice;
                document.getElementById("dtContent").className = "ui celled table";
                $('#dtContent tbody ').on('click', '.buttonEditClass', function () {
                    var data = table.row($(this).parents('tr')).data();
                    EditAccount(data["ID"]);
                });
                $('#dtContent tbody ').on('click', '.buttonDeleteClass', function () {
                    var data = table.row($(this).parents('tr')).data();
                    DeleteAccountList(data["ID"]);
                });
                            $('#dtContent tbody ').on('click', '.buttonPrintClass', function () {
                var data = table.row($(this).parents('tr')).data();
                window.open("/Views/Account/pageInvoicePrint.aspx?id="+data["ID"], '_blank', 'location=yes,height=650,width=800,scrollbars=yes,status=yes');
            });

            })
        }
        function DeleteAccountList(id) {
            const promise = notiConfirm();
            promise.then(function () { ExecuteDeleteAccount(id); }, function () { });
        }
        function ExecuteDeleteAccount(id) {
            $.ajax({
                url: "/Views/Account/pageInvoiceList.aspx/DeleteItem",
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
                        LoadAccountAjax();
                    } else {
                        notiError(result.d);
                    }
                }
            })
        }
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'Y-m-d',
                enableTime: false,
                defaultDate: new Date(),
            });
            divClone = $("#TableContent").clone();
            LoadAccountAjax();

        });
        function AddNewAccount() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Account/pageInvoiceDetail.aspx");
            $('#divDetailPopup').modal('show');
            return false;
        }
        function EditAccount(CurrentID) {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Account/pageInvoiceDetail.aspx?CurrentID=" + CurrentID);
            $('#divDetailPopup').modal('show');
            return false;
        }

    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/customjs/custom-datatable.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

</asp:Content>
