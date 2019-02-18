<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageTreatmentList.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageTreatmentList" %>

<div class="ui equal width left aligned padded grid stackable">
    <div class="row">
        <div class="sixteen wide column">
            <div class="ui segments">
                <div class="ui segment">
                    <div class="ui two column middle aligned very relaxed stackable grid">
                        <div class="column">
                            <h5 class="ui header">&nbsp</h5>
                        </div>
                        <div class="ui vertical divider">
                        </div>
                        <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                            <div class="ui buttons">
                                <button class="ui blue basic button modalfour" data-value="fade up" onclick="addNewTreatment(customerID)">Thêm Mới</button>
                                 <button class="ui blue basic button modalfour" data-value="fade up" onclick="addNewTakeCare(customerID)">Tạo Chăm Sóc</button>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="ui segment" id="TableContent">
                    <table id="dtContent" style="width: 100%">
                        <thead>
                            <tr>
                                <th style="text-align: center">ID</th>
                                <th style="text-align: center; width: 25px;">STT</th>
                                <th style="text-align: center">Bác Sĩ</th>
                                <th style="text-align: center">KTV</th>
                                <th style="text-align: center">Nội Dung</th>
                                <th style="text-align: center">Dịch Vụ</th>
                                <th style="text-align: center">Tồng Lần Điều Trị</th>
                                <th style="text-align: center">Lần Đã Điều Trị</th>
                                <th style="text-align: center">Ngày</th>
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

<script type="text/javascript">
    var divClone;
    var customerID = ("<%=CustomerID %>");
    function LoadTreatmentAjax() {
        GetDataSourceTreatment("/Views/Customer/pageTreatmentList.aspx/LoadataTreatment", customerID, function (data) {
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
                    { "visible": true, "targets": 2, "data": "DocName", width: "200px" },
                    { "visible": true, "targets": 3, "data": "PTname", width: "200px" },
                    { "visible": true, "targets": 4, "data": "Content", },
                    { "visible": true, "targets": 5, "data": "ServiceName", width: "250px" },
                    { "visible": true, "targets": 6, "data": "TimeToTreatment" },
                    { "visible": true, "targets": 7, "data": "TotalTreatment"},

                    { "visible": true, "targets": 8, "data": "CreatedString", width: "200px", "className": "center" },

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
                editTreatment(data["ID"], customerID);
            });
            $('#dtContent tbody ').on('click', '.buttonDeleteClass', function () {
                var data = table.row($(this).parents('tr')).data();
                DeleteTreatment(data["ID"])
            });

        })

    }
    function DeleteTreatment(id) {
        const promise = notiConfirm();
        promise.then(function () { ExecuteDeleteTreatment(id); }, function () { });
    }
    function ExecuteDeleteTreatment(id) {
        $.ajax({
            url: "/Views/Customer/pageTreatmentList.aspx/DeleteItem",
            dataType: "json",
            type: "POST",
            data: JSON.stringify({ 'id': id }),
            contentType: 'application/json; charset=utf-8',
            async: true,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                notiError();
            },
            success: function (result) {
                if (result.d == "1") {
                    notiSuccess();
                    LoadTreatmentAjax();
                } else {
                    notiError();
                }
            }
        })
    }
    $(document).ready(function () {
        divClone = $("#TableContent").clone();
        LoadTreatmentAjax();

    });



</script>

<script src="/dist/semantic.min.js"></script>
<script src="/js/customjs/custom-modal.js"></script>
<%--<script src="/plugins/datatable/jquery.dataTables.js"></script>--%>
<script src="/js/customjs/custom-datatable.js"></script>
<script src="/js/comon/load_datasource.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>
