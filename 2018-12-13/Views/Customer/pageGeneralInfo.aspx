<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageGeneralInfo.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageGeneralInfo" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>
    <div class="ui equal width left aligned padded grid stackable">
        <div class="row">
            <div class="sixteen wide tablet ten wide computer column">
                <div id="divCustomerInfo">
                    <div class="ui equal width left aligned padded grid stackable">
                        <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                    <div class="ui segment">
                                        <div class="ui two column middle aligned very relaxed stackable grid">
                                            <div class="column">
                                                <h5 class="ui header">Thông Tin Chung</h5>
                                            </div>
                                            <div class="ui vertical divider">
                                            </div>
                                            <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                                                <div class="ui buttons">
                                                    <button class="ui blue basic button modalfour" data-value="fade up" onclick="editCustomer(customerID)">Sửa Hồ Sơ</button>
                                                    <button class="ui green basic button modalfour" data-value="fade up" onclick="addNewHistoryNotComplaint(customerID)">Thêm Ghi Chú</button>
                                                    <button class="ui red basic button modalfour" data-value="fade up" onclick="addNewSMS(customerID)">Gửi SMS</button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
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
                                                    <a class="ui blue ribbon label">Đánh Giá Khách Hàng</a>
                                                    <table id="dtComplaintContent" class="ui celled padded table">
                                                        <thead>
                                                            <tr>
                                                                <th>Ngày</th>
                                                                <th>Rating</th>
                                                                <th>Nội Dung</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td class="single line">20-11-2018</td>
                                                                <td class="single line">
                                                                    <div class="ui star rating" data-rating="2" data-max-rating="3">
                                                                        <i class="icon active"></i>
                                                                        <i class="icon active"></i>
                                                                        <i class="icon active"></i>
                                                                    </div>
                                                                </td>
                                                                <td>Hài lòng với dịch vụ , đạt hiệu quả rất tốt sau một lần điều trị.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="ui raised segment">
                                                    <a class="ui teal ribbon label">Ghi Chú Khách Hàng</a>
                                                    <table id="dtNoteContent" class="ui celled padded table">
                                                        <thead>
                                                            <tr>
                                                                <th style="text-align: center; width: 25px;">STT</th>
                                                                <th style="text-align: center">Ngươi Tạo</th>
                                                                <th style="text-align: center">Nội Dung</th>
                                                                <th style="text-align: center">Ngày</th>
                                                                <th style="text-align: center">Loại</th>
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
            <div class="sixteen wide tablet six wide computer column">

                <div id="divCheckAppointment">
                    <div class="ui equal width left aligned padded grid stackable">
                        <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                    <div class="ui segment">
                                        <div class="ui two column middle aligned very relaxed stackable grid">
                                            <div class="column">
                                                <h5 class="ui header">Tình Trạng Lịch Hẹn</h5>
                                            </div>
                                            <div class="ui vertical divider">
                                            </div>
                                            <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                                                <div class="ui buttons">
                                                    
                                                    <button class="ui red basic button" data-value="fade up" onclick="changeBackAppointment()">Back</button>
                                                    <button class="ui green basic button" data-value="fade up" onclick="changeForwardAppointment()">Next</button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="ui segment">
                                        <div id="stepStatus" class="ui ordered steps">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="divPaymentInfo">
                    <div class="ui equal width left aligned padded grid stackable">
                        <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                    <div class="ui segment">
                                        <h5 class="ui header">Thông Tin Thanh Toán</h5>
                                    </div>
                                    <div class="ui segment">
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

                <div id="divAppointmentInfo">
                    <div class="ui equal width left aligned padded grid stackable">
                        <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                    <div class="ui segment">
                                        <div class="ui two column middle aligned very relaxed stackable grid">
                                            <div class="column">
                                                <h5 class="ui header">Lịch Hẹn Khách Hàng</h5>
                                            </div>
                                            <div class="ui vertical divider">
                                            </div>
                                            <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                                                <div class="ui buttons">
                                                    <button class="ui green basic button modalfour" data-value="fade up" onclick="newAppointment()">Tạo Lịch Hẹn</button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="ui segment">
                                        <div id="ScheduleList" class="ui feed timeline">
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
    <%--Call Event--%>
    <script type="text/javascript">
         var customerID = ("<%=CustomerID %>");
        $(document).ready(function () {
            LoadDataUpdate();
  
        });
       
        var idSchedule;
        var statusid;
        function changeForwardAppointment() {
            if (statusid < 3) {
                statusid = statusid + 1;
                ChangeStatus(idSchedule, statusid);
                switch (statusid) {
                        case 1:
                             RenStatusNotYet("stepStatus");
                            break
                        case 2:
                              RenStatusCheckIn("stepStatus");
                            break
                        case 3:
                             RenStatusCheckOUT("stepStatus");
                            break
                }
               
            }
           
        }
         function changeBackAppointment() {
            if (statusid > 1) {
                statusid = statusid - 1;
                ChangeStatus(idSchedule, statusid);
                switch (statusid) {
                        case 1:
                             RenStatusNotYet("stepStatus");
                            break
                        case 2:
                              RenStatusCheckIn("stepStatus");
                            break
                        case 3:
                             RenStatusCheckOUT("stepStatus");
                            break
                }
              
             }
             
        }

        function ChangeStatus(id, status) {
            var data = new Object();
            data.id = id;
            data.status = status;

            $.ajax({
                url: "/Views/Customer/pageGeneralInfo.aspx/ChangeStatus",
                dataType: "json",
                type: "POST",
                data: JSON.stringify({ 'data': JSON.stringify(data) }),
                contentType: 'application/json; charset=utf-8',
                async: true,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    notiError("Lỗi Hệ Thống");
                },
                success: function (result) {
                    if (result.d == "1") {
                        notiSuccess();
                        
                    } else {
                        notiError("Lỗi Đổi Trạng Thái");
                    }

                }
            });


            return false;
        }



        //function ChangeStatus() {

        //           }


        function LoadDataUpdate() {
            let dataMainCustomer = ([<%=dataMainCustomer%>][0])[0];
            let dataSchedule = ([<%=dataSchedule%>][0]);
            let dataHistory = ([<%=dataHistory%>][0]);

            if (dataMainCustomer) {
                $('#txtName').text(dataMainCustomer.Name);
                $('#txtPhone').text(dataMainCustomer.Phone1);
                $('#txtBirthday').text(dataMainCustomer.Birthday);
                $('#txtgender').text(dataMainCustomer.Gender);
                $('#txtAddress').text(dataMainCustomer.Address);
                $('#txtServiceTab').text(dataMainCustomer.TOTALPRICE);
                $('#txtPayment').text(dataMainCustomer.TOTALPAID);
                $('#txtRest').text(Number(dataMainCustomer.TOTALPRICE) - Number(dataMainCustomer.TOTALPAID));

                if (Number(dataMainCustomer.AppID) == 0) {
                    $('#divCheckAppointment').remove();
                }
                else {
                    idSchedule = Number(dataMainCustomer.AppID)
                    statusid=Number(dataMainCustomer.Status)
                    switch (Number(dataMainCustomer.Status)) {
                        case 1:
                             RenStatusNotYet("stepStatus");
                            break
                        case 2:
                              RenStatusCheckIn("stepStatus");
                            break
                        case 3:
                             RenStatusCheckOUT("stepStatus");
                            break
                    }
                }
            }
            if (dataHistory) {
                var table = $('#dtNoteContent').DataTable({
                    data: dataHistory,
                    info: false,
                    paging: false,
                    ordering: false,
                    searching: false,
                    destroy: true,
                    "columnDefs": [
                        { "visible": true, "targets": 0, "data": "STT", width: "50px", "className": "center" },
                        { "visible": true, "targets": 1, "data": "CreatedName", width: "120px", "className": "center" },
                        { "visible": true, "targets": 2, "data": "Content", width: "250px" },
                        { "visible": true, "targets": 3, "data": "CreatedString", width: "100px", "className": "center" },
                        { "visible": true, "targets": 4, "data": "TypeName", width: "150px" },
                    ],
                });
            }
            if (dataSchedule) {
                RenScheduleList(dataSchedule, "ScheduleList")
            }
        }
    </script>
    <script src="/dist/semantic.min.js"></script>
    <script src="/js/customjs/custom-modal.js"></script>


</body>

</html>
