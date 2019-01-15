<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageTicketListRecover.aspx.cs" Inherits="_2018_12_13.Views.Marketing.pageTicketListRecover" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">
                <div class="sixteen wide tablet ten wide computer column">
                    <div class="ui segments" style="background-color: white">
                        <form class="ui form segment" style="height: 65px">
                            <div class="ui segment" style="border: none; box-shadow: none;">
                                <div>
                                    <div style="float: left; width: 100px">
                                        <input id="dateFrom" class="flatpickr" type="text" placeholder="Date From ...." />
                                    </div>
                                    <div style="float: left; width: 100px">
                                        <input id="dateTo" class="flatpickr" type="text" placeholder="Date To .." />
                                    </div>
                                    <div style="float: left; width: 150px">
                                        <div class="ui fluid search selection dropdown" id="TicketSource">
                                            <input type="hidden" name="branch" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Nguồn Ticket</div>
                                            <div id="cbbTicketSource" class="menu" tabindex="-1">
                                            </div>
                                        </div>
                                    </div>
                                    <div style="float: left;">&nbsp</div>
                                    <div style="float: left;">
                                        <div class="ui blue button" onclick="event.preventDefault();return LoadTicket()">Xem</div>
                                    </div>

                                </div>


                            </div>
                        </form>
                        <div class="ui segment" id="TableContentTikcet">
                            <table id="dtContentTicket" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">TicketID</th>
                                        <th style="text-align: center">CustomerID</th>
                                        <th style="text-align: center">SourceID</th>
                                        <th style="text-align: center">STT</th>
                                        <th style="text-align: center">MSKH</th>
                                        <th style="text-align: center">Tên</th>
                                        <th style="text-align: center">Nguồn</th>
                                        <th style="text-align: center">Số Điện Thoại</th>
                                        <th style="text-align: center">Trạng Thái</th>
                                        <th style="text-align: center">Ngày Xóa</th>
                                        <th style="text-align: center">Giờ Xóa</th>
                                        <th style="text-align: center">Người Xóa</th>
                                        <th style="text-align: center; width: 90px">Khôi Phục</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var divClone;
        var DataComboSource = "";
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            DataComboSource = ([<%=_DataComboSource%>][0]);
            LoadCombo(DataComboSource, "cbbTicketSource")
            $("#TicketSource").dropdown("refresh");
            $("#TicketSource").dropdown("set selected", "0");
            divClone = $("#TableContentTikcet").clone();
            LoadTicket();
        });

        function LoadTicket() {
            var dateFrom = $('#dateFrom').val() ? $('#dateFrom').val() : new Date();
            var dateTo = $('#dateTo').val() ? $('#dateTo').val() : new Date();
            let sourceID = Number($('#TicketSource').dropdown('get value')) ? Number($('#TicketSource').dropdown('get value')) : 0;


            GetDataTicketListDelete("/Views/Marketing/pageTicketListRecover.aspx/LoadTicketList", dateFrom, dateTo, sourceID, function (data) {
                $('#dtContentTicket').DataTable().destroy();
                $("#TableContentTikcet").replaceWith(divClone.clone());
                var table = $('#dtContentTicket').DataTable({
                    data: data,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": false, "targets": 0, "data": "TicketID" },
                        { "visible": false, "targets": 1, "data": "CustomerID" },
                        { "visible": false, "targets": 2, "data": "SourceID" },
                        { "visible": true, "targets": 3, "data": "STT", width: "50px", "className": "center" },
                        {
                            "visible": true, "targets": 4, "data": "CustCode", width: "120px", "className": "center", "render": function (data, type, row, meta) {
                                if (type === 'display') { data = '<a href="' + "/Views/Customer/MainCustomer.aspx?CustomerID=" + Number(data) + '">' + data + '</a>'; }

                                return data;
                            }
                        },
                        { "visible": true, "targets": 5, "data": "TicketName" },
                        { "visible": true, "targets": 6, "data": "SrourceName" },
                        { "visible": true, "targets": 7, "data": "Phone", width: "250px" },
                        { "visible": true, "targets": 8, "data": "StatusName", width: "250px" },
                        { "visible": true, "targets": 9, "data": "DateExe", width: "100px" },
                        { "visible": true, "targets": 10, "data": "HourExe", width: "100px" },
                        { "visible": true, "targets": 11, "data": "PerExe", width: "200px" },
                        {
                            "targets": -1,
                            "data": null,
                            "defaultContent":
                                "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                                + "'data-value='fade up'><img class='buttonRecoverClass' src='/img/ButtonImg/recover.png' alt='delete' width='20' height='20'></button>",
                        },

                    ],
                });

                document.getElementById("dtContentTicket").className = "ui celled table";
                $('#dtContentTicket tbody ').on('click', '.buttonRecoverClass', function () {
                    var data = table.row($(this).parents('tr')).data();
                    RecoverTicket(data["TicketID"]);
                });


            })
        }
        function RecoverTicket(TicketID) {
                    const promise = notiConfirmDeleteTicket();
        promise.then(function () { ExecuteRecover(TicketID); }, function () { });
        }
            function ExecuteRecover(id) {
        $.ajax({
            url: "/Views/Marketing/pageTicketListRecover.aspx/Recover",
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
                    LoadTicket();
                } else {
                    notiError(result.d);
                }
            }
        })
    }

    </script>

    <script src="/dist/semantic.min.js"></script>
    <%--     <script src="/js/customjs/custom-modal.js"></script>--%>
    <script src="/js/comon/load_datasource.js"></script>

</asp:Content>
