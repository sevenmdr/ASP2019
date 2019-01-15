<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageNormSettingList.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageNormSettingList" %>

<div class="sixteen wide tablet ten wide computer column">
    <div class="ui segments" style="background-color: white">
        <form class="ui form segment form3" style="height: 65px">
            <div class="ui segment" style="border: none; box-shadow: none;">
                <div>
                    <div style="float: left">
                        <h3>Cài Đặt Định Mức</h3>
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
                        <th style="text-align: center">Tên Định Mức</th>
                        <th style="text-align: center">Mã Màu</th>
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
    function LoadNormAjax() {
        GetDataSourceUnit("/Views/WareHouse/pageNormSettingList.aspx/LoadataNorm", function (data) {
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
                    { "visible": true, "targets": 2, "data": "Name" },
                    { "visible": true, "targets": 3, "data": "ColorCode", width: "200px" },
                    { "visible": true, "targets": 4, "data": "CreatedString", width: "120px", "className": "center" },
                    { "visible": true, "targets": 5, "data": "NguoiTao", width: "200px" },


                ],
            });

            document.getElementById("dtContent").className = "ui celled table";
            $('#dtContent tbody ').on('click', '.buttonEditClass', function () {
                var data = table.row($(this).parents('tr')).data();
                EditUnit(data["ID"]);
            });
            $('#dtContent tbody ').on('click', '.buttonDeleteClass', function () {
                var data = table.row($(this).parents('tr')).data();
                DeleteUnit(data["ID"]);
            });

        })
    }
    $(document).ready(function () {

        divClone = $("#TableContent").clone();
        LoadNormAjax();
    });

</script>

<script src="/dist/semantic.min.js"></script>
<script src="/js/comon/load_datasource.js"></script>

<script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>

