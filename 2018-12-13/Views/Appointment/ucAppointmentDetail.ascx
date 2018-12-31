<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAppointmentDetail.ascx.cs" Inherits="_2018_12_13.Views.Appointment.ucAppointmentDetail" %>
<body>
    <div class="header">
        Lịch Hẹn Khách Hàng
    </div>
    <div class="row">
        <div class="sixteen wide tablet eight wide computer column">
            <div class="ui segments">
                <form class="ui form segment form3" id="form3">
                    <div class="three fields">
                        <div class="field">
                            <label>Loại Lịch Hẹn</label>
                            <div class="ui fluid search selection dropdown">
                                <input type="hidden" name="appointment">
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0">
                                <div class="default text">Loại Lịch Hẹn</div>
                                <div class="menu" tabindex="-1">
                                    <div class="item" data-value="0">Afghanistan</div>
                                    <div class="item" data-value="100">Aland Islands</div>
                                    <div class="item" data-value="200">Wallis and Futuna</div>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Ngày Hẹn</label>
                            <div class="ui input fluid">
                                <input id="date" name="date" type="text" class="datedrop" placeholder="Chọn Ngày...">
                            </div>
                        </div>
                        <div class="field">
                            <label>Giờ Hẹn</label>
                            <div class="ui input fluid">
                                <input id="hourid" name="hour" type="text" class="alarm" placeholder="Chọn Giờ...">
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Chi Nhánh</label>
                            <input type="text" onchange="aaaaaa()" />
                        </div>
                    </div>

                    <div class="field">
                        <div class="field">
                            <label>Chi Nhánh</label>
                            <div class="ui fluid search selection dropdown">
                                <input type="hidden" name="name" id="branch" onchange="aaaaaa()">
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0">
                                <div class="default text">Chọn Chi Nhánh</div>
                                <div class="menu" tabindex="-1">
                                    <div class="item" data-value="af">Afghanistan</div>
                                    <div class="item" data-value="ax">Aland Islands</div>
                                    <div class="item" data-value="wf">Wallis and Futuna</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Dịch Vụ Quan Tâm</label>
                            <div class="ui fluid search dropdown selection multiple">
                                <select name="serviceCare" multiple="">
                                    <option value="">Dịch Vụ Quan Tâm</option>
                                    <option value="AL">Alabama</option>
                                    <option value="AK">Alaska</option>
                                    <option value="AZ">Arizona</option>
                                    <option value="AR">Arkansas</option>
                                </select>
                                <i class="dropdown icon"></i>
                                <input class="search" autocomplete="off" tabindex="0">
                                <div class="default text">Dịch Vụ Quan Tâm</div>
                                <div class="menu" tabindex="-1">
                                    <div class="item" data-value="AL">Alabama</div>
                                    <div class="item" data-value="AK">Alaska</div>
                                    <div class="item" data-value="AZ">Arizona</div>
                                    <div class="item" data-value="AR">Arkansas</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field">
                            <label>Bác Sĩ</label>
                            <div class="ui fluid search selection dropdown">
                                <input type="hidden" name="branch">
                                <i class="dropdown icon"></i>
                                <input name="doctor" class="search" autocomplete="off" tabindex="0">
                                <div class="default text">Chọn Bác Sĩ</div>
                                <div id="doctordiv" class="menu" tabindex="-1">
                                    <div class="item" data-value="af">Afghanistan</div>
                                    <div class="item" data-value="ax">Aland Islands</div>
                                    <div class="item" data-value="wf">Wallis and Futuna</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="actions">
        <div style="float: right">
            <button class="ui teal button" onclick="return displayDate()" form="form3" type="submit">Save</button>
        </div>

    </div>

    <%--Script--%>
    <script src="/dist/semantic.min.js"></script>
    <script src="/plugins/cookie/js.cookie.js"></script>
    <script src="/plugins/nicescrool/jquery.nicescroll.min.js"></script>
    <script data-pace-options='{ "ajax": false }' src="/plugins/pacejs/pace.js"></script>
    <script src="/js/customjs/custom-validation.js"></script>
    <script src="/js/main.js"></script>
    <script src="/plugins/datedropper/datedropper.min.js"></script>
    <script src="/plugins/timedropper/timedropper.min.js"></script>
    <script src="/plugins/radioslider/jquery.radios-to-slider.js"></script>

    <script>
        $(document).ready(function () {
            $("#radios").radiosToSlider();
            $('.datedrop').dateDropper();
            $(".alarm").timeDropper();
        });
        //displayDate();
        function displayDate() {
            //$(".ui.standard.test.modal").modal("hide");
            alert(new Date());
            var result = '[{ "ID": "ALFKI", "Name": "Alfreds Futterkiste", "Purchases": null }, { "ID": "ALFKIsssssssssss", "Name": "Alfreds Futterkiste", "Purchases": null }]';
            LoadCombo(result, "doctordiv");
            return true;
        }
        function aaaaaa() {
            var singleValues = $("#branch").val();
            alert(singleValues);
        }
        $("#datedropper-0").change(function () {
            alert("Handler for .change() called.");
        });
        function displayVals() {
            var singleValues = $("#branch").val();
            var multipleValues = $("#multiple").val() || [];
            // When using jQuery 3:
            // var multipleValues = $( "#multiple" ).val();
            $("p").html("<b>Single:</b> " + singleValues +
                " <b>Multiple:</b> " + multipleValues.join(", "));
        }
        $("#hour").change(function () {   // 1st
            var singleValues = $("#hour").val();
            alert(singleValues);
        });
        $(document).ready(function () {
            
            var singleValues = $("#hourid").val();
            alert(singleValues);
        });
        $('.body').waypoint(function () {
            alert('The element has appeared on the screen.');
        });
        $("form3").focus(function () {
            alert("Handler for .focus() called.");
        });
        $("select").change(displayVals);
        displayVals();
      
    </script>
</body>
