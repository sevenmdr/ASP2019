<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageStatusListDental.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageStatusListDental" %>


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
                                <button class="ui yellow button modalthree" data-value="fade up" onclick="addNewStatus(customerID)">Thêm Mới</button>
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
                                <th style="text-align: center">Nội Dung</th>
                                <th style="text-align: center">Ngày</th>
                                <th style="text-align: center">Loại</th>
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
    var customerID = ("<%=_CustomerID %>");
    function LoadStatusAjax() {
        GetDataSourceStatus("/Views/Customer/pageStatusList.aspx/LoadataStatus", customerID, function (data) {
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
                    { "visible": true, "targets": 2, "data": "DoctorName", width: "120px" },
                    { "visible": true, "targets": 3, "data": "Content" },
                    { "visible": true, "targets": 4, "data": "CreatedString", width: "120px", "className": "center" },
                    { "visible": true, "targets": 5, "data": "TypeName", width: "120px" },
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
                editStatus(data["ID"],customerID);
            });
            $('#dtContent tbody ').on('click', '.buttonDeleteClass', function () {
                var data = table.row($(this).parents('tr')).data();
                DeleteStatusList(data["ID"]);
            });

        })

    }
    function DeleteStatusList(id) {
        const promise = notiConfirm();
        promise.then(function () { ExecuteDeleteStatus(id); }, function () { });
    }
    function ExecuteDeleteStatus(id) {
        $.ajax({
            url: "/Views/Customer/pageStatusList.aspx/DeleteItem",
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
                    LoadStatusAjax();
                } else {
                    notiError();
                }
            }
        })
    }
    $(document).ready(function () {
        divClone = $("#TableContent").clone();
        LoadStatusAjax();

    });



</script>

<script src="/dist/semantic.min.js"></script>
<script src="/js/customjs/custom-modal.js"></script>
<%--<script src="/plugins/datatable/jquery.dataTables.js"></script>--%>
<script src="/js/customjs/custom-datatable.js"></script>
<script src="/js/comon/load_datasource.js"></script>
<script src="/js/comon/renderControl.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>
