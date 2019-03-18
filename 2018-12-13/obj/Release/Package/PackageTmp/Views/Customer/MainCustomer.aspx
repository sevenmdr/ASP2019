<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="MainCustomer.aspx.cs" Inherits="_2018_12_13.Views.Customer.MainCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pusher">
        <!--navbar-->
        <div class="navslide navwrap">
            <div class="ui equal width left aligned padded grid stackable">
                <div class="sixteen wide tablet sixteen wide computer column profileheader row no-padding">
                    <div class="column  left floated">
                        <div class="ui items">
                            <div class="item">
                                <a class="ui small circular image">
                                    <img id="avatarCustomerLabel" src="#" alt="label-image" style="width: 100px !important;">
                                    <i class="circle mini red icon avt" data-content="Offline" data-variation="inverted redli"></i></a>&nbsp;<div class="middle aligned content hiddenui">
                                        <div class="header">
                                            <i class="asterisk teal loading icon"></i>
                                            <div id="txtNameMain"></div>
                                        </div>
                                        <div class="meta">
                                            <button id="buttonfacebook" class="ui circular facebook icon button" onclick="event.preventDefault();onclickfacebookicon()">
                                                <i class="facebook icon">/</i>
                                            </button>
                                            <button id="buttoninstagram" class="ui circular instagram icon button" onclick="event.preventDefault();onclickinstgramicon()">
                                                <i class="instagram icon"></i>
                                            </button>
                                            <a>&nbsp&nbsp</a><div id="txtPhoneMain"></div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ui pointing menu">
                <a class="active item">Thông Tin Hồ Sơ</a>
                <a class="item">Tư Vấn</a>
                 <a class="item">Tư Vấn Nha Khoa</a>
                <a class="item">Dịch Vụ</a>
                <a class="item">Thanh Toán</a>
                <a class="item">Điều Trị</a>
                <a class="item">Hình Ảnh</a>
                <a class="item">Lịch Sử</a>
                <a class="item">Lịch Hẹn</a>
                <div class="right menu">
                    <a class="item" id="totalMoneyCustomerRaise">
                        <div class="ui mini statistic">
                            <div id="totalmoneyRaise" class="value" style="font-size: 13px!important;">
                                1.6k
                            </div>
                            <div style="font-size: 4px;">
                                &nbsp;
                            </div>
                            <div style="background-color: green; font-size: 2px;">
                                &nbsp;
                            </div>
                            <div style="font-size: 4px;">
                                &nbsp;
                            </div>
                            <div class="label" style="font-size: 10px; color: darkslategrey">
                                Phát Sinh
                            </div>
                        </div>
                    </a>
                    <a class="item" id="totalMoneyCustomerPaid">
                        <div class="ui mini statistic">
                            <div id="totalmoneyPaid" class="value" style="font-size: 13px!important;">
                                102
                            </div>
                            <div style="font-size: 4px;">
                                &nbsp;
                            </div>
                            <div style="background-color: green; font-size: 2px;">
                                &nbsp;
                            </div>
                            <div style="font-size: 4px;">
                                &nbsp;
                            </div>
                            <div class="label" style="font-size: 10px; color: blue">
                                Đã Thanh Toán
                            </div>
                        </div>
                    </a>
                    <a class="item" id="totalMoneyCustomerLeft">
                        <div class="ui mini statistic">
                            <div id="totalmoneyLeft" class="value" style="font-size: 13px!important;">
                                206
                            </div>
                            <div style="font-size: 4px;">
                                &nbsp;
                            </div>
                            <div style="background-color: green; font-size: 2px;">
                                &nbsp;
                            </div>
                            <div style="font-size: 4px;">
                                &nbsp;
                            </div>
                            <div class="label" style="font-size: 10px; color: red">
                                Còn Lại
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div id="divMainPage">
            </div>

        </div>
    </div>


    <script>
        var facebookurl;
        var instgramurl; var totalmoneyRaise; var totalmoneyPaid; var totalmoneyLeft;
        $(document).ready(function () {
            document.getElementById("totalMoneyCustomerRaise").style.display = "none";
            document.getElementById("totalMoneyCustomerPaid").style.display = "none";
            document.getElementById("totalMoneyCustomerLeft").style.display = "none";

            let avatarCustomer = "<%=Avatar.ToString() %>";
            let avatarDefault = "<%=defaultAvatar %>";
            facebookurl = "<%=facebookurl.ToString() %>";
            instgramurl = "<%=instgramurl.ToString() %>";
            totalmoneyRaise = "<%=totalmoneyRaise.ToString() %>";
            totalmoneyPaid = "<%=totalmoneyPaid.ToString() %>";
            totalmoneyLeft = "<%=totalmoneyLeft.ToString() %>";
            document.getElementById("totalmoneyRaise").innerHTML = "<%=totalmoneyRaise.ToString() %>"
            document.getElementById("totalmoneyPaid").innerHTML = "<%=totalmoneyPaid.ToString() %>"
            document.getElementById("totalmoneyLeft").innerHTML = "<%=totalmoneyLeft.ToString() %>"

            document.getElementById("txtNameMain").innerHTML = "<%=CustName.ToString() %>" + "(" + "<%=CustCode.ToString() %>" + ")";
            document.getElementById("txtPhoneMain").innerHTML = "<%=Phone.ToString() %>"
            document.getElementById("divMainPage").innerHTML = '';
            if (avatarCustomer == '' || avatarCustomer == undefined) {
                $('#avatarCustomerLabel').attr('src', 'data:image/png;base64, ' + avatarDefault);
            }
            else {
                $('#avatarCustomerLabel').attr('src', 'data:image/png;base64, ' + avatarCustomer);
            }

            $("#divMainPage").load("/Views/Customer/pageGeneralInfo.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));

            if (facebookurl == '') $("#buttonfacebook").hide()
            else $("#buttonfacebook").show()
            if (instgramurl == '') $("#buttoninstagram").hide()
            else $("#buttoninstagram").show();

        });

        $('.ui.menu a.item').on('click', function () {
            $(this)
                .addClass('active')
                .siblings()
                .removeClass('active');
            document.getElementById("divMainPage").innerHTML = '';
            var textTab = document.querySelector(".ui.pointing.menu .active.item").innerHTML;
            switch (textTab) {
                case "Thông Tin Hồ Sơ":
                    document.getElementById("totalMoneyCustomerRaise").style.display = "none";
                    document.getElementById("totalMoneyCustomerPaid").style.display = "none";
                    document.getElementById("totalMoneyCustomerLeft").style.display = "none";
                    $("#divMainPage").load("/Views/Customer/pageGeneralInfo.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Tư Vấn":
                    document.getElementById("totalMoneyCustomerRaise").style.display = "block";
                    document.getElementById("totalMoneyCustomerPaid").style.display = "block";
                    document.getElementById("totalMoneyCustomerLeft").style.display = "block";
                    $("#divMainPage").load("/Views/Customer/pageStatusList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                  case "Tư Vấn Nha Khoa":
                    document.getElementById("totalMoneyCustomerRaise").style.display = "block";
                    document.getElementById("totalMoneyCustomerPaid").style.display = "block";
                    document.getElementById("totalMoneyCustomerLeft").style.display = "block";
                    $("#divMainPage").load("/Views/Customer/pageStatusListDental.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Lịch Sử":
                    document.getElementById("totalMoneyCustomerRaise").style.display = "block";
                    document.getElementById("totalMoneyCustomerPaid").style.display = "block";
                    document.getElementById("totalMoneyCustomerLeft").style.display = "block";
                    $("#divMainPage").load("/Views/Customer/pageHistoryList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Lịch Hẹn":
                    document.getElementById("totalMoneyCustomerRaise").style.display = "block";
                    document.getElementById("totalMoneyCustomerPaid").style.display = "block";
                    document.getElementById("totalMoneyCustomerLeft").style.display = "block";
                    $("#divMainPage").load("/Views/Customer/pageScheduleList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Dịch Vụ":
                    document.getElementById("totalMoneyCustomerRaise").style.display = "block";
                    document.getElementById("totalMoneyCustomerPaid").style.display = "block";
                    document.getElementById("totalMoneyCustomerLeft").style.display = "block";
                    $("#divMainPage").load("/Views/Customer/pageTabList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Thanh Toán":
                    document.getElementById("totalMoneyCustomerRaise").style.display = "block";
                    document.getElementById("totalMoneyCustomerPaid").style.display = "block";
                    document.getElementById("totalMoneyCustomerLeft").style.display = "block";
                    $("#divMainPage").load("/Views/Customer/pagePaymentList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Điều Trị":
                    document.getElementById("totalMoneyCustomerRaise").style.display = "block";
                    document.getElementById("totalMoneyCustomerPaid").style.display = "block";
                    document.getElementById("totalMoneyCustomerLeft").style.display = "block";
                    $("#divMainPage").load("/Views/Customer/pageTreatmentList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Hình Ảnh":
                    document.getElementById("totalMoneyCustomerRaise").style.display = "block";
                    document.getElementById("totalMoneyCustomerPaid").style.display = "block";
                    document.getElementById("totalMoneyCustomerLeft").style.display = "block";
                    $("#divMainPage").load("/Views/Customer/pageCustomerImage.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
            }
        })
        
        // Status //////////////
        function addNewStatus(customerID) {

            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageStatusDetail.aspx?CustomerID=" + customerID);
        }
        function editStatus(id, customerid) {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageStatusDetail.aspx?CurrentID=" + id + "&CustomerID=" + customerid);
            $('#divDetailPopup').modal('show');

        }
        ///////////////////
                // Status Nha khoa //////////////
        function addNewStatus(customerID) {

            document.getElementById("divDetailPopupLarge").innerHTML = '';
            $("#divDetailPopupLarge").load("/Views/Customer/pageStatusDetailDental.aspx?CustomerID=" + customerID);
        }
        function editStatus(id, customerid) {
            document.getElementById("divDetailPopupLarge").innerHTML = '';
            $("#divDetailPopupLarge").load("/Views/Customer/pageStatusDetailDental.aspx?CurrentID=" + id + "&CustomerID=" + customerid);
            $('#divDetailPopupLarge').modal('show');

        }
        ///////////////////

        // Image 
        function createFolder() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageImageNewFolder.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
        }
        function ShowImageDetail(url) {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageImageDetail.aspx?urlImage=" + url);
            $('#divDetailPopup').modal('show');
        }

        //////////////////

        // Tab //////////////
        function addNewTab(customerID) {

            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageTabDetail.aspx?CustomerID=" + customerID);
        }
        function editTab(id, customerid) {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageTabDetail.aspx?CurrentID=" + id + "&CustomerID=" + customerid);
            $('#divDetailPopup').modal('show');

        }
        ///////////////////
        // Treatment //////////////
        function addNewTreatment(customerID) {

            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageTreatmentDetail.aspx?CustomerID=" + customerID);
        }
        function addNewTakeCare(customerID) {

            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageTakeCareDetail.aspx?CustomerID=" + customerID);
        }

        function editTreatment(id, customerid) {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageTreatmentDetail.aspx?CurrentID=" + id + "&CustomerID=" + customerid);
            $('#divDetailPopup').modal('show');

        }
        ///////////////////
        // History //////////////
        function addNewHistoryNotComplaint(customerID) {

            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageHistoryDetail.aspx?CustomerID=" + customerID + "&typeHistory=1");
        }
        function addNewHistory(customerID) {

            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageHistoryDetail.aspx?CustomerID=" + customerID);

        }
        function editHistory(id, customerid) {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageHistoryDetail.aspx?CurrentID=" + id + "&CustomerID=" + customerid);
            $('#divDetailPopup').modal('show');

        }
        ///////////////////

        // Schedule //////////////
        function addNewSchedule(customerID) {

            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Appointment/pageAppointmentDetail.aspx?CustomerID=" + customerID + "&typeHistory=1");
        }
        function editSchedule(id, customerid) {
            debugger
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Appointment/pageAppointmentDetail.aspx?CurrentID=" + id + "&CustomerID=" + customerid);
            $('#divDetailPopup').modal('show');

        }
        ///////////////////


        //Payment ///////////////////
        function addNewPayment(customerID) {

            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pagePaymentDetail.aspx?CustomerID=" + customerID);
        }
        function editPayment(id, customerid) {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pagePaymentDetail.aspx?CurrentID=" + id + "&CustomerID=" + customerid);
            $('#divDetailPopup').modal('show');

        }
        ///////////////////


        function newAppointment() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Appointment/pageAppointmentDetail.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));

        }
        function editCustomer() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Customer/pageCustomerDetail.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));

        }

        function addNewSMS() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Sms/pageSmsDetail.aspx?type=" + 6 + "&CustomerID=" + ("<%=CustomerID.ToString() %>"));
        }
        function onclickfacebookicon() {
            var win = window.open(facebookurl, '_blank');
            win.focus();
        }
        function onclickinstgramicon() {
            var win = window.open(instgramurl, '_blank');
            win.focus();
        }

    </script>

    <script src="/dist/semantic.min.js"></script>
    <%--    <script src="/plugins/datatable/jquery.dataTables.js"></script>--%>
    <script src="/js/customjs/custom-datatable.js"></script>
    <script src="/js/comon/renderControl.js"></script>
    <script src="/js/customjs/custom-progress.js"></script>
    <script src="/UploadJS/js/vendor/jquery.ui.widget.js"></script>
    <script src="/UploadJS/js/jquery.iframe-transport.js"></script>
    <script src="/UploadJS/js/jquery.fileupload.js"></script>

</asp:Content>
