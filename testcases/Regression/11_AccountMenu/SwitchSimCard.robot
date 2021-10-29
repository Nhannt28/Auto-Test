*** Settings ***
Documentation       Verifying Account Menu Revamp - Switch Sim Card TC#336

Library     ../../../libraries/RBFindElement.py
Library     ../../../libraries/RPString.py

Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/SettingPage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/account.robot
Suite Setup         Check PreConditional
Test Setup          Launch Application
Test Teardown       Tear Down Test Cases
Suite Teardown      Close Application

*** Keywords ***
Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Social_login    HomePage      Twitter     Android     iOS
    Reopen App      ${EMPTY}
    Check Reminder
    Check Tutup popup
    Check default lang and swtich 
    Check Banner on the login page
    Check Logined User    ${TW_LinkAccount_Phonenumber}    ${TW_Phonenumber}   ${TW_Account}     ${TW_Password}     ${TW_Email}
    Check Reminder
    Check Tutup popup
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s

Front SIM Card Info
    [Arguments]     ${phoneNumber}
    Wait Until Page Contains Element    ${Front_SIM_Card}  timeout=30s
    Element Should Contain Text         ${Front_SIM_MSISDN}     ${phoneNumber}
    Run Keyword And Ignore Error        ${Front_SIM_Validity}
    Wait Until Page Contains Element    ${Front_Brand_MSISDN}
    Wait Until Page Contains Element    ${Front_See_PUK}

Back SIM Card Info
    Wait Until Page Contains Element    ${Back_SIM_Card}    timeout=30s
    Wait Until Page Contains Element    ${Back_SIM_PUK1}
    Wait Until Page Contains Element    ${Back_SIM_PUK2}
    Wait Until Page Contains Element    ${Back_To_Front_SIM}
    Click Element                       ${Back_To_Front_SIM}

Inactive SIM Card Info
    Wait Until Page Contains Element    ${Inactive_SIM_Card}    timeout=30s
    Wait Until Page Contains Element    ${Inactive_SIM_MSISDN}
    Wait Until Page Contains Element    ${Inactive_Brand_MSISDN}
    Wait Until Page Contains Element    ${Switch_SIM_Button}

Switch Confirmation Info
    [Arguments]     ${current}      ${switchTo}
    Wait Until Page Contains Element    ${Switch_Confirmation_SIM_Button}   timeout=30s
    Wait Until Page Contains            ${WCMS["account_pop_up_switch_title"]}
    Wait Until Page Contains            ${WCMS["account_pop_up_switch_button"]}
    Wait Until Page Contains Element    ${Switch_Description}
    Wait Until Page Contains            You are on ${current}
    Wait Until Page Contains            Do you want to switch to ${switchTo} ?

Valid Selected Result
  [Arguments]    ${element}       ${expected}
  Element Attribute Should Match      ${element}      selected   ${expected}

Verify Skeleton Page
    Valid Selected Result               ${TabBar_Menu}      True
    Page Should Not Contain Element     ${Front_SIM_Card}
    Page Should Not Contain Element     ${Add_Number_Card_Profile}
    Page Should Not Contain Element     ${APP_PACKAGE}:id/rl_language

Add New Card And Confirm 
    Wait Until Page Contains Element    ${Add_Number_Card_Profile}  timeout=30s
    Click Element                       ${Add_Number_Card_Profile}
    Wait Until Page Contains Element    ${Switch_Confirmation_SIM_Button}
    Click Element                       ${Switch_Confirmation_SIM_Button}

Go To Menu Setting
    Wait Until Page Contains Element    ${TabBar_Menu}  timeout=60s
    Click Element                       ${TabBar_Menu}
    Wait Until Page Contains Element    ${Front_See_PUK}    timeout=30s

Verify Account Already Reach 5
    Page Should Not Contain Element     ${Add_Number_Card_Profile}
    Click Element                       ${TabBar_Home}
    Wait Until Page Contains Element    ${Current_PhoneNunber_Id}       timeout=30s
    Click Element                       ${Current_PhoneNunber_Id}
    Page Should Not Contain Element     ${Popup_Add_Account_Add_btn}

Login With Multiple MSISDN
    FOR    ${i}    IN RANGE    3    
        ${idx}=      Evaluate        ${i}+2
        RBFindElement.find text in list view android    ${AddCard_Container}    Add Number     right
        sleep       5s
        Add New Card And Confirm
        Exit For Loop If    "${phoneNumbers}[${i}]" == "${EMPTY}"
        Add More Social Account Twitter    ${phoneNumbers}[${i}]   ${accounts}[${i}]       ${passwords}[${i}]     ${emails}[${i}]
        Go To Menu Setting
        Front SIM Card Info                 ${phoneNumbers}[${i}]
        Run Keyword If      ${idx}==5     Verify Account Already Reach 5
    END
    
Switch SIM Card
    [Arguments]     ${current}      ${switchTo}
    Wait Until Page Contains Element    ${Switch_SIM_Button}    timeout=30s
    Click Element                       ${Switch_SIM_Button}
    Switch Confirmation Info        ${current}      ${switchTo}
    Click Element                       ${Switch_Confirmation_SIM_Button}
    Wait Until Page Contains Element    ${Front_See_PUK}    timeout=30s

Logout Multiple MSISDN
    FOR    ${i}    IN RANGE    5
        Wait Until Page Contains     ${Current_PhoneNunber_Id}  timeout=60s
        ${current_pn}    Get Text    ${Current_PhoneNunber_Id}
        Exit For Loop If    "${current_pn}" == "${TW_LinkAccount_Phonenumber}"
        Logout Application From Menu
        Wait Until Page Contains Element    ${Current_PhoneNunber_Id}   timeout=30s
        Click Element       ${Current_PhoneNunber_Id}
        Wait Until Page Contains    ${current_pn}
        Click Text                  ${current_pn}
        Wait until page contains    ${current_pn}   timeout=30
        Click Element               ${Delete_Phone_Number_Confirm}
        Wait Until Page Contains Element        ${Delete_Phone_number_Confirmed_2}
        Click Element               ${Delete_Phone_number_Confirmed_2}
        Wait Until Page Contains Element    ${Current_PhoneNunber_Id}   timeout=30s
    END

*** Variables ***
@{phoneNumbers}=    ${EMPTY}    ${EMPTY}    ${EMPTY}
@{accounts}=        ${EMPTY}    ${EMPTY}    ${EMPTY}
@{passwords}=       ${EMPTY}    ${EMPTY}    ${EMPTY}
@{emails}=          ${EMPTY}    ${EMPTY}    ${EMPTY}

*** Test Cases ***
Verify Switch SIM Card
    [Documentation]    Verify Switch SIM Card
        ...     |TC Android|TC336  TC337  TC348  TC349  TC341  TC342  TC344  TC345|	
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Wait Until Page Contains Element    ${TabBar_Menu}  timeout=60s
    Click Element                       ${TabBar_Menu}
    Front SIM Card Info                 ${TW_LinkAccount_Phonenumber}
    Click Element                       ${Front_See_PUK}
    Back SIM Card Info
    Add New Card And Confirm
    Add More Social Account Twitter    ${TW2_Phonenumber}   ${TW2_Account}     ${TW2_Password}     ${TW2_Email}
    Go To Menu Setting
    Front SIM Card Info                 ${TW2_Phonenumber}
    # Click tab indicator to switch between card
    Click Element                       //android.widget.FrameLayout[@resource-id="${APP_PACKAGE}:id/vp_indicator"]/android.widget.LinearLayout/android.widget.RelativeLayout[@index="0"]
    # swipe horizontally
    Scroll                    ${Switch_SIM_Button}      ${Front_See_PUK}
    Inactive SIM Card Info
    Switch SIM Card           ${TW2_Phonenumber}    ${TW_LinkAccount_Phonenumber}
    Front SIM Card Info                 ${TW_LinkAccount_Phonenumber}
    Switch SIM Card           ${TW_LinkAccount_Phonenumber}     ${TW2_Phonenumber}
    Front SIM Card Info                 ${TW2_Phonenumber}

Add Multiple Login Account
    # note: not sure how to verify skeleton page
    [Documentation]    Add MSISDN until it reach 5 phone number
        ...     |TC Android|TC348|
        ...     |TC Type|Negative Case|
    [Tags]      Android
    # Verify Skeleton Page 
    Go To Menu Setting
    Login With Multiple MSISDN

Remove Multiple Login Account
    [Tags]      Android
    Logout Multiple MSISDN