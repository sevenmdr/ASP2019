<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageCustomerCareList.aspx.cs" Inherits="_2018_12_13.Views.CustomerCare.pageCustomerCareList" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="pusher">
        <div class="navslide navwrap">
            <div class="ui equal width left aligned padded grid stackable">
                <div class="row">
                    <div class="sixteen wide tablet six wide computer column">
                        <div id="divCustomerInfo">
                            <div class="ui equal width left aligned padded grid stackable">
                                <div class="row">
                                    <div class="sixteen wide column">
                                        <div class="ui segments">
                                            <div class="ui segment">
                                                <div class="ui column grid">
                                                    <div class="column">
                                                        <div class="ui raised segment">
                                                            <a class="ui red ribbon label">Hồ Sơ Khách Hàng</a>
                                                            <div class="ui divided selection list">
                                                                <a id="txtName" class="item">Nguyễn Văn Test
                                                                </a>
                                                                <a id="txtPhone" class="item">0936944427
                                                                </a>
                                                                <a id="txtBirthday" class="item">24-03-1990
                                                                </a>
                                                                <a id="txtgender" class="item">Nam
                                                                </a>
                                                                <a id="txtAddress" class="item"></a>
                                                            </div>

                                                        </div>
                                                        <div class="ui raised segment">
                                                            <a class="ui blue ribbon label">Thông Tin Thanh Toán</a>
                                                            <div id="divPaymentInfo">
                                                                <div class="ui equal width left aligned padded grid stackable">
                                                                    <div class="row">
                                                                        <div class="sixteen wide column">

                                                                            <a class="ui tag label">
                                                                                <div>Tổng Tiền</div>
                                                                                <div>&nbsp</div>
                                                                                <div style="font-size: 15px" id="txtServiceTab">70.000.000</div>
                                                                            </a>
                                                                            <a class="ui red tag label">
                                                                                <div>Đã Thanh Toán</div>
                                                                                <div>&nbsp</div>
                                                                                <div style="font-size: 15px" id="txtPayment">40.000.000</div>
                                                                            </a>
                                                                            <a class="ui teal tag label">
                                                                                <div>Còn Nợ</div>
                                                                                <div>&nbsp</div>
                                                                                <div style="font-size: 15px" id="txtRest">30.000.000</div>
                                                                            </a>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="ui raised segment">
                                                            <a class="ui teal ribbon label">Thông Tin Dịch Vụ</a>
                                                            <table id="TableService" class="ui celled padded table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>STT</th>
                                                                        <th>Ngày</th>
                                                                        <th>Dịch Vụ</th>
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
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="sixteen wide tablet ten wide computer column">
                        <div id="divCheckAppointment">
                            <div class="ui equal width left aligned padded grid stackable">
                                <div class="row">
                                    <div class="sixteen wide column">
                                        <div class="ui segments">
                                            <div class="ui segment">
                                                <div class="ui two column middle aligned very relaxed stackable grid" >
                                                    <div class="column">
                                                        <div class="ui fluid search selection dropdown" id="typeCare" onchange="LoadCustomerCareAjax()">
                                                            <input type="hidden" name="customerCareType" />
                                                            <input class="search" autocomplete="off" tabindex="0" />
                                                            <div class="default text">Tình Trạng</div>
                                                            <div id="cbbcustomerCareType" class="menu" tabindex="-1">
                                                                <div class="item" data-value="1">Nhắc Hẹn</div>
                                                                <div class="item" data-value="2">Đến Không Làm Dịch Vụ</div>
                                                                <div class="item" data-value="3">HoliDay</div>
                                                                <div class="item" data-value="4">Đặt Hẹn KHông Đến</div>
                                                                <div class="item" data-value="5">Chăm Sóc Sau Dịch Vụ</div>
                                                                <div class="item" data-value="6">Tất Cả</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ui vertical divider">
                                                    </div>
                                                    <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                                                        <div class="ui buttons">
                                                            <button class="ui blue basic button modalfour" data-value="fade up" onclick="callTakeCare()">Call Chăm Sóc</button>
                                                            <button class="ui green basic button modalfour" data-value="fade up" onclick="smsTakeCare()">SMS Chăm Sóc</button>
                                                            <button class="ui red basic button modalfour" data-value="fade up" onclick="makeAppointment()">Đặt Lịch</button>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                            <div class="ui segment">
                                                <table id="TableListCare" class="ui celled padded table">
                                                    <thead>
                                                        <tr>
                                                            <th>STT</th>
                                                            <th>Ngày</th>
                                                            <th>Nội Dung</th>
                                                            <th>Nhân Viên </th>
                                                            <th>Loại</th>
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
                    </div>
                </div>
            </div>
        </div>
    </div>

   <%-- <div class="ui small test modal" id="divDetailPopup"></div>--%>
    <script type="text/javascript">
              var dataMainCustomerCare;
        var DataMain;
        var dataMainCustomerService;
        var TypeCare;
        var AppID;
        var MasterID;

        TypeCare = (<%=Type_Care%>);
        CustomerID = (<%=CustomerID%>);
        AppID = (<%=AppID%>);
        MasterID=(<%=MasterID%>);
        DataMain = ([<%=DataMain%>][0]);
        dataMainCustomerCare = DataMain["Table"];
        dataMainCustomerService = DataMain["Table1"];

        $(document).ready(function () {
            LoadDataUpdate();
           // LoadCustomerCareAjax();
           // alert(CustomerIDCare);
        });
        function callTakeCare() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/CustomerCare/pageCallDetail.aspx?CustomerID=" + CustomerID + "&Type=" + TypeCare+ "&AppID=" + AppID+ "&MasterID=" + MasterID);
        }
        function smsTakeCare() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/SMS/pageSmsDetail.aspx?CustomerID="  + CustomerID + "&Type=" + TypeCare+ "&AppID=" + AppID+ "&MasterID=" + MasterID);
        }
        function makeAppointment() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Appointment/pageAppointmentDetail.aspx?CustomerID=" + CustomerID);
        }
        function LoadDataUpdate() {
            $("#typeCare").dropdown("set selected", TypeCare);
            if (dataMainCustomerCare[0]) {
                $('#txtName').text((dataMainCustomerCare[0].Name));
                $('#txtPhone').text((dataMainCustomerCare[0].Phone1));
                $('#txtBirthday').text((dataMainCustomerCare[0].Birthday));
                $('#txtgender').text((dataMainCustomerCare[0].Gender));
                $('#txtAddress').text((dataMainCustomerCare[0].Address));
                $('#txtServiceTab').text((dataMainCustomerCare[0].ServiceAmount));
                $('#txtPayment').text((dataMainCustomerCare[0].Payment));
                $('#txtRest').text(Number(dataMainCustomerCare[0].Balance));
            }
            if (dataMainCustomerService) {
                
                var table = $('#TableService').DataTable({
                    data: dataMainCustomerService,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": true, "targets": 0, "data": "STT", width: "50px", "className": "center" },
                        { "visible": true, "targets": 1, "data": "CreatedString", width: "130px", "className": "center" },
                        { "visible": true, "targets": 2, "data": "ServiceName" },
                    ],
                });
            }
        }

        function LoadCustomerCareAjax() {
            GetDataSourceCustomerCare("/Views/CustomerCare/pageCustomerCareList.aspx/LoadataCustomerCareList", Number($('#typeCare').dropdown('get value')) ? Number($('#typeCare').dropdown('get value')) : 6, function (data) {
                var table = $('#TableListCare').DataTable({
                    data: data,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": true, "targets": 0, "data": "STT", width: "50px", "className": "center" },
                        { "visible": true, "targets": 1, "data": "CreatedString", width: "100px", "className": "center" },
                        { "visible": true, "targets": 2, "data": "Content", width: "150px" },
                        { "visible": true, "targets": 3, "data": "EmpName", width: "150px" },
                        { "visible": true, "targets": 4, "data": "Type", width: "150px" },
                    ],
                });
            });
        }


    </script>
    <script src="/dist/semantic.min.js"></script>
    <script src="/js/customjs/custom-modal.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>

</asp:Content>
