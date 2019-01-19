<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageTicketDetail.aspx.cs" Inherits="_2018_12_13.Views.Marketing.pageTicketDetail" %>

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
        Ticket
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="field">
                        <div class="field">
                            <label>Tên</label>
                            <input id="txtNameTicket" name="name" type="text" />
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <div class="field">
                                <label>Điện Thoại ( 10 Ký Tự Số )</label>
                                <input id="Phone1" name="phonenumber" type="text" />
                            </div>
                        </div>
                        <div class="field">
                            <label>Email</label>
                            <input id="Email1" name="email" type="text" />
                        </div>
                    </div>
                    <div class="two fields">
                      <div class="field">
                            <label>Nguồn Dữ Liệu</label>
                           <div class="ui fluid search selection dropdown" id="sourceType">
                                <input type="hidden" name="sourceType" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Nguồn Dữ Liệu</div>
                                <div id="cbbsourceType" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Giớt Tính</label>
                           <div class="ui fluid search selection dropdown" id="genderType">
                                <input type="hidden" name="gender" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Giớt Tính</div>
                                <div id="cbbgenderType" class="menu" tabindex="-1">
                                </div>
                            </div>
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
            <button class="ui teal button" form="form3" type="submit" onclick="return ExcuteData()">Save</button>
        </div>

    </div>

    <script type="text/javascript">
        var DataComboGender; // Data gender
        var DataTicketSource; // Data source
        var TicketMainDetail; // Data main

        $(document).ready(function () {
            $(".flatpickr").flatpickr({
               dateFormat: 'Y-m-d',
                enableTime: false,
                defaultDate: new Date(),
            });
            DataComboGender = ([<%=_DataComboGender%>][0]);
            DataTicketSource = ([<%=_DataTicketSource%>][0]);
            LoadCombo(DataComboGender, "cbbgenderType")
            LoadCombo(DataTicketSource, "cbbsourceType")
            LoadDataUpdate();
        });
 
  
        function LoadDataUpdate() {
            let TicketMainDetail = ([<%=_TicketMainDetail%>][0]);
            if (TicketMainDetail) {
                $('#txtNameTicket').val((TicketMainDetail[0].Name));
                $('#Phone1').val((TicketMainDetail[0].Phone));
                $('#Email1').val((TicketMainDetail[0].Email));
                $('#txtContent').val((TicketMainDetail[0].Content));
                $("#sourceType").dropdown("refresh");
                $("#sourceType").dropdown("set selected", TicketMainDetail[0].Source);
                 $("#genderType").dropdown("refresh");
                $("#genderType").dropdown("set selected", TicketMainDetail[0].Gender);

            }
        }

        function ExcuteData() {
            var data = new Object();
            data.Name = $('#txtNameTicket').val() ? $('#txtNameTicket').val() : "";
            data.Phone = $('#Phone1').val() ? $('#Phone1').val() : "";
            data.Email = $('#Email1').val() ? $('#Email1').val() : "";
            data.Content = $('#txtContent').val() ? $('#txtContent').val() : "";
            data.Source = Number($('#sourceType').dropdown('get value')) ? Number($('#sourceType').dropdown('get value')) : 0;
            data.Gender = Number($('#genderType').dropdown('get value')) ? Number($('#genderType').dropdown('get value')) : 0;


            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {

                $.ajax({
                    url: "/Views/Marketing/pageTicketDetail.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data)}),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            location.reload();
                        } else {
                            notiError("Lỗi Thao Tác");
                        }
                    }
                })
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
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

</body>

</html>

