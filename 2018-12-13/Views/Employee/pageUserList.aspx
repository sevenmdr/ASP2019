<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageUserList.aspx.cs" Inherits="_2018_12_13.Views.Employee.pageUserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">
                <div class="sixteen wide tablet ten wide computer column">
                    <div class="ui segments" style="background-color: white">
                          <form class="ui form segment form3">
                            <div class="ui segment" style="border: none;">
                                <div class="four fields" style="margin: 0px;">
                                    <div class="field">
                                        <h5>Thông Tin User</h5>
                                    </div>
                                        <div class="field">
                                    </div>
                                    <div class="field">
                                    </div>
                                    <div class="field">
                                          <div style="float: right; width: 200px">
                                        <div class="ui fluid search selection dropdown" id="StateID" onchange="LoadEmployeeAjax()">
                                            <input type="hidden" name="branch" />
                                            <input class="search" autocomplete="off" tabindex="0" />
                                            <div class="default text">Trạng Thái</div>
                                            <div  class="menu" tabindex="-1">
                                                 <div class="item" data-value="2">Tất Cả</div>
                                                <div class="item" data-value="1">Hoạt Động</div>
                                                <div class="item" data-value="0">Không Hoạt Động</div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                     <div style="float: right ;width:150px">
                                        <button class="ui blue basic button" data-value="fade up" onclick="return AddNewUser()">Thêm Mới</button>
                                    </div>

                                </div>
                            </div>
                        </form>
         
                        <div class="ui segment" id="TableContent">
                    <table id="dtContent" style="width: 100%">
                        <thead>
                            <tr>
                                <th style="text-align: center">ID</th>
                                <th style="text-align: center; width: 25px;">STT</th>
                                <th style="text-align: center">Tên Nhân Viên</th>
                                <th style="text-align: center">Tên User</th>
                                <th style="text-align: center">Chi Nhánh</th>
                                <th style="text-align: center">Nhóm Phân Quyền</th>                               
                                <th style="text-align: center">Trạng Thái</th>
                                <th style="text-align: center; width: 30px;">Sửa</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                    </div>
               
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var divClone;
         var dataEmployee;
        function LoadEmployeeAjax() {
            
            GetDataSourceUserList("/Views/Employee/pageUserList.aspx/Loadata", function (data) {
               dataEmployee = data;
                if ($('#StateID').dropdown('get value') != "" && $('#StateID').dropdown('get value') != "2") {
                    dataEmployee = data.filter(word => word["State"] == Number($('#StateID').dropdown('get value')));
                }
            $('#dtContent').DataTable().destroy();
            $("#TableContent").replaceWith(divClone.clone());
            var table = $('#dtContent').DataTable({
                data: dataEmployee,
                info: false,
                paging: false,
                ordering: false,
                searching: false,
                destroy: true,
                "columnDefs": [
                    { "visible": false, "targets": 0, "data": "ID" },
                    { "visible": true, "targets": 1, "data": "STT", width: "50px", "className": "center" },
                    { "visible": true, "targets": 2, "data": "Name", width: "250px" },
                    { "visible": true, "targets": 3, "data": "Username", width: "150px" },
                    { "visible": true, "targets": 4, "data": "Branch" },
                    { "visible": true, "targets": 5, "data": "GroupName", width: "200px" },
                   { "visible": true, "targets": 6, "data": "StateName" , width: "150px" },
                    {
                        "targets": -1,
                        "data": null,
                        "defaultContent":
                            "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                            + "'data-value='fade up'><img class='buttonEditClass' src='/img/ButtonImg/edit.png' alt='edit' width='20' height='20'></button>",
                    },
                ],
            });

            document.getElementById("dtContent").className = "ui celled table";
            $('#dtContent tbody ').on('click', '.buttonEditClass', function () {
                var data = table.row($(this).parents('tr')).data();
                EditInfoUser(data["ID"]);
            });
         

        })
        }

   
        $(document).ready(function () {
            divClone = $("#TableContent").clone();
             $("#StateID").dropdown("refresh");
            $("#StateID").dropdown("set selected", 2);
        });
        function AddNewUser() {
            document.getElementById("divDetailPopup").innerHTML = '';
            $("#divDetailPopup").load("/Views/Employee/pageUserDetail.aspx");
            $('#divDetailPopup').modal('show');
            return false;
        }
             function EditInfoUser(CurrentID) {
                 document.getElementById("divDetailPopup").innerHTML = '';
                 $("#divDetailPopup").load("/Views/Employee/pageUserDetail.aspx?CurrentID=" + CurrentID);
            $('#divDetailPopup').modal('show');
            return false;
        }
    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>
</asp:Content>
