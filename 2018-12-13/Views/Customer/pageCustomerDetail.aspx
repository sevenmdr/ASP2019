<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageCustomerDetail.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageCustomerDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <%--    <link rel="icon" href="~/img/favicon.ico" />--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />--%>
    <%--    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />--%>
    <%--    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />--%>
    <%--    <link href="/css/main.css" rel="stylesheet" />
    <link href="/dist/semantic.min.css" rel="stylesheet" />
    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />--%>
    <%--    <script src="/dist/semantic.min.js"></script>--%>
    <%--    <link href="/css/main.custom.css" rel="stylesheet" />--%>
    <%--    <link rel="shortcut icon" href="~/img/favicon.ico" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />--%>
    <script src="/js/comon/noti_function.js"></script>
    <%--    <script src="/js/customjs/custom-validation.js"></script>--%>
    <script src="/js/comon/load_datasource.js"></script>
    <%--    <script src="/js/comon/renderControl.js"></script>--%>
    <%--    <script src="/js/customjs/custom-progress.js"></script>--%>
    <%--  <script src="/UploadJS/js/vendor/jquery.ui.widget.js"></script>
    <script src="/UploadJS/js/jquery.iframe-transport.js"></script>
    <script src="/UploadJS/js/jquery.fileupload.js"></script>--%>

    <script type="text/javascript">
        var dataInfo;
        function ChaneUpdateData(data) {
            dataInfo = data[0];
        }
    </script>
</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" />
    </form>
    <div class="header">
        Thông Tin Khách Hàng
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
                            <div class="field">
                                <label>Họ Và Tên</label>
                                <input id="Name" name="name" type="text" />
                            </div>
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
                                <label>Nguồn</label>
                                <div class="ui fluid search selection dropdown" id="Type_Cat_ID">
                                    <input type="hidden" name="source" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text">Nguồn Khách Hàng</div>
                                    <div id="cbbSource" class="menu" tabindex="-1">
                                    </div>
                                </div>
                            </div>
                            <div class="field">
                                <label>Ngôn Ngữ</label>
                                <div class="ui fluid search selection dropdown" id="Language_ID">
                                    <input type="hidden" name="language" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text">Ngôn Ngữ</div>
                                    <div id="cbbLanguage" class="menu" tabindex="-1">
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
            <button class="ui teal button" form="form3" onclick="ExcuteData()">Save</button>
        </div>
    </div>
    <script>
        function ExcuteData() {

            var data = new Object();
            data.Gender_ID = Number($('#Gender_ID').dropdown('get value')) ? Number($('#Gender_ID').dropdown('get value')) : 0;
            data.Type_Cat_ID = Number($('#Type_Cat_ID').dropdown('get value')) ? Number($('#Type_Cat_ID').dropdown('get value')) : 0;
            data.Language_ID = Number($('#Language_ID').dropdown('get value')) ? Number($('#Language_ID').dropdown('get value')) : 0;
            data.Email1 = $('#Email1').val() ? $('#Email1').val() : "";
            data.Address = $('#Address').val() ? $('#Address').val() : "";
            data.Phone1 = $('#Phone1').val() ? $('#Phone1').val() : "";
            data.Name = $('#Name').val() ? $('#Name').val() : "";
            data.Birthday = $('#Birthday').val() ? $('#Birthday').val() : "";

            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {
                $.ajax({
                    url: "/Views/Customer/pageCustomerDetail.aspx/ExcuteData",
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
                            location.reload();
                        } else {
                            notiError("Lỗi Thêm Mới");
                        }
                    }
                });
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
        }
        // Loadcombo status type
        var DataComboGender;
        function LoadComboCustomer() {
            GetDataComboCustomer("/Views/Customer/pageCustomerDetail.aspx/LoadComboMain", function (dataLangue, dataSource, dataGender) {
                LoadCombo(dataGender, "cbbGender")
                LoadCombo(dataSource, "cbbSource")
                LoadCombo(dataLangue, "cbbLanguage")
            });
        }
        $(document).ready(function () {
            LoadComboCustomer();

            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            LoadDataUpdate();
        });
        function LoadDataUpdate() {
            if (dataInfo) {
                $("#Gender_ID ").dropdown("refresh");
                $("#Gender_ID ").dropdown("set selected", dataInfo.Gender_ID);
                $("#Type_Cat_ID ").dropdown("refresh");
                $("#Type_Cat_ID ").dropdown("set selected", dataInfo.Type_Cat_ID);
                $("#Language_ID ").dropdown("refresh");
                $("#Language_ID ").dropdown("set selected", dataInfo.Language_ID);
                $('#Name').val((dataInfo.Name));
                $('#Email1').val((dataInfo.Email1));
                $('#Address').val((dataInfo.Address));
                $('#Phone1').val((dataInfo.Phone1));
                $(".flatpickr").flatpickr({ defaultDate: dataInfo.Birthday });
            }
        }
    </script>
    <script src="/dist/semantic.min.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
</body>

</html>
