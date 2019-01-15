<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageReportOverView.aspx.cs" Inherits="_2018_12_13.Views.Report.Report.pageReportOverView" %>

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
                <div class="row">
                    <div class="sixteen wide tablet four wide computer column">

                        <div class="ui segment left aligned">

                            <div class="ui  statistic">
                                <div class="value counter" id="totalReceipt">
                                    0
                                </div>
                                <div class="label">
                                    Tổng Chi
                                </div>
                                <i class="icon ion-ios-cart teal statisticIcon"></i>
                            </div>

                        </div>
                    </div>

                    <div class="sixteen wide tablet four wide computer column">

                        <div class="ui segment left aligned">

                            <div class="ui  statistic">
                                <div class="value counter" id="totalImport">
                                   0
                                </div>
                                <div class="label">
                                    Tổng Tiền Nhập
                                </div>
                                <i class="icon ion-ios-timer blue statisticIcon"></i>
                            </div>

                        </div>
                    </div>
                    <div class="sixteen wide tablet four wide computer column">

                        <div class="ui segment left aligned">

                            <div class="ui  statistic">
                                <div class="value counter" id="totalPayment">
                                   0
                                </div>
                                <div class="label">
                                    Tổng Thu
                                </div>
                                <i class="icon ion-magnet purple statisticIcon"></i>
                            </div>

                        </div>
                    </div>
                    <div class="sixteen wide tablet four wide computer column">

                        <div class="ui segment left aligned">

                            <div class="ui  statistic">

                                <div class="value counter" id="totalMain">
                                   0
                                </div>
                                <div class="label">
                                    Lời Lỗ
                                </div>
                                <i class="icon ion-trophy red statisticIcon"></i>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="sixteen wide tablet ten wide computer column">
                        <div class="ui segments">
                            <div class="ui segment no-padding-bottom">
                                <h5 class="ui left floated header">Chi Tại Chi Nhánh
                                </h5>
                                <h5 class="ui right floated header"></h5>
                                <div class="clearfix"></div>
                            </div>
                            <div class="ui segment left aligned">
                                <table class="ui very basic center aligned  celled table">
                                    <thead>
                                        <tr>
                                             <th style="text-align: center">STT</th>
                                            <th style="text-align: center">Loại Chi</th>
                                            <th style="text-align: center">Tiền Chi</th>
                                            <th style="text-align: center">Ngày Chi</th>
                                            <th style="text-align: center">Người Chi</th>
                                        </tr>
                                    </thead>
                                    <tbody id="dtContentReceipt">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="sixteen wide tablet six wide computer column">
                        <div class="ui segments">
                            <div class="ui segment no-padding-bottom">
                                <h5 class="ui left floated header">Nhập Hàng
                                </h5>
                                <h5 class="ui right floated header"></h5>
                                <div class="clearfix"></div>
                            </div>
                            <div class="ui segment left aligned">
                                <table class="ui very basic center aligned  celled table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">STT</th>
                                            <th style="text-align: center">Ngày Nhập</th>
                                            <th style="text-align: center">Người Nhập</th>
                                            <th style="text-align: center">Tổng Tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody id="dtContentImport">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="sixteen wide tablet sixteen wide computer column">
                        <div class="ui segments">
                            <div class="ui segment no-padding-bottom">
                                <h5 class="ui left floated header">Tiền Thu Khách Hàng
                                </h5>
                                <h5 class="ui right floated header"></h5>
                                <div class="clearfix"></div>
                            </div>
                            <div class="ui segment left aligned">
                                <table class="ui very basic center aligned  celled table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">STT</th>
                                            <th style="text-align: center">Tên Khách</th>
                                            <th style="text-align: center">Ngày Thu</th>
                                            <th style="text-align: center">Tiền Thu</th>
                                            <th style="text-align: center">Người Thu</th>
                                            <th style="text-align: center">Nguồn Khách</th>
                                        </tr>
                                    </thead>
                                    <tbody id="dtContentPayment">
                                    </tbody>
                                </table>
                            </div>
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
                dateFormat: 'd-m-Y',
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
            GetReportOverView("/Views/Report/Report/pageReportOverView.aspx/LoadData", dateFrom, dateTo, branchID.toString(), function (datareceipt, dataImport, dataPayment,dataGeneral) {
                RenderReportOverViewReceipt(datareceipt, "dtContentReceipt");
                RenderReportOverViewImport(dataImport, "dtContentImport");
                RenderReportOverViewPayment(dataPayment, "dtContentPayment");
                
                document.getElementById("totalReceipt").innerHTML = !dataGeneral[0]?0:dataGeneral[0].totalReceipt;
                document.getElementById("totalImport").innerHTML = !dataGeneral[0]?0:dataGeneral[0].totalImport;
                document.getElementById("totalPayment").innerHTML = !dataGeneral[0]?0:dataGeneral[0].totalPayment;
                document.getElementById("totalMain").innerHTML = !dataGeneral[0]?0:dataGeneral[0].totalMain;

            })
        }



    </script>


</asp:Content>
