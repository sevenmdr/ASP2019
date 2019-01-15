<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageSettingGeneral.aspx.cs" Inherits="_2018_12_13.Views.Setting.pageSettingGeneral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="/UploadJS/css/jquery.fileupload.css" />
    <link rel="stylesheet" href="/UploadJS/css/jquery.fileupload-ui.css" />
    <script src="/UploadJS/js/vendor/jquery.ui.widget.js"></script>
    <script src="/UploadJS/js/jquery.iframe-transport.js"></script>
    <script src="/UploadJS/js/jquery.fileupload.js"></script>

    <style>
        .upload-btn-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }

        .btn {
            color: gray;
            background-color: white;
            border-radius: 8px;
            font-size: 12px;
            font-weight: bold;
        }

        .upload-btn-wrapper input[type=file] {
            font-size: 100px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
        }
    </style>
    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">
                <div class="ui equal width left aligned padded grid stackable">
                    <!--Site Content-->
                    <!--Site Content-->

                    <div class="sixteen wide tablet two wide computer column">
                        <div class="ui vertical secondary pointing fluid tabular menu">
                            <a class="item active" data-tab="company">Công Ty
                            </a>
                            <a class="item" data-tab="branch">Chi Nhánh
                            </a>
                            <a class="item" data-tab="sms">SMS
                            </a>
                            <a class="item" data-tab="passworddefault">Mật Khẩu Mặc Định
                            </a>
                        </div>
                    </div>
                    <div class="sixteen wide tablet fourteen wide computer column">
                        <div class="ui segment">
                            <div class="ui tab active" data-tab="company">
                                <div class="ui two column middle aligned very relaxed stackable grid">
                                    <div class="column">
                                        <form class="ui form segment">
                                            <div class="field">
                                                <label>Tên Công Ty</label>
                                                <input id="CompanyName" name="Name" type="text" />
                                            </div>
                                            <div class="field">
                                                <label>HotLine</label>
                                                <input id="CompanyHotline" name="CompanyHotline" type="text" />
                                            </div>
                                            <div class="field">
                                                <label>Địa Chỉ</label>
                                                <input id="CompanyAddress" name="CompanyAddress" type="text" />
                                            </div>
                                            <div class="ui blue submit button" onclick="ExcuteCompany()">Lưu</div>
                                        </form>
                                    </div>
                                    <div class="ui vertical divider">
                                    </div>
                                    <div class="center aligned column">
                                        <img id="avatarCompany" class="ui mini circular image" src="#" alt="label-image" style="width: 150px; height: 150px;margin: auto;" />
                                        <div>&nbsp</div>
                                        <div class="btn btn-success upload-btn-wrapper">
                                            <button class="btn" style="width: 100%">3Mp ( png ,jpg )</button>
                                            <input id="fileuploadAvatarCompany" type="file" name="files[]" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui tab" data-tab="branch">
                                <form class="ui form segment">
                                    <h3 class="ui header">Chi Nhánh
                                    </h3>
                                    <div class="ui hidden divider"></div>
                                    <div class="two field">
                                        <div class=" field">
                                            <label>Tên Chi Nhánh</label>
                                            <input id="BranchName" name="Name" type="text" />
                                        </div>
                                        <div class="field">
                                            <label>Chỉ Tiêu</label>
                                            <input id="Target" type="number" />
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label>Mã Chi Nhánh (5 ký tự)</label>
                                        <input id="BranchCode" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Địa Chỉ</label>
                                        <input id="BranchAddress" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Vị Trí Gợi Nhớ</label>
                                        <input id="BranchAddressNote" type="text" />
                                    </div>

                                    <div class="ui blue submit button" onclick="ExcuteBranch()">Lưu</div>

                                </form>
                            </div>
                            <div class="ui tab" data-tab="sms">
                                <form class="ui form segment">
                                    <h3 class="ui header">SMS
                                    </h3>
                                    <div class="ui hidden divider"></div>
                                    <div class="field">
                                        <label>API Key</label>
                                        <input id="SMSAPI" disabled name="SMSAPI" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>API Secret Key</label>
                                        <input id="SMSSecretKey" disabled name="SMSSecretKey" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>URL</label>
                                        <input id="SMSURL" disabled name="SMSURL" type="text" />
                                    </div>

                                    <div class="field">
                                        <label>Nội Dung Đặt Lịch Không Đến (Chăm Sóc)</label>
                                        <input id="SMSContentDLKD" disabled name="SMSContentDLKD" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Nội Dung Đến Không Làm Dịch Vụ (Chăm Sóc)</label>
                                        <input id="SMSContentDKLDV" disabled name="SMSContentDKLDV" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Nội Dung Nhắc Lịch (Chăm Sóc)</label>
                                        <input id="SMSContentNLich" disabled name="SMSContentNLich" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Nội Dung Chăm Sóc Sau Điều Trị (Chăm Sóc)</label>
                                        <input id="SMSContentCSSDT" disabled name="SMSContentCSSDT" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Nội Dung Chăm Sóc Ngày Lễ (Chăm Sóc)</label>
                                        <input id="SMSContentNLe" disabled name="SMSContentNLe" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Nội Dung SMS Cơ Bản</label>
                                        <input id="SMSContentGeneral" disabled name="SMSContentGeneral" type="text" />
                                    </div>

                                </form>
                            </div>

                            <div class="ui tab" data-tab="passworddefault">
                                <form class="ui form segment">
                                    <h3 class="ui header">Mật Khẩu Mặc Định
                                    </h3>
                                    <div class="ui hidden divider"></div>
                                    <div class="field">
                                        <label>Mật Khẩu Mặc Định</label>
                                        <input id="PasswordDefault" name="DefaultPassword" type="text" />
                                    </div>
                                    <div class="ui blue submit button" onclick="ExcuteOption()">Lưu</div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var DataBranch; // Data gender
        var DataCompany; // Data source
        var DataOption; // Data main
        var ID_DefaultPassword; // Data main
        var avatarString = ("<%=_defaultAvatar %>");
        var urlAvatar = "/UploadClass/FileUploadHandler.ashx?Type=Avatar";
        $(document).ready(function () {
    
            $('#avatarCompany').attr('src', 'data:image/png;base64, ' + avatarString);
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            $('#fileuploadAvatarCompany').fileupload({
                url: urlAvatar,
                done: function (e, data) {
                    var resulf = data._response["result"];
                    if (resulf != "0") {
                        avatarString = resulf;
                        $('#avatarCompany').attr('src', 'data:image/png;base64, ' + avatarString);
                    }
                    else {
                        notiError("Lỗi Upload");
                    }
                },
                fail: function (e, data) {
                    notiError();
                },
                maxFileSize: 5000000,
                maxNumberOfFiles: 1,
                minFileSize: undefined,
                acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,

            });

            DataBranch = ([<%=_DataBranch%>][0]);
            DataCompany = ([<%=_DataCompany%>][0]);
            DataOption = ([<%=_DataOption%>]);
            LoadDataUpdate();
        });

        function ExcuteCompany() {

            var data = new Object();
            data.Name = $('#CompanyName').val() ? $('#CompanyName').val() : "";
            data.Hotline = $('#CompanyHotline').val() ? $('#CompanyHotline').val() : "";
            data.Address = $('#CompanyAddress').val() ? $('#CompanyAddress').val() : "";

            data.Avatar = avatarString;


            $('#form3').form('validate form');
            if ($('#form3').form('is valid')) {

                $.ajax({
                    url: "/Views/Setting/pageSettingGeneral.aspx/ExcuteCompany",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data) }),
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            location.reload();
                        } else {
                            notiError("Lỗi Thao Tác");
                        }
                    }
                })
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
        }
        function ExcuteBranch() {

            var data = new Object();
            data.Name = $('#BranchName').val() ? $('#BranchName').val() : "";
            data.BranchCode = $('#BranchCode').val() ? $('#BranchCode').val() : "";
            data.Address = $('#BranchAddress').val() ? $('#BranchAddress').val() : "";
            data.BranchAddressNote = $('#BranchAddressNote').val() ? $('#BranchAddressNote').val() : "";
            data.Target = $('#Target').val() ? Number($('#Target').val()) : 0;
            $('#form4').form('validate form');
            if ($('#form4').form('is valid')) {

                $.ajax({
                    url: "/Views/Setting/pageSettingGeneral.aspx/ExcuteBranch",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data) }),
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            location.reload();

                        } else {
                            notiError("Lỗi Thao Tác");
                        }
                    }
                })
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
        }
        function ExcuteOption() {

            var data = new Object();
            data.ID = ID_DefaultPassword;
            data.Value = $('#PasswordDefault').val() ? $('#PasswordDefault').val() : "";
            $('#form5').form('validate form');
            if ($('#form5').form('is valid')) {

                $.ajax({
                    url: "/Views/Setting/pageSettingGeneral.aspx/ExcuteOption",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'data': JSON.stringify(data) }),
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            location.reload();
                        } else {
                            notiError("Lỗi Thao Tác");
                        }
                    }
                })
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
        }
        function LoadDataUpdate() {

            DataCompany = ([<%=_DataCompany%>][0]);
            if (DataCompany) {
                $('#CompanyName').val((DataCompany[0].Name));
                $('#CompanyHotline').val((DataCompany[0].Phone));
                $('#CompanyAddress').val((DataCompany[0].Address));
    
                if (DataCompany[0].Avatar == '' || DataCompany[0].Avatar == undefined) {
                    $('#avatarCompany').attr('src', 'data:image/png;base64, ' + avatarString);
                }
                else {
                    $('#avatarCompany').attr('src', 'data:image/png;base64, ' + DataCompany[0].Avatar);
                    avatarString = DataCompany[0].Avatar;
                }
            }
            DataBranch = ([<%=_DataBranch%>][0]);
            if (DataBranch) {
                $('#BranchName').val((DataBranch[0].Name));
                $('#BranchCode').val((DataBranch[0].BranchCode));
                $('#BranchAddress').val((DataBranch[0].Address));
                $('#BranchAddressNote').val((DataBranch[0].Suggest_Location));
                $('#Target').val((DataBranch[0].Target_Amount));
            }
            DataOption = ([<%=_DataOption%>][0]);
            if (DataOption) {
                $('#PasswordDefault').val(DataOption.filter(word => word["Type"] == "PasswordDefault")[0].Value);
                ID_DefaultPassword = DataOption.filter(word => word["Type"] == "PasswordDefault")[0].ID;
                $('#SMSAPI').val(DataOption.filter(word => word["Type"] == "SMSAPI")[0].Value);
                $('#SMSSecretKey').val(DataOption.filter(word => word["Type"] == "SMSSecretKey")[0].Value);
                $('#SMSURL').val(DataOption.filter(word => word["Type"] == "SMSURL")[0].Value);
                $('#SMSContentNLich').val(DataOption.filter(word => word["Type"] == "SMSContentNLich")[0].Value);
                $('#SMSContentDLKD').val(DataOption.filter(word => word["Type"] == "SMSContentDLKD")[0].Value);
                $('#SMSContentDKLDV').val(DataOption.filter(word => word["Type"] == "SMSContentDKLDV")[0].Value);
                $('#SMSContentCSSDT').val(DataOption.filter(word => word["Type"] == "SMSContentCSSDT")[0].Value);
                $('#SMSContentNLe').val(DataOption.filter(word => word["Type"] == "SMSContentNLe")[0].Value);
                $('#SMSContentGeneral').val(DataOption.filter(word => word["Type"] == "SMSContentGeneral")[0].Value);
            }
        }
    </script>

    <%--        <script src="/dist/semantic.min.js"></script>
        <script src="/js/comon/load_datasource.js"></script>--%>
    <%--        <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>
        <script src="/plugins/datatable/jquery.dataTables.js"></script>--%>
</asp:Content>
