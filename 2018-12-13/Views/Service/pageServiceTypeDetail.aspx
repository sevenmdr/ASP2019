<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageServiceTypeDetail.aspx.cs" Inherits="_2018_12_13.Views.Service.pageServiceTypeDetail" %>

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
        Loại Dịch Vụ
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3">
                    <div class="two fields">
                        <div class="field">
                          <%--  <label>Loại Chi Chú</label>
                            <div class="ui fluid search selection dropdown" id="TypeHistory">
                                <input type="hidden" name="historyType" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Loại Lịch Sử</div>
                                <div id="ccbHistoryType" class="menu" tabindex="-1">
                                </div>
                            </div>--%>
                        </div>
                        <div class="field">
                        <%--    <label>Loại Complain</label>
                            <div class="ui fluid search selection dropdown">
                                <input id="ComplaintInput" type="hidden" name="complainType" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Loại Complain</div>
                                <div id="ccbComplainType" class="menu" tabindex="-1">
                                </div>
                            </div>--%>
                        </div>
                    </div>

                    <div class="field">
                        <div class="field">
                            <label>Nội Dung</label>
                            <textarea id="txtNameHistory" name="content"></textarea>
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
        //var DataComboHistory;
        //var DataComboCompalaint;
        function ChangeTypeHistory() {

            //if (Number($('#TypeHistory').dropdown('get value')) == 56) {

            //    $('#TypeComplain').removeClass("disabled");
            //    $("#ComplaintInput").attr('name', "complainType");
            //}
            //else {
            //    $('#TypeComplain').dropdown('clear')
            //    $('#TypeComplain').addClass("disabled");
            //    $("#ComplaintInput").attr('name', "NotVali");
            //}
        }
        function ExcuteData() {
            //var data = new Object();
            //data.TypeHistory_ID = Number($('#TypeHistory').dropdown('get value')) ? Number($('#TypeHistory').dropdown('get value')) : 0;
            //data.TypeCompalint_ID = Number($('#TypeComplain').dropdown('get value')) ? Number($('#TypeComplain').dropdown('get value')) : 0;
            //data.Content = $('#txtNameHistory').val() ? $('#txtNameHistory').val() : "";
            //$('#form3').form('validate form');
            //if ($('#form3').form('is valid')) {
            //    $.ajax({
            //        url: "/Views/Customer/pageHistoryDetail.aspx/ExcuteData",
            //        dataType: "json",
            //        type: "POST",
            //        data: JSON.stringify({ 'data': JSON.stringify(data) }),
            //        contentType: 'application/json; charset=utf-8',
            //        async: true,
            //        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //            notiError("Lỗi Hệ Thống");
            //        },
            //        success: function (result) {
            //            if (result.d == "1") {
            //                notiSuccess();
            //                LoadHistoryAjax();
            //            } else {
            //                notiError("Lỗi Thao Tác");
            //            }
            //        }
            //    })
            //    $('#divDetailPopup').modal('hide');
            //    document.getElementById("divDetailPopup").innerHTML = '';
            //}
            return false;
        }
        // Loadcombo status type

        function LoadComboHistory() {

           <%-- GetDataComboTypeHistory("/Views/Customer/pageHistoryDetail.aspx/LoadComboMain", function (_DataComboHistory, _DataComboCompalaint) {
                DataComboStatus = _DataComboHistory
                if ((<%=_typeHistory%>).toString() == "1") {
                    DataComboStatus = DataComboStatus.filter(word => word["ID"] != 56);
                }
                LoadCombo(DataComboStatus, "ccbHistoryType")
                DataComboCompalaint = _DataComboCompalaint
                LoadCombo(DataComboCompalaint, "ccbComplainType")
            });--%>
        }

        $(document).ready(function () {
            //LoadComboHistory();
            //$('#TypeComplain').addClass("disabled");
            //LoadDataUpdate();
        });

        function LoadDataUpdate() {
        <%--    let dataHistory = ([<%=_dataHistory%>][0]);--%>
            //if (dataHistory) {
            //    $("#TypeHistory").dropdown("refresh");
            //    $("#TypeComplain").dropdown("refresh");
            //    $("#TypeHistory").dropdown("set selected", dataHistory[0].Type);
            //    $("#TypeComplain").dropdown("set selected", dataHistory[0].Complaint);
            //    $('#txtNameHistory').val((dataHistory[0].Content));

            //}
        }
    </script>

    
    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
    <script src="/js/customjs/custom-modal.js"></script>
</body>

</html>

