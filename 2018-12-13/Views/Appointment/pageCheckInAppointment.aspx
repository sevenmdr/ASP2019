<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageCheckInAppointment.aspx.cs" Inherits="_2018_12_13.Views.Appointment.pageCheckInAppointment" %>

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
                                <h5 class="ui header">Tình Trạng Lịch Hẹn</h5>
                            </div>
                            <div class="ui vertical divider">
                            </div>
                        </div>

                    </div>
                    <div class="ui segment">
                        <div id="radios">
                            <input id="option1" name="options" type="radio">
                            <label for="option1" style="font-size:14px">None</label>
                            <input id="option2" name="options" type="radio">
                            <label for="option2" style="font-size:14px">In</label>
                            <input id="option3" name="options" type="radio" checked>
                            <label for="option3" style="font-size:14px">Out</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="/dist/semantic.min.js"></script>
<%--    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>

    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/main.js"></script>--%>

        <script src="/plugins/radioslider/jquery.radios-to-slider.js"></script>
    <link href="/plugins/radioslider/radios-to-slider.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $("#radios").radiosToSlider();
        });
    </script>
</body>
</html>
