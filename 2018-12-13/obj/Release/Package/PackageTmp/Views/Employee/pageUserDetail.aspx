<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageUserDetail.aspx.cs" Inherits="_2018_12_13.Views.Employee.pageUserDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />
    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
    <link href="/css/main.custom.css" rel="stylesheet" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />

</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" />
    </form>
    <div class="header">
        Hồ Sơ Nhân Viên
    </div>
    <div class="description">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">

                <form class="ui form segment form3" id="form3">
                    <div class="field">

                        <div class="field">
                            <label>Nhân Viên</label>
                            <div class="ui fluid search selection dropdown" id="Emp_ID" onchange="ExcuteEmp()">
                                <input type="hidden" name="Employee" />
                                <i class="dropdown icon"></i>
                                <input   id="inputEmp" class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Nhân Viên</div>
                                <div id="cbbEmployee" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Nhóm</label>
                            <div class="ui fluid search selection dropdown" id="Group_ID">
                                <input type="hidden" name="GroupUser" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Nhóm</div>
                                <div id="cbbGroupUser" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Trạng Thái</label>
                            <div class="ui fluid search selection dropdown" id="State_ID">
                                <input type="hidden" name="State" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Trạng Thái</div>
                                <div class="menu" tabindex="-1">
                                    <div class="item" data-value="1">Hoạt Động</div>
                                    <div class="item" data-value="2">Không Hoạt Động</div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label>Chi Nhánh</label>
                        <div class="ui fluid search selection dropdown" id="Branch_ID">
                            <input type="hidden" name="branch" />
                            <i class="dropdown icon"></i>
                            <input class="search" autocomplete="off" tabindex="0" />
                            <div class="default text">Chi Nhánh</div>
                            <div id="cbbBranch" class="menu" tabindex="-1">
                            </div>
                        </div>
                    </div>

                    <div class="field">
                        <div class="field">
                            <label id="lbUser">User Name</label>
                        </div>
                    </div>




                </form>
            </div>
        </div>
    </div>



    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" type="submit" onclick="return ExcuteData()">Save</button>
        </div>

    </div>

    <script type="text/javascript">
        var UserName;
        var DataComboEmp;
        var DataComboEmpEdit;
        function ExcuteEmp() {
            $.ajax({
                url: "/Views/Employee/pageUserDetail.aspx/CheckexistUser",
                dataType: "json",
                type: "POST",
                data:JSON.stringify({ 'EmpName': $('#cbbEmployee')[0].innerText}) , 
                contentType: 'application/json; charset=utf-8',
                async: false,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                        UserName = "";
                    },
                    success: function (result) {
                        if (result.d != "") {
                            UserName = result.d;
                        } else {
                            UserName = "";
                        }

                    }
            });
            $('#lbUser').text("UserName : " + UserName);
        }
        function ExcuteData() {
            var data = new Object();
            data.Emp_ID = Number($('#Emp_ID').dropdown('get value')) ? Number($('#Emp_ID').dropdown('get value')) : 0;
            data.State = Number($('#State_ID').dropdown('get value')) == 1 ? Number($('#State_ID').dropdown('get value')) : 0;
            data.Group = Number($('#Group_ID').dropdown('get value')) ? Number($('#Group_ID').dropdown('get value')) : 0;
            data.Branch_ID = Number($('#Branch_ID').dropdown('get value')) ? Number($('#Branch_ID').dropdown('get value')) : 0;
            data.UserName = UserName;
            data.Name = $('#cbbEmployee')[0].innerText;
            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Employee/pageUserDetail.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data) }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError();
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            LoadEmployeeAjax();
                        } else {
                            notiError(result.d);
                        }

                    }
                });
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
        }
        function LoadComboEmp() {

            GetDataComboUser("/Views/Employee/pageUserDetail.aspx/LoadComboMain", function (dataGroup,dataBranch,dataEmp,dataEmpEdit) {
                LoadCombo(dataGroup, "cbbGroupUser")
                LoadCombo(dataBranch, "cbbBranch")
                DataComboEmp = dataEmp;
              DataComboEmpEdit = dataEmpEdit;
            });
        }

        $(document).ready(function () {

            LoadComboEmp();
            LoadDataUpdateUser();
        });


        function LoadDataUpdateUser() {
            let dataUser = ([<%=_dataUserList%>][0]);
            
            if (dataUser) {
                 LoadCombo(DataComboEmpEdit, "cbbEmployee")
                
                $("#Emp_ID ").dropdown("refresh");
                $("#Emp_ID ").dropdown("set selected", dataUser[0].Employee_ID);
                $("#State_ID ").dropdown("refresh");
                $("#State_ID ").dropdown("set selected", dataUser[0].State);
                $("#Group_ID ").dropdown("refresh");
                $("#Group_ID ").dropdown("set selected", dataUser[0].Group_ID);
                 $("#Branch_ID ").dropdown("refresh");
                $("#Branch_ID ").dropdown("set selected", dataUser[0].Branch_ID)
                $('#lbUser').text("UserName : " + (dataUser[0].Username));
                $('#Emp_ID').addClass("disabled");
            }
            else {
                   LoadCombo(DataComboEmp, "cbbEmployee")
                $("#State_ID").dropdown("refresh");
                $("#State_ID").dropdown("set selected",1);
            }
        }
    </script>


    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
    <%--   <script src="/js/customjs/custom-modal.js"></script>--%>
</body>

</html>

