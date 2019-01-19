<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageTicketAllByDay.aspx.cs" Inherits="_2018_12_13.Views.Marketing.pageTicketAllByDay" %>

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
                                        <div class="ui fluid search selection dropdown" id="statusTicketAll">
                                            <input type="hidden" name="statusTicketAll" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Tình Trạng</div>
                                            <div id="cbbstatusTicketAll" class="menu" tabindex="-1">
                                                <div class="item" data-value="2">Tất Cả</div>
                                                <div class="item" data-value="1">Đã Xử Lý</div>
                                                <div class="item" data-value="0">Chưa Xử Lýc</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <input id="dateFrom" class="flatpickr" type="text" placeholder="Select Date.." />
                                    </div>
                                    <div class="field">
                                        <input id="dateTo" class="flatpickr" type="text" placeholder="Select Date.." />
                                    </div>
                                    <div class="field">
                                        <div class="ui red button" onclick="event.preventDefault();LoadDataTicketAll();">Xem</div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="ui cards" id="careTicketMainALl" style="margin: -.875em -0.01em">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <script type="text/javascript">
        var dataTicketMainAll;
        function LoadCardView(data, id) {
            if (data && data.length > 0) {
                var myNode = document.getElementById(id);
                myNode.innerHTML = '';
                var re = new RegExp(",", 'g');
                const markup = `
    ${(data).map(item => `


<div class="card" style="
    width: 250px;
    height: 73px;
    background-color: ${item.ColorCode};
    ">
                                <div class="content" style="">
                                    <div class="header" style="font-size: 13px;color: white;max-height: 20px;">${item.CustomerName}
            <div style="float:right">


            <img src= ${item.isExecute == 0 ? "/img/ButtonImg/checked.png" : ""}>
</div></div>
                                    <div class="meta" style="color: #c3f1ce;font-size: 13px;height: 20px;max-height: 30px;width: 180px;max-width: 180px;font-style: italic;">${item.ServiceCare}</div>
    
                                    
<a class='ticketallday' name=${item.TicketID} style="font-size: 21px;color:white;float: right">${item.HourApp}</a>

                               </div>
                           
                            </div>





`)
                    }
`;
                document.getElementById(id).innerHTML = markup.replace(re, '');;
            }
            else { document.getElementById(id).innerHTML = '' }
        }
        function LoadDataTicketAll() {
            GetDataTicketMainByDay("/Views/Marketing/pageTicketAllByDay.aspx/LoadData"
                , $('#dateFrom').val() ? $('#dateFrom').val() : new Date()
                , $('#dateTo').val() ? $('#dateTo').val() : new Date()
                , function (data) {
                    dataTicketMainAll = data;
                    let statusid = $('#statusTicketAll').dropdown('get value');
                    if (statusid != "" && statusid != "2") {
                        dataTicketMainAll = data.filter(word => word["isExecute"] == Number(statusid));
                    }

                    LoadCardView(dataTicketMainAll, "careTicketMainALl")

                    $(".ticketallday").click(function (e) {
                        debugger
                        window.open("/Views/Marketing/pageTicketAction.aspx?TicketID="+$(this).attr('name'));
                    });

                })

        }

        $(document).ready(function () {
            $(".flatpickr").flatpickr({
               dateFormat: 'Y-m-d',
                enableTime: false,
                defaultDate: new Date(),
            });

            $("#statusTicketAll").dropdown("refresh");
            $("#statusTicketAll").dropdown("set selected", 2);
           // LoadDataTicketAll();
        });


    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/customjs/custom-datatable.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

</asp:Content>
