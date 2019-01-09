<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageWareReview.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageWareReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">


                <div class="sixteen wide tablet ten wide computer column">
                    <div class="ui segments" style="background-color: white">
                        <form class="ui form segment form3" style="height: 65px">
                            <div class="ui segment" style="border: none; box-shadow: none;">
                                <div>
                                    <div style="float: left">
                                        <h3>Xem Hàng Tồn Kho</h3>
                                    </div>
                                    <div style="float: right">
                                        <div style="float: left; width: 200px" class="ui fluid search selection dropdown" id="wareHouseChoose" onchange="event.preventDefault();return onchangeWare()">
                                            <input type="hidden" name="wareHouseChoose" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Chọn Kho</div>
                                            <div id="cbbWareHouse" class="menu" tabindex="-1">
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </form>
                        <div class="ui segment" id="TableContentReviewWare">
                            <table id="dtContentReviewWare" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; display: none">ID</th>
                                        <th style="text-align: center; display: none">IDUnit</th>
                                        <th style="text-align: center; display: none">IDProduct</th>
                                        <th style="text-align: center; width: 25px;">STT</th>
                                        <th style="text-align: center">Vật Liệu</th>
                                        <th style="text-align: center">Tồn Trước</th>
                                        <th style="text-align: center">Mới Nhập</th>
                                        <th style="text-align: center">Đã Xuất</th>
                                        <th style="text-align: center">Còn Lại</th>
                                    </tr>
                                </thead>
                                <tbody id="dtContentReviewBody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var DataWare;
        $(document).ready(function () {
            DataWare = ([<%=_DataWare%>][0]);
            LoadCombo(DataWare, "cbbWareHouse");
        });
        function onchangeWare() {
            let wareID = Number($('#wareHouseChoose').dropdown('get value')) ? Number($('#wareHouseChoose').dropdown('get value')) : 0;
            GetDataReviewWareHouse("/Views/WareHouse/pageWareReview.aspx/LoadList", wareID, function (data) {
                RenderLockReview(data, "dtContentReviewBody");
                document.getElementById("dtContentReviewWare").className = "ui celled table";
            })
        }
    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
</asp:Content>
