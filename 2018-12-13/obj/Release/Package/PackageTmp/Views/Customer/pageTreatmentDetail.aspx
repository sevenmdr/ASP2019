<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageTreatmentDetail.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageTreatmentDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <link rel="icon" href="/img/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />
    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
    <link href="/css/main.custom.css" rel="stylesheet" />
    <link rel="shortcut icon" href="/img/favicon.ico" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>
    <div id="header" class="header">
        Điều Trị Khách Hàng
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="two fields">
                        <div class="field">
                            <label>Bác Sỉ 1</label>
                            <div class="ui fluid search selection dropdown" id="doc1">
                                <input type="hidden" name="doctor1" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Bác Sỉ 1</div>
                                <div id="ccbDoctor1" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Bác Sỉ 2</label>
                            <div class="ui fluid search selection dropdown" id="doc2">
                                <input type="hidden" name="doctor2" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Bác Sỉ 1</div>
                                <div id="ccbDoctor2" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="two fields">
                        <div class="field">
                            <label>Phụ Tá 1</label>
                            <div class="ui fluid search selection dropdown" id="ass1">
                                <input type="hidden" name="assitant1" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Phụ Tá 1</div>
                                <div id="ccbAssitant1" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Phụ Tá 2</label>
                            <div class="ui fluid search selection dropdown" id="ass2">
                                <input type="hidden" name="assitant2" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Phụ Tá 2</div>
                                <div id="ccbAssitant2" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="field" id="servicenamecombo">
                        <div class="field">
                            <div class="field">
                                <label>Dịch Vụ</label>
                                <input class="form-control" id="serviceTabChoosen" />
                            </div>
                        </div>
                    </div>
                    <div class="field" id="servicenamediv">
                        <div class="field">
                            <label>Dịch Vụ</label>
                            <input id="txtNameService" name="" type="text" disabled />
                        </div>
                    </div>

                    <div class="field">
                        <div class="field">
                            <label>Nội Dung</label>
                            <input id="txtName" name="content" type="text" />
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <div style="font-size: 10px; color: red" id="textShowMessage"></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" onclick="event.preventDefault();return ExcuteData();">Save</button>
        </div>

    </div>

    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
    <script>
        var DataComboDoctor;
        var DataComboKTV;
        var DataComboTab;

        function ExcuteData() {
            var data = new Object();
            let tabID = Number($('#serviceTabChoosen').val()) ? Number($('#serviceTabChoosen').val()) : 0;
            data.Doc1 = Number($('#doc1').dropdown('get value')) ? Number($('#doc1').dropdown('get value')) : 0;
            data.Doc2 = Number($('#doc2').dropdown('get value')) ? Number($('#doc2').dropdown('get value')) : 0;
            data.Ass1 = Number($('#ass1').dropdown('get value')) ? Number($('#ass1').dropdown('get value')) : 0;
            data.Ass2 = Number($('#ass2').dropdown('get value')) ? Number($('#ass2').dropdown('get value')) : 0;
            data.Content = $('#txtName').val() ? $('#txtName').val() : "";
            data.Tab_ID = tabID;
            if ( document.getElementById("servicenamecombo").style.display == "block" && tabID == 0) {
                document.getElementById("textShowMessage").innerHTML = "Chọn Dịch Vụ Điều Trị";
            }
            else {
                 document.getElementById("textShowMessage").innerHTML = "";
                if ($('#form3').form('is valid')) {
                    $.ajax({
                        url: "/Views/Customer/pageTreatmentDetail.aspx/ExcuteData",
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
                                LoadTreatmentAjax();
                            } else {
                                notiError();
                            }

                        }
                    });
                    $('#divDetailPopup').modal('hide');
                    document.getElementById("divDetailPopup").innerHTML = '';
                }
            }
            return false;
        }
        function LoadDataUpdate() {
            let dataTreatment = ([<%=_dataTreatment%>][0]);
            if (dataTreatment) {

                $("#doc1").dropdown("refresh");
                $("#doc1").dropdown("set selected", dataTreatment[0].BS1);
                $("#doc2").dropdown("refresh");
                $("#doc2").dropdown("set selected", dataTreatment[0].BS2);
                $("#ass1").dropdown("refresh");
                $("#ass1").dropdown("set selected", dataTreatment[0].PT1);
                $("#ass2").dropdown("refresh");
                $("#ass2").dropdown("set selected", dataTreatment[0].PT2);
                $('#txtName').val((dataTreatment[0].Content));
                $('#txtNameService').val((dataTreatment[0].ServiceName));
                document.getElementById("servicenamecombo").style.display = "none";
                document.getElementById("servicenamediv").style.display = "block";
            }
            else {
                document.getElementById("servicenamecombo").style.display = "block";
                document.getElementById("servicenamediv").style.display = "none";
            }
        }
        $(document).ready(function () {
            document.getElementById("textShowMessage").innerHTML = "";
            DataComboDoctor = ([<%=_dataComboDoctor%>][0]);
            DataComboKTV = ([<%=_dataComboAssist%>][0]);
            DataComboTab = ([<%=_dataComboService%>][0]);
            LoadCombo(DataComboDoctor, "ccbDoctor1")
            LoadCombo(DataComboDoctor, "ccbDoctor2")
            LoadCombo(DataComboKTV, "ccbAssitant1")
            LoadCombo(DataComboKTV, "ccbAssitant2")
            $('#serviceTabChoosen').inputpicker({
                data: DataComboTab,
                fields: [
                    { name: 'ID', text: 'Code' },
                    { name: 'Name', text: 'Tên Dịch Vụ' },
                    { name: 'TimeToTreatment', text: 'Tổng Lần Điều Trị' },
                    { name: 'TotalTreatment', text: 'Lần Đã Điều Trị' },
                    { name: 'TreatmentLeft', text: 'Lần Còn Lại' },
                    { name: 'Created', text: 'Ngày Tạo' }
                ],
                headShow: true,
                width: '100%',
                height: '240px',
                autoOpen: false,
                listBackgroundColor: 'rgb(238, 243, 247)',
                listBorderColor: 'red',
                rowSelectedBackgroundColor: 'blue',
                rowSelectedFontColor: 'white',
                highlightResult: true,
                fieldText: 'Name',
                fieldValue: 'ID'
            });
            LoadDataUpdate();
        });
    </script>
</body>

</html>

