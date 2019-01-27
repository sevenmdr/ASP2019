<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageCustomerDetail.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageCustomerDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VTTech Solution</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/UploadJS/css/jquery.fileupload.css" />
    <link rel="stylesheet" href="/UploadJS/css/jquery.fileupload-ui.css" />
    <script src="/UploadJS/js/vendor/jquery.ui.widget.js"></script>
    <script src="/UploadJS/js/jquery.iframe-transport.js"></script>
    <script src="/UploadJS/js/jquery.fileupload.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />--%>
    <%--    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />--%>
    <%--    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />--%>
    <%--    <link href="/css/main.css" rel="stylesheet" />
    <link href="/dist/semantic.min.css" rel="stylesheet" />
    <link href="/dist/semantic.min.custom.css" rel="stylesheet" />--%>
    <%--    <script src="/dist/semantic.min.js"></script>--%>
    <%--    <link href="/css/main.custom.css" rel="stylesheet" />--%>
    <%--    <link rel="shortcut icon" href="/img/favicon.ico" />
    <link href="/plugins/lobibox/css/lobibox.css" rel="stylesheet" />--%>
    <script src="/js/comon/noti_function.js"></script>
    <%--    <script src="/js/customjs/custom-validation.js"></script>--%>
    <script src="/js/comon/load_datasource.js"></script>
    <%--    <script src="/js/comon/renderControl.js"></script>--%>
    <%--    <script src="/js/customjs/custom-progress.js"></script>--%>
    <%--  <script src="/UploadJS/js/vendor/jquery.ui.widget.js"></script>
    <script src="/UploadJS/js/jquery.iframe-transport.js"></script>
    <script src="/UploadJS/js/jquery.fileupload.js"></script>--%>

    <%-- <script type="text/javascript">
        var dataInfo;
        function ChaneUpdateData(data) {
            dataInfo = data[0];
        }
    </script>--%>

    <%--    <script src="/plugins/datatable/jquery.dataTables.js"></script>
    <script src="/js/customjs/custom-datatable.js"></script>--%>
    <script src="/js/comon/renderControl.js"></script>
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

            <img id="avatarCustomerUpload" class="ui mini circular image" src="#" alt="label-image" style="width: 150px; height: 150px" />
            <div>&nbsp</div>
            <div class="btn btn-success upload-btn-wrapper">
                <button class="btn" style="width: 100%">3Mp ( png ,jpg )</button>
                <input id="fileuploadAvatar" type="file" name="files[]" />
            </div>
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
                                <label>Điện Thoại ( 10 Ký Tự Số )</label>
                                <input id="Phone2" name="phonenumberNotMain" type="text" />
                            </div>

                        </div>
                        <div class="field">
                            <div class="field">
                                <label>Email</label>
                                <input id="Email1" name="email" type="text" />

                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                                <label>Instagram</label>
                                <input id="instgramurl" name="instgramurl" type="text" />
                            </div>
                            <div class="field">
                                <label>Facebook</label>
                                <input id="facebookurl" name="facebookurl" type="text" />

                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                                <label>Ngày Sinh</label>
                                <input id="Birthday" class="flatpickr" type="text" placeholder="Select Date.." />
                            </div>
                            <div class="field">
                                <label>Giới Tính</label>
                                <div class="ui fluid search selection dropdown" id="Gender_ID" onchange="event.preventDefault();">
                                    <input type="hidden" name="gender" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text">Giới Tính</div>
                                    <div id="cbbGenderCustomer" class="menu" tabindex="-1">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="two fields">
                            <div class="field">
                                <label>Nguồn</label>
                                <div class="ui fluid search selection dropdown" id="Type_Cat_ID" onchange="event.preventDefault();">
                                    <input type="hidden" name="source" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text">Nguồn Khách Hàng</div>
                                    <div id="cbbSourceCustomer" class="menu" tabindex="-1">
                                    </div>
                                </div>
                            </div>
                            <div class="field">
                                <label>Ngôn Ngữ</label>
                                <div class="ui fluid search selection dropdown" id="Language_ID" onchange="event.preventDefault();">
                                    <input type="hidden" name="language" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text">Ngôn Ngữ</div>
                                    <div id="cbbLanguageCustomer" class="menu" tabindex="-1">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <div class="field">
                                <div class="ui toggle checkbox">
                                    <input id="chkIsOldCustomer" type="checkbox" checked="checked" name="newsletter" />
                                    <label id="lbOldCustomr" class="coloring blue">Khách Hàng Cũ</label>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Ghi Chú</label>
                            <input id="txtContent" name="content" type="text" />

                        </div>


                        <div class="two fields">
                            <div class="field">
                                <label>Thành Phố</label>
                                <div class="ui fluid search selection dropdown" id="CityID" onchange="return LoadComboCity()">
                                    <input type="hidden" name="source" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text"></div>
                                    <div id="cbbCity" class="menu" tabindex="-1">
                                    </div>
                                </div>
                            </div>
                            <div class="field">
                                <label>Quận/Huyện</label>
                                <div class="ui fluid search selection dropdown" id="DistrictID" onchange="return ExcuteAddress();">
                                    <input type="hidden" name="language" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text"></div>
                                    <div id="cbbDisstrict" class="menu" tabindex="-1">
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
            <button class="ui teal button" form="form3" onclick="event.preventDefault();ExcuteData()">Save</button>
        </div>
    </div>
    <script>
        var urlAvatar = "/UploadClass/FileUploadHandler.ashx?Type=Avatar";
        var avatarString = ("<%=_defaultAvatar %>");
        var DataComboGender;
        var loadtemp = 1;
        var dataGender;
        var dataSource;
        var dataLangue;
        var dataCity;
        var dataDistrict;
        function ExcuteData() {

            var data = new Object();
            data.Gender_ID = Number($('#Gender_ID').dropdown('get value')) ? Number($('#Gender_ID').dropdown('get value')) : 0;
            data.Type_Cat_ID = Number($('#Type_Cat_ID').dropdown('get value')) ? Number($('#Type_Cat_ID').dropdown('get value')) : 0;
            data.Language_ID = Number($('#Language_ID').dropdown('get value')) ? Number($('#Language_ID').dropdown('get value')) : 0;
            data.Email1 = $('#Email1').val() ? $('#Email1').val() : "";
            data.Address = $('#Address').val() ? $('#Address').val() : "";
            data.Phone1 = $('#Phone1').val() ? $('#Phone1').val() : "";
            data.Phone2 = $('#Phone2').val() ? $('#Phone2').val() : "";

            data.Name = $('#Name').val() ? $('#Name').val() : "";
            data.Birthday = $('#Birthday').val();
            data.Avatar = avatarString;
            data.instgramurl = $('#instgramurl').val() ? $('#instgramurl').val() : "";
            data.facebookurl = $('#facebookurl').val() ? $('#facebookurl').val() : "";
            data.City = Number($('#CityID').dropdown('get value')) ? Number($('#CityID').dropdown('get value')) : 0;
            data.District = Number($('#DistrictID').dropdown('get value')) ? Number($('#DistrictID').dropdown('get value')) : 0;
            data.Note = $('#txtContent').val() ? $('#txtContent').val() : "";
            data.OldCustomer = (document.getElementById("chkIsOldCustomer").checked) ? "1" : "0";
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
                            location.reload();
                        }
                        else if (result.d == "0") {
                            notiError(result.d);

                        }
                        else {
                            //  notiSuccess();
                            window.open("/Views/Customer/MainCustomer.aspx?CustomerID=" + result.d);
                        }
                    }
                });
                $('#divDetailPopup').modal('hide');
                document.getElementById("divDetailPopup").innerHTML = '';
            }
            return false;
        }


        function LoadComboCustomer() {
            dataGender = ([<%=_dataGender%>][0]);
            dataSource = ([<%=_dataSource%>][0]);
            dataLangue = ([<%=_dataLangue%>][0]);
            dataCity = ([<%=_dataCity%>][0]);
            
            LoadCombo(dataGender, "cbbGenderCustomer")
            LoadCombo(dataSource, "cbbSourceCustomer")
            LoadCombo(dataLangue, "cbbLanguageCustomer")
            
                LoadCombo(dataCity, "cbbCity");
            dataDistrict = ([<%=_dataDistrict%>][0]);

            $("#Gender_ID ").dropdown("refresh");
            $("#Type_Cat_ID ").dropdown("refresh");
            $("#Language_ID ").dropdown("refresh");
            $("#CityID ").dropdown("refresh");
            $("#DistrictID ").dropdown("refresh");
        }
        function LoadComboCity() {

            let _dataDistrict = dataDistrict
            if (Number($('#CityID').dropdown('get value'))) {
                _dataDistrict = dataDistrict.filter(word => word["CityID"] == Number($('#CityID').dropdown('get value')));
            }
            LoadCombo(_dataDistrict, "cbbDisstrict")

            ExcuteAddress();
            return false;
        }
        function ExcuteAddress() {
            $('#Address').val(($('#DistrictID').dropdown('get text') ? "," + $('#DistrictID').dropdown('get text') : "") + ($('#CityID').dropdown('get text') ? "," + $('#CityID').dropdown('get text') : ""));
            return false;
        }
        $(document).ready(function () {

            $('#avatarCustomerUpload').attr('src', 'data:image/png;base64, ' + avatarString);
            LoadComboCustomer();
            $(".flatpickr").flatpickr({
                dateFormat: 'Y-m-d',
                enableTime: false,
                defaultDate: new Date(),
            });
            $('#fileuploadAvatar').fileupload({
                url: urlAvatar,
                done: function (e, data) {
                    var resulf = data._response["result"];
                    if (resulf != "0") {
                        avatarString = resulf;
                        $('#avatarCustomerUpload').attr('src', 'data:image/png;base64, ' + avatarString);
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
            LoadDataUpdate();
        });

        function LoadDataUpdate() {
        
            let dataInfo = ([<%=_dataInfo%>][0]);
            if (dataInfo != undefined) {
                
                $("#Gender_ID ").dropdown("refresh");
                $("#Gender_ID ").dropdown("set selected", dataInfo[0].Gender_ID);
                $("#Type_Cat_ID ").dropdown("refresh");
                $("#Type_Cat_ID ").dropdown("set selected", dataInfo[0].Type_Cat_ID);
                $("#Language_ID ").dropdown("refresh");
                $("#Language_ID ").dropdown("set selected", dataInfo[0].Language_ID);
                $('#Name').val((dataInfo[0].Name));
                $('#txtContent').val((dataInfo[0].Note));
                $('#Email1').val((dataInfo[0].Email1));
                $('#Phone1').val((dataInfo[0].Phone1));
                $('#Phone2').val((dataInfo[0].Phone2));
                $('#instgramurl').val((dataInfo[0].instgramurl));
                $('#facebookurl').val((dataInfo[0].facebookurl));
                $("#CityID ").dropdown("refresh");
                $("#CityID ").dropdown("set selected", dataInfo[0].City_ID);
                $("#DistrictID ").dropdown("refresh");
                $("#DistrictID ").dropdown("set selected", dataInfo[0].District_ID);


                $('#Address').val((dataInfo[0].Address));
                (dataInfo[0].OldCustomer) == 1 ? $("#chkIsOldCustomer").prop('checked', true) : $("#chkIsOldCustomer").prop('checked', false);
                if (dataInfo[0].Avatar == '' || dataInfo[0].Avatar == undefined) {
                    $('#avatarCustomerUpload').attr('src', 'data:image/png;base64, ' + avatarString);
                }
                else {
                    $('#avatarCustomerUpload').attr('src', 'data:image/png;base64, ' + dataInfo[0].Avatar);
                    avatarString = dataInfo[0].Avatar;
                }
                $(".flatpickr").flatpickr({ defaultDate: dataInfo[0].Birthday });
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
