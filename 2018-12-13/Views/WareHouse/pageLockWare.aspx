<%@ Page Title="" Language="C#" MasterPageFile="~/Master/1_LeftNar.Master" AutoEventWireup="true" CodeBehind="pageLockWare.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageLockWare" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pusher">
        <div class="navslide navwrap">
            <div class="row">
                <div class="sixteen wide column">

                    <div class="ui segment">
                        <div class="ui two column very relaxed stackable grid">
                            <div class="column">
                                <div class="sixteen wide tablet ten wide computer column">
                                    <div class="ui segments" style="background-color: white">
                                        <form class="ui form segment form3" style="height: 65px">
                                            <div class="ui segment" style="border: none; box-shadow: none;">
                                                <div>
                                                    <div style="float: left">
                                                        <h3>Danh Sách Chốt Kho</h3>
                                                    </div>
                                                    <div style="float: right">
                                                        <button class="ui blue basic button" data-value="fade up" onclick="event.preventDefault();return AddNewLock()">Chốt Kho</button>
                                                    </div>
                                                    <div style="float: right; width: 200px">
                                                        <input id="dateTo" class="flatpickr" type="text" placeholder="Date To .." onchange="LoadLockAjax()" />
                                                    </div>
                                                    <div style="float: right; width: 200px">
                                                        <input id="dateFrom" class="flatpickr" type="text" placeholder="Date From ...." onchange="LoadLockAjax()" />
                                                    </div>

                                                </div>


                                            </div>
                                        </form>
                                        <div class="ui segment" id="TableContentLockWare">
                                            <table id="dtContentLockWare" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center">ID</th>
                                                        <th style="text-align: center">WareID</th>
                                                        <th style="text-align: center; width: 25px;">STT</th>
                                                        <th style="text-align: center">Mã Chốt</th>
                                                        <th style="text-align: center">Ngày Chốt</th>
                                                        <th style="text-align: center">Người Chốt</th>
                                                        <th style="text-align: center">Ngày Sửa</th>
                                                        <th style="text-align: center">Ngày Sửa</th>
                                                        <th style="text-align: center">Kho</th>
                                                        <th style="text-align: center; width: 30px;">Sửa</th>
                                                        <th style="text-align: center; width: 30px;">Xóa</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui vertical divider">
                            </div>
                            <div class="column" id="warehouseDetail">
                                <div class="sixteen wide tablet ten wide computer column">
                                    <div class="ui segment" style="border: none; box-shadow: none;">
                                        <div>
                                            <div style="float: left">
                                                <div class="ui right disabled labeled fluid input" style="width: 200px">
                                                    <div class="ui label">Mã Code</div>
                                                    <input id="headerLockCode" type="text" value="" disabled />
                                                    <div class="ui basic label"></div>
                                                </div>
                                            </div>
                                            <div style="float: left; width: 200px" class="ui fluid search selection dropdown" id="wareLock" onchange="event.preventDefault();return OnChangeWare()">
                                                <input type="hidden" name="warehouse" />
                                                <input class="search" autocomplete="off" tabindex="0" />
                                                <div class="default text">Chọn Kho</div>
                                                <div id="cbbWareHouse" class="menu" tabindex="-1">
                                                </div>
                                            </div>
                                            <div style="float: right">
                                                <button class="ui blue basic button" data-value="fade up" onclick="return ExecuteLock()">Lưu</button>
                                            </div>
                                            <div style="float: right">
                                                <button class="ui red basic button" data-value="fade up" onclick="return CancelLock()">Hủy</button>
                                            </div>
                                        </div>
                                        <div style="font-size: 12px; color: red" id="textShowMessage"></div>
                                    </div>
                                    <div>&nbsp</div>
                                    <div class="ui segments" style="background-color: white">
                                        <div id="TableContentLockWareDetail">
                                            <table id="dtContentLockWareDetail" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center; display: none">ID</th>
                                                        <th style="text-align: center; display: none">IDUnit</th>
                                                        <th style="text-align: center; display: none">IDProduct</th>
                                                        <th style="text-align: center; width: 25px;">STT</th>
                                                        <th style="text-align: center">Vật Liệu</th>
                                                        <th style="text-align: center">Số Lượng Tồn</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="dtContentLockWareDetailBody">
                                                </tbody>
                                            </table>
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

    <script type="text/javascript">
        var divLockList;
        var dataDetailLock;
        var DataWare;
        var newOrUpdate;
        function LoadLockAjax() {
            GetDataSourceInputList("/Views/WareHouse/pageLockWare.aspx/LoadLockList", $('#dateFrom').val() ? $('#dateFrom').val() : new Date()
                , $('#dateTo').val() ? $('#dateTo').val() : new Date(), function (data) {
                    $('#dtContentLockWare').DataTable().destroy();
                    $("#TableContentLockWare").replaceWith(divLockList.clone());
                    var table = $('#dtContentLockWare').DataTable({
                        data: data,
                        info: false,
                        paging: false,
                        ordering: false,
                        searching: false,
                        destroy: true,
                        "columnDefs": [
                            { "visible": false, "targets": 0, "data": "ID" },
                            { "visible": false, "targets": 1, "data": "WareID" },
                            { "visible": true, "targets": 2, "data": "STT", width: "50px", "className": "center" },
                            { "visible": true, "targets": 3, "data": "Code", width: "150px", "className": "center" },
                            { "visible": true, "targets": 4, "data": "Created", width: "120px" },
                            { "visible": true, "targets": 5, "data": "CreateName", width: "250px" },
                            { "visible": true, "targets": 6, "data": "Modified", width: "250px" },
                            { "visible": true, "targets": 7, "data": "ModifiedName" },
                            { "visible": true, "targets": 8, "data": "WareName" },
                            {
                                "targets": -2,
                                "data": null,
                                "defaultContent":
                                    "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                                    + "'data-value='fade up'><img class='buttonEditClass' src='/img/ButtonImg/edit.png' alt='edit' width='20' height='20'></button>",
                            },
                            {
                                "targets": -1,
                                "data": null,
                                "defaultContent":
                                    "<button class='ui blue basic button modalfour' style='margin-bottom: -3rem;margin-top: -0.5rem;box-shadow: 0 0 0 1px #ffffff !important;"
                                    + "'data-value='fade up'><img class='buttonDeleteClass' src='/img/ButtonImg/delete.png' alt='delete' width='20' height='20'></button>",
                            },

                        ],
                    });

                    document.getElementById("dtContentLockWare").className = "ui celled table";
                    $('#dtContentLockWare tbody ').on('click', '.buttonEditClass', function () {
                        var data = table.row($(this).parents('tr')).data();
                        EditLock(data["ID"], data["Code"], data["WareID"]);
                    });
                    $('#dtContentLockWare tbody ').on('click', '.buttonDeleteClass', function () {
                        var data = table.row($(this).parents('tr')).data();
                        DeleteLockList(data["ID"]);
                    });

                })
        }
        function DeleteLockList(id) {
            const promise = notiConfirm();
            promise.then(function () { ExecuteDeleteLock(id); }, function () { });
        }
        function ExecuteDeleteLock(id) {
            //$.ajax({
            //    url: "/Views/WareHouse/pageLockWare.aspx/DeleteItem",
            //    dataType: "json",
            //    type: "POST",
            //    data: JSON.stringify({ 'id': id }),
            //    contentType: 'application/json; charset=utf-8',
            //    async: false,
            //    error: function (XMLHttpRequest, textStatus, errorThrown) {
            //        notiError();
            //    },
            //    success: function (result) {
            //        if (result.d == "1") {
            //            notiSuccess();
            //            LoadLockAjax();
            //        } else {
            //            notiError(result.d);
            //        }
            //    }
            //})
        }
        $(document).ready(function () {
            $(".flatpickr").flatpickr({
                dateFormat: 'd-m-Y',
                enableTime: false,
                defaultDate: new Date(),
            });
            DataWare = ([<%=_DataWare%>][0]);
            divLockList = $("#TableContentLockWare").clone();
            document.getElementById("warehouseDetail").style.display = "none";
            LoadLockAjax();
        });
        function AddNewLock() {
            newOrUpdate = "0";
            document.getElementById("headerLockCode").value = "";
            document.getElementById("warehouseDetail").style.display = "block";
            dataDetailLock = "";
            LoadCombo(DataWare, "cbbWareHouse");
            $("#wareLock").dropdown("refresh");
            $('#wareLock').removeClass("disabled");

            return false;
        }
        function OnChangeWare() {

            if (newOrUpdate == "0") {
                let wareID = Number($('#wareLock').dropdown('get value')) ? Number($('#wareLock').dropdown('get value')) : 0;
                if (wareID != "0") {
                    GetDataLockDetailNew("/Views/WareHouse/pageLockWare.aspx/LoadLockDetailNew", wareID, function (data) {
                        dataDetailLock = data;
                        RenderLockDetail(dataDetailLock, "dtContentLockWareDetailBody");
                        document.getElementById("dtContentLockWareDetail").className = "ui celled table";
                    });
                }
            }
            return false;
        }
        function EditLock(CurrentID, Code, WareID) {
            newOrUpdate = "1";
            LoadCombo(DataWare, "cbbWareHouse");
            document.getElementById("headerLockCode").value = Code;

            $("#wareLock").dropdown("refresh");
            $("#wareLock").dropdown("set selected", Number(WareID));
            $('#wareLock').addClass("disabled");
            document.getElementById("warehouseDetail").style.display = "block";
            dataDetailLock = "";
            debugger
            GetDataLockDetail("/Views/WareHouse/pageLockWare.aspx/LoadLockDetail", CurrentID, function (data) {
                dataDetailLock = data;
                RenderLockDetail(dataDetailLock, "dtContentLockWareDetailBody");
                document.getElementById("dtContentLockWareDetail").className = "ui celled table";
            })
            return false;
        }

        //////////////// Detail

        function CancelLock() {
            document.getElementById("warehouseDetail").style.display = "none";
            return false;
        }
        function ExecuteLock() {
            let idWare = Number($('#wareLock').dropdown('get value')) ? Number($('#wareLock').dropdown('get value')) : 0;
            if (idWare == "0") {
                document.getElementById("textShowMessage").innerHTML = "Chọn Kho";
            }
            else {

                var x = document.getElementsByClassName("numberLeftDetail");
                for (var i = 0; i < x.length; i++) {
                    dataDetailLock[i].NumberLeft = x[i].value;
                }

                $.ajax({
                    url: "/Views/WareHouse/pageLockWare.aspx/ExcuteDataNew",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify({ 'dataDetail': JSON.stringify(dataDetailLock), 'idWare': idWare.toString(), 'newOrUpdate': newOrUpdate.toString() }),
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notiError("Lỗi Hệ Thống");
                    },
                    success: function (result) {
                        if (result.d == "1") {
                            notiSuccess();
                            LoadLockAjax();
                        } else {
                            notiError("Lỗi Thao Tác");
                        }
                    }
                })
                document.getElementById("warehouseDetail").style.display = "none";
                document.getElementById("textShowMessage").innerHTML = "";
            }
            return false;
        }

    </script>

    <script src="/dist/semantic.min.js"></script>
    <script src="/js/comon/load_datasource.js"></script>
</asp:Content>
