<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageDiscountList.aspx.cs" Inherits="_2018_12_13.Views.Discount.pageDiscountList" %>

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
                                        <h3>Chương Trình Khuyến Mãi</h3>
                                    </div>
                                    <div style="float: right">
                                        <button class="ui blue basic button" data-value="fade up" onclick="return AddNewDiscount()">Thêm Mới</button>
                                    </div>
                                    <div style="float: right; width: 200px">
                                        <input id="dateTo" class="flatpickr" type="text" placeholder="Date To .." onchange="LoadDiscountAjax()" />
                                    </div>
                                    <div style="float: right; width: 200px">
                                        <input id="dateFrom" class="flatpickr" type="text" placeholder="Date From ...." onchange="LoadDiscountAjax()" />
                                    </div>
                                </div>


                            </div>
                        </form>
                        <div class="ui segment" id="TableContent" style="float: left; width: 100%">
                            <table class="ui celled padded table" id="dtContent">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">ID</th>
                                        <th style="text-align: center; width: 25px;">STT</th>
                                        <th style="text-align: center">Loại</th>
                                        <th style="text-align: center">Tên CTKM</th>
                                        <th style="text-align: center">Từ Ngày</th>
                                        <th style="text-align: center">Đến Ngày</th>
                                        <th style="text-align: center">Phần Trăm Giảm</th>
                                        <th style="text-align: center">Số Tiền Giảm</th>
                                        <th style="text-align: center">Dịch Vụ Giảm</th>
                                        <th style="text-align: center">Nội Dung</th>
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
        function LoadDiscountAjax() {
            let dateFrom = $('#dateFrom').val() ? $('#dateFrom').val() : new Date();
            let dateTo = $('#dateTo').val() ? $('#dateTo').val() : new Date()
            GetDataDiscount("/Views/Discount/pageDiscountList.aspx/LoadDataDiscount", dateFrom, dateTo, function (data) {
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
                        { "visible": true, "targets": 2, "data": "Type" , width: "250px" },
                        { "visible": true, "targets": 3, "data": "Name", width: "250px" },
                        { "visible": true, "targets": 4, "data": "DateFrom" , width: "150px"},
                        { "visible": true, "targets": 5, "data": "DateTo", width: "150px" },
                        { "visible": true, "targets": 6, "data": "Percent", width: "150px" },
                        { "visible": true, "targets": 7, "data": "Amount" , width: "150px"},
                        { "visible": true, "targets":8, "data": "Rule" },
                           { "visible": true, "targets": 9, "data": "Content" , width: "150px"},
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
                    EditDiscount(data["ID"]);
                });
                $('#dtContent tbody ').on('click', '.buttonDeleteClass', function () {
                    var data = table.row($(this).parents('tr')).data();
                    DeleteDiscount(data["ID"]);
                });

            })

        }
        function AddNewDiscount() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Discount/pageDiscountDetail.aspx");
            $('#divDetailPopup').modal('show');
            return false;
        }
        function DeleteDiscount(id) {
            const promise = notiConfirm();
            promise.then(function () { ExecuteDeleteDiscount(id); }, function () { });
        }

        function EditDiscount(id) {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Discount/pageDiscountDetail.aspx?CurrentID=" + id);
            $('#divDetailPopup').modal('show');

        }
        function ExecuteDeleteDiscount(id) {
            $.ajax({
                url: "/Views/Discount/pageDiscountList.aspx/DeleteItem",
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
                        LoadDiscountAjax();
                    } else {
                        notiError();
                    }
                }
            })
        }
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            divClone = $("#TableContent").clone();
            LoadDiscountAjax();
        });



    </script>

        <script src="/dist/semantic.min.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>

  
</asp:Content>
