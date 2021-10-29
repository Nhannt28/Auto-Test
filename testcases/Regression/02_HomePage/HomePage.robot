*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/SettingPage.robot
Resource            ../../../variables/account.robot
Resource            LoginCommonKeyWord.robot
Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Launch Application
Test Teardown       Tear Down Test Cases

*** Variables ***
${MsisdnSelected_PhoneNUmber}            ${APP_PACKAGE}:id/tv_prepaidMsisdnSelected
*** Keywords ***

Login Social Account Twitter
    [Documentation]    Verify Login Page #TC470
    [Arguments]    ${phoneNumber}       ${account}      ${password}     ${email}
    Wait until page contains element  ${Login_page_Language}   timeout=90
    Scroll Up If Need
    Scroll Up If Need
    Wait until page contains    ${WCMS["login_page_title"]}   timeout=30
    Login With Msisdn Number   ${TW_Phonenumber}
    Click Text                    ${WCMS["login_page_other_methods_title"]}
    Verify Other Login Page
    Click Text    ${WCMS["label.other_login_option_app.body.twitter"]}
    Wait until page contains    ${TW_Page_Header}   timeout=30
    Click Element    ${TW_fill_email}
    Input text    ${TW_fill_email}   ${account}
    Click Element    ${TW_fill_pw}
    Input text    ${TW_fill_pw}   ${password}
    Swipe	500	    400	    500 	200	1000
    Wait until page contains    ${TW_Login_btn1}
    Click Text        ${TW_Login_btn1}
    Check Reminder
    Wait until page contains    ${TW_Page_Verify_Header}   timeout=30
    ${Result}   Run Keyword And Return Status   Page Should Contain Text   ${TW_Page_Verify_check}
    Click Element    ${TW_Page_Verify_Answer}       
    Run Keyword If      ${Result}==True       Input text    ${TW_Page_Verify_Answer}   ${phoneNumber}
    Run Keyword If      ${Result}==False      Input text    ${TW_Page_Verify_Answer}   ${email}
    Click Element    ${TW_Page_Verify_Submit}
    Check Reminder
    # Wait until page contains    Authorize app   timeout=30
    # Click Element    ${TW_Page_Final_Confirm}


# Login Social Account Twitter
#     [Documentation]    Verify Login Page #TC470
#     [Arguments]    ${phoneNumber}       ${account}      ${password}     ${email}
#     Wait until page contains element  ${Login_page_Language}   timeout=90
#     Scroll Up If Need
#     Scroll Up If Need
#     Wait until page contains    ${WCMS["login_page_title"]}   timeout=30
#     Login With Msisdn Number   ${TW_Phonenumber}
#     Click Text                    ${WCMS["login_page_other_methods_title"]}
#     Verify Other Login Page
#     Click Text    ${WCMS["label.other_login_option_app.body.twitter"]}
#     Wait until page contains    ${TW_Page_Header}   timeout=30
#     Click Element    ${TW_fill_email}
#     Input text    ${TW_fill_email}   ${account}
#     Click Element    ${TW_fill_pw}
#     Input text    ${TW_fill_pw}   ${password}
#     Swipe	500	    400	    500 	200	1000
#     Wait until page contains element    ${TW_Login_btn1}
#     Click Element        ${TW_Login_btn1}
#     ${NeedVerify}       Run Keyword And Return Status       Wait until page contains    ${TW_Page_Verify_Header}   timeout=30
#     Run Keyword If      ${NeedVerify}==True       Verify Twitter Safe Account       ${phoneNumber}      ${email}

Verify VOC GUI
    [Documentation]    Verify Login Page #TC470
    Wait until page contains    ${WCMS["voc_heading"]}    timeout=30
    Wait until page contains    ${WCMS["voc_feedback"]}
    Wait until page contains    ${WCMS["voc_login_text"]}
    Wait until page contains    ${WCMS["voc_scale_rating_default"]}
    Wait until page contains    ${WCMS["skip"]}
    Click Element    ${VOC_rating}
    Click Element    ${VOC_Continue}
    Wait until page contains    ${WCMS["voc_buy_package_text"]}    timeout=30
    Wait until page contains    ${WCMS["voc_notice"]}
    Wait until page contains    ${WCMS["voc_rating"]}
    Wait until page contains    ${WCMS["not_likely_title"]}
    Wait until page contains    ${WCMS["very-likely.title"]}
    Wait until page contains    ${WCMS["voc_textarea_text"]}
    Wait until page contains    ${WCMS["feedback2_title_fourth"]}
    Wait until page contains    ${WCMS["label.global.button.submit"]}
    Wait until page contains    ${WCMS["skip"]}

    Click Element    ${VOC_textField}
    Input text    ${VOC_textField}   test comment
    Swipe	500	    400	    500 	0	1000
    Click Element    ${VOC_Submit}
    Wait until page contains    ${WCMS["voc_success_feedback"]}    timeout=30
    Wait until page contains    ${WCMS["voc_thankyou_text"]}
    Wait until page contains    ${WCMS["voc_rate_text_android"]}
    Wait until page contains    ${WCMS["payment-go-to-dashboard"]}
    Click Element    ${VOC_Home}

Skip VOC GUI
    ${Result}   Run Keyword And Return Status   Wait until page contains    ${WCMS["voc_scale_rating_default"]}    timeout=30
    Run Keyword If      ${Result}==True       Click Element    ${VOC_Skip}
       
Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Social_login    HomePage      Twitter     Android     iOS
    Reopen App      ${EMPTY}
    Check Launching New version 
    Check Permission First Launch
    Check Tutup popup
    Check Reminder
    Check Tutup popup
    Check Logined User    ${TW_LinkAccount_Phonenumber}    ${TW_Phonenumber}   ${TW_Account}     ${TW_Password}     ${TW_Email}
    Check Tutup popup
    Check Reminder
    Check Permission Location Display
    ${Result}   Run Keyword And Return Status   Wait until page contains    ${WCMS["voc_heading"]}    timeout=30
    Run Keyword If      ${Result}==True       Verify VOC GUI
    BuiltIn.Sleep   2s

*** Test Cases ***
Add More Account To Application
    [Documentation]     User success Add another number  
        ...     |*TC IDs*|iOS TC052 - Android:TC1192|
        ...     |*TC Type*| Positive Case|   
    [Tags]    Social_login    HomePage      Twitter     Android1     iOS
    Check VOC Dispaly And Skip
    Check Reminder
    Check Tutup popup
    Wait until page contains    ${TW_LinkAccount_Phonenumber}   timeout=30
    BuiltIn.Sleep   15s
    Click Element    ${Home_Page_Open_Popup_Account}
    Wait until page contains    ${WCMS["dashboard_header_add_number_text"]}        timeout=30
    Click Text        ${WCMS["dashboard_header_add_number_text"]}
    Add More Social Account Twitter    ${TW2_Phonenumber}   ${TW2_Account}     ${TW2_Password}     ${TW2_Email}
    Check Tutup popup
    # Wait until page contains Element        ${MsisdnSelected_PhoneNUmber}        timeout=30
    # Click Element                        ${MsisdnSelected_PhoneNUmber}
    Wait until page contains    ${TW2_Phonenumber}   timeout=30
    BuiltIn.Sleep   15s
    Click Text    ${TW2_Phonenumber}
    Wait until page contains    ${TW_LinkAccount_Phonenumber}
    Wait until page contains    ${TW2_LinkAccount_Phonenumber}


Remove Account In Application
    [Documentation]     User success delete number 
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Social_login    HomePage      Twitter  RemoveAcc     Android1    iOS
    Check VOC Dispaly And Skip
    Check Tutup popup
    Wait until page contains    ${TW2_Phonenumber}   timeout=30
    Click Element    ${TabBar_Menu}
    BuiltIn.Sleep   2s
    Swipe	500	    400	    500 	0	1000
    Click Element    ${Menu_Setting}
    # ${str1} =	Convert To Upper Case	${WCMS["account_application_setting_text"]}
    # Wait until page contains    ${str1}   timeout=30
    Wait until page contains    ${WCMS["account_application_setting_header"]}
    Click Element    ${Setting_logout}
    BuiltIn.Sleep   2s
    Check Tutup popup
    Check Reminder
    Check Permission Location Display
    Wait until page contains    ${TW_LinkAccount_Phonenumber}   timeout=30
    Click Element    ${Home_Page_Open_Popup_Account}
    Wait until page contains    ${TW_LinkAccount_Phonenumber}
    Wait until page contains    ${TW2_Phonenumber}
    Click Text    ${TW2_Phonenumber}
    Wait until page contains    ${TW2_Phonenumber}   timeout=30
    Click Element    ${Delete_Phone_Number_Confirm}
    Wait Until Page Contains Element        ${Delete_Phone_number_Confirmed_2}
    Click Element    ${Delete_Phone_number_Confirmed_2}
    Check Tutup popup
    Check Reminder
    Wait until page contains    ${TW_LinkAccount_Phonenumber}   timeout=30
    Click Element    ${Home_Page_Open_Popup_Account}
    Wait until page contains    ${TW_LinkAccount_Phonenumber}
    Page Should Not Contain Text        ${TW2_LinkAccount_Phonenumber}
    #Wait until page contains        ${TW2_Phonenumber}