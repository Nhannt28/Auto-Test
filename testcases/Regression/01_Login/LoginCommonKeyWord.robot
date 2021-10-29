*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/SettingPage.robot
Resource            ../../../variables/account.robot

*** variables ***
${OtherMethod_Btn}        Other login methods

*** Keywords ***
Verify Login Page
    [Documentation]    
    Wait until page contains element  ${Login_page_Language}   timeout=90
    BuiltIn.Sleep   5s 
    Scroll Up If Need
    Scroll Up If Need
    Wait until page contains    ${WCMS["login_page_title"]}
    Scroll Down If Need
    Scroll Down If Need
    Wait until page contains    ${WCMS["login_page_msisdn_placeholder"]}
    Wait until page contains    ${WCMS["login_button"]}
    Wait until page contains Element    ${Login_page_Phone_TextField}
    Wait until page contains Element    ${Login_page_Desc}  
    Wait until page contains Element    ${Login_page_KeepLogin_Checkbox}
    Wait until page contains            ${WCMS["login_page_buy_new_sim"]}        timeout=30
    #Wait until page contains    ${WCMS["login_tnc_text"]}   # Text html verif y fail

Verify Wait Login Verify Number
    # Wait until page contains    ${WCMS["login_verification_number_title"]} timeout=30
    # Wait until page contains    ${WCMS["login_verification_number_text"]}
    Wait until page contains    ${WCMS["login_page_loading_text"]}        timeout=5
   
  

Verify Confirm Login Page
    [Arguments]    	${phone}
    ${verifyPhoneNumber}    Replace String  ${WCMS["login_page_magic_link_title"]}     %msisdn%      ${phone}
    Run Keyword And Return Status    Wait until page contains    ${verifyPhoneNumber}        timeout=30
    Wait until page contains element        ${Other_login_Page_send_link_sms}
    # Check Button Clickable       ${Other_login_Page_send_link_email}    true
    # Check Button Clickable       ${Other_login_Page_send_link_sms}    false
    # BuiltIn.Sleep   30s
    # Check Button Clickable       ${Other_login_Page_send_link_sms}    true

    Click Element    ${Other_login_Page_send_link_sms}
    BuiltIn.Sleep   5s
    # Check Button Clickable       ${Other_login_Page_Resend}    false
    Run Keyword And Return Status    Wait until page contains    ${WCMS["login_verification_text"]}
    Run Keyword And Return Status    Wait until page contains    ${WCMS["login_verification_retry_text"]}
    Run Keyword And Return Status    Wait until page contains    ${WCMS["login_page_other_methods_title"]}


Verify Other Login Page
    Wait until page contains    ${WCMS["login_page_other_methods_title"]}    timeout=30
    Wait until page contains    ${WCMS["login_social_media_title"]}
    Wait until page contains    ${WCMS["login_page_other_methods_desc"]}
    Wait until page contains    ${WCMS["login_page_other_methods_google_text"]}
    Wait until page contains    ${WCMS["login_page_other_methods_facebook_text"]}
    Wait until page contains    ${WCMS["login_page_other_methods_twitter_text"]}
    Wait until page contains    ${WCMS["login_page_other_methods_veronika_title"]}
    Run Keyword If      '${ENV}'=='ios'       Wait until page contains    Apple


Login With Msisdn Number
    [Arguments]    	${phoneNumber}
    Clear text   ${Login_page_Phone_TextField}
    Click Element    ${Login_page_Phone_TextField}
    Input text    ${Login_page_Phone_TextField}   ${phoneNumber}
    Hide Keyboard
    Wait until page contains element    ${Login_page_Login_btn}
    Click Element    ${Login_page_Login_btn}
    #Verify Wait Login Verify Number # screen transit too fast can not verify
    Verify Confirm Login Page   ${TW_Phonenumber_62}

#Check Security Certificate popup when first time open Buy New Sim
Verify Security Certificate when first time open Buy New Sim
    Wait until page contains element        ${Security_Certificate_Confirm_Title} 
    Wait until page contains element        ${Security_Certificate_Confirm_BtnContinue}
    Wait until page contains element        ${Security_Certificate_Confirm_Description}
    Wait until page contains element        ${Security_Certificate_Confirm_BtnCancel}
    Click Element                           ${Security_Certificate_Confirm_BtnContinue}
Check Verify Security Certificate when first time open Buy New Sim
    ${Security_title}       Run Keyword And Return Status       Wait until page contains element    ${Security_Certificate_Confirm_Title}    timeout=60
    Run Keyword If      ${Security_title}==True       Verify Security Certificate when first time open Buy New Sim

Check Reminder
    ${Reminder}       Run Keyword And Return Status       Wait until page contains      ${WCMS["dashboard_link_email_remind_button"]}    timeout=30
    Run Keyword If      ${Reminder}==True        Click Text        ${WCMS["dashboard_link_email_remind_button"]}

Check reminder verify your email 
    ${verify_email}       Run Keyword And Return Status       Wait until page contains      ${WCMS["dashboard_verify_email_button"]}        timeout=30
    Run Keyword If      ${verify_email}==True        Wait until page contains        ${WCMS["dashboard_link_email_title"]}
    Run Keyword If      ${verify_email}==True        Wait until page contains        ${WCMS["dashboard_verify_email_text"]}
    Run Keyword If      ${verify_email}==True        Wait until page contains        ${WCMS["dashboard_verify_email_subtitle"]}
    Run Keyword If      ${verify_email}==True        Wait until page contains        ${WCMS["dashboard_verify_email_desc"]}
    Run Keyword If      ${verify_email}==True        Click Button        ${WCMS["dashboard_verify_email_button"]}

Login Social Account FaceBook
   [Documentation]    Verify Login Page #TC470
   [Tags]    Social_login    FaceBook     iOS     Android
   [Arguments]    ${phoneNumber}      ${password}     ${email}
    Wait until page contains element     ${Login_page_Language}   timeout=60
    Wait until page contains             ${WCMS["login_page_title"]}   timeout=30
    Clear text                           ${Login_page_Phone_TextField}
    Click Element                        ${Login_page_Phone_TextField}
    Input text                           ${Login_page_Phone_TextField}   ${phoneNumber}
    Hide Keyboard
    Swipe	500	    400	    500 	200	 1000
    Click Element                        ${Login_page_Login_btn}
    Wait until page contains             ${WCMS["login_page_other_methods_title"]}    timeout=30
    Click Text                            ${WCMS["login_page_other_methods_title"]}                                  
    Verify Other Login Page
    Click Text                           ${WCMS["login_page_other_methods_facebook_text"]}
    Wait until page contains             ${FB_Page_Header}   timeout=30
    Wait until page contains element      ${FB_fill_email}
    Click Element                        ${FB_fill_email}
    Input text    ${FB_fill_email}   ${email}
    Click Element                        ${FB_fill_pw}
    Input text    ${FB_fill_pw}   ${password}
    Click Element                        ${FB_Login_btn}
    Check reminder verify your email
    Notify Home Page
# Login Social Account Google
#     [Documentation]    Verify Login Page #TC470
#     [Tags]    Social_login    Google       iOS     Android
#     Wait until page contains element  ${Login_page_Language}   timeout=90
#     # Scroll Up If Need
#     # Scroll Up If Need
#     Wait until page contains    ${WCMS["login_page_title"]}   timeout=30
#     # Scroll Down If Need
#     # Scroll Down If Need
#     Login With Msisdn Number   ${GG_Phonenumber}
#     Click Element    ${Other_Login_Page_Button}
#     Verify Other Login Page
#     Click Text    ${WCMS["login_page_other_methods_google_text"]}
#     Wait until page contains    ${GG_Page_Header}   timeout=30
#     Wait until page contains element  ${GG_fill_email}
#     Click Element    ${GG_fill_email}
#     Input text    ${GG_fill_email}   ${GG_Email}
#     Swipe	500	    200	    500 	0	1000
#     Click Text    ${GG_fill_email_next}
#     Wait until page contains    ${GG_Email}   timeout=30
#     BuiltIn.Sleep   2s
#     Click Element    ${GG_fill_pw}
#     Input text    ${GG_fill_pw}   ${GG_Password}
#     Swipe	500	    200	    500 	0	1000
#     Click Text    ${GG_Login_btn}
#     Wait until page contains    ${GG_Phonenumber}   timeout=30
#     Click Element    ${TabBar_Menu}
#     BuiltIn.Sleep   2s
#     Swipe	500	    400	    500 	0	1000
#     Click Element    ${Menu_Setting}
#     ${str1} =	Convert To Upper Case	${WCMS["account_application_setting_text"]}
#     Wait until page contains    ${str1}   timeout=30
#     Click Element    ${Setting_logout}
#     BuiltIn.Sleep   2s
    

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
    Click Text        ${WCMS["login_page_other_methods_twitter_text"]}
    Wait until page contains    ${TW_Page_Header}   timeout=30
    Click Element    ${TW_fill_email}
    Input text    ${TW_fill_email}   ${account}
    Click Element    ${TW_fill_pw}
    Input text    ${TW_fill_pw}   ${password}
    Swipe	500	    400	    500 	200     1000
    Wait until page contains    ${TW_Login_btn1}        timeout=30
    Click Text        ${TW_Login_btn1}
    ${NeedVerify}       Run Keyword And Return Status       Wait until page contains    ${TW_Page_Verify_Header}   timeout=30
    Run Keyword If      ${NeedVerify}==True       Verify Twitter Safe Account       ${phoneNumber}      ${email}
    Check reminder verify your email
    Notify Home Page

Verify Twitter Safe Account
    [Arguments]    ${phoneNumber}   ${email}
    ${Result}   Run Keyword And Return Status   Page Should Contain Text   ${TW_Page_Verify_check}
    Click Element    ${TW_Page_Verify_Answer}       
    Run Keyword If      ${Result}==True       Input text    ${TW_Page_Verify_Answer}   ${phoneNumber}
    Run Keyword If      ${Result}==False      Input text    ${TW_Page_Verify_Answer}   ${email}
    Click Element    ${TW_Page_Verify_Submit}
    # Wait until page contains    Authorize app   timeout=30
    # Click Element    ${TW_Page_Final_Confirm}

Add More Social Account Twitter
    [Documentation]    Verify Login Page #TC470
    [Arguments]    ${phoneNumber}       ${account}      ${password}     ${email}
    Wait until page contains    ${WCMS["login_page_title"]}   timeout=30
    Click Element    ${Login_page_Phone_TextField}
    Input text    ${Login_page_Phone_TextField}   ${phoneNumber}
    Hide Keyboard
    Wait Until Page Contains Element    ${Login_page_Login_btn}     timeout=30
    Click Element    ${Login_page_Login_btn}
    Wait until page contains    ${WCMS["login_page_other_methods_title"]}    timeout=30
    Click Text                     ${WCMS["login_page_other_methods_title"]}
    Verify Other Login Page
    Click Text        ${WCMS["login_page_other_methods_twitter_text"]}
    Wait until page contains    ${TW_Page_Header}   timeout=30
    Click Element    ${TW_fill_email}
    Input text    ${TW_fill_email}     ${account}
    Click Element    ${TW_fill_pw}
    Input text    ${TW_fill_pw}   ${password}
    Swipe	500	    400	    500 	200	1000
    Wait until page contains            ${TW_Login_btn1}        timeout=30
    Click Text        ${TW_Login_btn1}
    ${NeedVerify}       Run Keyword And Return Status       Wait until page contains    ${TW_Page_Verify_Header}   timeout=30
    Run Keyword If      ${NeedVerify}==True       Verify Twitter Safe Account       ${phoneNumber}      ${email}
    Check reminder verify your email
    Notify Home Page







