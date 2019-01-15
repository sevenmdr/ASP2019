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

                    <div class="field">
                        <div class="field">
                            <label>Dịch Vụ</label>
                            <div class="ui fluid search selection dropdown" id="tab_id">
                                <input type="hidden" name="serviceTab" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Dịch Vụ</div>
                                <div id="ccbServiceTab" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Nội Dung</label>
                             <textarea id="txtName" name="content"></textarea>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" onclick="ExcuteData()">Save</button>
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
       function LoadComboTreatment() {
            
            GetDataComboTreatment("/Views/Customer/pageTreatmentDetail.aspx/LoadComboMain",function (_DataComboDoctor,_DataComboKTV,_DataComboTab) {
        
                DataComboDoctor = _DataComboDoctor
                LoadCombo(DataComboDoctor, "ccbDoctor1")
                LoadCombo(DataComboDoctor, "ccbDoctor2")
                 DataComboKTV = _DataComboKTV
                LoadCombo(DataComboKTV, "ccbAssitant1")
                LoadCombo(DataComboKTV, "ccbAssitant2")
                 DataComboTab = _DataComboTab
                LoadCombo(DataComboTab, "ccbServiceTab")
            });
        } 
       function ExcuteData() {
            var data = new Object();
           data.Doc1 = Number($('#doc1').dropdown('get value')) ? Number($('#doc1').dropdown('get value')) : 0;
           data.Doc2 = Number($('#doc2').dropdown('get value')) ? Number($('#doc2').dropdown('get value')) : 0;
           data.Ass1 = Number($('#ass1').dropdown('get value')) ? Number($('#ass1').dropdown('get value')) : 0;
           data.Ass2 = Number($('#ass2').dropdown('get value')) ? Number($('#ass2').dropdown('get value')) : 0;
            data.Content = $('#txtName').val() ? $('#txtName').val() : "";          
            data.Tab_ID = Number($('#tab_id').dropdown('get value')) ? Number($('#tab_id').dropdown('get value')) : 0;
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
        function LoadDataUpdate() {
            let dataTreatment = ([<%=_dataTreatment%>][0]);
            if (dataTreatment) {
                
                $("#tab_id").dropdown("refresh");
                $("#tab_id").dropdown("set selected", dataTreatment[0].TabID.toString());
                $("#doc1").dropdown("refresh");
                $("#doc1").dropdown("set selected", dataTreatment[0].BS1);
                $("#doc2").dropdown("refresh");
                $("#doc2").dropdown("set selected", dataTreatment[0].BS2);
                $("#ass1").dropdown("refresh");
                $("#ass1").dropdown("set selected", dataTreatment[0].PT1);
                $("#ass2").dropdown("refresh");
                $("#ass2").dropdown("set selected", dataTreatment[0].PT2);
                $('#txtName').val((dataTreatment[0].Content));

          
            }
        }
        $(document).ready(function () {
            LoadComboTreatment();
            LoadDataUpdate();
        });
    </script>
</body>

</html>

