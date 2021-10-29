
*** Keywords ***
Check Pop Up Detail Info After Selected Denom Credit  
    Click Element                           ${PaymentMethod_view_detail}
    Wait until page contains Element        ${product_name_01}
    Wait until page contains Element        ${product_name_02}
    Wait until page contains                ${Active_Period} 
    Wait until page contains                ${Credit_Amount}
    Wait until page contains                ${Credit_POIN}
    Wait until page contains                ${OK_Btn} 

Close Pop Up Detail Info After Selected Denom Credit 
    Click Element                                   ${OK_Btn}
    Wait until page contains Element                ${PaymentMethod_headerTitle}
    Wait until page contains Element                ${PaymentMethod_view_detail} 
    Wait Until Page Does Not Contain Element        ${product_name_01}
    Wait Until Page Does Not Contain Element        ${product_name_02}
    Wait Until Page Does Not Contain Element        ${OK_Btn} 