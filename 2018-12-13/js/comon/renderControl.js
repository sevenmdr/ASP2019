//LoadCombo - Normal
function LoadCombo(data, id) {
    if (data && data.length > 0) {
        var re = new RegExp(",", 'g');
        const markup = `
    ${(data).map(item => `
<div class="item" data-value=${item.ID}>${item.Name}</div>
`)
            }
`;
        document.getElementById(id).innerHTML = markup.replace(re, '');;
    }
    else { document.getElementById(id).innerHTML = '' }

}
//LoadCombo - With Value
function LoadComboWithValue(data, id) {
    if (data && data.length > 0) {
        var re = new RegExp(",", 'g');
        const markup = `


    ${ (data).map(item => ` <div class="item" data-value=${item.Value}>${item.Name}</div>`)
            }
`;
        document.getElementById(id).innerHTML = markup.replace(re, '');;
    }

    else { document.getElementById(id).innerHTML = '' }
}

//LoadCombo - Token
function LoadComboToken(data, id) {
    if (data && data.length > 0) {
        var re = new RegExp(",", 'g');
        const markup = `


    ${ (data).map(item => `  <option value=${item.ID}>${item.Name}</option>`)
            }
`;

        document.getElementById(id).innerHTML = markup.replace(re, '');;
    }

    else { document.getElementById(id).innerHTML = '' }
}
//LoadCombo - DetailValue
function LoadComboDetail(data, id) {
    if (data && data.length > 0) {
        var re = new RegExp(",", 'g');
        const markup = `${(data).map(item => `<div class="item" data-value=${item.ID}><div>${item.Name}</div><div class="money" id=${item.ID}money>${item.Price}</div></div>`)}`;
        document.getElementById(id).innerHTML = markup.replace(re, '');;
    }


    else { document.getElementById(id).innerHTML = '' }
}


//RenFoderImage
function RenFoder(data, id) {
   // debugger
    if (data && data.length > 0) {
        var myNode = document.getElementById(id);
        myNode.innerHTML = '';
        var re = new RegExp(",", 'g');
        const markup = `${(data).map(item => ` <a class="item">${item.FolderName}</a>`)}`;
        document.getElementById(id).innerHTML = markup.replace(re, '');
    }
    else { document.getElementById(id).innerHTML = '' }


}

//RenFoderImage
function RenderImage(data, id) {
    if (data && data.length > 0) {
        var myNode = document.getElementById(id);
        myNode.innerHTML = '';
        var re = new RegExp(",", 'g');
        const markup = `
    ${(data).map(item => `
                         
                              
                            <img src=${item.link} alt="" title="" style="width: 200px;height: 200px;"/></a>
            
`)
            }
`;
        document.getElementById(id).innerHTML = markup.replace(re, '');
    }
    else { document.getElementById(id).innerHTML = '' }

}

//RenderSchedule - pageGeneralInfo
function RenScheduleList(data, id) {
    if (data && data.length > 0) {
        var myNode = document.getElementById(id);
        myNode.innerHTML = '';
        var re = new RegExp(",", 'g');
        const markup = `
    ${(data).map(item => `
                             <div class="event">
                                            <div class="label">
                                                <img src="/img/ButtonImg/location.png" alt="label-image" />
                                            </div>
                                            <div class="content">
                                                <div class="summary">
                                                    <a class="ui pointing red basic label">${item.StatusName}</a>
                                                </div>
                                                <div class="summary">
                                                    <a class="ui tag label">${item.DateFrom}</a>
                                                    <a class="ui tag label">${item.TimeFrom}</a>
                                                    <a class="ui tag label">${item.ShortName}</a>
                                                    <a class="ui label">${item.Content}</a>
                                                </div>
                                            </div>
                                        </div>
`)
            }
`;
        document.getElementById(id).innerHTML = markup.replace(re, '');
    }
    else { document.getElementById(id).innerHTML = '' }

}

//Render Radio - pageGeneralInfo
function RenStatusNotYet(id) {

        var myNode = document.getElementById(id);
        myNode.innerHTML = '';
        var re = new RegExp(",", 'g');
        const markup = `
    ${ `
                                   <div class="step">
                                                <div class="content">
                                                    <div class="title">Chưa Đến</div>
                                                </div>
                                            </div>
                                            <div class="step">
                                                <div class="content">
                                                    <div class="title">Đã Đến</div>
                                                </div>
                                            </div>
                                            <div class="step">
                                                <div class="content">
                                                    <div class="title">Ra Về</div>
                                                </div>
                                            </div>
`
            }
`;
        document.getElementById(id).innerHTML = markup.replace(re, '');


}
function RenStatusCheckIn(id) {
   
        var myNode = document.getElementById(id);
        myNode.innerHTML = '';
        var re = new RegExp(",", 'g');
        const markup = `
    ${ `
                                          <div class="step">
                                                <div class="content">
                                                    <div class="title">Chưa Đến</div>
                                                </div>
                                            </div>
                                            <div class="completed step">
                                                <div class="content">
                                                    <div class="title">Đã Đến</div>
                                                </div>
                                            </div>
                                            <div class="step">
                                                <div class="content">
                                                    <div class="title">Ra Về</div>
                                                </div>
                                            </div>
`
            }
`;
        document.getElementById(id).innerHTML = markup.replace(re, '');
  

}
function RenStatusCheckOUT(id) {
  
        var myNode = document.getElementById(id);
        myNode.innerHTML = '';
        var re = new RegExp(",", 'g');
        const markup = `
    ${ `
                                      <div class="step">
                                                <div class="content">
                                                    <div class="title">Chưa Đến</div>
                                                </div>
                                            </div>
                                            <div class="step">
                                                <div class="content">
                                                    <div class="title">Đã Đến</div>
                                                </div>
                                            </div>
                                            <div class="completed step">
                                                <div class="content">
                                                    <div class="title">Ra Về</div>
                                                </div>
                                            </div>
`
            }
`;
        document.getElementById(id).innerHTML = markup.replace(re, '');


}


