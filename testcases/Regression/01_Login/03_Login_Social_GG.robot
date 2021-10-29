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


*** Keywords **
Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    
    Reopen App      ${EMPTY}
    Check Launching New version 
    Check Tutup popup
    Check Permission First Launch
    Check default lang and swtich
    Check Banner on the login page 

*** Test Cases **

Verify Link to account Google success
    [Documentation]     
        ...     |*TC IDs*|Android    TC491    TC492|
    [Tags]  Google
    Login Social Account FaceBook                ${FB2_Phonenumber}       ${FB2_Password}       ${FB2_Email}    
    Check Reminder
    Check Permission Location Display
    Wait until page contains                     ${FB2_Phonenumber}       timeout=30
    Click Element    ${TabBar_Menu}
    Wait until page contains                     ${WCMS["account_management_text"]}      timeout=30
    Click Text                                   ${WCMS["account_management_text"]} 
    Wait until page contains                     ${WCMS["account_my_profile_text"]}           timeout=30
    Click Text                                   ${WCMS["account_my_profile_text"]} 
    Wait until page contains element             ${Load_Content_Title}              timeout=30
    Run Keyword And Return Status                Page Should Contain                          ${editprofile_personalinformation_title}       timeout=30
    Swipe	    600    1800    600    500    1000
    Wait until page contains element             ${Social_account}   
    ${status}            Run Keyword And Return Status      Element Text Should Be    ${Google_toggle}       ON    
    Run Keyword If       ${status}==True           Click Element           ${Google_toggle}          
    Run Keyword If       ${status}==True           Wait until page contains              ${WCMS["email_register_button_success"]}      timeout=30
    Run Keyword If       ${status}==True           Wait until page contains element      ${Yes_btn} 
    Run Keyword If       ${status}==True           Click Element                         ${Yes_btn}
    Wait until page contains element             ${Google_toggle}            timeout=30
    Element Attribute Should Match     ${Google_toggle}     text       OFF                  
    Click Element                      ${Google_toggle}
    Wait until page contains element              ${GG_chrome_header}              timeout=30
    Run Keyword And Return Status                  Wait until page contains                      ${GG_Page_Header}            
    Wait until page contains                      ${GG_Email}                    timeout=60
    Click Text                                    ${GG_Email}
    Wait until page contains element             ${Google_toggle}            timeout=60
    Sleep  10
    Element Attribute Should Match     ${Google_toggle}     checked       true
    Go Back 
    Logout Application From Menu    

Verify Login via Social Account Google 
    [Documentation]     
        ...     |*TC IDs*|Android    TC486    TC487|
    [Tags]  Google1
    Wait until page contains element              ${Login_page_Language}           timeout=90
    Wait until page contains                      ${WCMS["login_page_title"]}      timeout=30
    Clear text                                    ${Login_page_Phone_TextField}
    Click Element                                 ${Login_page_Phone_TextField}
    Input text                                    ${Login_page_Phone_TextField}       ${GG_Phonenumber}
    Hide Keyboard
    Wait until page contains element              ${Login_page_Login_btn}
    Click Element                                 ${Login_page_Login_btn}
    Wait until page contains                      ${WCMS["login_page_other_methods_title"]}    timeout=30
    Click Text                                    ${WCMS["login_page_other_methods_title"]} 
    Verify Other Login Page
    Click Text                                    ${WCMS["login_page_other_methods_google_text"]}
    Wait until page contains element              ${GG_chrome_header}              timeout=30
    Run Keyword And Return Status                  Wait until page contains                      ${GG_Page_Header}            
    Wait until page contains                      ${GG_Email}                    timeout=60
    Click Text                                    ${GG_Email}

    # ${get_acc}           Get Text         ${acc_1}    
    # ${status}            Run Keyword And Return Status      Should Be Equal As Strings       ${get_acc}        ${name_gg} 
    # Run Keyword If       ${status}=True           Click Element      ${acc_1}
    # Run Keyword If       ${status}=False          Click Element      ${acc_2}
    Check Permission Location Display
    Check reminder verify your email
    Notify Home Page   
    Wait until page contains                      ${GG_Phonenumber}   timeout=30
    [Teardown]      Tear Down Test Cases And Logout

Verify Login via Social Account Google BUT Acc GG not bind
    [Documentation]     
        ...     |*TC IDs*|Android    TC488    TC489|
    [Tags]  Google1
    Wait until page contains element              ${Login_page_Language}           timeout=90
    Wait until page contains                      ${WCMS["login_page_title"]}      timeout=30
    Clear text                                    ${Login_page_Phone_TextField}
    Click Element                                 ${Login_page_Phone_TextField}
    Input text                                    ${Login_page_Phone_TextField}       ${GG_Phonenumber}
    Hide Keyboard
    Wait until page contains element              ${Login_page_Login_btn}
    Click Element                                 ${Login_page_Login_btn}
    Wait until page contains                      ${WCMS["login_page_other_methods_title"]}    timeout=30
    Click Text                                    ${WCMS["login_page_other_methods_title"]} 
    Verify Other Login Page                       
    Wait until page contains                      ${WCMS["login_page_other_methods_google_text"]}
    Click Text                                    ${WCMS["login_page_other_methods_google_text"]}
    Wait until page contains element              ${GG_chrome_header}              timeout=30
    Run Keyword And Return Status                  Wait until page contains                ${GG_Page_Header}          timeout=30
    Wait until page contains                      ${GG2_Email}                    timeout=60
    Click Text                                    ${GG2_Email}
    ${message}            Run Keyword And Return Status      Wait until page contains       ${WCMS["label.login_page_app.button.alternate_login"]}  timeout=30           
    Run Keyword If       ${message}=True                     Page Should Contain            ${WCMS["login_page_other_methods_not_linked_desc"]}          
    Run Keyword If       ${message}=True                     Click Button                   ${WCMS["login_page_other_methods_not_linked_button"]} 
    ${error_1}            Run Keyword And Return Status      Page Should Contain            ${WCMS["login_page_other_methods_error_title"]}
    Run Keyword If       ${error_1}=True                     Click Element                  com.telkomsel.mytelkomsel:id/ivClose           
    
                         

    