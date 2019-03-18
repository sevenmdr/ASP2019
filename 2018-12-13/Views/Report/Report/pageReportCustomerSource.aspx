<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageReportCustomerSource.aspx.cs" Inherits="_2018_12_13.Views.Report.Report.pageReportCustomerSource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        text {
            font: 12px sans-serif;
        }

        html, body, #chart1, svg {
            margin: 0px;
            padding: 0px;
            height: 100%;
            width: 100%;
        }


        .nvd3.nv-pie.nv-chart-donut2 .nv-pie-title {
            fill: rgba(70, 107, 168, 0.78);
        }
         
        .nvd3.nv-pie.nv-chart-donut1 .nv-pie-title {
            opacity: 0.4;
            fill: rgba(224, 116, 76, 0.91);
        }
    </style>


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
                    <div class="sixteen wide tablet ten wide computer column">
                        <div class="ui segments">
                            <div class="ui segment no-padding-bottom">
                                <h5 class="ui left floated header">Doanh Thu Theo Nguồn
                                </h5>
                                <h5 class="ui right floated header">
                                    <i class="ion-ios-arrow-up icon link"></i>
                                    <i class="ion-ios-refresh-empty refreshing icon link"></i>
                                    <i class="ion-ios-close-empty icon link"></i>
                                </h5>
                                <div class="clearfix"></div>
                            </div>
                            <div class="ui segment left aligned">
                                <table class="ui very basic center aligned  celled table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">Nguồn Khách Hàng</th>
                                            <th style="text-align: center">Doanh Thu</th>
                                            <th style="text-align: center">Số Lượng Khách Mới</th>
                                        </tr>
                                    </thead>
                                    <tbody id="dtContentCustomerSourceBody">
                                    </tbody>
                                </table>

                                <div class="ui inverted dimmer">
                                    <div class="ui text loader">Loading</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sixteen wide tablet six wide computer column">
                        <div class="ui segment">
                            <svg id="chartpie" class="mypiechart" style="height: 350px !important; width: 350px !important;"></svg>
                        </div>
                    </div>




                </div>
                <div class="row">
                    <div class="sixteen wide tablet sixteen wide computer column">
                        <div class="ui segments">
                            <div class="ui segment no-padding-bottom">
                                <h5 class="ui left floated header">
                                </h5>
                                <h5 class="ui right floated header">
                                    <i class="ion-ios-arrow-up icon link"></i>
                                    <i class="ion-ios-refresh-empty refreshing icon link"></i>
                                    <i class="ion-ios-close-empty icon link"></i>
                                </h5>
                                <div class="clearfix"></div>
                            </div>
                            <div class="ui segment">
                                <div class="ui grid">
                                    <div class="stretched row">
                                        <div class="sixteen wide tablet sixteen wide computer column">
                                            <div id="chart1" style="height: 250px;">
                                                <svg style="display: block;"></svg>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var DataComboBranch;
        var DataMain;
        var chart1;

        var dataChartPie;
        var dataChartColumn

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
            GetRevenueCustomerSource("/Views/Report/Report/pageReportCustomerSource.aspx/LoadDataSpurce", dateFrom, dateTo, branchID.toString(), function (data) {
  
                DataMain = data;
                dataChartPie = new Array();

                var valuesChartColumn = new Array();

                for (var i = 0; i < DataMain.length; i++) {
                    var temp_item = DataMain[i];
                    var element = {};
                    element.key = temp_item.SourceName;
                    element.y = Number(temp_item.Amount);
                    dataChartPie.push(element);

                    var elementColumn = {};
                    elementColumn.label = temp_item.SourceName;
                    elementColumn.value = Number(temp_item.Amount);
                    valuesChartColumn.push(elementColumn);
                }

                dataChartColumn = new Array();
                var element = {};
                element.key="Column 1"
                element.values = valuesChartColumn;
                dataChartColumn.push(element);


                LoadChartPie();
                LoadChartColumn();
                LoadTableList();

            })
        }

        function LoadChartPie() {
            nv.addGraph(function () {
                var chart1 = nv.models.pieChart()
                    .x(function (d) { return d.key })
                    .y(function (d) { return d.y })
                    .donut(true)
                    .width(350)
                    .height(350)
                    .padAngle(.08)
                    .cornerRadius(5)
                    .id('donut1'); // allow custom CSS for this one svg
                chart1.title("100%");
                chart1.pie.labelsOutside(true).donut(true);
                d3.select("#chartpie")
                    .datum(dataChartPie)
                    .transition().duration(1200)
                    .call(chart1);
                return chart1;

            });
        }
        function LoadChartColumn() {
            nv.addGraph(function () {
                var chart = nv.models.discreteBarChart()
                    .x(function (d) { return d.label })
                    .y(function (d) { return d.value })
                    .staggerLabels(true)
                    .showValues(true)
                    .duration(250)
                    ;

                d3.select('#chart1 svg')
                    .datum(dataChartColumn)
                    .call(chart);

                nv.utils.windowResize(chart.update);
                return chart;
            });
        }
        function LoadTableList() {
            RenderReportCustomerSource(DataMain, "dtContentCustomerSourceBody");
        }

    </script>


</asp:Content>
