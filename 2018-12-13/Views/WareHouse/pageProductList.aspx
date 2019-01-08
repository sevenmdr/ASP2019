<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageProductList.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageProductList" %>


<div class="sixteen wide tablet ten wide computer column">
    <div class="ui segments" style="background-color: white">
        <form class="ui form segment form3" style="height: 65px">
            <div class="ui segment" style="border: none; box-shadow: none;">
                <div>
                    <div style="float: left">
                        <h3>Sản Phẩm</h3>
                    </div>
                    <div style="float: right">
                        <button class="ui blue basic button" data-value="fade up" onclick="return AddNewProduct()">Thêm Mới</button>
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
                        <th style="text-align: center">Mã Sản Phẩm</th>
                        <th style="text-align: center">Tên Sản Phẩm</th>
                        <th style="text-align: center">Loại Sản Phẩm</th>
                        <th style="text-align: center">Đơn Vị Tính Chính</th>
                        <th style="text-align: center">Ghi Chú</th>
                        <th style="text-align: center; max-width: 70px;">Định Mức 1</th>
                        <th style="text-align: center; max-width: 70px;">Định Mức 2</th>
                        <th style="text-align: center; max-width: 70px;">Định Mức 3</th>
                        <th style="text-align: center; width: 30px;">Sửa</th>
                        <th style="text-align: center; width: 30px;">Xóa</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    var divClone;
    function LoadProductAjax() {
        GetDataSourceProduct("/Views/WareHouse/pageProductList.aspx/LoadataProduct", function (data) {
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
                    { "visible": true, "targets": 2, "data": "Code", width: "50px", "className": "center" },
                    { "visible": true, "targets": 3, "data": "Name", width: "120px" },
                    { "visible": true, "targets": 4, "data": "TypeName", width: "250px" },
                    { "visible": true, "targets": 5, "data": "UnitName", width: "200px" },
                    { "visible": true, "targets": 6, "data": "Note" },
                    { "visible": true, "targets": 7, "data": "N1" },
                    { "visible": true, "targets": 8, "data": "N2" },
                    { "visible": true, "targets": 9, "data": "N3" },

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
                EditProduct(data["ID"]);
            });
            $('#dtContent tbody ').on('click', '.buttonDeleteClass', function () {
                var data = table.row($(this).parents('tr')).data();
                DeleteProductList(data["ID"]);
            });

        })
    }
    function DeleteProductList(id) {
        const promise = notiConfirm();
        promise.then(function () { ExecuteDeleteProduct(id); }, function () { });
    }
    function ExecuteDeleteProduct(id) {
        $.ajax({
            url: "/Views/WareHouse/pageProductList.aspx/DeleteItem",
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
                    LoadProductAjax();
                } else {
                    notiError(result.d);
                }
            }
        })
    }
    $(document).ready(function () {

        divClone = $("#TableContent").clone();
        LoadProductAjax();
    });
    function AddNewProduct() {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/WareHouse/pageProductDetail.aspx");
        $('#divDetailPopup').modal('show');
        return false;
    }
    function EditProduct(CurrentID) {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/WareHouse/pageProductDetail.aspx?CurrentID=" + CurrentID);
        $('#divDetailPopup').modal('show');
        return false;
    }
</script>

<%--<script src="/dist/semantic.min.js"></script>--%>
<%--<script src="/js/comon/load_datasource.js"></script>--%>


