<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pagePaymentList.aspx.cs" Inherits="_2018_12_13.Views.Customer.pagePaymentList" %>

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
                                <button class="ui blue basic button modalfour" data-value="fade up" onclick="addNewPayment(customerID)">Thêm Mới</button>

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
                                <th style="text-align: center">Ngươi Tạo</th>
                                <th style="text-align: center">Mã Phiếu</th>
                                <th style="text-align: center">Nội Dung</th>
                                <th style="text-align: center">Số Tiền</th>
                                <th style="text-align: center">Ngày</th>
                                <th style="text-align: center">Hình Thức</th>
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

<script type="text/javascript">
    var divClone;
    var customerID = ("<%=CustomerID %>");
    function LoadPaymentAjax() {
        GetDataSourcePayment("/Views/Customer/pagePaymentList.aspx/LoadataPayment", customerID, function (data) {
            //$('#dtContent').DataTable().clear();
            //$('#dtContent').DataTable().state.clear()
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
                    { "visible": true, "targets": 1, "data": "STT" ,width: "50px"},
                    { "visible": true, "targets": 2, "data": "CreatedName", width:"120px" },
                    { "visible": true, "targets": 3, "data": "InvoiceNum", width:"120px" },            
                    { "visible": true, "targets": 4, "data": "Content", },
                     { "visible": true, "targets":5, "data": "Amount" , width:"150px"},
                    { "visible": true, "targets": 6, "data": "CreatedString", width:"120px" },
                    { "visible": true, "targets": 7, "data": "MethodName", width:"120px" },
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
                            + "'data-value='fade up' onclick='deleteHistory()'><img class='buttonDeleteClass' src='/img/ButtonImg/delete.png' alt='delete' width='20' height='20'></button>",
                    },
                     {
                        "targets": -3,
                        "data": null,
                        "defaultContent":
                            "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                            + "'data-value='fade up'><img class='buttonPrintClass' src='/img/ButtonImg/printer.png' alt='delete' width='20' height='20'></button>",
                    },

                ], 
      
   } );
          

            document.getElementById("dtContent").className = "ui celled table";
            $('#dtContent tbody ').on('click', '.buttonEditClass', function () {
                var data = table.row($(this).parents('tr')).data();
                console.log(data);
                editPayment(data["ID"],customerID);
            });
            $('#dtContent tbody ').on('click', '.buttonDeleteClass', function () {
                var data = table.row($(this).parents('tr')).data();
                DeletePayment(data["ID"])
            });
            $('#dtContent tbody ').on('click', '.buttonPrintClass', function () {
                var data = table.row($(this).parents('tr')).data();
                window.open("/Views/Customer/pagePaymentPrint.aspx?id="+data["ID"], '_blank', 'location=yes,height=650,width=800,scrollbars=yes,status=yes');
            });


        })
    }
    function DeletePayment(id) {
        const promise = notiConfirm();
        promise.then(function () { ExecuteDeletePayment(id); }, function () { });
    }
            function ExecuteDeletePayment(id) {
                $.ajax({
                    url: "/Views/Customer/pagePaymentList.aspx/DeleteItem",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'id':id  }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError();
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            LoadPaymentAjax();
                        } else {
                            notiError();
                        }
                    }
                })
        }
    $(document).ready(function () {
        divClone = $("#TableContent").clone();
        LoadPaymentAjax();
       

    });



</script>

<script src="/dist/semantic.min.js"></script>
<script src="/js/customjs/custom-modal.js"></script>
<script src="/plugins/datatable/jquery.dataTables.js"></script>
<script src="/js/customjs/custom-datatable.js"></script>
<script src="/js/comon/load_datasource.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>



