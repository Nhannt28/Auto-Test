*** Keywords ***

Skip VOC GUI
    Wait until page contains    ${WCMS["voc_scale_rating_default"]}    timeout=30
    Click Element    ${VOC_Skip}
   

Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
    [Tags]    Android     iOS
    Reopen App      ${EMPTY}
    Check Launching New version 
    Check Logined User    ${TW2_LinkAccount_Phonenumber}    ${TW2_Phonenumber}   ${TW2_Account}     ${TW2_Password}     ${TW2_Email}
    Check Permission First Launch
    Check Tutup popup
    Check Reminder
    Check Tutup popup
    # Check Logined Default User
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s

Go To Bill Menu
    Launch Application
    Wait until page contains    ${TW2_LinkAccount_Phonenumber}   timeout=30
    Check VOC Dispaly And Skip
    Click Element    ${TabBar_Menu}
    BuiltIn.Sleep   2s
    Wait until page contains    ${WCMS["account_management_text"]}   timeout=30
    Click Text  ${WCMS["account_management_text"]}
    Wait until page contains    ${WCMS["account_billing_text"]}   timeout=30
    Click Text  ${WCMS["account_billing_text"]}
    BuiltIn.Sleep   2s

Verify GUI Password Email Popup
    Wait until page contains    ${WCMS["my_billing_enter_password_title"]}   timeout=30
    Wait until page contains    ${WCMS["my_billing_enter_password_text"]}
    Wait until page contains    ${WCMS["my_billing_enter_password_button"]}
    Page Should Contain Element     ${Bill_Page_Password_Email}

Verify GUI E-Bill Page
    Input text    ${Bill_Page_Password_Email}   ${TW_PW_Bill_Email}
    Click Text       ${WCMS["my_billing_enter_password_button"]}

    Wait until page contains    ${WCMS["my_billing_register_ebill_header"]}   timeout=30
    Wait until page contains    ${WCMS["my_billing_ebill_title"]} 
    Wait until page contains    ${WCMS["my_billing_ebill_registered_text"]} 
    Wait until page contains    ${WCMS["my_billing_ebill_edit_text"]} 
    Wait until page contains    ${WCMS["my_billing_ebill_button"]} 

Verify GUI Change Email
    Wait until page contains    ${WCMS["my_billing_edit_ebill_header"]}   timeout=30
    Wait until page contains    ${WCMS["my_billing_edit_ebill_current_title"]} 
    Wait until page contains    ${WCMS["my_billing_edit_ebill_new_title"]} 
    Wait until page contains    ${WCMS["my_billing_edit_ebill_confirm_title"]} 
    Wait until page contains    ${WCMS["my_billing_ebill_edit_text"]}

    Element Attribute Should Match      ${Bill_Page_New_Email}      text   ${WCMS["my_billing_edit_ebill_confirm_placeholder"]}
    Element Attribute Should Match      ${Bill_Page_Re_Email}      text   ${WCMS["my_billing_edit_ebill_confirm_placeholder"]}

    Check Button Clickable      ${Bill_Page_Confirm_Change_Email}    false
