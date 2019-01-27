<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageCustomerCare_NotCheckIn.aspx.cs" Inherits="_2018_12_13.Views.CustomerCare.pageCustomerCare_NotCheckIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">
                <div class="sixteen wide tablet ten wide computer column">
                    <div class="ui segments" style="background-color: white;border: none;">
                        <form class="ui form segment form3">
                            <div class="ui segment" style="border: none;">
                                <div class="five fields" style="margin: 0px;">
                                    <div class="field">
                                        <h5>Đặt Lịch Không Đến</h5>
                                    </div>
                                    <div class="field">
                                    </div>
                                    <div class="field">
                                        <div class="ui fluid search selection dropdown" id="Branch_ID" onchange="LoadDataCustomerCareNotCheckIN()">
                                            <input type="hidden" name="branch" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Chi Nhánh</div>
                                            <div id="cbbBranch" class="menu" tabindex="-1">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui fluid search selection dropdown" id="typetakecare"onchange="LoadDataCustomerCareNotCheckIN()">
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
                                        <input class="flatpickr" id="DateFrom" type="text" placeholder="Select Date.." onchange="LoadDataCustomerCareNotCheckIN()" />
                                    </div>
                                    <div class="field">
                                        <input class="flatpickr" id="DateTo" type="text" placeholder="Select Date.." onchange="LoadDataCustomerCareNotCheckIN()" />
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
        var dataListMainNotCheckIn;
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
                                        ${item.isTakeCare==1?"Đã Chăm Sóc":"Chưa Chăm Sóc"}
                                    </div>
                                    <div class="description">
                                        <b>${item.Content.lenght > 10 ? item.Content.substring(0, 10) + "..." : item.Content}</b>
                                    </div>
                                </div>
                                <div class="extra content">
                                    <div class="ui two buttons">
                                        <button class="ui basic green button" value=${item.CustID}>Đến Khách Hàng</button>
                                        <button class="ui basic red button"  name=${item.CustID} value=${item.Appid}>Chăm Sóc</button>
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
        function LoadDataCustomerCareNotCheckIN() {
            GetDataSourceCustomerCareAfterTreatment("/Views/CustomerCare/pageCustomerCare_NotCheckIn.aspx/LoadataCustomerCare", Number($('#Branch_ID').dropdown('get value')), $("#DateFrom").val(), $("#DateTo").val(), function (data) {
                dataListMainNotCheckIn = data;
                if ($('#typetakecare').dropdown('get value') != ""&& $('#typetakecare').dropdown('get value') != "2") {
                    dataListMainNotCheckIn = data.filter(word => word["isTakeCare"] == Number($('#typetakecare').dropdown('get value')));
                }
                
                LoadCardView(dataListMainNotCheckIn, "cardaftertreatment")
                                                      $(".ui.basic.red.button").click(function (e) {
                    window.open("/Views/CustomerCare/pageCustomerCareList.aspx?CustomerID=" + $(this).attr('name') + "&AppID=" + $(this).val() + "&Type=4");

                });
                // Cham soc khach hang
                $(".ui.basic.green.button").click(function (e) {
                    window.open("/Views/Customer/MainCustomer.aspx?CustomerID=" + $(this).val());
                });
            })

        }
        function LoadComboBranchNotCheckIn() {
            GetDataComboBranch("/Views/CustomerCare/pageCustomerCare_NotCheckIn.aspx/LoadComboMain", function (data) {
                LoadCombo(data, "cbbBranch");
            });
        }


        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'Y-m-d',
                enableTime: false,
                defaultDate: new Date(),
            });
                 LoadComboBranchNotCheckIn();
             $("#Branch_ID").dropdown("refresh");
            $("#Branch_ID").dropdown("set selected", 1);
            $("#typetakecare").dropdown("refresh");
            $("#typetakecare").dropdown("set selected", 2);
             LoadDataCustomerCareNotCheckIN();

       
        });


    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/customjs/custom-datatable.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

</asp:Content>
