<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageWareHouseGeneral.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageWareHouseGeneral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



        <div class="pusher">
            <div class="navslide navwrap">
                <div class="row">
                    <div class="ui equal width left aligned padded grid stackable">
                        <div class="sixteen wide tablet two wide computer column">
                            <div class="ui vertical secondary pointing fluid tabular menu" id="divMenuItem">
                                <a class="item active" data-tab="warehouselist">Danh Sách Kho
                                </a>
                                <a class="item" data-tab="unicount">Đơn Vị Tính
                                </a>
                                <a class="item" data-tab="producttype">Loại Sản Phẩm
                                </a>
                                <a class="item" data-tab="productlist">Sản Phẩm
                                </a>
                                <a class="item" data-tab="setting">Cài Đặt Định Mức
                                </a>
                                <a class="item" data-tab="supplier">Nhà Cung Cấp
                                </a>
                            </div>
                        </div>
                        <div class="sixteen wide tablet fourteen wide computer column">

                            <div id="divMainPageWareHouse">
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $("#divMainPageWareHouse").load("/Views/WareHouse/pageWareHouseList.aspx");
            $('#divMenuItem a.item').on('click', function () {
                $(this)
                    .addClass('active')
                    .siblings()
                    .removeClass('active');
                var textTab = $("#divMenuItem a.active.item")[0].innerHTML;
                document.getElementById("divMainPageWareHouse").innerHTML = '';
                switch (textTab.trim()) {
                    case "Danh Sách Kho":
                        $("#divMainPageWareHouse").load("/Views/WareHouse/pageWareHouseList.aspx");
                        break;
                    case "Đơn Vị Tính":
                        $("#divMainPageWareHouse").load("/Views/WareHouse/pageUnitCountList.aspx");
                        break;
                    case "Loại Sản Phẩm":
                        $("#divMainPageWareHouse").load("/Views/WareHouse/pageProductTypeList.aspx");
                        break;
                    case "Sản Phẩm":
                        $("#divMainPageWareHouse").load("/Views/WareHouse/pageProductList.aspx");
                        break;
                    case "Cài Đặt Định Mức":
                        $("#divMainPageWareHouse").load("/Views/WareHouse/pageNormSettingList.aspx");
                        break;
                    case "Nhà Cung Cấp":
                        $("#divMainPageWareHouse").load("/Views/WareHouse/pageSupplierList.aspx");
                        break;

                    default: break;
                }
            });
        </script>

<%--        <script src="/dist/semantic.min.js"></script>
        <script src="/js/comon/load_datasource.js"></script>--%>
<%--        <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>
        <script src="/plugins/datatable/jquery.dataTables.js"></script>--%>


</asp:Content>
