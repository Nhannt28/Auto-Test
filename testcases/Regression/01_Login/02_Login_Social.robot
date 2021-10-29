*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/SettingPage.robot
Resource            ../../../variables/account.robot
Resource            LoginCommonKeyWord.robot
Suite Setup         Check PreConditional
Suite Teardown      Close Application
# Test Setup          Launch Application
# Test Teardown       Tear Down Test Cases

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

*** Test Cases **
Verify Login Page
    [Documentation]
        ...     |*TC IDs*|IOS TC1608 - Android TC470|
        ...     |*TC Type*| Positive Case| 
    [Tags]    LoginPage
    Verify Login Page
    
Verify Buy New Sim Card
    [Tags]    iOS     Android
    Click Text      ${WCMS["login_page_buy_new_sim"]}
    Check Verify Security Certificate when first time open Buy New Sim
    # ${str1} =	Convert To Upper Case	${WCMS["login_buy_sim_button"]}
    Wait until page contains    ${Buy_SimCard_Header}    timeout=30
    Wait until page contains element       ${Load_Content_Close}       timeout=30  
    Click Element               ${Load_Content_Close}

# Verify Terms and Conditional
#     [Tags]    iOS
#     Verify Login Page
#     Click Text      ${WCMS["web_tnc_title"]}
#     Wait until page contains    ${WCMS["web_tnc_title"]}    timeout=30
#     Click Element   ${Load_Content_Close}

# Verify Privacy Policy
#     [Tags]    iOS
#     Verify Login Page
#     Click Text      ${WCMS["label.login_page_app.body.privacy_policy"]}
#     Wait until page contains    ${WCMS["label.login_page_app.body.privacy_policy"]}    timeout=30
#     Click Element   ${Load_Content_Close}


Verify Other Login Page Screen
    [Tags]    iOS       Android
    Wait until page contains element      ${Login_page_Language}   timeout=90
    Wait until page contains              ${WCMS["login_page_title"]}   timeout=30
    Login With Msisdn Number              ${TW_Phonenumber}
    Click Text                            ${WCMS["login_page_other_methods_title"]}
    Verify Other Login Page
    Go Back
    Go Back
    Sleep  3

Login Social Account FaceBook
    [Documentation]    Verify Login Page #TC470
    [Tags]    Social_login    FaceBook     iOS     Android
    Login Social Account FaceBook       ${FB2_Phonenumber}       ${FB2_Password}       ${FB2_Email}
    Check Reminder
    Check Permission Location Display
    Wait until page contains    ${FB2_Phonenumber}   timeout=30
    [Teardown]      Tear Down Test Cases And Logout


Login Social Account Twitter
    [Documentation]    Verify Login Page #TC470
    [Tags]    Social_login    Twitter   iOS     Android1
    Launch Application 
    Login Social Account Twitter    ${TW_Phonenumber}   ${TW_Account}     ${TW_Password}     ${TW_Email}
    Check Reminder
    Check Permission Location Display
    Wait until page contains    ${TW_LinkAccount_Phonenumber}   timeout=30      
    # [Teardown]      Tear Down Test Cases And Logout