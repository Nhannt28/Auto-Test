*** Keywords ***
Purchase Family Plan Package
    [Arguments]     ${phoneNumber}
    Wait Until Page Contains Element        ${Load_Content_Title}
    Click Element                           ${Btn_Buy_Package}
    Verify See Details Menu
    Verify Bottom Dialog
    Scroll      ${Bottom_Sheet}     ${Payment_Page_Continue_Pay}
    Wait Until Page Contains Element    ${Check_Box}    timeout=30s
    Click Element                       ${Check_Box}
    Wait Until Page Contains Element    ${PhoneNumber_Icon}     timeout=30s
    Input Text          ${PhoneNumber_Slot}     ${phoneNumber}
    Click Element                       ${Button_CheckNumber_FamilyPlan}
    Wait Until Page Contains Element    ${Confirm_Button}      timeout=30s
    Click Element                       ${Confirm_Button}
    Wait Until Page Contains Element    ${Seekbar_Quota}  timeout=30s
    Wait Until Page Contains Element    ${Confirm_Button}
    Click Element                       ${Confirm_Button}
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}     timeout=30s
    Click Element                       ${Payment_Page_Continue_Pay}
    Wait Until Page Contains Element    ${Load_Content_Title}
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}     timeout=30s
    Click Element                       ${Payment_Page_Continue_Pay}

Verify Bottom Dialog
    Scroll                              ${Bottom_Sheet}     ${Detail_Payment_Title}
    Wait Until Page Contains Element    ${Bottom_Sheet_Detail_Price}
    Wait Until Page Contains Element    ${Bottom_Sheet_Detail_Title}