﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pagePaymentPrint.aspx.cs" Inherits="_2018_12_13.Views.Customer.pagePaymentPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Print Payment</title>

    <style>
        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, .15);
            font-size: 16px;
            line-height: 24px;
            font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
            color: #555;
        }

            .invoice-box table {
                width: 100%;
                line-height: inherit;
                text-align: left;
            }

                .invoice-box table td {
                    padding: 5px;
                    vertical-align: top;
                }

                .invoice-box table tr td:nth-child(2) {
                    text-align: right;
                }

                .invoice-box table tr.top table td {
                    padding-bottom: 20px;
                }

                    .invoice-box table tr.top table td.title {
                        font-size: 15px;
                        line-height: 15px;
                        color: #333;
                    }

                .invoice-box table tr.information table td {
                    padding-bottom: 40px;
                }

                .invoice-box table tr.heading td {
                    background: #eee;
                    border-bottom: 1px solid #ddd;
                    font-weight: bold;
                }

                .invoice-box table tr.details td {
                    padding-bottom: 20px;
                }

                .invoice-box table tr.item td {
                    border-bottom: 1px solid #eee;
                }

                .invoice-box table tr.item.last td {
                    border-bottom: none;
                }

                .invoice-box table tr.total td:nth-child(2) {
                    border-top: 2px solid #eee;
                    font-weight: bold;
                }

        @media only screen and (max-width: 600px) {
            .invoice-box table tr.top table td {
                width: 100%;
                display: block;
                text-align: center;
            }

            .invoice-box table tr.information table td {
                width: 100%;
                display: block;
                text-align: center;
            }
        }

        .payment-header {
            font-size: 15px;
            display: flex;
            flex-direction: row;
        }

        .text-right {
            text-align: right;
            position: absolute;
            float: right;
            right: 10px;
        }

        .Total {
            font-size: 15px;
            display: flex;
            flex-direction: row;
            padding-bottom: 55px;
        }

        .m-0 {
            font-size: 15px;
        }

        /** RTL **/
        .rtl {
            direction: rtl;
            font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        }

            .rtl table {
                text-align: right;
            }

                .rtl table tr td:nth-child(2) {
                    text-align: left;
                }
    </style>
    <script type="text/javascript">
        var dataPrint;

        function PrintDetail(data) {
            dataPrint = data[0];
        }

    </script>
</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager123232323232322" runat="server" EnablePageMethods="true" />
    </form>



    <div class="invoice-box">
        <table>
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="title">
                                <div class="col-6">
                                    <p>
                                        <img id="logo" src="/img/logo/LogoCompany.png" style="height: 80px;" />
                                    </p>
                                    <p style="font-size: 13px;font-weight: bold;">Viện Thẫm Mỹ Jarim</p>
                                    <p id="Address">123</p>
                                    <p id="hotline">123</p>
                                </div>
                            </td>

                            <td>
                                <p class="m-0">Mẫu số: 01-TT</p>
                                <p class="m-0">(Ban hành theo QĐ số: 15/2006/QĐ-BTC ngày 20/03/2006)</p>
                                <b class="mb-0 mt-2" style="font-size: 14px;" id="Invoicenum"></b>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="information">
                <td colspan="3">
                    <div>

                        <p style="text-align: center; font-size: 25px">Phiếu Thu</p>
                        <p id="Datenow" style="text-align: center; font-size: 15px;">19/09/2019</p>
                    </div>
                </td>
            </tr>
            <tr class="item">
                <td style="width: 80px" colspan="1">Họ Tên
                </td>
                <td id="CusName" style="text-align: left;"></td>
            </tr>

            <tr class="item">
                <td style="width: 80px" colspan="1">Số Tiền
                </td>
                <td id="Amount" style="text-align: left;"></td>
            </tr>

            <tr class="item">
                <td style="width: 80px" colspan="1">Lý do thu
                </td>
                <td id="Content" style="text-align: left;"></td>
            </tr>
            <tr class="item">
                <td style="width: 150px" colspan="1">Số tiền bằng chữ
                </td>
                <td id="Amountword" style="text-align: left;"></td>
            </tr>
            <tr class="item">
                <td style="width: 150px" colspan="1">Chứng Từ kèm theo
                </td>
                <td id="CTKT" style="text-align: left;">:</td>
            </tr>
            <tr class="item">
                <td style="width: 80px" colspan="1">Ghi chú
                </td>
                <td id="Note" style="text-align: left;">:</td>
            </tr>
        </table>

        <div class="Total">
            <p style="padding-left: 40px; padding-right: 40px">Người Lập Biểu</p>
            <p style="padding-left: 40px; padding-right: 40px">Thủ Quỹ</p>
            <p style="padding-left: 40px; padding-right: 40px">Người Nộp</p>
            <p style="padding-left: 25px; padding-right: 10px">Thủ Trưởng Đơn Vị</p>
        </div>
    </div>

    <script>
        console.log(dataPrint)
        document.getElementById('hotline').innerHTML = dataPrint.Tel;
        document.getElementById('Invoicenum').innerHTML = " Số :"+dataPrint.Invoice_Num;
        document.getElementById('CusName').innerHTML = ":"+dataPrint.CustomerName;
        document.getElementById('Amount').innerHTML = ":" + dataPrint.Amount;
        document.getElementById('Amountword').innerHTML = ":"+dataPrint.Word;
        document.getElementById('Content').innerHTML = ":"+dataPrint.Content;
        document.getElementById('Datenow').innerHTML =dataPrint.Datestring;
        document.getElementById('Address').innerHTML = dataPrint.Address;
    </script>
</body>

</html>

