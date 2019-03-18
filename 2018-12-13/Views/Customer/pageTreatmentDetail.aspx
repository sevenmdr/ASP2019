<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageTreatmentDetail.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageTreatmentDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <script src="/js/simple.money.format.js"></script>
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
                    </div>
                    <div class="field" id="servicenamecombo" onchange="event.preventDefault();return onChangeServiceTab()">
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
                        <div class="field" id="stageServiceCombo">
                            <label>Bước Điều Trị</label>
                            <div class="ui fluid search selection dropdown" id="stageService" onchange="event.preventDefault();return LoadMaterialByService();">
                                <input type="hidden" name="stageService" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Bước Điều Trị</div>
                                <div id="cbbstageService" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field" id="stagenamediv">
                        <div class="field">
                            <label>Bước Điều Trị</label>
                            <input id="txtNameStage" name="" type="text" disabled />
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Nội Dung</label>
                            <input id="txtName" name="content" type="text" />
                        </div>
                    </div>
                    <div class="ui accordion field">
                        <div class="title active">
                            <i class="icon dropdown"></i>Vật Liệu Tiêu Hao
                        </div>
                        <div class="content field active">
                            <div class="ui segments" style="background-color: white">
                                <div id="TableProductDetail">
                                    <table class="ui celled table" id="dtContentProductDetail" style="font-size: 11px; max-width: 100%; min-width: 100%">
                                        <thead>
                                            <tr>

                                                <th style="text-align: center; display: none">IDUnit</th>
                                                <th style="text-align: center; display: none">IDProduct</th>
                                                <th style="text-align: center; width: 25px;">STT</th>
                                                <th style="text-align: center">Vật Liệu</th>
                                                <th style="text-align: center">Số Lượng</th>
                                            </tr>
                                        </thead>
                                        <tbody id="dtContenProductDetailBody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ui accordion field">
                        <div class="title">
                            <i class="icon dropdown"></i>Khác
                        </div>
                        <div class="content field">
                            <div class="two fields">
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
                            <div class="field">
                                <div class="field">
                                    <label>Hoa Hồng Điều trị</label>
                                    <div class="ui right labeled fluid input">
                                        <div class="ui label">$</div>
                                        <input id="TreatmentAmount" name="discountOther" type="text" class="money" />
                                        <div class="ui basic label">VND</div>
                                    </div>
                                </div>
                            </div>
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
        var dataDetailProduct;
        function LoadMaterialByService() {
            dataDetailProduct = "";
            let stageID = Number($('#stageService').dropdown('get value'))
                ? Number($('#stageService').dropdown('get value')) : 0;
            GetDataTreatmentMaterial("/Views/Customer/pageTreatmentDetail.aspx/LoadProductByStage", stageID, function (data) {
                dataDetailProduct = data;
                RenderMaterialTreatmentDetail_Insert(dataDetailProduct, "dtContenProductDetailBody");
                document.getElementById("dtContentProductDetail").className = "ui celled table";
            });
            return false;
        }


        function onChangeServiceTab() {
            ExcuteService();
            dataDetailProduct = "";
            return false;
        }
        function ExcuteData() {
            var data = new Object();
            let tabID = Number($('#serviceTabChoosen').val()) ? Number($('#serviceTabChoosen').val()) : 0;
            data.Doc1 = Number($('#doc1').dropdown('get value')) ? Number($('#doc1').dropdown('get value')) : 0;
            data.Doc2 = Number($('#doc2').dropdown('get value')) ? Number($('#doc2').dropdown('get value')) : 0;
            data.Ass1 = Number($('#ass1').dropdown('get value')) ? Number($('#ass1').dropdown('get value')) : 0;
            data.Ass2 = Number($('#ass2').dropdown('get value')) ? Number($('#ass2').dropdown('get value')) : 0;
            data.StageID = Number($('#stageService').dropdown('get value')) ? Number($('#stageService').dropdown('get value')) : 0;
            data.Content = $('#txtName').val() ? $('#txtName').val() : "";
            data.Tab_ID = tabID;
            data.TreatmentAmount = $('#TreatmentAmount').val() ? $('#TreatmentAmount').val() : 0;
            if (document.getElementById("servicenamecombo").style.display == "block" && tabID == 0) {
                document.getElementById("textShowMessage").innerHTML = "Chọn Dịch Vụ Điều Trị";
            }
            else {
                var x = document.getElementsByClassName("numberLeftDetail");
                for (var i = 0; i < x.length; i++) {
                    dataDetailProduct[i].Number = x[i].value;
                }
                document.getElementById("textShowMessage").innerHTML = "";
                if ($('#form3').form('is valid')) {
                    $.ajax({
                        url: "/Views/Customer/pageTreatmentDetail.aspx/ExcuteData",
                        dataType: "json",
                        type: "POST",
                        data: JSON.stringify({ 'data': JSON.stringify(data), 'dataDetailProduct': JSON.stringify(dataDetailProduct) }),
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

        function ExcuteService() {

            let AmountTreat = 0
            let PerTreat = 0
            let priceService = 0
            let serviceID = 0;
            let serviceTabChoosen = Number($('#serviceTabChoosen').val());
            priceService = DataComboTab.filter(word => word["ID"] == serviceTabChoosen)[0]["Price"];
            AmountTreat = DataComboTab.filter(word => word["ID"] == serviceTabChoosen)[0]["AmountTreat"];
            PerTreat = DataComboTab.filter(word => word["ID"] == serviceTabChoosen)[0]["PerTreat"];
            serviceID = DataComboTab.filter(word => word["ID"] == serviceTabChoosen)[0]["ServiceID"];
            if (AmountTreat != 0) {
                AmountTreat = AmountTreat;
            }
            else {
                AmountTreat = PerTreat * priceService / 100;
            }
            $('#TreatmentAmount').val(Number(AmountTreat));
            // Load Stage
            $('#stageService').dropdown('clear');
            GetDataStageByService("/Views/Customer/pageTreatmentDetail.aspx/LoadStageByService", serviceID, function (data) {
                LoadCombo(data, "cbbstageService")
            });
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
                $('#txtNameStage').val((dataTreatment[0].StageName));

                $('#TreatmentAmount').val(Number(dataTreatment[0].TreatmentAmount));

                document.getElementById("servicenamecombo").style.display = "none";
                document.getElementById("servicenamediv").style.display = "block";
                document.getElementById("stageServiceCombo").style.display = "none";
                document.getElementById("stagenamediv").style.display = "block";

                // gender when update, khong cho sua
                debugger
                RenderMaterialTreatmentDetail_Update(([<%=_dataMaterialWhenUpdate%>][0]), "dtContenProductDetailBody");
                document.getElementById("dtContentProductDetail").className = "ui celled table";


            }
            else {
                document.getElementById("servicenamecombo").style.display = "block";
                document.getElementById("servicenamediv").style.display = "none";
                document.getElementById("stageServiceCombo").style.display = "block";
                document.getElementById("stagenamediv").style.display = "none";
            }
        }
        $(document).ready(function () {
            document.getElementById("textShowMessage").innerHTML = "";
            DataComboDoctor = ([<%=_dataComboDoctor%>][0]);
            DataComboKTV = ([<%=_dataComboAssist%>][0]);
            DataComboTab = ([<%=_dataComboService%>][0]);
            LoadCombo(DataComboDoctor, "ccbDoctor1");
            LoadCombo(DataComboDoctor, "ccbDoctor2");
            LoadCombo(DataComboKTV, "ccbAssitant1");
            LoadCombo(DataComboKTV, "ccbAssitant2");
            dataDetailProduct = "";
            $('#TreatmentAmount').divide();
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

