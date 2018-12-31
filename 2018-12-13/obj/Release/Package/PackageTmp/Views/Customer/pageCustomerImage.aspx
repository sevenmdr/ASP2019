<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageCustomerImage.aspx.cs" Inherits="_2018_12_13.Views.Customer.pageCustomerImage" %>

<head runat="server">
    <link rel="stylesheet" href="/UploadJS/css/jquery.fileupload.css" />
    <link rel="stylesheet" href="/UploadJS/css/jquery.fileupload-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<div class="ui equal width left aligned padded grid stackable">
    <div class="sixteen wide tablet three wide computer column">
        <div class="ui segments">
            <div class="ui segment">
                <div class="ui two column middle aligned very relaxed stackable grid">
                    <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                        <div class="ui buttons">
                            <button class="ui blue basic button modalfour" data-value="fade up" onclick="createFolder(customerID)">Tạo Thư Mục</button>
                        </div>
                    </div>
                    <div class="ui vertical divider">
                    </div>
                    <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                        <div class="ui buttons">
                        </div>
                    </div>
                </div>
            </div>


            <div class="ui segment">
                <div class="ui secondary fluid vertical stackable pointing menu" id="divFolderName">
                    <a class="active item">Home</a>
                    <a class="item">Messages</a>
                    <a class="item">Friend</a>
                </div>
            </div>
        </div>
    </div>
    <div class="sixteen wide tablet thirteen wide computer column">
        <div class="ui segments">
            <div class="ui segment">
                <div class="ui two column middle aligned very relaxed stackable grid">
                    <div class="column">
                        <h3 class="ui header" id="txtHeaderFolder"></h3>
                    </div>

                    <div class="ui vertical divider">
                    </div>
                    <div class="center aligned column" style="text-align: right; padding-bottom: 0rem">
                        <div class="ui buttons">
                            <button class="ui red basic button modalfour" data-value="fade up" onclick="deleteFolder()">Xóa Thư Mục</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui segment">
                <div class="container">
                    <blockquote>
                        <p>
                            Chọn Tối Đa 5 file 1 lần upload . Dung lượng < 5Mp từng hình . Định dạng hình png,jpg
                        </p>
                    </blockquote>
                    <div class="btn btn-success upload-btn-wrapper">
                        <button class="btn">Upload a file</button>
                        <input id="fileupload" type="file" name="files[]" multiple />
                    </div>
                </div>
            </div>
            <div class="ui segment">
                <div id="gallaryimage" class="containerli">
                    <div class="gallery" id="galleryid">
                    </div>
                    <%--  <div class="gallery">
                        <a href="/img/gallery/images2.jpg" class="overlay-2" title="">
                            <img src="/img/gallery/images2.jpg" alt="" title="" /></a>
                    </div>
                    <div class="gallery">
                        <a href="/img/gallery/images3.jpg" class="overlay-2" title="">
                            <img src="/img/gallery/images3.jpg" alt="" title="" /></a>
                    </div>
                    <div class="gallery">
                        <a href="https://www.aticalicut.org/uploads/link/697029-twitter-512.png" class="overlay-2" title="">
                            <img src="https://www.aticalicut.org/uploads/link/697029-twitter-512.png" alt="" title="" /></a>
                    </div>
                    <div class="gallery">
                        <a href="/img/gallery/images5.jpg" class="overlay-2" title="">
                            <img src="/img/gallery/images5.jpg" alt="" title="" /></a>
                    </div>--%>
                </div>
            </div>
        </div>
        <%-- <div class="ui small test modal" id="divImageGallary"></div>--%>
    </div>
</div>


<script>
    $('#divImageGallary').modal({
        autofocus: false
    });

    var customerID = ("<%=_CustomerID %>");
    var folderName;
    var url;
    $(document).ready(function () {

        $('#fileupload').fileupload().bind('fileuploaddone', function (e, data) {
            //notiSuccess();
        });
        $('#fileupload').fileupload().bind('fileuploadfail', function (e, data) {
            //  notiError();
        });
       debugger
        $('#fileupload').fileupload({
            url: url,
            done: function (e, data) {
                var resulf = data._response["result"];
                if (resulf == "1") {
                    notiSuccess();
                }
                else {
                    notiError();
                }
            },
            fail: function (e, data) {
                notiError();
            },
            maxFileSize: 5000000,
            maxNumberOfFiles: 5,
            minFileSize: undefined,
            acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,

        }).bind('fileuploadadd', function (e, data) {
            data.url = url;
        });
        LoadFolderTree();
    });
    function LoadFolderTree() {
        GetDataSourceImageFolder("/Views/Customer/pageCustomerImage.aspx/LoadAllFolder", customerID, function (data) {
            RenFoder(data, "divFolderName");
               $('.ui.menu a.item').on('click', function () {
            $(this)
                .addClass('active')
                .siblings()
                .removeClass('active');
            var textTab = document.querySelector(".ui.secondary.fluid.vertical.stackable.pointing.menu .active.item").innerHTML;
            folderName = textTab;
            document.getElementById("txtHeaderFolder").innerHTML = folderName;
            LoadImage(folderName);
            url = 'FileUploadHandler.ashx?CustomerID=' + customerID + '&FolderName=' + folderName;
        });
        });
     

    }
    function LoadImage(textTab) {
        GetImageByFolder("/Views/Customer/pageCustomerImage.aspx/LoadImageByFolder", customerID + "/" + textTab, function (data) {
            RenderImage(data, "galleryid");
        });
        $(".gallery").click(function (e) {
            ShowImageDetail(this.children[0].src);
        });




    }

</script>
<link href="/plugins/fluidbox/dist/css/fluidbox.min.css" rel="stylesheet" />
<script src="/dist/semantic.min.js"></script>
<script src="/plugins/datatable/jquery.dataTables.js"></script>
<script src="/js/customjs/custom-datatable.js"></script>
<script src="/plugins/gridalicius/jquery.grid-a-licious.min.js"></script>
<script src="/plugins/fluidbox/dist/js/jquery.fluidbox.min.js"></script>
<script src="/js/customjs/custom-gallery.js"></script>
<script src="/js/comon/load_datasource.js"></script>
<script src="/js/customjs/custom-modal.js"></script>
<%--<script src="/plugins/gridalicius/jquery.grid-a-licious.min.js"></script>--%>
