<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageReportOldNewCustomer.aspx.cs" Inherits="_2018_12_13.Views.Report.Report.pageReportOldNewCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pusher">
        <link href="/Views/Report/build/nv.d3.css" rel="stylesheet" type="text/css" />
        <script src="/Views/Report/build/d3.min.js"></script>
        <script src="/Views/Report/build/d3.v3.min.js"></script>
        <script src="/Views/Report/build/nv.d3.js"></script>
        <script src="lib/stream_layers.js"></script>
        <div class="navslide navwrap">

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
                                <div style="float: left; width: 200px">
                                    <div class="ui fluid search selection dropdown" id="branch">
                                        <input type="hidden" name="branch" />
                                        <input class="search" autocomplete="off" tabindex="0" />
                                        <div class="default text">Chọn Chi Nhánh</div>
                                        <div id="cbbBranch" class="menu" tabindex="-1">
                                        </div>
                                    </div>
                                </div>
                                <div style="float: left;">&nbsp</div>
                                <div style="float: left;">
                                    <div class="ui blue button" onclick="event.preventDefault();return LoadDataChart()">Xem</div>
                                </div>
                            </div>


                        </div>
                    </form>
                </div>
            </div>

        </div>


        <div class="mainWrap navslide">
            <div class="ui equal width left aligned padded grid stackable">
                <div class="stretched row">
                    <div class="sixteen wide tablet eight wide computer column">

                        <div class="ui segment">
                            <h5 class="ui dividing header">Khách Hàng Mới<p>&nbsp;</p>
                            </h5>
                            <div class="ui middle aligned relaxed list">
                                <div class="item">
                                    <div class="right floated content">
                                        <a id="TotalNewCustomer" class="ui red basic label" style="font-size: 14px;">0</a>
                                    </div>
                                    <i class="icon large ion-pizza circular red"></i>
                                    <div class="content">
                                        Tổng Số Khách
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="right floated content">
                                        <a id="TotalPaymentNewCustomer" class="ui teal basic label" style="font-size: 14px;">0</a>
                                    </div>
                                    <i class="icon large ion-lock-combination circular teal"></i>

                                    <div class="content">
                                        Tổng Tiền Thu
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="right floated content">
                                        <a id="TotalBalanceNewCustomer" class="ui blue basic label" style="font-size: 14px;">0</a>
                                    </div>
                                    <i class="icon large ion-bowtie circular blue"></i>

                                    <div class="content">
                                        Tiền Còn Nợ
                                    </div>
                                </div>

                            </div>
                            <div class="ui segment left aligned">
                                <table class="ui very basic center aligned  celled table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">MSKH</th>
                                            <th style="text-align: center">Tên Khách Hàng</th>
                                            <th style="text-align: center">Tổng Tiền DV</th>
                                            <th style="text-align: center">Tổng Tiền Thanh Toán</th>
                                            <th style="text-align: center">Tổng Tiền Nợ</th>
                                        </tr>
                                    </thead>
                                    <tbody id="dtContentReceipt">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="sixteen wide tablet eight wide computer column">

                        <div class="ui segment">
                            <h5 class="ui dividing header">Khách Hàng Cũ<p>&nbsp;</p>
                            </h5>
                            <div class="ui middle aligned relaxed list">
                                <div class="item">
                                    <div class="right floated content">
                                        <a id="TotalOldCustomer" class="ui red basic label" style="font-size: 14px;">0</a>
                                    </div>
                                    <i class="icon large ion-pizza circular red"></i>
                                    <div class="content">
                                        Tổng Số Khách
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="right floated content">
                                        <a id="TotalPaymentOldCustomer" class="ui teal basic label" style="font-size: 14px;">0</a>
                                    </div>
                                    <i class="icon large ion-lock-combination circular teal"></i>

                                    <div class="content">
                                        Tổng Tiền Thu
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="right floated content">
                                        <a id="TotalBalanceOldCustomer" class="ui blue basic label" style="font-size: 14px;">0</a>
                                    </div>
                                    <i class="icon large ion-bowtie circular blue"></i>

                                    <div class="content">
                                        Tiền Còn Nợ
                                    </div>
                                </div>
                            </div>
                            <div class="ui segment left aligned">
                                <table class="ui very basic center aligned  celled table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">MSKH</th>
                                            <th style="text-align: center">Tên Khách Hàng</th>
                                            <th style="text-align: center">Tổng Tiền DV</th>
                                            <th style="text-align: center">Tổng Tiền Thanh Toán</th>
                                            <th style="text-align: center">Tổng Tiền Nợ</th>
                                        </tr>
                                    </thead>
                                    <tbody id="dtContentReceipt1">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script type="text/javascript">

            var DataComboBranch;




            $(document).ready(function () {
                $(".flatpickr").flatpickr({
                    dateFormat: 'Y-m-d',
                    enableTime: false,
                    defaultDate: new Date(),
                });
                DataComboBranch = ([<%=_DataComboBranch%>][0]);

                LoadCombo(DataComboBranch, "cbbBranch")
            });
            function LoadDataChart() {
                var dateFrom = $('#dateFrom').val() ? $('#dateFrom').val() : new Date();
                var dateTo = $('#dateTo').val() ? $('#dateTo').val() : new Date();

                let branchID = Number($('#branch').dropdown('get value')) ? Number($('#branch').dropdown('get value')) : 0;
                GetReportONewCustomer("/Views/Report/Report/pageReportOldNewCustomer.aspx/LoadData", dateFrom, dateTo, branchID.toString(), function (dataContent, dataGeneral) {
                    let dataNewCustomer=  dataContent.filter(word => word["Type"] == 1);
                    let dataOldCustomer = dataContent.filter(word => word["Type"] == 0);
                    
                    RenderReportOldNewCustomer(dataNewCustomer, "dtContentReceipt");
                    RenderReportOldNewCustomer(dataOldCustomer, "dtContentReceipt1");

                    document.getElementById("TotalOldCustomer").innerHTML = !dataGeneral[0] ? 0 : dataGeneral[0].TotalOldCutomer;
                    document.getElementById("TotalPaymentOldCustomer").innerHTML = !dataGeneral[0] ? 0 : dataGeneral[0].TotalAmountOldCutomer;
                    document.getElementById("TotalBalanceOldCustomer").innerHTML = !dataGeneral[0] ? 0 : dataGeneral[0].TotalBalanceOldCutomer;
                    document.getElementById("TotalNewCustomer").innerHTML = !dataGeneral[0] ? 0 : dataGeneral[0].TotalNewCutomer;
                    document.getElementById("TotalPaymentNewCustomer").innerHTML = !dataGeneral[0] ? 0 : dataGeneral[0].TotalAmountNewCutomer;
                    document.getElementById("TotalBalanceNewCustomer").innerHTML = !dataGeneral[0] ? 0 : dataGeneral[0].TotalBalanceNewCutomer;

                })
            }

        </script>
</asp:Content>
