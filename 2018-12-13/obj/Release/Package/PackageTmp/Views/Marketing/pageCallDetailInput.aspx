<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageCallDetailInput.aspx.cs" Inherits="_2018_12_13.Views.Marketing.pageCallDetailInput" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <link rel="icon" href="/img/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />
    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
    <link href="/css/main.custom.css" rel="stylesheet" />
    <link rel="shortcut icon" href="/img/favicon.ico" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>
    <div id="header" class="header">
        Call Khách Hàng
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="field">
                        <div class="field">
                            <label>Nội Dung</label>
                            <textarea id="txtContent" name="name"></textarea>
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Loại</label>
                            <div class="ui fluid search selection dropdown" id="Typeinput" onchange="ChangeType()">
                                <input type="hidden" name="appointment" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Loại</div>
                                <div id="ccbTypeinput" class="menu" tabindex="-1">

                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label id="lbtime">Ngày Gọi lại</label>
                            <input id="Date_from" name="date" class="flatpickr" type="text" placeholder="Select Date.." />
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

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

    <script>
        function ExcuteData() {
            var data = new Object();
            data.Typeinput = Number($('#Typeinput').dropdown('get value')) ? Number($('#Typeinput').dropdown('get value')) : 0;
            data.TimeCallBack = $('#Date_from').val() ? $('#Date_from').val() : "";
            data.Content = $('#txtContent').val() ? $('#txtContent').val() : "";
            $('#form3').form('validate form');
            debugger
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Marketing/pageCallDetailInput.aspx/ExcuteData",
                    type: "POST",
                    dataType: "json",
                    data:JSON.stringify({ 'data': JSON.stringify(data) }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError();
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            LoadTickedValueAjax();
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
        function ChangeType() {
            debugger
            if (Number($('#Typeinput').dropdown('get value')) == 89) {
                document.getElementById("lbtime").style.display = "none";
                    $('.flatpickr').hide();
                }
                else {
                $('.flatpickr').show();
                document.getElementById("lbtime").style.display= "block";
                }
            }
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y H:i',
                enableTime: true,
                defaultDate: new Date(),
            });
            DataComboTypeinput = ([<%=_DataComboTypeinput%>][0]);
            debugger
            LoadCombo(DataComboTypeinput, "ccbTypeinput")
        });
    </script>
</body>

</html>

