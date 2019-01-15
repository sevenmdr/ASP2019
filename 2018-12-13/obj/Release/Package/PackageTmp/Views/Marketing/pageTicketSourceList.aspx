<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageTicketSourceList.aspx.cs" Inherits="_2018_12_13.Views.Marketing.pageTicketSourceList" %>

<div class="sixteen wide tablet ten wide computer column">
    <div class="ui segments" style="background-color: white">
        <form class="ui form segment form3" style="height: 65px">
            <div class="ui segment" style="border: none; box-shadow: none;">
                <div>
                    <div style="float: left">
                        <h3>Nguồn Khách Hàng</h3>
                    </div>
                    <div style="float: right">
                        <button class="ui blue basic button" data-value="fade up" onclick="return AddNewTicketSource()">Thêm Mới</button>
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
                        <th style="text-align: center">Tên Nguồn</th>
                        <th style="text-align: center">Ghi Chú</th>
                        <th style="text-align: center">Ngày Tạo</th>
                        <th style="text-align: center">Người Tạo</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</div>


<script type="text/javascript">
    var divClone;
    function LoadTicketSourceAjax() {
        GetDataTicketSource("/Views/Marketing/pageTicketSourceList.aspx/LoadData", function (data) {
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
                    { "visible": true, "targets": 2, "data": "Name", width: "250px" },
                    { "visible": true, "targets": 3, "data": "Note" },
                    { "visible": true, "targets": 4, "data": "CreatedString", width: "120px", "className": "center" },
                    { "visible": true, "targets": 5, "data": "NguoiTao", width: "200px" },
                    //{
                    //    "targets": -2,
                    //    "data": null,
                    //    "defaultContent":
                    //        "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                    //        + "'data-value='fade up'><img class='buttonEditClass' src='/img/ButtonImg/edit.png' alt='edit' width='20' height='20'></button>",
                    //},
                    //{
                    //    "targets": -1,
                    //    "data": null,
                    //    "defaultContent":
                    //        "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                    //        + "'data-value='fade up'><img class='buttonDeleteClass' src='/img/ButtonImg/delete.png' alt='delete' width='20' height='20'></button>",
                    //},

                ],
            });

            document.getElementById("dtContent").className = "ui celled table";
            $('#dtContent tbody ').on('click', '.buttonEditClass', function () {
                var data = table.row($(this).parents('tr')).data();
                EditTicketSource(data["ID"]);
            });
            //$('#dtContent tbody ').on('click', '.buttonDeleteClass', function () {
            //    var data = table.row($(this).parents('tr')).data();
            //    DeleteTicketSource(data["ID"]);
            //});

        })
    }
    function DeleteTicketSource(id) {
        const promise = notiConfirm();
        promise.then(function () { ExecuteDeleteTicketSource(id); }, function () { });
    }
    function ExecuteDeleteTicketSource(id) {
        $.ajax({
            url: "/Views/Marketing/pageTicketSourceList.aspx/DeleteItem",
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
                    LoadTicketSourceAjax();
                } else {
                    notiError(result.d);
                }
            }
        })
    }
    $(document).ready(function () {
        divClone = $("#TableContent").clone();
        LoadTicketSourceAjax();
    });
    function AddNewTicketSource() {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Marketing/pageTicketSourceDetail.aspx");
        $('#divDetailPopup').modal('show');
        return false;
    }
    function EditTicketSource(CurrentID) {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Marketing/pageTicketSourceDetail.aspx?CurrentID=" + CurrentID);
        $('#divDetailPopup').modal('show');
        return false;
    }
</script>

<script src="/dist/semantic.min.js"></script>
<script src="/js/comon/load_datasource.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>

