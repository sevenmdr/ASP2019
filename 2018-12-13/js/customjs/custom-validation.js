//validation settings in formvalidation page
'use strict'
$('.ui.form1').form({
    fields: {
        name: {
            identifier: 'name',
            rules: [{
                type: 'empty',
                prompt: 'Please enter your name'
            }]
        },
        skills: {
            identifier: 'skills',
            rules: [{
                type: 'minCount[2]',
                prompt: 'Please select at least two skills'
            }]
        },
        gender: {
            identifier: 'gender',
            rules: [{
                type: 'empty',
                prompt: 'Please select a gender'
            }]
        },
        username: {
            identifier: 'username',
            rules: [{
                type: 'empty',
                prompt: 'Please enter a username'
            }]
        },
        password: {
            identifier: 'password',
            rules: [{
                type: 'empty',
                prompt: 'Please enter a password'
            }, {
                type: 'minLength[6]',
                prompt: 'Your password must be at least {ruleValue} characters'
            }]
        },
        terms: {
            identifier: 'terms',
            rules: [{
                type: 'checked',
                prompt: 'You must agree to the terms and conditions'
            }]
        }
    }
});
$('.ui.form2').form({
    fields: {
        field1: {
            rules: [{
                type: 'empty'
            }]
        },
        field2: {
            rules: [{
                type: 'exactly[dog]',
                prompt: '{name} is set to "{value}" that is totally wrong. It should be {ruleValue}'
            }]
        }
    }
});

// AppointmentDetail, CustomerDetail,EmplopyeeDetail,UserDetail
// Customer HistoryDetail,Customer StatusDetail,Customer TabDetail,Customer TreatmentDetail,Customer PaymentDetail
// AccountDetail
// pageServiceTypeDetail,pageServiceDetail
// pageProductTypeDetail,pageProductDetail
// pageSupplierDetail,pageInputDetail, pageOutputDetail
// pageCustomerCareDetail
$('.ui.form3').form({
    fields: {
        search: {
            identifier: 'appointment',
            rules: [{
                type: 'empty',
                prompt: 'Please enter appointment'
            }]
        },
        branch: {
            identifier: 'branch',
            rules: [{
                type: 'empty',
                prompt: 'Please enter branch'
            }]
        },
        tokenServiceCare: {
            identifier: 'tokenServiceCare',
            rules: [
                {
                    type: 'minCount[1]',
                    prompt: 'Please select at least 1 value'
                }
            ]
        },
        doctor: {
            identifier: 'doctor',
            rules: [{
                type: 'empty',
                prompt: 'Please enter doctor'
            }]
        },
        skills: {
            identifier: 'skills',
            rules: [{
                type: 'minCount[1]',
                prompt: 'Please select at least two skills'
            }]
        },
        gender: {
            identifier: 'gender',
            rules: [{
                type: 'empty',
                prompt: 'Please select a gender'
            }]
        },
        username: {
            identifier: 'username',
            rules: [{
                type: 'empty',
                prompt: 'Please enter a username'
            }]
        },
        password: {
            identifier: 'password',
            rules: [{
                type: 'empty',
                prompt: 'Please enter a password'
            }, {
                type: 'minLength[6]',
                prompt: 'Your password must be at least {ruleValue} characters'
            }]
        },
        terms: {
            identifier: 'terms',
            rules: [{
                type: 'checked',
                prompt: 'You must agree to the terms and conditions'
            }]
        },
        email: {
            identifier: 'email',
            rules: [
                {
                    type: 'email',
                    prompt: 'Please enter a valid e-mail'
                }
            ]
        },
        phonenumber: {
            identifier: 'phonenumber',
            rules: [
                {
                    type: 'exactLength[10]',
                    prompt: 'Please enter exactly 10 characters'
                },
                {
                    type: 'number',
                    prompt: 'Please enter number'
                }
            ]
        },
        name: {
            identifier: 'name',
            rules: [{
                type: 'empty',
                prompt: 'Please enter your name'
            }]
        },
        gender: {
            identifier: 'gender',
            rules: [{
                type: 'empty',
                prompt: 'Please enter gender'
            }]
        },
        source: {
            identifier: 'source',
            rules: [{
                type: 'empty',
                prompt: 'Please enter source'
            }]
        },
        language: {
            identifier: 'language',
            rules: [{
                type: 'empty',
                prompt: 'Please enter language'
            }]
        },
        department: {
            identifier: 'department',
            rules: [{
                type: 'empty',
                prompt: 'Please enter department'
            }]
        },
        cmnd: {
            identifier: 'cmnd',
            rules: [
                {
                    type: 'number',
                    prompt: 'Please enter number'
                }
            ]
        },
        employee: {
            identifier: 'employee',
            rules: [{
                type: 'empty',
                prompt: 'Please enter employee'
            }]
        },
        userGroup: {
            identifier: 'userGroup',
            rules: [{
                type: 'empty',
                prompt: 'Please enter user group'
            }]
        },
        historyType: {
            identifier: 'historyType',
            rules: [{
                type: 'empty',
                prompt: 'Please enter history type'
            }]
        },
        complainType: {
            identifier: 'complainType',
            rules: [{
                type: 'empty',
                prompt: 'Please enter complain type'
            }]
        },
        statusType: {
            identifier: 'statusType',
            rules: [{
                type: 'empty',
                prompt: 'Please enter status type'
            }]
        },
        serviceTab: {
            identifier: 'serviceTab',
            rules: [{
                type: 'empty',
                prompt: 'Please enter service'
            }]
        },
        numberService: {
            identifier: 'numberService',
            rules: [{
                type: 'integer[1..100]',
                prompt: 'Please enter number of unit'
            }]
        },
        discountOther: {
            identifier: 'discountOther',
            rules: [{
                type: 'regExp[/^[0-9,]{0,12}$/]',
                prompt: 'Please enter other discount'
            }]
        },
        accountType: {
            identifier: 'accountType',
            rules: [{
                type: 'empty',
                prompt: 'Please enter account type'
            }]
        },
        accountMethod: {
            identifier: 'accountMethod',
            rules: [{
                type: 'empty',
                prompt: 'Please enter account method'
            }]
        },
        accountAmount: {
            identifier: 'accountAmount',
            rules: [{
                type: 'empty',
                prompt: 'Please enter value'
            }, {
                type: 'regExp[/^[0-9,]{0,12}$/]',
                prompt: 'Please enter account amount'
            }]
        },
        productType: {
            identifier: 'productType',
            rules: [{
                type: 'empty',
                prompt: 'Please enter product type'
            }]
        },
        serviceType: {
            identifier: 'serviceType',
            rules: [{
                type: 'empty',
                prompt: 'Please enter service type'
            }]
        },
        unitCountService: {
            identifier: 'unitCountService',
            rules: [{
                type: 'empty',
                prompt: 'Please enter unit count of service'
            }]
        },
        serviceCode: {
            identifier: 'serviceCode',
            rules: [{
                type: 'empty',
                prompt: 'Please enter a service code'
            },
            {
                type: 'exactLength[3]',
                prompt: 'Service code must be at least {ruleValue} characters'
            }
            ]
        },
        servicePrice: {
            identifier: 'servicePrice',
            rules: [{
                type: 'empty',
                prompt: 'Please enter value'
            }, {
                type: 'regExp[/^[0-9,]{0,12}$/]',
                prompt: 'Please enter account amount'
            }]
        },
        //assitant1: {
        //    identifier: 'assitant1',
        //    rules: [{
        //        type: 'empty',
        //        prompt: 'Please enterassitant1'
        //    }]
        //},
        //assitant2: {
        //    identifier: 'assitant2',
        //    rules: [{
        //        type: 'empty',
        //        prompt: 'Please enter assitant2'
        //    }]
        //},
        //doctor1: {
        //    identifier: 'doctor1',
        //    rules: [{
        //        type: 'empty',
        //        prompt: 'Please enter doctor1'
        //    }]
        //},
        //doctor2: {
        //    identifier: 'doctor2',
        //    rules: [{
        //        type: 'empty',
        //        prompt: 'Please enter doctor2'
        //    }]
        //},
        product: {
            identifier: 'product',
            rules: [{
                type: 'empty',
                prompt: 'Please enter product'
            }]
        },
        supplier: {
            identifier: 'supplier',
            rules: [{
                type: 'empty',
                prompt: 'Please enter supplier'
            }]
        },
        unitProduct: {
            identifier: 'unitProduct',
            rules: [{
                type: 'empty',
                prompt: 'Please enter unit of product'
            }]
        },
        numberProduct: {
            identifier: 'numberProduct',
            rules: [{
                type: 'integer[1..100]',
                prompt: 'Please enter number of product'
            }]
        },
        productPrice: {
            identifier: 'productPrice',
            rules: [{
                type: 'empty',
                prompt: 'Please enter value'
            }, {
                type: 'regExp[/^[0-9,]{0,12}$/]',
                prompt: 'Please enter price'
            }]
        },
        date: {
            identifier: 'date',
            rules: [{
                type: 'empty',
                prompt: 'Please enter date'
            }]
        },
        folderName: {
            identifier: 'folderName',
            rules: [{
                type: 'empty',
                prompt: 'Please enter value'
            }, {
                type: 'regExp[/^[a-zA-Z0-9-/]{0,50}$/]',
                prompt: 'Please enter folder name'
            }]
        },
    }
});

$('.ui.form4').form({
    fields: {
        name: {
            identifier: 'name',
            rules: [{
                type: 'empty',
                prompt: 'Please enter your name'
            }]
        },
        skills: {
            identifier: 'skills',
            rules: [{
                type: 'minCount[2]',
                prompt: 'Please select at least two skills'
            }]
        },
        gender: {
            identifier: 'gender',
            rules: [{
                type: 'empty',
                prompt: 'Please select a gender'
            }]
        },
        username: {
            identifier: 'username',
            rules: [{
                type: 'empty',
                prompt: 'Please enter a username'
            }]
        },
        password: {
            identifier: 'password',
            rules: [{
                type: 'empty',
                prompt: 'Please enter a password'
            }, {
                type: 'minLength[6]',
                prompt: 'Your password must be at least {ruleValue} characters'
            }]
        },
        terms: {
            identifier: 'terms',
            rules: [{
                type: 'checked',
                prompt: 'You must agree to the terms and conditions'
            }]
        }
    }
});
$(".setdata.button").on("click", function () {
    $('.ui.form3')
        // set one value
        .form('set value', 'name', 'Jack')
        // set several values
        .form('set values', {
            name: 'Joshua',
            gender: 'male',
            colors: ['red', 'grey'],
            username: 'q_joshua',
            password: 'passw0rd',
            terms: true
        });
})

$(".clear.button").on("click", function () {
    $('form').form('clear')
});
$(".reset.button").on("click", function () {
    $('form').form('reset')
});
$('.ui.form5').form({
    inline: true,
    on: 'blur',
    fields: {
        name: {
            identifier: 'first-name',
            rules: [{
                type: 'empty',
                prompt: 'Please enter your name'
            }]
        },
        skills: {
            identifier: 'last-name',
            rules: [{
                type: 'minCount[2]',
                prompt: 'Please enter your last name'
            }]
        },

        username: {
            identifier: 'username',
            rules: [{
                type: 'empty',
                prompt: 'Please enter a username'
            }]
        },
        password: {
            identifier: 'password',
            rules: [{
                type: 'empty',
                prompt: 'Please enter a password'
            }, {
                type: 'minLength[6]',
                prompt: 'Your password must be at least {ruleValue} characters'
            }]
        },
        terms: {
            identifier: 'terms',
            rules: [{
                type: 'checked',
                prompt: 'You must agree to the terms and conditions'
            }]
        }
    }
});

$('.ui.form6').form({
    on: 'blur',
    inline: true,
    fields: {
        integer: {
            identifier: 'integer',
            rules: [
                {
                    type: 'integer[1..100]',
                    prompt: 'Please enter an integer value'
                }
            ]
        },
        decimal: {
            identifier: 'decimal',
            rules: [
                {
                    type: 'decimal',
                    prompt: 'Please enter a valid decimal'
                }
            ]
        },
        number: {
            identifier: 'number',
            rules: [
                {
                    type: 'number',
                    prompt: 'Please enter a valid number'
                }
            ]
        },
        email: {
            identifier: 'email',
            rules: [
                {
                    type: 'email',
                    prompt: 'Please enter a valid e-mail'
                }
            ]
        },
        url: {
            identifier: 'url',
            rules: [
                {
                    type: 'url',
                    prompt: 'Please enter a url'
                }
            ]
        },
        regex: {
            identifier: 'regex',
            rules: [
                {
                    type: 'regExp[/^[a-z0-9_-]{4,16}$/]',
                    prompt: 'Please enter a 4-16 letter username'
                }
            ]
        }
    }
})
    ;

$('.ui.form7').form({
    on: 'blur',
    fields: {
        card: {
            identifier: 'card',
            rules: [
                {
                    type: 'creditCard',
                    prompt: 'Please enter a valid credit card'
                }
            ]
        },
        exactCard: {
            identifier: 'exact-card',
            rules: [
                {
                    type: 'creditCard[visa,amex]',
                    prompt: 'Please enter a visa or amex card'
                }
            ]
        }
    }
})
    ;

$('.ui.form8').form({
    on: 'blur',
    fields: {
        match: {
            identifier: 'match2',
            rules: [
                {
                    type: 'match[match1]',
                    prompt: 'Please put the same value in both fields'
                }
            ]
        },
        different: {
            identifier: 'different2',
            rules: [
                {
                    type: 'different[different1]',
                    prompt: 'Please put different values for each field'
                }
            ]
        }
    }
})
    ;
$('.ui.form9').form({
    on: 'blur',
    fields: {
        minLength: {
            identifier: 'minLength',
            rules: [
                {
                    type: 'minLength[100]',
                    prompt: 'Please enter at least 100 characters'
                }
            ]
        },
        exactLength: {
            identifier: 'exactLength',
            rules: [
                {
                    type: 'exactLength[6]',
                    prompt: 'Please enter exactly 6 characters'
                }
            ]
        },
        maxLength: {
            identifier: 'maxLength',
            rules: [
                {
                    type: 'maxLength[100]',
                    prompt: 'Please enter at most 100 characters'
                }
            ]
        },
    }
})
    ;

$('.ui.form10').form({
    on: 'blur',
    fields: {
        is: {
            identifier: 'is',
            rules: [
                {
                    type: 'is[dog]',
                    prompt: 'Please enter exactly "dog"'
                }
            ]
        },
        isExactly: {
            identifier: 'isExactly',
            rules: [
                {
                    type: 'isExactly[dog]',
                    prompt: 'Please enter exactly "dog"'
                }
            ]
        },
        not: {
            identifier: 'not',
            rules: [
                {
                    type: 'not[dog]',
                    prompt: 'Please enter a value, but not "dog"'
                }
            ]
        },
        notExactly: {
            identifier: 'notExactly',
            rules: [
                {
                    type: 'notExactly[dog]',
                    prompt: 'Please enter a value, but not exactly "dog"'
                }
            ]
        },
        contains: {
            identifier: 'contains',
            rules: [
                {
                    type: 'contains[dog]',
                    prompt: 'Please enter a value containing "dog"'
                }
            ]
        },
        containsExactly: {
            identifier: 'containsExactly',
            rules: [
                {
                    type: 'containsExactly[dog]',
                    prompt: 'Please enter a value containing exactly "dog"'
                }
            ]
        },
        doesntContain: {
            identifier: 'doesntContain',
            rules: [
                {
                    type: 'doesntContain[dog]',
                    prompt: 'Please enter a value not containing "dog"'
                }
            ]
        },
        doesntContainExactly: {
            identifier: 'doesntContainExactly',
            rules: [
                {
                    type: 'doesntContainExactly[dog]',
                    prompt: 'Please enter a value not containing exactly "dog"'
                }
            ]
        }
    }
})
    ;

$('.ui.form11').form({
    on: 'blur',
    fields: {
        minCount: {
            identifier: 'minCount',
            rules: [
                {
                    type: 'minCount[2]',
                    prompt: 'Please select at least 2 values'
                }
            ]
        },
        maxCount: {
            identifier: 'maxCount',
            rules: [
                {
                    type: 'maxCount[2]',
                    prompt: 'Please select a max of 2 values'
                }
            ]
        },
        exactCount: {
            identifier: 'exactCount',
            rules: [
                {
                    type: 'exactCount[2]',
                    prompt: 'Please select 2 values'
                }
            ]
        }
    }
});
$('.ui.form12').form({
    dog: {
        identifier: 'dog',
        rules: [
            {
                type: 'empty',
                prompt: 'You must have a dog to add'
            },
            {
                type: 'contains[fluffy]',
                prompt: 'I only want you to add fluffy dogs!'
            },
            {
                type: 'not[mean]',
                prompt: 'Why would you add a mean dog to the list?'
            }
        ]
    }
});






