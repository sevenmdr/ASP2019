<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pagePermissionControlList.aspx.cs" Inherits="_2018_12_13.Views.Permission.pagePermissionControlList" %>

<div class="sixteen wide tablet ten wide computer column">
    <div class="ui segments" style="background-color: white">
        <form class="ui form segment form3" style="height: 65px">
            <div class="ui segment" style="border: none; box-shadow: none;">
                <div>
                    <div style="float: left">
                        <h3>Danh sách Control 

                        </h3>
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
                        <th style="text-align: center">Tên Control</th>
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
    function LoadControlListAjax() {
        GetDataPermissionControlList("/Views/Permission/pagePermissionControlList.aspx/LoadData", function (data) {
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
                    { "visible": true, "targets": 2, "data": "Name", width: "350px" },
                    { "visible": true, "targets": 3, "data": "Note" },
                    { "visible": true, "targets": 4, "data": "CreatedString", width: "120px", "className": "center" },
                    { "visible": true, "targets": 5, "data": "NguoiTao", width: "200px" },


                ],
            });

            document.getElementById("dtContent").className = "ui celled table";
        })
    }

    $(document).ready(function () {
        divClone = $("#TableContent").clone();
        LoadControlListAjax();
    });

</script>

<script src="/dist/semantic.min.js"></script>
<script src="/js/comon/load_datasource.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>

