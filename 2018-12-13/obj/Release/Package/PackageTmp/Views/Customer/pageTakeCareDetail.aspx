<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageTakeCareDetail.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageTakeCareDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
        <script src="/js/simple.money.format.js"></script>
    <script src="/js/comon/load_datasource.js"></script>


</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>
    <div id="header" class="header">
        Chăm Sóc Khách Hàng Sau Điều Trị
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="two fields">
                        <div class="field">
                            <label>Ngày Chăm Sóc</label>
                            <input id="TakeCare1" class="flatpickr1" type="text" placeholder="Select Date.." />
                        </div>
                        <div class="field">
                            <label>Ngày Chăm Sóc</label>
                            <input id="TakeCare2" class="flatpickr" type="text" placeholder="Select Date.." />
                        </div>
                    </div>

                    <div class="two fields">
                        <div class="field">
                            <label>Ngày Chăm Sóc</label>
                            <input id="TakeCare3" class="flatpickr" type="text" placeholder="Select Date.." />
                        </div>
                        <div class="field">
                            <label>Ngày Chăm Sóc</label>
                            <input id="TakeCare4" class="flatpickr" type="text" placeholder="Select Date.." />
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Ghi Chú</label>
                            <input id="txtContent" name="content" type="text" />
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" onclick="event.preventDefault();return ExcuteData();">Save</button>
        </div>

    </div>

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
       <script src="/js/customjs/custom-validation.js"></script>
     <script src="/js/comon/load_datasource.js"></script>
    <script src="/js/main.js"></script>
    <script>

        function ExcuteData() {

            var data = new Object();
            data.TakeCare1 = $('#TakeCare1').val();
            data.TakeCare2 = $('#TakeCare2').val();
            data.TakeCare3 = $('#TakeCare3').val();
            data.TakeCare4 = $('#TakeCare4').val();
            data.Content = $('#txtContent').val() ? $('#txtContent').val() : "";
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Customer/pageTakeCareDetail.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data) }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError();
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();

                        } else {
                            notiError();
                        }

                    }
                });
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
        }

        $(document).ready(function () {
            $(".flatpickr1").flatpickr({
                dateFormat: 'Y-m-d',
                enableTime: false,
                defaultDate: new Date(),
                minDate: new Date(),
            });
            $(".flatpickr").flatpickr({
                dateFormat: 'Y-m-d',
                enableTime: false,
                minDate: new Date(),
            });
        });
    </script>
</body>

</html>

