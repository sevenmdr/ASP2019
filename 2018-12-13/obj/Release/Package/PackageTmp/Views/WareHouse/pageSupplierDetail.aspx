<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageSupplierDetail.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageSupplierDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />
    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
    <link href="/css/main.custom.css" rel="stylesheet" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />

</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" />
    </form>
    <div class="header">
        Nhà Cung Cấp
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                     <div class="two fields">
                        <div class="field">
                            <div class="field">
                                <label>Tên Nhà Cung Cấp</label>
                                <input id="NameSup" name="name" type="text" />
                            </div>
                        </div>
                        <div class="field">
                            <div class="field">
                                <label>Số Điện Thoại</label>
                                <input id="PhoneSup" name="phonenumber" type="text" />
                            </div>
                        </div>
                    </div>
  <div class="two fields">
                        <div class="field">
                            <div class="field">
                                <label>Email</label>
                                <input id="EmailSup" name="email" type="text" />
                            </div>
                        </div>
                        <div class="field">
                            <div class="field">
                                <label>Người Đại Diện</label>
                                <input id="PersonSup" name="PersonSup" type="text" />
                            </div>
                        </div>
                    </div>
                        <div class="field">
                        <div class="field">
                            <label>Địa Chỉ</label>
                            <textarea id="NoteSup" name="content"></textarea>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" type="submit" onclick="return ExcuteData()">Save</button>
        </div>

    </div>

    <script type="text/javascript">
       function ExcuteData() {
            var data = new Object();
            data.Name = $('#NameSup').val() ? $('#NameSup').val() : "";
            data.Phone = $('#PhoneSup').val() ? $('#PhoneSup').val() : "";
            data.Email = $('#EmailSup').val() ? $('#EmailSup').val() : "";
           data.Person = $('#PersonSup').val() ? $('#PersonSup').val() : "";
           data.Note = $('#NoteSup').val() ? $('#NoteSup').val() : "";
            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/WareHouse/pageSupplierDetail.aspx/ExcuteData",
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
                            LoadSupplierAjax();
                        } else {
                            notiError(result.d);
                        }

                    }
                });
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
        }
        // Loadcombo status type


        $(document).ready(function () {
            LoadDataUpdateSupplier();
        });

            function LoadDataUpdateSupplier() {
            let dataSupplier = ([<%=_dataSupplier%>][0]);
            if (dataSupplier) {

                $('#NameSup').val((dataSupplier[0].Name));
                $('#PhoneSup').val((dataSupplier[0].Phone));
                $('#EmailSup').val((dataSupplier[0].Email));
                $('#PersonSup').val((dataSupplier[0].Person));
                 $('#NoteSup').val((dataSupplier[0].Note));
            }
        }
    </script>

    
    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/noti_function.js"></script>
        <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
<%--    <script src="/js/customjs/custom-modal.js"></script>--%>
</body>

</html>

