<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pagePermissionGeneral.aspx.cs" Inherits="_2018_12_13.Views.Permission.pagePermissionGeneral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



        <div class="pusher">
            <div class="navslide navwrap">
                <div class="row">
                    <div class="ui equal width left aligned padded grid stackable">
                        <div class="sixteen wide tablet two wide computer column">
                            <div class="ui vertical secondary pointing fluid tabular menu" id="divMenuItem">
                                <a class="item active" data-tab="PageList">Danh Sách Màn Hình
                                </a>
                                <a class="item" data-tab="controlist">Danh sách Control
                                </a>
                                <a class="item" data-tab="GroupPageList">Phân Quyền Theo Màn Hình
                                </a>
                                <a class="item" data-tab="GroupControlList">Phân Quyền theo Control
                                </a>
                               
                            </div>
                        </div>
                        <div class="sixteen wide tablet fourteen wide computer column">

                            <div id="divMainPagePermission">
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $("#divMainPagePermission").load("/Views/Permission/pagePermissionPageList.aspx");
            $('#divMenuItem a.item').on('click', function () {
                $(this)
                    .addClass('active')
                    .siblings()
                    .removeClass('active');
                var textTab = $("#divMenuItem a.active.item")[0].innerHTML;
                document.getElementById("divMainPagePermission").innerHTML = '';
                switch (textTab.trim()) {
                    case "Danh Sách Màn Hình":
                        $("#divMainPagePermission").load("/Views/Permission/pagePermissionPageList.aspx");
                        break;
                    case "Danh sách Control":
                        $("#divMainPagePermission").load("/Views/Permission/pagePermissionControlList.aspx");
                        break;
                    case "Phân Quyền Theo Màn Hình":
                        $("#divMainPagePermission").load("/Views/Permission/pagePermissionGroupPageList.aspx");
                        break;
                    case "Phân Quyền theo Control":
                        $("#divMainPagePermission").load("/Views/Permission/pagePermissionGroupControlList.aspx");
                        break;
                    default: break;
                }
            });
        </script>


</asp:Content>
