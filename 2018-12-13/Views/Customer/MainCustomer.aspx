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
                                    <img src="/img/avatar/people/Meggie.png" alt="label-image">
                                    <i class="circle mini red icon avt" data-content="Offline" data-variation="inverted redli"></i></a>&nbsp;<div class="middle aligned content hiddenui">
                                        <div class="header">
                                            <i  class="asterisk teal loading icon"></i>
                                            <div id="txtNameMain"></div>
                                        </div>
                                        <div class="meta">
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
                <a class="item">Dịch Vụ</a>
                <a class="item">Thanh Toán</a>
                <a class="item">Điều Trị</a>
                <a class="item">Hình Ảnh</a>
                <a class="item">Lịch Sử</a>
            </div>
            <div id="divMainPage">
            </div>
           
        </div>
    </div>


    <script>

        $(document).ready(function () {
            document.getElementById("txtNameMain").innerHTML = "<%=CustName.ToString() %>" + "(" + "<%=CustCode.ToString() %>" + ")";
            document.getElementById("txtPhoneMain").innerHTML = "<%=Phone.ToString() %>"
            document.getElementById("divMainPage").innerHTML = '';
            $("#divMainPage").load("/Views/Customer/pageGeneralInfo.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
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
                    $("#divMainPage").load("/Views/Customer/pageGeneralInfo.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Tư Vấn":
                    $("#divMainPage").load("/Views/Customer/pageStatusList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Lịch Sử":
                    $("#divMainPage").load("/Views/Customer/pageHistoryList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Dịch Vụ":
                    $("#divMainPage").load("/Views/Customer/pageTabList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Thanh Toán":
                    $("#divMainPage").load("/Views/Customer/pagePaymentList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Điều Trị":
                    $("#divMainPage").load("/Views/Customer/pageTreatmentList.aspx?CustomerID=" + ("<%=CustomerID.ToString() %>"));
                    break;
                case "Hình Ảnh":
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




    </script>


    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/customjs/custom-datatable.js"></script>
<%--    <script src="/plugins/radioslider/jquery.radios-to-slider.js"></script>
    <link href="/plugins/radioslider/radios-to-slider.css" rel="stylesheet" />--%>
    <script src="/js/comon/renderControl.js"></script>
    <script src="/js/customjs/custom-progress.js"></script>
    <script src="/UploadJS/js/vendor/jquery.ui.widget.js"></script>
    <script src="/UploadJS/js/jquery.iframe-transport.js"></script>
    <script src="/UploadJS/js/jquery.fileupload.js"></script>

</asp:Content>
