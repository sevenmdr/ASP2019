<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageAppointmentDetail.aspx.cs" Inherits="_2018_12_13.Views.Appointment.pageAppointmentDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <link rel="icon" href="~/img/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />
    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
    <link href="/css/main.custom.css" rel="stylesheet" />
    <link rel="shortcut icon" href="~/img/favicon.ico" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />
    <script src="/js/comon/noti_function.js"></script>
           <script type="text/javascript">
               var dataInfo;
                      function LoadComboSchedule() {
            GetDataComboAppointment("/Views/Appointment/pageAppointmentDetail.aspx/LoadCombo", function (dataScheduleType, ServiceCare, Doctor, Branch, TimeTreatment) {
                LoadCombo(dataScheduleType, "ccbTypeSchedule")
                LoadComboToken(ServiceCare, "tokenServiceCare")
                LoadCombo(Doctor, "ccboDoctor")
                LoadCombo(Branch, "ccbBranch")

            });
               }
               
               function ChaneUpdateData(data) {
                   LoadComboSchedule();
            dataInfo = data[0];
        }

    </script>
</head>

<body>
        <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>
    <div class="header">
        Lịch Hẹn Khách Hàng
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="two fields">
                        <div class="field">
                            <label>Loại Lịch Hẹn</label>
                            <div class="ui fluid search selection dropdown" id="TypeSchedule" onchange="ChangeTypeScheule()">
                                <input type="hidden" name="appointment" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Loại Lịch Hẹn</div>
                                <div id="ccbTypeSchedule" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Ngày Hẹn</label>
                            <input id="Date_from" name="date" class="flatpickr" type="text" placeholder="Select Date.." />
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Chi Nhánh</label>
                            <div class="ui fluid search selection dropdown" id="branch_ID">
                                <input type="hidden" name="branch" id="branch" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Chọn Chi Nhánh</div>
                                <div id="ccbBranch" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Dịch Vụ Quan Tâm</label>
                        
                             <select  id="tokenServiceCare" name="skills" multiple="" class="label ui selection fluid dropdown">



    </select>
                        
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Bác Sĩ</label>
                            <div class="ui fluid search selection dropdown" id="Doctor_ID">
                                <input id="inputdoctor1" type="hidden" name="doctor" />
                                <i class="dropdown icon"></i>
                                <input id="inputdoctor" name="doctor" class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Chọn Bác Sĩ</div>
                                <div id="ccboDoctor" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>
                           <div class="field">
                            <div class="field">
                                <label>Ghi chú</label>
                                <input id="NoteSchedule" name="address" type="text" />
                            </div>
                        </div>
                </form>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" onclick="ExcuteData()" form="form3">Save</button>
        </div>

    </div>
    <script>
        var url = "/js/comon/load_datasource.js";
        $.getScript(url);
    </script>

    <%--Script--%>
    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
    <script>
                    function ChangeTypeScheule() {
                
                if (Number($('#TypeSchedule').dropdown('get value')) == 1) {

                   $('#Doctor_ID').dropdown('clear')
                    $('#Doctor_ID').addClass("disabled");
                    $("#inputdoctor").attr('name', "NotVali");
                    $("#inputdoctor1").attr('name', "NotVali");

                }
                else {
                     $('#Doctor_ID').removeClass("disabled");
                    $("#inputdoctor").attr('name', "doctor");
                    $("#inputdoctor1").attr('name', "doctor");
                }
            }
        function ExcuteData()
        {
            var data = new Object();
              data.branch_ID  = Number($('#branch_ID').dropdown('get value')) ? Number($('#branch_ID').dropdown('get value')) : 0;
              data.Doctor_ID = Number($('#Doctor_ID').dropdown('get value')) ? Number($('#Doctor_ID').dropdown('get value')) : 0;
            data.TypeSchedule = Number($('#TypeSchedule').dropdown('get value')) ? Number($('#TypeSchedule').dropdown('get value')) : 0;
            data.ServiceCare_ID = $('#tokenServiceCare').dropdown('get value').toString().substring(0, ($('#tokenServiceCare').dropdown('get value').toString().length)/2) ? $('#tokenServiceCare').dropdown('get value').toString().substring(0, ($('#tokenServiceCare').dropdown('get value').toString().length)/2) : "";
            data.Customer_ID = 7;
              data.Note  = $('#NoteSchedule').val() ? $('#NoteSchedule').val() : "";
              data.Date_from = $('#Date_from').val() ? $('#Date_from').val() : "";

            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Appointment/pageAppointmentDetail.aspx/ExcuteData",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data) }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            LoadStatusAjax();
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
        $(document).ready(function () {
            LoadComboSchedule();
            $('#Doctor_ID').addClass("disabled");
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y H:i',
                enableTime: true,
                defaultDate: new Date(),
            });
            LoadDataUpdate();

        });
        function LoadDataUpdate() {
            debugger
                    if (dataInfo) {
                $("#branch_ID ").dropdown("refresh");
                $("#branch_ID ").dropdown("set selected", dataInfo.Branch_ID); 
                 $("#Doctor_ID ").dropdown("refresh");
                $("#Doctor_ID ").dropdown("set selected", dataInfo.DoctorID ); 
                 $("#TypeSchedule ").dropdown("refresh");
                        $("#TypeSchedule ").dropdown("set selected", dataInfo.Type_ID); 


                       // $("#tokenServiceCare").dropdown("refresh");
                      //  $("#tokenServiceCare").val(tokenServiceCare.Service_care);
                       // $("#tokenServiceCare").multiselect("refresh");
                        $('#tokenServiceCare').dropdown('clear')
                        $('#tokenServiceCare').dropdown('set selected',['67','68']);
                       // $('#tokenServiceCare').dropdown('set exactly',['67','68']);
                     //   $('#tokenServiceCare ').val();
                $('#NoteSchedule').val((dataInfo.Content));
                $(".flatpickr").flatpickr({ defaultDate: dataInfo.Date_From });
            }
        }

    </script>
</body>

</html>
