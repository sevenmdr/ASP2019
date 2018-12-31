<%@ Page Title="" Language="C#" MasterPageFile="~/Master/2_Customer.Master" AutoEventWireup="true" CodeBehind="pageCustomerMain.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageCustomerMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
        <div class="ui equal width left aligned padded grid stackable">
            <div class="row">
                <div class="sixteen wide column">
                    <div class="ui segments">
                        <div class="ui segment">
                            <h5 class="ui header">
                                <button id="button1" class="ui teal button" data-value="fade up" onclick="notiSuccess()">Noti</button>
                                <button id="button2" class="ui teal button modalone" data-value="fade up" onclick="AddPageLarge()">Large Modal</button>
                                <button id="button3" class="ui teal button modalfour" data-value="fade up" onclick="AddPageSmall()">Small Modal</button>
                            </h5>
                        </div>
                        <div class="ui segment">
                            <table id="data_table" class="ui compact selectable striped celled table tablet stackable">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Phone</th>
                                        <th>Office</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Jena Bennett</td>
                                        <td>(02) 2393 3416</td>
                                        <td>Adipiscing Fringilla Associates</td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui standard test modal" id="div1">
        </div>
        <div class="ui small test modal" id="div2">
        </div>
    </div>
    <div class="row">
        <div class="sixteen wide column">
            <div class="ui segments">
                <div class="ui segment">
                    <h3 class="ui header">Advanced Notofication
                    </h3>
                </div>
                <div class="ui segment">

                    <button class="ui button red not" data-icon="" data-image="/img/avatar/people/carol.png" data-animation="" data-type="error" data-size="normal" data-message="This is default notification">
                        Error Notification with Image
                    </button>
                </div>
            </div>
        </div>
    </div>


    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/customjs/custom-datatable.js"></script>

    <script src="/js/main.js"></script>
    <script type="text/javascript">
        function ResetDiv() {
            document.getElementById("div1").innerHTML = '';
            document.getElementById("div2").innerHTML = '';
        }
        function AddPageLarge() {
            ResetDiv();
            // $("#div1").load("http://localhost:5345/Views/Employee/pageEmployeeDetail.aspx?id=10");
            $("#div1").load("http://localhost:5345/Views/Customer/pageTabDetail.aspx");
        }
        function AddPageSmall() {
            ResetDiv();
            $("#div2").load("http://localhost:5345/Views/Customer/pageCustomerDetail.aspx?id=1");
        }

    </script>
</asp:Content>

