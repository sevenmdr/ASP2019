<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageWareHouseDetail.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageWareHouseDetail" %>

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

    <script>
                              function LoadComboBranchWareHouse() {
                                  GetDataComboBranch("/Views/WareHouse/pageWareHouseDetail.aspx/LoadComboMain",
                                      function (Branch) {
                LoadComboToken(Branch, "BranchWare")
            });
               }
               
        </script>
</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" />
    </form>
    <div class="header">
        Kho Hàng
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="two fields">
                        <div class="field">
                            <div class="field">
                                <label>Mã Kho</label>
                                <input id="CodeWare" name="codewarehouse" type="text" />
                            </div>
                        </div>
                        <div class="field">
                            <div class="field">
                                <label>Tên Kho</label>
                                <input id="NameWare" name="namewarehouse" type="text" />
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Chi Nhánh</label>
                            <select id="BranchWare" name="branchwarehouse" multiple="" class="label ui selection fluid dropdown">
                            </select>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Địa Chỉ</label>
                            <textarea id="AddressWare" name="content"></textarea>
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

        function ExcuteData() {
            var data = new Object();
            data.Code = $('#CodeWare').val() ? $('#CodeWare').val() : "";
            data.Name = $('#NameWare').val() ? $('#NameWare').val() : "";
            data.Address = $('#AddressWare').val() ? $('#AddressWare').val() : "";
            data.BranchID = $('#BranchWare').dropdown('get value').toString().substring(0, ($('#BranchWare').dropdown('get value').toString().length)/2) ? $('#BranchWare').dropdown('get value').toString().substring(0, ($('#BranchWare').dropdown('get value').toString().length)/2) : "";
            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/WareHouse/pageWareHouseDetail.aspx/ExcuteData",
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
                            LoadWareHouseAjax();
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
        // Loadcombo BranchWareHouse 



        $(document).ready(function () {
              LoadComboBranchWareHouse();
            LoadDataUpdateWareHouse();
        });

        function LoadDataUpdateWareHouse() {
            let dataWareHouse = ([<%=_dataWareHouse%>][0]);
            if (dataWareHouse) {
                $('#BranchWare').dropdown('clear')
                $('#BranchWare').dropdown('set selected', (dataWareHouse[0].BranchID.split(",")));
                $('#CodeWare').val((dataWareHouse[0].Code));
                $('#NameWare').val((dataWareHouse[0].Name));
                 $('#AddressWare').val((dataWareHouse[0].Address));
            }
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

