<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageDiscountList.aspx.cs" Inherits="_2018_12_13.Views.Discount.pageDiscountList" %>

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
                                        <h3>Tiền Chi Chi Nhánh</h3>
                                    </div>
                                    <div style="float: right">
                                        <button class="ui blue basic button modalfour" data-value="fade up" onclick="addNewHistory()">Thêm Mới</button>
                                    </div>
                                    <div style="float: right">
                                        <input class="flatpickr" type="text" placeholder="Đến Ngày.." />
                                    </div>
                                    <div style="float: right">
                                        <input class="flatpickr" type="text" placeholder="Từ Ngày.." />
                                    </div>
                                    
                                </div>


                            </div>
                        </form>
                        <div class="ui segment" style="float: left;">
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
                                    <tr>
                                        <td class="single line">20-11-2018</td>
                                        <td>Creatine supplementation is the reference compound for increasing muscular creatine levels; 
                                                        there is variability in this increase, however, with some nonresponders.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="single line">20-11-2018</td>
                                        <td>Creatine supplementation is the reference compound for increasing muscular creatine levels; 
                                                        there is variability in this increase, however, with some nonresponders.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="single line">20-11-2018</td>
                                        <td>Creatine supplementation is the reference compound for increasing muscular creatine levels; 
                                                        there is variability in this increase, however, with some nonresponders.
                                        </td>
                                    </tr>
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
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
    
            $('#dtContent').DataTable({
                info: false,
                paging: false,
                ordering: false,
                searching: true,
            });
        });

    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/customjs/custom-datatable.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
   
</asp:Content>
