<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageLockWareDetail.aspx.cs" Inherits="_2018_12_13.Views.WareHouse.pageLockWareDetail" %>


<div class="sixteen wide tablet ten wide computer column">
    <div class="ui segment" style="border: none; box-shadow: none;">
        <div>
            <div style="float: left">
                <h3 id="headerLockCode">CODE LOCK HERE</h3>
            </div>
            <div style="float: right">
                <button class="ui blue basic button" data-value="fade up" onclick="return ExecuteLock()">Lưu</button>
            </div>
            <div style="float: right">
                <button class="ui red basic button" data-value="fade up" onclick="return CancelLock()">Hủy</button>
            </div>

        </div>
    </div>
    <div>&nbsp</div>
    <div class="ui segments" style="background-color: white">
        <div class="ui segment" id="TableContentLockWareDetail">
            <table id="dtContentLockWareDetail" style="width: 100%">
                <thead>
                    <tr>
                        <th style="text-align: center">ID</th>
                        <th style="text-align: center">IDUnit</th>
                        <th style="text-align: center">IDProduct</th>
                        <th style="text-align: center; width: 25px;">STT</th>
                        <th style="text-align: center">Vật Liệu</th>
                        <th style="text-align: center">Số Lượng Tồn</th>
                        <th style="text-align: center">Đơn Vị</th>
                        <th style="text-align: center; width: 30px;">Sửa</th>
                        <th style="text-align: center; width: 30px;">Xóa</th>
                    </tr>
                </thead>
            </table>
        </div>

    </div>
</div>


<script type="text/javascript">
     var divLockDetail;
     $(document).ready(function () {
            divLockDetail = $("#TableContentLockWareDetail").clone();
        });
</script>



