<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageSettingListParam.aspx.cs" Inherits="_2018_12_13.Views.Setting.pageSettingListParam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



        <div class="pusher">
            <div class="navslide navwrap">
                <div class="row">
                    <div class="ui equal width left aligned padded grid stackable">
                        <div class="sixteen wide tablet two wide computer column">
                            <div class="ui vertical secondary pointing fluid tabular menu" id="divMenuItem">
                                <a class="item active" data-tab="warehouselist">Loại Lịch Sử
                                </a>
                             <a class="item active" data-tab="warehouselist">Loại Chi
                                </a>
                               
                            </div>
                        </div>
                        <div class="sixteen wide tablet fourteen wide computer column">

                            <div id="divMainPageTicket">
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $("#divMainPageTicket").load("/Views/Setting/pageTicketSourceList.aspx");
            $('#divMenuItem a.item').on('click', function () {
                $(this)
                    .addClass('active')
                    .siblings()
                    .removeClass('active');
                var textTab = $("#divMenuItem a.active.item")[0].innerHTML;
                document.getElementById("divMainPageTicket").innerHTML = '';
                switch (textTab.trim()) {
                    case "Loại Lịch Sử":
                        $("#divMainPageTicket").load("/Views/Setting/pageTypeHistoryList.aspx");
                        break;
                                        case "Loại Chi":
                        $("#divMainPageTicket").load("/Views/Setting/pageTypeAccountList.aspx");
                        break;
                    default: break;
                }
            });
        </script>


</asp:Content>
