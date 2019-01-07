﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageInputList.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageInputList" %>


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
            $("#divDetailPopup").load("/Views/WareHouse/pageInputDetail.aspx");
            $('#divDetailPopup').modal('show');
            return false;
        }
    </script>
    <script src="/dist/semantic.min.js"></script>
    <script src="/js/comon/load_datasource.js"></script>


