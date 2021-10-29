*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/account.robot
Suite Setup         Check PreConditional For KuotaKeluarga
Suite Teardown      Close Application
Test Template       Template For Input MSISDN

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
    Check default lang and swtich 
    Check Banner on the login page
    Check Logined User    ${TW_LinkAccount_Phonenumber}    ${TW_Phonenumber}   ${TW_Account}     ${TW_Password}     ${TW_Email}
    Check Tutup popup
    Check Reminder
    Check Permission Location Display

Check PreConditional For KuotaKeluarga
    Check PreConditional
    Go To KuotaKeluarga Page
    Wait Until Page Contains Element    ${Btn_Buy_Package}  timeout=30s
    Click Element                       ${Btn_Buy_Package}
    Wait Until Page Contains Element    ${Check_Box}    timeout=30s
    Click Element                       ${Check_Box}
    Wait Until Page Contains Element    ${PhoneNumber_Icon}     timeout=30s
    Wait Until Page Contains            ${WCMS["label.familyplan_popup.body.input_title"]}
    Wait Until Page Contains            ${WCMS["label_familyplan_popup_title_select_members"]}
    Wait Until Page Contains            ${WCMS["label.familyplan_popup.body.input_number"]}

*** Test Cases ***              PHONENUMBER         FAIL MESSAGE    
Inactive PhoneNumber            081396969493        ${WCMS["familyplan_verify_eligibility_invalidmsisdn"]}
    [Tags]    iOS     Android
# Blocked PhoneNumber             00000000000            ${WCMS["familyplan_verify_eligibility_blocked"]}
#     [Tags]    iOS     Android
Corporate PhoneNumber           08111334942         ${WCMS["familyplan_verify_eligibility_iscorporate"]}
    [Tags]    iOS     Android
# HALO PhoneNumber                08111447224         ${WCMS["familyplan_verify_eligibility_ishalo"]}
#     [Tags]    iOS     Android
Already Registered PhoneNumber      081282702348      ${WCMS["familyplan_verify_eligibility_already_registered"]}
    [Tags]    iOS     Android
# note: error type is toast message
Own PhoneNumber                 ${TW_LinkAccount_Phonenumber}       ${WCMS["MISSING_VALID_MEMBER"]}
    [Tags]    iOS     Android

#note: error message should be "Enter a valid Telkomsel number"
Not Telkomsel PhoneNumber           08999999999         ${WCMS["label.familyplan.warning.text"]}
    [Tags]    iOS     Android


*** Keywords ***
Template For Input MSISDN
    [Arguments]     ${phoneNumber}      ${error_message}
    ${status}       Run Keyword And Return Status   Page Should Not Contain Element     ${Check_Box}
    Run Keyword If      ${status}==False    Click Element   ${Check_Box}
    Clear Text                      ${PhoneNumber_Slot}
    Wait Until Page Contains Element    ${PhoneNumber_Icon}
    Wait Until Page Contains Element    ${Back_Select_Member}
    Input Text          ${PhoneNumber_Slot}     ${phoneNumber}
    Click Element                   ${Button_CheckNumber_FamilyPlan}
    Run Keyword And Continue On Failure  Wait Until Page Contains        ${error_message}    timeout=30s
    Click Element                   ${Back_Select_Member}