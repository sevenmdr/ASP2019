
function notiSuccess() {
    Lobibox.notify("success", {
        size: "normal",
        rounded: false,
        delayIndicator: true,
        msg: "This is default notification",
        //icon: null,
        //title: "aaaaaa",
        soundPath: '/plugins/lobibox/sounds/',   // The folder path where sounds are located
        soundExt: '.ogg',           // Default extension for all sounds
        sound: 'sound4',
        showClass: "fadeInDown",
        hideClass: "zoomOut",
        delay: 1000,
        sound: true,
        img: null,

    });
}
function notiError() {
    Lobibox.notify("error", {
        size: "normal",
        rounded: false,
        delayIndicator: true,
        msg: "This is default notification",
        //icon: null,
        //title: "aaaaaa",
        soundPath: '/plugins/lobibox/sounds/',   // The folder path where sounds are located
        soundExt: '.ogg',           // Default extension for all sounds
        sound: 'sound2',
        showClass: "fadeInDown",
        hideClass: "zoomOut",
        delay: 4000,
        sound: true,
        img: null,

    });
}
function notiWarning() {
    Lobibox.notify("warning", {
        size: "normal",
        rounded: false,
        delayIndicator: true,
        msg: "This is default notification",
        //icon: null,
        //title: "aaaaaa",
        soundPath: '/plugins/lobibox/sounds/',   // The folder path where sounds are located
        soundExt: '.ogg',           // Default extension for all sounds
        sound: 'sound3',
        showClass: "fadeInDown",
        hideClass: "zoomOut",
        delay: 4000,
        sound: true,
        img: null,

    });
}

async function notiConfirm() {
    let result = await swal(
        {
            title: "Xác Nhận",
            text: "Bạn Thật Sự Muốn Xóa",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes",
            cancelButtonText: "No",
            closeOnConfirm: true,
            closeOnCancel: true
        },
        function (isConfirm) {
            if (isConfirm) {
                return true;
            } else {
                return false;
            }
        });
}


