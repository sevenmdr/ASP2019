<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageCustomerCare_AfterTreatment.aspx.cs" Inherits="_2018_12_13.Views.CustomerCare.pageCustomerCare_AfterTreatment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">
                <div class="sixteen wide tablet ten wide computer column">
                    <div class="ui segments" style="background-color: white; border: none;">
                        <form class="ui form segment form3">
                            <div class="ui segment" style="border: none;">
                                <div class="five fields" style="margin: 0px;">
                                    <div class="field">
                                        <h5>Chăm Sóc Sau Điều Trị</h5>
                                    </div>
                                    <div class="field">
                                    </div>
                                    <div class="field">
                                        <div class="ui fluid search selection dropdown" id="Branch_ID" onchange="LoadDataCustomerCareTreat()">
                                            <input type="hidden" name="branch" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Chi Nhánh</div>
                                            <div id="cbbBranch" class="menu" tabindex="-1">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui fluid search selection dropdown" id="typetakecare" onchange="LoadDataCustomerCareTreat()">
                                            <input type="hidden" name="customerCareType" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Tình Trạng</div>
                                            <div id="cbbcustomerCareType" class="menu" tabindex="-1">
                                                <div class="item" data-value="2">Tất Cả</div>
                                                <div class="item" data-value="1">Đã Chăm Sóc</div>
                                                <div class="item" data-value="0">Chưa Chăm Sóc</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <input class="flatpickr" id="DateFrom" type="text" placeholder="Select Date.." onchange="LoadDataCustomerCareTreat()" />
                                    </div>
                                    <div class="field">
                                        <input class="flatpickr" id="DateTo"   type="text" placeholder="Select Date.." onchange="LoadDataCustomerCareTreat()" />
                                    </div>

                                </div>
                            </div>
                        </form>
                        <div class="ui cards" id="cardaftertreatment" style="margin: -.875em -0.01em">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">
        var dataListMain;
        function LoadCardView(data, id) {
            if (data && data.length > 0) {
                var myNode = document.getElementById(id);
                myNode.innerHTML = '';
                var re = new RegExp(",", 'g');
                const markup = `
    ${(data).map(item => `
                            <div class="card">
                                <div class="content">
                                    <div class="header">
                                        ${item.CusDetail}
                                    </div>
                                    <div class="meta">
                                        ${item.isTakeCare == 1 ? "Đã Chăm Sóc" : "Chưa Chăm Sóc"}
                                    </div>
                                    <div class="description">
                                        <b>${item.Content.lenght > 10 ? item.Content.substring(0, 10) + "..." : item.Content}</b>
                                    </div>
                                </div>
                                <div class="extra content">
                                    <div value=${item.CustID} class="ui two buttons">
                                        <button class="ui basic green button" value=${item.CustID}>Đến Khách Hàng</button>
                                        <button class="ui basic red button" name=${item.CustID} value=${item.ID}>Chăm Sóc</button>
                                    </div>
                                </div>
                            </div>
`)
                    }
`;
                document.getElementById(id).innerHTML = markup.replace(re, '');;
            }
            else { document.getElementById(id).innerHTML = '' }
        }
        function LoadDataCustomerCareTreat() {
            GetDataSourceCustomerCareAfterTreatment("/Views/CustomerCare/pageCustomerCare_AfterTreatment.aspx/LoadataCustomerCare", Number($('#Branch_ID').dropdown('get value')), $("#DateFrom").val(), $("#DateTo").val(), function (data) {
                dataListMain = data;
                if ($('#typetakecare').dropdown('get value') != "" && $('#typetakecare').dropdown('get value') != "2") {
                    dataListMain = data.filter(word => word["isTakeCare"] == Number($('#typetakecare').dropdown('get value')));
                }

                LoadCardView(dataListMain, "cardaftertreatment")
                // di den khach hang
                $(".ui.basic.red.button").click(function (e) {
                    window.open("/Views/CustomerCare/pageCustomerCareList.aspx?CustomerID=" + $(this).attr('name') + "&MasterID=" + $(this).val() + "&Type=5");

                });
                // Cham soc khach hang
                $(".ui.basic.green.button").click(function (e) {
                    window.open("/Views/Customer/MainCustomer.aspx?CustomerID=" + $(this).val());
                });
            })

        }
        function LoadComboBranch() {
            GetDataComboBranch("/Views/CustomerCare/pageCustomerCare_AfterTreatment.aspx/LoadComboMain", function (data) {
                LoadCombo(data, "cbbBranch");
            });
        }
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'Y-m-d',
                enableTime: false,
                defaultDate: new Date(),
            });



            LoadComboBranch();
            $("#Branch_ID").dropdown("refresh");
            $("#Branch_ID").dropdown("set selected", 1);
            $("#typetakecare").dropdown("refresh");
            $("#typetakecare").dropdown("set selected", 2);
            LoadDataCustomerCareTreat();

        });


    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/customjs/custom-datatable.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

</asp:Content>
