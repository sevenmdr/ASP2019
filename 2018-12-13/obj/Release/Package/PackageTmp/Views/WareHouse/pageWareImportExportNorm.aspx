<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageWareImportExportNorm.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageWareImportExportNorm" %>

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
                                        <div style="float: left; width: 200px" class="ui fluid search selection dropdown" id="typeChoose" onchange="event.preventDefault();return onchangeType()">
                                            <input type="hidden" name="typeChoose" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Chọn Loại</div>
                                            <div id="cbbTypeChoose" class="menu" tabindex="-1">
                                            </div>
                                        </div>
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
                                        <th style="text-align: center">Nhập / Xuất / Tồn</th>
                                        <th style="text-align: center">Nhập / Xuất / Tồn DVC</th>
                                        <th style="text-align: center">Ngày</th>
                                        <th style="text-align: center">Loại</th>
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
        var DataType;
        var dataMain;
        var loadcombo;
        $(document).ready(function () {
            DataWare = ([<%=_DataWare%>][0]);
            DataType = ([<%=_DataType%>][0]);
            LoadCombo(DataWare, "cbbWareHouse");
            LoadCombo(DataType, "cbbTypeChoose");
            loadcombo = 0;
            dataMain = "";
        });
        function onchangeWare() {
            loadcombo = 1;
            $("#typeChoose").dropdown("set selected", 4);
            let wareID = Number($('#wareHouseChoose').dropdown('get value')) ? Number($('#wareHouseChoose').dropdown('get value')) : 0;
            GetDataWareHouseExImNor("/Views/WareHouse/pageWareImportExportNorm.aspx/LoadList", wareID, function (data) {
                dataMain = data;
                RenderImportExportNorm(dataMain, "dtContentReviewBody");
                document.getElementById("dtContentReviewWare").className = "ui celled table";
            });
            loadcombo = 0;
        }
        function onchangeType() {
            if (loadcombo == 0) {

                let typeID = Number($('#typeChoose').dropdown('get value')) ? Number($('#typeChoose').dropdown('get value')) : 0;
                if (dataMain != "") {
                    var _dataMain=dataMain;
                    if (typeID != "4") {
                         _dataMain = dataMain.filter(word => word["TYPE"] == typeID.toString());
                    }
                    RenderImportExportNorm(_dataMain, "dtContentReviewBody");
                    document.getElementById("dtContentReviewWare").className = "ui celled table";
                }
            }
        }

    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
</asp:Content>
