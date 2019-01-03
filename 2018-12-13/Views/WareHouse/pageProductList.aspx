﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageProductList.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageProductList" %>

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
                                        <h3>Sản Phẩm</h3>
                                    </div>
                                    <div style="float: right">
                                        <button class="ui blue basic button" data-value="fade up" onclick="return AddNewProduct()">Thêm Mới</button>
                                    </div>
                                </div>


                            </div>
                        </form>
                        <div class="ui segment" style="float: left; width: 100%">
                            <table class="ui celled padded table" id="dtContent">
                                <thead>
                                    <tr>
                                        <th>Ngày</th>
                                        <th>Nội Dung</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="single line">20-11-2018</td>
                                        <td>Creatine supplementation is the reference compound for increasing muscular creatine levels; 
                                                        there is variability in this increase, however, with some nonresponders.
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {

            $('#dtContent').DataTable({
                info: false,
                paging: false,
                ordering: false,
                searching: false,
            });
        });
        function AddNewProduct() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/WareHouse/pageProductDetail.aspx");
            $('#divDetailPopup').modal('show');
            return false;
        }
    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>
</asp:Content>
