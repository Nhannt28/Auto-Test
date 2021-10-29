*** Settings ***
Documentation       Verifying Kuota Keluarga Error Notification Enhancement & Journey Enhancement
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/account.robot
Suite Setup         Check PreConditional
Test Setup          Launch Application
Test Teardown       Tear Down Test Cases
Suite Teardown      Close Application

*** Keywords ***
Check PreConditional  
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC Android*| TC531     TC535    TC536    TC537    TC538|
        ...     |*TC IOS*| TC1669    TC1673    TC1674    TC1675     TC1676|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Invalid Phone Number
    Reopen App      ${EMPTY}
    Check Launching New version 
    Check Permission First Launch
    Check Tutup popup
    Check Reminder
    Check Tutup popup
    Check Logined Default User
    Check Tutup popup
    Check Reminder
    Check Permission Location Display

*** Test Cases ***
Verify Kuota Keluarga - Error Notification Enhancement
    [Documentation]    Verify Kuota Keluarga Package Detail & Detail Payment
        ...     |TC Android|TC152 - TC156|
        ...     |TC Type| Positive Case|
    [Tags]      Android
    Go To KuotaKeluarga Page
    Verify Package Detail
    Click Element                       ${Btn_Buy_Package}
    Wait Until Page Contains Element    ${Load_Content_Title}   timeout=30s
    Wait Until Page Contains Element    ${Detail_Payment_Title}
    Wait Until Page Contains Element    ${Total_Price_Detail_Payment}
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}
    Verify See Details Menu
    Click Element                       ${CheckBox_Family_Quota}
    Wait Until Page Contains Element    ${PhoneNumber_Icon}     timeout=30s
    Input Text          ${PhoneNumber_Slot}     ${TW2_Phonenumber}
    Click Element                   ${Button_CheckNumber_FamilyPlan}
    Wait Until Page Contains Element    ${Confirm_Button}      timeout=30s
    Click Element                       ${Confirm_Button}
    Wait Until Page Contains Element    ${Seekbar_Quota}  timeout=30s
    Wait Until Page Contains Element    ${Confirm_Button}
    Click Element                       ${Confirm_Button}
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}     timeout=30s
    Click Element                       ${Payment_Page_Continue_Pay}
    Wait Until Page Contains Element    ${Load_Content_Title}
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}     timeout=30s

Verify Kuota Keluarga - Journey Enhancement
    # note: TC075 no.15 "user can't click button quota setup", infact it can be click
    [Documentation]    Verify Kuota Keluarga Package Detail & Detail Payment
        ...     |TC Android|TC071 - TC075|
        ...     |TC Type| Positive Case|
    [Tags]      Android
    Go To KuotaKeluarga Page
    Verify Package Detail
    Click Element                       ${Btn_Buy_Package}
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}     timeout=30s
    Click Element                       ${Payment_Page_Continue_Pay}
    Wait Until Page Contains            ${WCMS["quota_setup_warning_text"]}
    