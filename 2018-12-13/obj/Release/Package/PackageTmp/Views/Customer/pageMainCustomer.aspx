<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageMainCustomer.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageMainCustomer" %>

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
                                                <button class="ui blue basic button modalfour" data-value="fade up" onclick="editCustomer()">Sửa Hồ Sơ</button>
                                                <button class="ui green basic button modalfour" data-value="fade up" onclick="newHistory()">Thêm Ghi Chú</button>
                                                <button class="ui red basic button modalfour" data-value="fade up">Gửi SMS</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="ui segment">
                                    <a href="pageMainCustomer.aspx">pageMainCustomer.aspx</a>

                                    <div class="ui column grid">
                                        <div class="column">
                                            <div class="ui raised segment">
                                                <a class="ui red ribbon label">Hồ Sơ Khách Hàng</a>
                                                <div class="ui divided selection list">
                                                    <a class="item">Nguyễn Văn Test
                                                    </a>
                                                    <a class="item">0936944427
                                                    </a>
                                                    <a class="item">24-03-1990
                                                    </a>
                                                    <a class="item">Nam
                                                    </a>
                                                    <a class="item">26 B3 Tây Thạnh, Tân Phú, TP HCM
                                                    </a>
                                                </div>

                                            </div>
                                            <div class="ui raised segment">
                                                <a class="ui blue ribbon label">Đánh Giá Khách Hàng</a>
                                                <table class="ui celled padded table">
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
                                                            <td>Creatine supplementation is the reference compound for increasing muscular creatine levels; 
                                                        there is variability in this increase, however, with some nonresponders.
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="single line">20-11-2018</td>
                                                            <td class="single line">
                                                                <div class="ui star rating" data-rating="1" data-max-rating="3">
                                                                    <i class="icon active"></i>
                                                                    <i class="icon active"></i>
                                                                    <i class="icon active"></i>
                                                                </div>
                                                            </td>
                                                            <td>Creatine supplementation is the reference compound for increasing muscular creatine levels; 
                                                        there is variability in this increase, however, with some nonresponders.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="ui raised segment">
                                                <a class="ui teal ribbon label">Ghi Chú Khách Hàng</a>
                                                <table class="ui celled padded table">
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
                                    </div>

                                </div>
                                <div class="ui segment">
                                    <div id="radios">
                                        <input id="option1" name="options" type="radio">
                                        <label for="option1" style="font-size: 14px">None</label>
                                        <input id="option2" name="options" type="radio">
                                        <label for="option2" style="font-size: 14px">In</label>
                                        <input id="option3" name="options" type="radio" checked>
                                        <label for="option3" style="font-size: 14px">Out</label>
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
                                        <div style="font-size: 15px">70.000.000</div>
                                    </a>
                                    <a class="ui red tag label">
                                        <div>Đã Thanh Toán</div>
                                        <div>&nbsp</div>
                                        <div style="font-size: 15px">40.000.000</div>
                                    </a>
                                    <a class="ui teal tag label">
                                        <div>Còn Nợ</div>
                                        <div>&nbsp</div>
                                        <div style="font-size: 15px">30.000.000</div>
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
                                    <div class="ui feed timeline">
                                        <div class="event">
                                            <div class="label">
                                                <img src="/img/ButtonImg/location.png" alt="label-image" />
                                            </div>
                                            <div class="content">
                                                <div class="summary">
                                                    <a class="ui pointing red basic label">Checked Out</a>
                                                </div>
                                                <div class="summary">
                                                    <a class="ui tag label">15-10-2018</a>
                                                    <a class="ui tag label">20:10</a>
                                                    <a class="ui tag label">Chi Nhánh Jarim CMT8</a>
                                                    <a class="ui label">Chúng tôi xin trích nguyên văn thư chia tay của ông Bae gửi tới các tuyển thủ Việt Nam</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="event">
                                            <div class="label">
                                                <img src="/img/ButtonImg/location.png" alt="label-image" />
                                            </div>
                                            <div class="content">
                                                <div class="summary">
                                                    <a class="ui blue basic label">Checked In</a>
                                                    <div class="summary">
                                                        <a class="ui tag label">15-10-2018</a>
                                                        <a class="ui tag label">20:10</a>
                                                        <a class="ui tag label">Chi Nhánh Jarim CMT8</a>
                                                        <a class="ui label">Chúng tôi xin trích nguyên văn thư chia tay của ông Bae gửi tới các tuyển thủ Việt Nam</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="event">
                                            <div class="label">
                                                <img src="/img/ButtonImg/location.png" alt="label-image" />
                                            </div>
                                            <div class="content">
                                                <div class="summary">
                                                    <a class="ui basic label">Not Yet</a>
                                                    <div class="summary">
                                                        <a class="ui tag label">15-10-2018</a>
                                                        <a class="ui tag label">20:10</a>
                                                        <a class="ui tag label">Chi Nhánh Jarim CMT8</a>
                                                        <a class="ui label">Chúng tôi xin trích nguyên văn thư chia tay của ông Bae gửi tới các tuyển thủ Việt Nam</a>
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

<script type="text/javascript">
    $(document).ready(function () {
        $("#radios").radiosToSlider();
    });
    //Addnew
    function newAppointment() {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Appointment/pageAppointmentDetail.aspx");
    }
    function editCustomer() {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pageCustomerDetail.aspx");
    }
    function addNewHistory() {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pageHistoryDetail.aspx");
    }
    function addNewStatus() {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pageStatusDetail.aspx");
    }
        function addNewTab() {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pageTabDetail.aspx");
    }
        function addNewHistory() {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pageHistoryDetail.aspx");
    }
        function addNewTreatment() {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pageTreatmentDetail.aspx");
    }
         function addNewPayment() {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pagePaymentDetail.aspx");
    }


    //Edit

    function editStatus(id) {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pageStatusDetail.aspx?id="+id);
        $('#divDetailPopup').modal('show');
  
    }
        function editHistory(id) {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pageHistoryDetail.aspx?id="+id);
        $('#divDetailPopup').modal('show');
    }
            function editTab(id) {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pageTabDetail.aspx?id="+id);
        $('#divDetailPopup').modal('show');
    }
         function editTreatment(id) {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pageTreatmentDetail.aspx?id="+id);
        $('#divDetailPopup').modal('show');
    }
             function editPayment(id) {
        document.getElementById("divDetailPopup").innerHTML = '';
        $("#divDetailPopup").load("/Views/Customer/pagePaymentDetail.aspx?id="+id);
        $('#divDetailPopup').modal('show');
    }
     function deleteStatus() {
   
    }
</script>
<script src="/dist/semantic.min.js"></script>
<script src="/js/customjs/custom-modal.js"></script>

