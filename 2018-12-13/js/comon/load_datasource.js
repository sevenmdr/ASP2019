function GetDataComboServiceCustomer(link, fn) {
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {

            fn(JSON.parse(result.d)["Table1"]);
            //    LoadComboDetail(JSON.parse(result.d)["Table1"], "ccbServiceTab");
            // LoadCombo(JSON.parse(result.d)["Table2"], "ccbDiscountTab");


        }

    })
};

function GetDataComboServiceCustomerDiscount(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table2"]);
        }
    })
    return x;
}

function GetDataComboTypeStatus(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table1"]);
        }
    })
    return x;
}
function GetDataComboMethod(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table1"]);
        }
    })
    return x;
}


// Load list customer status,
function GetDataSourceStatus(link, CustomerID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "CustomerID": CustomerID }),
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
//GetCombo History
function GetDataComboTypeHistory(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d)["Table1"], JSON.parse(data.d)["Table2"]);
        }
    })
    return x;
}
// Load list customer History,
function GetDataSourceHistory(link, CustomerID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "CustomerID": CustomerID }),
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
// Load list customer Tab,

function GetDataSourceTab(link, CustomerID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "CustomerID": CustomerID }),
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
// Load list customer Payment,
function GetDataSourcePayment(link, CustomerID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "CustomerID": CustomerID }),
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

// Load list customer Payment,
function GetDataSourceTreatment(link, CustomerID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "CustomerID": CustomerID }),
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

//GetCombo Treatment
function GetDataComboTreatment(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d)["Table1"], JSON.parse(data.d)["Table2"], JSON.parse(data.d)["Table3"]);
        }
    })
    return x;
}

//LoadData CustomerCare AfterTreatment
function GetDataSourceCustomerCareAfterTreatment(link, Branch_ID, Date, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "Branch_ID": Branch_ID, "Date": Date }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
//GetCombo CustomerCare AfterTreatment
function GetDataComboBranch(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d)["Table1"]);
        }
    })
    return x;
}

function GetInfoCustomer(link, CustomerID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "CustomerID": CustomerID }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table1"], JSON.parse(data.d)["Table2"], JSON.parse(data.d)["Table3"], JSON.parse(data.d)["Table4"]);
        }
    })
    return x;
}
//GetCombo Customer
function GetDataComboCustomer(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table1"], JSON.parse(data.d)["Table2"], JSON.parse(data.d)["Table3"]);
        }
    })
    return x;
}
//GetCombo Appointment
function GetDataComboAppointment(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table1"], JSON.parse(data.d)["Table2"], JSON.parse(data.d)["Table3"]
                , JSON.parse(data.d)["Table4"]
                , JSON.parse(data.d)["Table5"]);
        }
    })
    return x;
}
//GetCombo Appointment    List
function GetDataComboAppointmentList(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table1"], JSON.parse(data.d)["Table2"]);
        }
    })
    return x;
}
// Load Image Folder Tree
function GetDataSourceImageFolder(link, CustomerID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "CustomerID": CustomerID }),
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

// Load Image Folder Tree
function GetImageByFolder(link, folderName, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "folderName": folderName }),
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}



// Load list customer Care,
function GetDataSourceCustomerCare(link, type, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "type": type }),
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
// Load list Appointment In Day,
function GetDataSourceAppointmentList(link, Branch_ID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "branchID": Branch_ID }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}


// Load list Appointment By Dat,
function GetDataSourceAppointmentListByDay(link, Branch_ID, dateFrom, dateTo, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "branchID": Branch_ID, "dateFrom": dateFrom, "dateTo": dateTo }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

// Load Searching,
function GetDataSourceSerchCustomer(link, keyword, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "keyword": keyword }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
//LoadComboBranchh
function GetDataComboBranch(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table1"]);
        }
    })
    return x;
}
// Load list WareHouse,
function GetDataSourceWareHouse(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
// Load list Supplier,
function GetDataSourceSupplier(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
// Load list Supplier,
function GetDataSourceProductType(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
function GetDataSourceUnit(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

///////////// DISCOUNT //////////////////
// Load list Discount
function GetDataDiscount(link, dateFrom, dateTo, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "dateFrom": dateFrom, "dateTo": dateTo }),
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}


// Execute DataTable Left and right
function ExecuteDataTableLeftAndRight(link, type, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "type": type }),
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

// Load Combo Discount
function GetDataComboDiscount(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table1"], JSON.parse(data.d)["Table2"]);
        }
    })
    return x;
}
///////////////////////


//////////////EmployeeGroup
//LoadList
function GetDataSourceGroupEmployee(link, fn) {
    debugger
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
//////////////
//////////////Employee
//LoadList
function GetDataSourceEmployee(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
function GetDataComboEmployee(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table1"], JSON.parse(data.d)["Table2"]);
        }
    })
    return x;
}
//////////////
/////////////User
function GetDataSourceGroupUser(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

function GetDataSourceUserList(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
function GetDataComboUser(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {
            fn(JSON.parse(data.d)["Table1"], JSON.parse(data.d)["Table2"], JSON.parse(data.d)["Table3"], JSON.parse(data.d)["Table4"]);
        }
    })
    return x;
}
/////////


/////////////Product//////////////
function GetDataSourceProduct(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

function GetDataSourceInputList(link, dateFrom, dateTo, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "datefrom": dateFrom, "dateto": dateTo }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

function GetDataSourceoutList(link, dateFrom, dateTo, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "datefrom": dateFrom, "dateto": dateTo }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
//////////////ServiceType
function GetDataSourceServiceType(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

// Load Lock Detail New, and Not New

function GetDataLockDetailNew(link,wareID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "wareID": wareID }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
function GetDataLockDetail(link, idLock, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "idLock": idLock}),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

function GetDataReviewWareHouse(link, wareID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "wareID": wareID}),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

function GetDataWareHouseExImNor(link, wareID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "wareID": wareID }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

// load Data Source Service
function GetDataSourceService(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

//.... Martketing Load TIcket List
function GetDataTicketList(link, dateFrom, dateTo,statusID,sourceID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "dateFrom": dateFrom, "dateTo": dateTo, "statusID": statusID, "sourceID": sourceID }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

//.... Martketing Load TIcket List
function GetDataTicketListDelete(link, dateFrom, dateTo, sourceID, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "dateFrom": dateFrom, "dateTo": dateTo,  "sourceID": sourceID }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

// Load Ticket Source

function GetDataTicketSource(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

// Load Ticket Color Code

function GetDataTicketColorCode(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}


//Load Data Ticket Main By Day
function GetDataTicketMainByDay(link, dateFrom,dateTo,fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "dateFrom": dateFrom, "dateTo": dateTo }),
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}

/////////////////////Permission////////////

function GetDataPermissionPageList(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
function GetDataPermissionControlList(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
function GetDataPermissionGroupPageList(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}
function GetDataPermissionGroupControlList(link, fn) {
    var x = "";
    $.ajax({
        url: link,
        dataType: "json",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        async: true,
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (data) {

            fn(JSON.parse(data.d));
        }
    })
    return x;
}