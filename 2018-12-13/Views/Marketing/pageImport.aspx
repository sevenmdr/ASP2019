<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageImport.aspx.cs" Inherits="_2018_12_13.Views.Marketing.pageImport" %>

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
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.7.7/xlsx.core.min.js"></script>

</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" />
    </form>
    <div class="header">
        Import
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="field">
                        <div class="field">
                            <label>Nguồn Dữ Liệu</label>
                            <div class="ui fluid search selection dropdown" id="sourceType">
                                <input type="hidden" name="sourceType" />
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0" />
                                <div class="default text">Nguồn Dữ Liệu</div>
                                <div id="cbbsourceType" class="menu" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Import File</label>
                            <input type="file" id="fileUpload" name="fileUpload" onchange="event.preventDefault();return handleFile(event)" />
                        </div>
                    </div>

                    <div class="field">
                        <div class="field">
                            <div style="font-size: 10px; color: red" id="textShowMessage"></div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="column" id="TableExecelImport">
                            <table class="ui celled table" id="dtTableExecelImport" style="font-size: 11px; max-width: 100%; min-width: 100%">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">Name</th>
                                        <th style="text-align: center">Phone</th>
                                    </tr>
                                </thead>
                                <tbody id="dtTableExecelImportBody">
                                </tbody>
                            </table>
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
        var divImportExcel;
        var fileName = "";
        var DataComboSource = "";
        var DataTableExcelImport;
        $(document).ready(function () {
            DataComboSource = ([<%=_DataComboSource%>][0]);
            LoadCombo(DataComboSource, "cbbsourceType");
            divImportExcel = $("#TableExecelImport").clone();
            DataTableExcelImport = new Array();
            document.getElementById("textShowMessage").innerHTML = "";
        });
        function handleFile(e) {
            DataTableExcelImport = [];
            var files = e.target.files;
            var i, f, j;
            for (i = 0, f = files[i]; i != files.length; ++i) {
                var reader = new FileReader();
                var name = f.name;
                reader.onload = function (e) {
                    var data = e.target.result;
                    var result;
                    var workbook = XLSX.read(data, { type: 'binary' });
                    var sheet_name_list = workbook.SheetNames;
                    sheet_name_list.forEach(function (y) {
                        var roa = XLSX.utils.sheet_to_json(workbook.Sheets[y]);
                        if (roa.length > 0) {
                            result = roa;
                        }
                    });
                    for (j = 0; j < result.length; j++) {
                        let element = {};
                        element.Name = result[j]["Name"];
                        element.Phone = result[j]["Phone"];
                        DataTableExcelImport.push(element);
                    }
                    RenderTableImportExcel(DataTableExcelImport, "dtTableExecelImportBody");
                    document.getElementById("dtTableExecelImport").className = "ui celled table";
                };
                reader.readAsArrayBuffer(f);
            }
            return false;
        }
        function ExcuteData() {

            var sourceID = Number($('#sourceType').dropdown('get value')) ? Number($('#sourceType').dropdown('get value')) : 0;
            var dataLength = Number(DataTableExcelImport.length) ? Number(DataTableExcelImport.length) : 0;
             if (sourceID == 0 || dataLength == 0) {
                document.getElementById("textShowMessage").innerHTML = "Data Rổng Hoặc Chưa Có Nguồn";
            }
            else {
                if ($('#form3').form('is valid')) {
                    $.ajax({
                        url: "/Views/Marketing/pageImport.aspx/ExcuteData",
                        dataType: "json",
                        type: "POST",
                        data: JSON.stringify({ 'data': JSON.stringify(DataTableExcelImport), 'sourceID': sourceID.toString() }),
                        contentType: 'application/json; charset=utf-8',
                        async: true,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            notiError();
                        },
                        success: function (result) {
                            if (result.d == "1") {
                                notiSuccess();
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
    </script>


    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/comon/noti_function.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/comon/load_datasource.js"></script>

</body>

</html>

