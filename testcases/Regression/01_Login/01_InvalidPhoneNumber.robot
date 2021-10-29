*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/account.robot
Suite Setup         Check PreConditional
Suite Teardown      Close Application
# Test Setup          Launch Application
# Test Teardown       Tear Down Test Cases
Test Template         Login with invalid phonenumber should fail
*** Variables ***  
${message_warming_verify_phone_number}     Please enter Telkomsel number only 
${message_warming_phone_number_Overmax}    Please enter a valid number (10-12 character)
${Login_page_Phone_HideTextField}          08XX XXXX XXXX

*** Keywords **
Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Social_login    HomePage      Twitter     Android     iOS
    Reopen App      ${EMPTY}
    Check Launching New version 
    Check Tutup popup
    Check Permission First Launch
    Check default lang and swtich
    Check Banner on the login page 


*** Test Cases ***              USERNAME            FAIL MESSAGE    
PhoneNumber not in ID           84947557945         ${WCMS["login_page_error_invalid_number"]}              
PhoneNumber too short           081189              ${WCMS["login_page_error_telkomsel_number"]}  
PhoneNumber too long            081189081189081189  ${WCMS["login_page_error_telkomsel_number"]} 
            

*** Keywords ***
Login with invalid phonenumber should fail
    [Arguments]     ${phoneNumber}      ${fail_message}
    Wait until page contains    ${WCMS["login_page_title"]}   timeout=30
    Wait until page contains    ${WCMS["login_page_msisdn_placeholder"]} 
    Wait until page contains    ${Login_page_Phone_TextField}  
    Clear text   ${Login_page_Phone_TextField}
    Element Attribute Should Match      ${Login_page_Login_btn}       clickable   true
    Click Element    ${Login_page_Phone_TextField}
    Input text    ${Login_page_Phone_TextField}   ${phoneNumber}
    Hide Keyboard
    Wait until page contains    ${fail_message}
    Element Attribute Should Match      ${Login_page_Login_btn}       clickable   true
    Clear text   ${Login_page_Phone_TextField}
    Page Should Not Contain Text    ${fail_message}
    # Wait Until Page Does Not Contain    ${Login_page_Phone_TextField}   ${phoneNumber}    


