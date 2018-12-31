<%@ Page Title="" Language="C#" MasterPageFile="~/Master/2_Master.Master" AutoEventWireup="true" CodeBehind="Searching.aspx.cs" Inherits="_2018_12_13.Views.Searching.Searching" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">
                <div class="sixteen wide tablet ten wide computer column">
                    <div class="ui segments" style="background-color: white">
                        <form class="ui form segment form3" id="form3">
                            <div class="ui segment" style="border: none;">
                                <div class="five fields" style="margin: 0px;">
                                    <div class="field">
                                    </div>
                                    <div class="field">
                                    </div>
                                    <div class="field">
                                    </div>
                                    <div class="field">
                                    </div>
                                    <div class="field">
                                        <input id="searchCustomerIDSeaching" type="text" placeholder="Search..." style="display: none">
                     
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="ui segment" id="TableContent">
                            <table id="dtContent" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">ID</th>
                                        <th style="text-align: center">STT</th>
                                        <th style="text-align: center">MSKH</th>
                                        <th style="text-align: center">Tên Khách Hàng</th>
                                        <th style="text-align: center">SĐT</th>
                                        <th style="text-align: center">Email</th>
                                        <th style="text-align: center">Địa Chỉ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">
        var divClone;
        var SeachingText;
        $(document).ready(function () {
            divClone = $("#TableContent").clone();
            SeachingText = ("<%=_SeachingText %>");
            $('#searchCustomerIDSeaching').val(SeachingText);
            //var input = document.getElementById("searchCustomerIDSeaching");
            //input.addEventListener("keyup", function (event) {
            //    event.preventDefault();
            //    if (event.keyCode === 13) {
            //        debugger
            //        SearchListCustomer();
            //    }
            //});
            SearchListCustomer();
        });
        function SearchListCustomer() {

            GetDataSourceSerchCustomer("/Views/Searching/Searching.aspx/LoadataDataCustomer", $('#searchCustomerIDSeaching').val(), function (data) {

                $('#dtContent').DataTable().destroy();
                $("#TableContent").replaceWith(divClone.clone());
                $('#dtContent').DataTable({
                    data: data,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": false, "targets": 0, "data": "CustomerID" },
                        { "visible": true, "targets": 1, "data": "STT", width: "50px", "className": "center" },
                        {
                            "visible": true, "targets": 2, "data": "CustCode", width: "120px", "className": "center", "render": function (data, type, row, meta) {
                                if (type === 'display') { data = '<a href="' + "/Views/Customer/MainCustomer.aspx?CustomerID=" + Number(data) + '">' + data + '</a>'; }

                                return data;
                            }
                        },
                        { "visible": true, "targets": 3, "data": "CustomerName", width: "200px", "className": "center" },
                        { "visible": true, "targets": 4, "data": "CustomerPhone", width: "150px" },
                        { "visible": true, "targets": 5, "data": "customerEmail", width: "150px" },
                        { "visible": true, "targets": 6, "data": "CustomerAddress" },
                    ],
                });
                document.getElementById("dtContent").className = "ui celled table";
            })
        }


    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

</asp:Content>
