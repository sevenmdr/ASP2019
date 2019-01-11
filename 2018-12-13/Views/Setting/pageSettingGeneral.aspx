<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageSettingGeneral.aspx.cs" Inherits="_2018_12_13.Views.Setting.pageSettingGeneral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



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
                                        <div class="ui form">
                                            <div class="field">
                                                <label>Tên Công Ty</label>
                                                <input id="CompanyName" name="CompanyName" type="text" />
                                            </div>
                                            <div class="field">
                                                <label>HotLine</label>
                                                <input id="CompanyHotline" name="CompanyHotline" type="text" />
                                            </div>
                                            <div class="field">
                                                <label>Địa Chỉ</label>
                                                <input id="CompanyAddress" name="CompanyAddress" type="text" />
                                            </div>
                                            <div class="ui blue submit button">Lưu</div>
                                        </div>
                                    </div>
                                    <div class="ui vertical divider">
                                    </div>
                                    <div class="center aligned column">
                                        <img id="avatarCompany" class="ui mini circular image" src="#" alt="label-image" style="width: 150px; height: 150px" />
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
                                    <div class="field">
                                        <label>Tên Chi Nhánh</label>
                                        <input id="BranchName" name="BranchName" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Mã Chi Nhánh</label>
                                        <input id="BranchCode" name="BranchCode" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Địa Chỉ</label>
                                        <input id="BranchAddress" name="BranchAddress" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Vị Trí Gợi Nhớ</label>
                                        <input id="BranchAddressNote" name="BranchAddressNote" type="text" />
                                    </div>

                                    <div class="ui blue submit button">Lưu</div>

                                </form>
                            </div>
                            <div class="ui tab" data-tab="sms">
                                <form class="ui form segment">
                                    <h3 class="ui header">SMS
                                    </h3>
                                    <div class="ui hidden divider"></div>
                                    <div class="field">
                                        <label>API Key</label>
                                        <input id="SMSAPI" name="SMSAPI" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>API Secret Key</label>
                                        <input id="SMSSecretKey" name="SMSSecretKey" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>URL</label>
                                        <input id="SMSURL" name="SMSURL" type="text" />
                                    </div>

                                    <div class="field">
                                        <label>Nội Dung Đặt Lịch Không Đến (Chăm Sóc)</label>
                                        <input id="SMSContentDLKD" name="SMSContentDLKD" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Nội Dung Đến Không Làm Dịch Vụ (Chăm Sóc)</label>
                                        <input id="SMSContentDKLDV" name="SMSContentDKLDV" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Nội Dung Nhắc Lịch (Chăm Sóc)</label>
                                        <input id="SMSContentNLich" name="SMSContentNLich" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Nội Dung Chăm Sóc Sau Điều Trị (Chăm Sóc)</label>
                                        <input id="SMSContentCSSDT" name="SMSContentCSSDT" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Nội Dung Chăm Sóc Ngày Lễ (Chăm Sóc)</label>
                                        <input id="SMSContentNLe" name="SMSContentNLe" type="text" />
                                    </div>
                                    <div class="field">
                                        <label>Nội Dung SMS Cơ Bản</label>
                                        <input id="SMSContentGeneral" name="SMSContentGeneral" type="text" />
                                    </div>

                                    <div class="ui blue submit button">Lưu</div>

                                </form>
                            </div>

                            <div class="ui tab" data-tab="passworddefault">
                               <form class="ui form segment">
                                    <h3 class="ui header">Mật Khẩu Mặc Định
                                    </h3>
                                    <div class="ui hidden divider"></div>
                                    <div class="field">
                                        <label>Mật Khẩu Mặc Định</label>
                                        <input id="DefaultPassword" name="DefaultPassword" type="text" />
                                    </div>  
                                    <div class="ui blue submit button">Lưu</div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

    </script>

    <%--        <script src="/dist/semantic.min.js"></script>
        <script src="/js/comon/load_datasource.js"></script>--%>
    <%--        <script type="text/javascript" src="https://cdn.datatables.net/v/se/dt-1.10.18/b-1.5.4/datatables.min.js"></script>
        <script src="/plugins/datatable/jquery.dataTables.js"></script>--%>
</asp:Content>
