<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageAppointmentInfo.aspx.cs" Inherits="_2018_12_13.Views.Appointment.pageAppointmentInfo" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%--    <title>Stagb Admin Template</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="/dist/semantic.min.css" rel="stylesheet" />
    <link href="/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
     <link href="/css/main.custom.css" rel="stylesheet" />
    <link href="/plugins/pacejs/pace.css" rel="stylesheet" />
    <link rel="shortcut icon" href="/img/favicon.ico" />--%>
</head>
<body>
    <div class="ui equal width left aligned padded grid stackable">
        <div class="row">
            <div class="sixteen wide column">
                <div class="ui segments">
                    <div class="ui segment">
                        <div class="ui two column middle aligned very relaxed stackable grid">
                            <div class="column">
                                <h5 class="ui header">Lịch Hẹn Khách Hàng</h5>
                            </div>
                            <div class="ui vertical divider">
                            </div>
                            <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                                <div class="ui buttons">
                                     <button class="ui green basic button modalfour" data-value="fade up" onclick="newAppointment()">Tạo Lịch Hẹn</button>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="ui segment">
                        <div class="ui feed timeline">
                            <div class="event">
                                <div class="label">
                                    <img src="https://prospectareachamber.org/wp-content/uploads/2017/12/map-marker-icon-e1512334260964.png" alt="label-image" />
                                </div>
                                <div class="content">
                                    <div class="summary">
                                        <a class="ui pointing red basic label">Checked Out</a>
                                    </div>
                                    <div class="summary">
                                        <a class="ui tag label">15-10-2018</a>
                                        <a class="ui tag label">20:10</a>
                                        <a class="ui tag label">Chi Nhánh Jarim CMT8</a>
                                        <a class="ui label">Chúng tôi xin trích nguyên văn thư chia tay của ông Bae gửi tới các tuyển thủ Việt Nam</a>
                                    </div>
                                </div>
                            </div>
                            <div class="event">
                                <div class="label">
                                    <img src="https://prospectareachamber.org/wp-content/uploads/2017/12/map-marker-icon-e1512334260964.png" alt="label-image" />
                                </div>
                                <div class="content">
                                    <div class="summary">
                                        <a class="ui blue basic label">Checked In</a>
                                        <div class="summary">
                                            <a class="ui tag label">15-10-2018</a>
                                            <a class="ui tag label">20:10</a>
                                            <a class="ui tag label">Chi Nhánh Jarim CMT8</a>
                                            <a class="ui label">Chúng tôi xin trích nguyên văn thư chia tay của ông Bae gửi tới các tuyển thủ Việt Nam</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="event">
                                <div class="label">
                                    <img src="https://prospectareachamber.org/wp-content/uploads/2017/12/map-marker-icon-e1512334260964.png" alt="label-image" />
                                </div>
                                <div class="content">
                                    <div class="summary">
                                        <a class="ui basic label">Not Yet</a>
                                        <div class="summary">
                                            <a class="ui tag label">15-10-2018</a>
                                            <a class="ui tag label">20:10</a>
                                            <a class="ui tag label">Chi Nhánh Jarim CMT8</a>
                                            <a class="ui label">Chúng tôi xin trích nguyên văn thư chia tay của ông Bae gửi tới các tuyển thủ Việt Nam</a>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="/dist/semantic.min.js"></script>
    <script src="/js/customjs/custom-timeline.js"></script>
    <script src="/js/customjs/custom-modal.js"></script>


</body>
</html>
