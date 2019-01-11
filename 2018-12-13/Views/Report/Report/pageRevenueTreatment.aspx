<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageRevenueTreatment.aspx.cs" Inherits="_2018_12_13.Views.Report.Report.pageRevenueTreatment" %>

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
                                <div style="float: right; width: 200px">
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
                                    <div class="ui blue button" onclick="event.preventDefault();return LoadData()">Xem</div>
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
                    <div class="sixteen wide tablet sixteen wide computer column">
                        <div class="ui segments">
                            <div class="ui segment no-padding-bottom">
                                <h5 class="ui left floated header">hoa Hồng Điều Trị
                                </h5>
                                <h5 class="ui right floated header"></h5>
                                <div class="clearfix"></div>
                            </div>
                            <div class="ui segment left aligned">
                                <table class="ui very basic center aligned  celled table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">STT</th>
                                            <th style="text-align: center">Tên Nhân Viên</th>
                                            <th style="text-align: center">Bộ Phận</th>
                                            <th style="text-align: center">Doanh Thu</th>
                                            <th style="text-align: center">Tình Trạng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="dtContentTreatment">
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
        function LoadData() {
            var dateFrom = $('#dateFrom').val() ? $('#dateFrom').val() : new Date();
            var dateTo = $('#dateTo').val() ? $('#dateTo').val() : new Date();

            let branchID = Number($('#branch').dropdown('get value')) ? Number($('#branch').dropdown('get value')) : 0;
            GetRevenueTreatment("/Views/Report/Report/pageRevenueTreatment.aspx/LoadData", dateFrom, dateTo, branchID.toString(), function (data) {
                RenderReportRevenueTreatment(data, "dtContentTreatment");
            

            })
        }



    </script>


</asp:Content>
