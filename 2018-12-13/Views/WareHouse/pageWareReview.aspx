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
                                    <div style="float: right">
                                        <div style="float: left; width: 200px" class="ui fluid search selection dropdown" id="TypeProduct" onchange="event.preventDefault();return onchangeType()">
                                            <input type="hidden" name="wareHouseChoose" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Loại Sản Phẩm</div>
                                            <div id="cbbTypeProduct" class="menu" tabindex="-1">
                                            </div>
                                        </div>
                                    </div>
                                    <div style="float: right">
                                        <div style="float: left; width: 200px" class="ui fluid search selection dropdown" id="Norm" onchange="event.preventDefault();return onchangeNorm()">
                                            <input type="hidden" name="wareHouseChoose" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Định Mức Tồn</div>
                                            <div id="cbbNorm" class="menu" tabindex="-1">
                                                <div class="item" data-value="N0">Tất Cả</div>
                                                <div class="item" data-value="N1">Định Mức 1</div>
                                                <div class="item" data-value="N2">Định Mức 2</div>
                                                <div class="item" data-value="N3">Định Mức 3</div>
                                                <div class="item" data-value="N4">Bình Thường</div>

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
        var DataComboTypeProduct;
        var dataMain;
        var loadcombo;
        $(document).ready(function () {
            DataWare = ([<%=_DataWare%>][0]);
            DataComboTypeProduct = ([<%=_DataComboTypeProduct%>][0]);
            LoadCombo(DataWare, "cbbWareHouse");
            LoadCombo(DataComboTypeProduct, "cbbTypeProduct");


        });
        function onchangeWare() {
            loadcombo = 1;
            $("#Norm").dropdown("set selected", "N0");
            $("#TypeProduct").dropdown("set selected", 0);
            let wareID = Number($('#wareHouseChoose').dropdown('get value')) ? Number($('#wareHouseChoose').dropdown('get value')) : 0;
            GetDataReviewWareHouse("/Views/WareHouse/pageWareReview.aspx/LoadList", wareID, function (data) {
                dataMain = data;
                RenderLockReview(dataMain, "dtContentReviewBody");
                document.getElementById("dtContentReviewWare").className = "ui celled table";
            })
            loadcombo = 0;
        }
        function onchangeType() {
            if (loadcombo == 0) {

                let typeID = Number($('#TypeProduct').dropdown('get value')) ? Number($('#TypeProduct').dropdown('get value')) : 0;
                if (dataMain != "") {
                    var _dataMain = dataMain;
                    if (typeID != "0") {
                        _dataMain = dataMain.filter(word => word["ProductTypeID"] == typeID.toString());
                    }
                    RenderLockReview(_dataMain, "dtContentReviewBody");
                    document.getElementById("dtContentReviewWare").className = "ui celled table";
                }
            }
        }
        function onchangeNorm() {
            if (loadcombo == 0) {
                debugger
                let NormID = $('#Norm').dropdown('get value') ? $('#Norm').dropdown('get value') : "N4";
                if (dataMain != "") {
                    var _dataMain = dataMain;
                    if (NormID != "N0") {
                        _dataMain = dataMain.filter(word => word["Type"] == NormID.toString());
                    }
                    RenderLockReview(_dataMain, "dtContentReviewBody");
                    document.getElementById("dtContentReviewWare").className = "ui celled table";
                }
            }
        }
    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
</asp:Content>
