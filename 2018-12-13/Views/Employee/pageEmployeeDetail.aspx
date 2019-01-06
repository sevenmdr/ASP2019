<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageEmployeeDetail.aspx.cs" Inherits="_2018_12_13.Views.Employee.pageEmployeeDetail" %>

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
      <div class="image content">
        <div class="ui massive image">
            <img id="logo" src="/img/avatar/people/Glenn.png" />
        </div>
    <div class="description">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">

                <form class="ui form segment form3" id="form3">
                    <div class="field">

                        <label>Nhân Viên</label>
                        <input id="EmpName" name="name" type="text" />

                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Điện Thoại ( 10 Ký Tự Số )</label>
                            <input id="Phone1" name="phonenumber" type="text" />
                        </div>
                        <div class="field">
                            <label>Email</label>
                            <input id="Email1" name="email" type="text" />

                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Ngày Sinh</label>
                            <input id="Birthday" class="flatpickr" type="text" placeholder="Select Date.." />
                        </div>
                        <div class="field">
                            <label>Giới Tính</label>
                            <div class="ui fluid search selection dropdown" id="Gender_ID">
                                <input type="hidden" name="gender" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Giới Tính</div>
                                <div id="cbbGender" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Bộ Phận</label>
                            <div class="ui fluid search selection dropdown" id="GroupEmp">
                                <input type="hidden" name="GroupUser" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Bộ Phận</div>
                                <div id="cbbGroup" class="menu" tabindex="-1">
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
                                <div  class="menu" tabindex="-1">
                                    <div class="item" data-value="2">Đã Nghỉ Việc</div>
                                     <div class="item" data-value="1">Đang Làm Việc</div>
                                     
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Địa Chỉ</label>
                            <input id="Address" name="address" type="text" />
                        </div>
                    </div>




                </form>
                </div>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" type="submit" onclick="return ExcuteData()">Save</button>
        </div>

    </div>

    <script type="text/javascript">
        function ExcuteData() {
            
            var data = new Object();
             data.Gender_ID = Number($('#Gender_ID').dropdown('get value')) ? Number($('#Gender_ID').dropdown('get value')) : 0;
            data.State = Number($('#State_ID').dropdown('get value')) == 1 ? Number($('#State_ID').dropdown('get value')) : 0;
            data.Group = Number($('#GroupEmp').dropdown('get value')) ? Number($('#GroupEmp').dropdown('get value')) : 0;
            data.Email1 = $('#Email1').val() ? $('#Email1').val() : "";
            data.Address = $('#Address').val() ? $('#Address').val() : "";
            data.Phone1 = $('#Phone1').val() ? $('#Phone1').val() : "";
            data.Birthday = $('#Birthday').val() ? $('#Birthday').val() : "";  
            data.Name = $('#EmpName').val() ? $('#EmpName').val() : "";
            data.Avatar =  "";
            
            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Employee/pageEmployeeDetail.aspx/ExcuteData",
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
            GetDataComboEmployee("/Views/Employee/pageEmployeeDetail.aspx/LoadComboMain", function (dataGroup, dataGender) {
                LoadCombo(dataGender, "cbbGender")
                LoadCombo(dataGroup, "cbbGroup")
            });
        }

        $(document).ready(function () {
            
              LoadComboEmp();

            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            LoadDataUpdateEmployee();
        });


        function LoadDataUpdateEmployee() {
            
            let dataEmployee = ([<%=_dataEmployeeList%>][0]);
            if (dataEmployee) {
                

                $("#Gender_ID ").dropdown("refresh");
                $("#Gender_ID ").dropdown("set selected", dataEmployee[0].Gender);
                $("#State_ID ").dropdown("refresh");
                $("#State_ID ").dropdown("set selected", dataEmployee[0].State);
                $("#GroupEmp ").dropdown("refresh");
                $("#GroupEmp ").dropdown("set selected", dataEmployee[0].Group_ID);
                $('#EmpName').val((dataEmployee[0].Name));
                $('#Email1').val((dataEmployee[0].Email));
                $('#Address').val((dataEmployee[0].Address));
                $('#Phone1').val((dataEmployee[0].Phone));
                $(".flatpickr").flatpickr({ defaultDate: dataEmployee[0].Brithday });
            }
            else {
                 $("#State_ID").dropdown("refresh");
            $("#State_ID").dropdown("set selected", 1);
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

