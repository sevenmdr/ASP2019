<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageEmployeeDetail.aspx.cs" Inherits="_2018_12_13.Views.Employee.pageEmployeeDetail" %>

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
    <script type="text/javascript">
        function LoadDataUpdate() {
            CallWebMethod();
        }
    </script>
</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    </form>
    <div class="header">
        Thông Tin Nhân Viên
    </div>


    <div class="image content">
        <div class="ui massive image">
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Wesley2012.JPG/220px-Wesley2012.JPG" />
        </div>
        <div class="description">
            <div class="sixteen wide tablet eight wide computer column">
                <div class="ui segments">
                    <form class="ui form segment form3" id="form3">
                        <div class="field">
                            <div class="field">
                                <label>Họ Và Tên</label>
                               <input name="name" type="text"/>
                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                                <label>Phòng Ban</label>
                                 <div class="ui fluid search selection dropdown">
                                    <input type="hidden" name="department" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text">Phòng Ban</div>
                                    <div id="cbbdepartment" class="menu" tabindex="-1">
                                    </div>
                                </div>
                            </div>
                            <div class="field">
                                <label>Chức Vụ</label>
                                <div class="ui fluid search selection dropdown">
                                    <input type="hidden" name="statusLevel" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text">Chức Vụ</div>
                                    <div id="cbbStatusLevel" class="menu" tabindex="-1">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="two fields">
                            <div class="field">
                                <label>Điện Thoại ( 10 Ký Tự Số )</label>
                                <input name="phonenumber" type="text"/>
                            </div>
                            <div class="field">
                                <label>Email</label>
                                <input name="email" type="text"/>            
                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                                <label>Ngày Sinh</label>
                                 <input name="birthday" class="flatpickr" type="text" placeholder="Select Date.." />
                            </div>
                            <div class="field">
                                <label>Giới Tính</label>
                               <div class="ui fluid search selection dropdown">
                                    <input type="hidden" name="gender" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text">Giới Tính</div>
                                    <div id="cbbGender" class="menu" tabindex="-1">
                                    </div>
                                </div>
                            </div>
                        </div>
                          <div class="three fields">
                              <div class="field">
                                <label>CMND</label>
                                 <input name="cmnd" type="text"/>
                            </div>
                            <div class="field">
                                <label>Ngày Cấp</label>
                               <input name="dateIssue" class="flatpickr" type="text" placeholder="Select Date.." />
                            </div>
                            <div class="field">
                                <label>Nơi Cấp</label>
                                <div class="ui fluid search selection dropdown">
                                    <input type="hidden" name="placeIssue" />
                                    <i class="dropdown icon"></i>
                                    <input class="search" autocomplete="off" tabindex="0" />
                                    <div class="default text">Nơi Cấp</div>
                                    <div id="cbbPlaceIssue" class="menu" tabindex="-1">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <div class="field">
                                <label>Địa Chỉ</label>
                                 <input name="address" type="text"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" form="form3" type="submit">Save</button>
        </div>

    </div>

    <%--Script--%>
    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/main.js"></script>

    <script>
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });

        });

    </script>

</body>

</html>
