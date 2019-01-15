<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageTicketAction.aspx.cs" Inherits="_2018_12_13.Views.Marketing.pageTicketAction" %>



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
                                                   <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                                                <div class="ui buttons">
                                                    <button class="ui blue basic button modalfour" data-value="fade up" onclick="EditTicket()">Sửa Hồ Sơ</button>
                                                </div>
                                            </div>
                                                <div class="ui column grid">
                                                    <div class="column">
                                                        <div class="ui raised segment">
                                                            <a class="ui red ribbon label">Hồ Sơ Khách Hàng</a>
                                                            <div class="ui divided selection list">
                                                                <a id="txtName" class="item">Nguyễn Văn Test
                                                                </a>
                                                                <a id="txtPhone" class="item">0936944427
                                                                </a>
                                                                <a id="txtSource" class="item">Facebook
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
                                                        <div class="ui fluid search selection dropdown" id="typeCare" onchange="LoadTickedValueAjax()">
                                                            <input type="hidden" name="customerCareType" />
                                                            <input class="search" autocomplete="off" tabindex="0" />
                                                            <div class="default text">Tình Trạng</div>
                                                            <div id="cbbcustomerCareType" class="menu" tabindex="-1">
                                                                <div class="item" data-value="2">Ghi Chú</div>
                                                                <div class="item" data-value="1">Chăm Sóc</div>
                                                                <div class="item" data-value="0">Tele</div>
                                                                <div class="item" data-value="3">Tất Cả</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ui vertical divider">
                                                    </div>
                                                    <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                                                        <div class="ui buttons">
                                                            <button class="ui yellow basic button modalfour" id="btnNewCustomer" data-value="fade up" onclick="NewCustomer()">Tạo Khách Hàng</button>
                                                            <button class="ui blue basic button modalfour" data-value="fade up" onclick="callTakeCare()">Call Chăm Sóc</button>
                                                            <button class="ui green basic button modalfour" data-value="fade up" onclick="smsTakeCare()">SMS Chăm Sóc</button>
                                                            <button class="ui red basic button modalfour" id="btnNewApp" data-value="fade up" onclick="makeAppointment()">Đặt Lịch</button>
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
        var CustomerID;
        var TicketID;

      

        $(document).ready(function () {
            
                  $("#typeCare").dropdown("refresh");
                $("#typeCare").dropdown("set selected", 3);
            LoadDataUpdate();
            DisableNewCustomer();
          //  LoadTickedValueAjax();
        });
                function EditTicket() {
            document.getElementById("divDetailPopup").innerHTML = '';
                    $("#divDetailPopup").load("/Views/Marketing/pageTicketDetail.aspx?CurrentID=" + TicketID);
                    
        }
        function callTakeCare() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Marketing/pageCallDetailInput.aspx?TicketID=" + TicketID);
        }
        function smsTakeCare() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/SMS/pageSmsDetail.aspx?CustomerID="  + CustomerID + "&TicketID=" + TicketID);
        }
        function makeAppointment() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Appointment/pageAppointmentDetail.aspx?CustomerID=" + CustomerID+ "&TicketID=" + TicketID);
        }
        function LoadDataUpdate() {

              CustomerID = (<%=_CustomerID%>);
        TicketID = (<%=_TicketID%>);
            let DataMain = ([<%=_DataMain%>][0]);
            if (DataMain) {
                  $('#txtName').text((DataMain[0].Name));
                $('#txtPhone').text((DataMain[0].Phone));
                $('#txtSource').text((DataMain[0].Source));
                $('#txtgender').text((DataMain[0].Gender));
                $('#txtAddress').text((DataMain[0].Address));
                $('#txtServiceTab').text((DataMain[0].ServiceAmount));
                $('#txtPayment').text((DataMain[0].Payment));
                $('#txtRest').text(Number(DataMain[0].Balance)); 
            }
        }
        function NewCustomer() {

                $.ajax({
                    url: "/Views/Marketing/pageTicketAction.aspx/AddnewCustomer",
                    type: "POST",
                    dataType: "json",
                    data:JSON.stringify({ 'TicketID':  TicketID }) ,
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError();
                    },
                    success: function (result) {
                        if (result.d != "1") {
                            notiSuccess();
                            CustomerID = result.d;
                            LoadTickedValueAjax();
                            DisableNewCustomer();
                        } else {
                            notiError();
                        }
                    }
                });
            
            return false;
        }
        function DisableNewCustomer() {
            debugger
            if (CustomerID && Number(CustomerID) != 0) {
                $('#btnNewCustomer').addClass("disabled");
                 $('#btnNewApp').removeClass("disabled");
            }
            else {
                $('#btnNewCustomer').removeClass("disabled");
                $('#btnNewApp').addClass("disabled");
            }
        }

        function LoadTickedValueAjax() {
         
            LoadDatasourceticket("/Views/Marketing/pageTicketAction.aspx/LoadataCustomerCareList", function (data) {

                debugger
                let _DataList;
               
                if ($('#typeCare').dropdown('get value') && $('#typeCare').dropdown('get value') != "3") {
                    _DataList = data.filter(word => word["TYPE"] == $('#typeCare').dropdown('get value'));
                }
                else {
                     _DataList=data
                }
                var table = $('#TableListCare').DataTable({
                    data: _DataList,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": true, "targets": 0, "data": "STT", width: "50px", "className": "center" },
                        { "visible": true, "targets": 1, "data": "CreatedString", width: "180px", "className": "center" },
                        { "visible": true, "targets": 2, "data": "Content"},
                        { "visible": true, "targets": 3, "data": "Emp", width: "200px" },
                    ],
                });
            });
        }


    </script>
    <script src="/dist/semantic.min.js"></script>
    <script src="/js/customjs/custom-modal.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>

</asp:Content>
