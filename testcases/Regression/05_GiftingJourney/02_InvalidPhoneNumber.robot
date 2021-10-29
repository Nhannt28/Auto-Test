*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/SendGiftPage.robot
Resource            ../../../variables/account.robot
Test Template         Login with invalid phonenumber should fail
Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Launch Application
Test Teardown       Tear Down Test Cases

*** Variables ***  
# ${message_warming_Input_not_active_PhoneNumber}         Number is not active
# ${message_warming_Input_grace_priod_PhoneNumber}        ${WCMS["send_gift_grace_number_label"]}
# ${message_warming_Input_Postpaid_PhoneNumber}           ${WCMS["send_gift_postpaid_number_label"]}


*** Test Cases ***                  PHONE NUMBER                FAIL MESSAGE    
Input invalid PhoneNumber           84947557945                 ${WCMS["send_gift_wrong_number_label"]}         
# Input not active PhoneNumber        081189081189081189      ${message_warming_Input_not_active_PhoneNumber}  
# Input grace priod PhoneNumber       08128025167             ${message_warming_Input_grace_priod_PhoneNumber}
Input own number PhoneNumber           081397027224            ${WCMS["send_gift_same_number_label"]} 
Input Postpaid PhoneNumber          08111447224             ${WCMS["send_gift_postpaid_number_label"]} 


            

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

Login with invalid phonenumber should fail
    [Arguments]     ${phoneNumber}      ${fail_message}
    Check Reminder
    Wait until page contains       ${TabBar_Shop}        timeout=30      
    Click Element                  ${TabBar_Shop}
    Wait Until Page Contains Element        ${Send_Btn}        timeout=30             
    Click Element                   ${Send_btn}
    Wait until page contains        ${Input_Number_Text_Field}
    #Check Button Clickable       ${Continue_Btn}    true
    Click Element                   ${Input_Number_Text_Field}
    Input text                      ${Input_Number_Text_Field}        ${phoneNumber}
    Wait until page contains        ${fail_message}
    Check Button Clickable          ${Continue_Btn}    true
    Clear text                      ${Input_Number_Text_Field}
    Page Should Not Contain Text    ${fail_message}
    Wait until page contains        ${Input_Number_Text_Field}    