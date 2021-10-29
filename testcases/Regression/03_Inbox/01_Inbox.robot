*** Settings ***
# | Variables | Inbox_api.py
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/Inbox.robot
Resource            ../../../variables/account.robot
Library             ../../../libraries/MathLib.py

Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Go To Inbox
Test Teardown       Go Back

*** Variables ***
${inbox_promo_list_header}        Inbox - Promo
${inbox_notification_header}        Notification
${choose_time}                    JUST ONCE
# ${Buy_Again}                    Beli Lagi
${Redeem_Points_Again}            Redeem Poin Lagi
${poin_Dashboard}                POIN


*** Keywords ***

Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Social_login    HomePage      Twitter     Android     iOS
    Reopen App      ${EMPTY}
    Check Launching New version 

    Check Tutup popup
    Check Reminder
    Check Tutup popup
    Check Permission First Launch
    Check Logined Default User
    Check Tutup popup
    Check Reminder
    Check Tutup popup
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   2s

Skip VOC GUI
    Wait until page contains    ${WCMS["voc_scale_rating_default"]}    timeout=30
    Click Element    ${VOC_Skip}

Go To Inbox
    Wait until page contains    ${Inbox_icon}     timeout=30
    Click Element            ${Inbox_icon} 
    Sleep  5 
    ${api_error}            Run Keyword And Return Status         Wait until page contains      ${WCMS["global_error_button_text"]}          timeout=30    
    Run Keyword If          ${api_error}==True                    Click Button                  ${WCMS["global_error_button_text"]}      

Verify Promo Page
    BuiltIn.Sleep   5s
    Run Keyword And Return Status        Wait until page contains             ${WCMS["inbox_promo_list_header"]}      timeout=30
    ${no_promo}       Run Keyword And Return Status    Wait until page contains         ${WCMS["inbox_empty_state_title"]} 
    ${emty_state}      Replace String         ${WCMS["inbox_empty_state_text"]}       %username%    ${user_name}
    Run Keyword if    ${no_promo}==True        Wait until page contains       ${emty_state}     timeout=30
    Run Keyword if    ${no_promo}==False       Exist Promo
    # Wait until page contains    ${WCMS["label.inbox.category_promotion"]}
    # Wait until page contains    ${WCMS["label.inbox.category_announcement"]}
    # Wait until page contains    ${WCMS["global_see_all"]}
    Wait until page contains    ${WCMS["global_edit_label"]}
    

Exist Promo 
    Click Element       ${Inbox_Promo_Edit}
    Wait until page contains    ${WCMS["TITLE-done"]}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Click Element       ${Inbox_List_CheckBox}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       true
    Click Element       ${Inbox_List_CheckBox}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Click Element       ${Inbox_SelectAll}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       true
    Click Element       ${Inbox_SelectAll}
    Valid CheckBox Result     ${Inbox_List_CheckBox}       false
    Click Element       ${Inbox_SelectAll}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       true
    Click Element       ${Inbox_Promo_Done}
    Click Element       ${Inbox_Promo_Edit}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Valid CheckBox Result      ${Inbox_SelectAll}       false
    Click Element       ${Inbox_Promo_Done}


Verify Notification Page
    Wait until page contains    ${inbox_notification_header}    timeout=30
    Wait until page contains    ${WCMS["global_see_all"]}
    Run Keyword And Return Status    Wait until page contains    ${WCMS["label.inbox.category_customer_support"]}
    Wait until page contains    ${WCMS["label.inbox.category_alert"]}
    Wait until page contains    ${WCMS["label.inbox.category_notification"]}
    

Verify Notification Page When Exist Notify 
    Click Element       ${Inbox_Notify_Edit}
    Wait until page contains    ${WCMS["TITLE-done"]}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Click Element       ${Inbox_List_CheckBox}
    Valid CheckBox Result     ${Inbox_List_CheckBox}       true
    Click Element       ${Inbox_List_CheckBox}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Click Element       ${Inbox_SelectAll}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       true
    Click Element       ${Inbox_SelectAll}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Click Element       ${Inbox_SelectAll}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       true
    Click Element       ${Inbox_Notify_Done}
    Click Element       ${Inbox_Notify_Edit}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Valid CheckBox Result      ${Inbox_SelectAll}       false
    Click Element       ${Inbox_Notify_Done}

Read Single Notify and Delete Single Notify
    Click Element                       ${Inbox_Notify_Edit} 
    Sleep  3
    Click Element                       ${Inbox_List_CheckBox}
    Wait until page contains element    ${mark_read}        timeout=30
    Click Element              ${mark_read}             
    ${mark_read_success}       Run Keyword And Return Status            Wait Until Page Does Not Contain Element        ${mark_read}       timeout=30
    Run Keyword if                      ${mark_read_success}==False                  Click Element       ${Inbox_Notify_Done}
    Wait until page contains element    ${Inbox_Notify_Edit}     timeout=30
    Sleep  3
    Click Element                       ${Inbox_Notify_Edit}
    Sleep  3
    Click Element                       ${Inbox_List_CheckBox}  
    Wait until page contains element    ${bt_delete}             timeout=30
    Click Element                       ${bt_delete}
    Sleep  5 
    Go Back

# Read Multi Notify and Delete Multi Notify
#     Wait until page contains            ${WCMS["inbox_notification_title"]}        timeout=30
#     Click Text        ${WCMS["inbox_notification_title"]}
#     Wait until page contains element    ${Inbox_Notify_Edit}        timeout=30
#     Click Element                       ${Inbox_Notify_Edit}
#     Wait until page contains element    ${checkbox_notify_1}        timeout=30
#     RBFindElement.find Element In Section Android        ${nested_scroll_view}         ${checkbox_notify_2}       
#     Wait until page contains element    ${checkbox_notify_2}        timeout=30
#     Click Element                       ${checkbox_notify_1}
#     Click Element                       ${checkbox_notify_2}
#     Wait until page contains element    ${mark_read}        timeout=30
#     Click Element                       ${mark_read} 
#     ${mark_read_success}       Run Keyword And Return Status        Wait Until Page Does Not Contain Element        ${mark_read}       timeout=30
#     Run Keyword if             ${mark_read_success}==False                  Click Element       ${Inbox_Notify_Done}
#     Wait until page contains element    ${Inbox_Notify_Edit}     timeout=30
#     Click Element                       ${Inbox_Notify_Edit}
#     Wait until page contains element    ${checkbox_notify_1}        timeout=30
#     Click Element                       ${checkbox_notify_1}
#     RBFindElement.find Element In Section Android        ${nested_scroll_view}         ${checkbox_notify_2} 
#     Click Element                       ${checkbox_notify_2}  
#     Wait until page contains element    ${bt_delete}         timeout=30
#     # Click Element                       ${bt_delete}
#     # Sleep  5 
#     # Go Back


Read Multi Notify and Delete Multi Notify
    Wait until page contains            ${WCMS["inbox_notification_title"]}        timeout=30
    Click Text        ${WCMS["inbox_notification_title"]}
    Wait until page contains element    ${Inbox_Notify_Edit}        timeout=30
    Click Element                       ${Inbox_Notify_Edit}
    
    ${result_1}                 Run Keyword And Return Status        Wait until page contains element    ${checkbox_notify_1.1}        timeout=30
    Run Keyword if              ${result_1}==True        Click Element         ${checkbox_notify_1.1} 
    Run Keyword if              ${result_1}==False       Wait until page contains element      ${checkbox_notify_1.1'}        timeout=30
    Run Keyword if              ${result_1}==False       Click Element         ${checkbox_notify_1.1'}
    ${result_2}                 Run Keyword And Return Status        Wait until page contains element    ${checkbox_notify_1.2}         timeout=30
    Run Keyword if              ${result_2}==True        Click Element         ${checkbox_notify_1.2}
    Run Keyword if              ${result_1}==False       Wait until page contains element       ${checkbox_notify_2.1}            timeout=30
    Run Keyword if              ${result_1}==False       Click Element         ${checkbox_notify_2.1}
    Wait until page contains element    ${mark_read}        timeout=30
    Click Element                       ${mark_read} 
    ${mark_read_success}       Run Keyword And Return Status        Wait Until Page Does Not Contain Element        ${mark_read}       timeout=30
    Run Keyword if             ${mark_read_success}==False                  Click Element       ${Inbox_Notify_Done}
    
    Wait until page contains element    ${Inbox_Notify_Edit}     timeout=30
    Click Element                       ${Inbox_Notify_Edit}
    ${result_1}                 Run Keyword And Return Status        Wait until page contains element    ${checkbox_notify_1.1}        timeout=30
    Run Keyword if              ${result_1}==True        Click Element         ${checkbox_notify_1.1} 
    Run Keyword if              ${result_1}==False       Wait until page contains element       ${checkbox_notify_1.1'}        timeout=30
    Run Keyword if              ${result_1}==False       Click Element         ${checkbox_notify_1.1'}
    ${result_2}                 Run Keyword And Return Status        Wait until page contains element    ${checkbox_notify_1.2}         timeout=30
    Run Keyword if              ${result_2}==True        Click Element         ${checkbox_notify_1.2}
    Run Keyword if              ${result_2}==False       Wait until page contains element       ${checkbox_notify_2.1}            timeout=30
    Run Keyword if              ${result_2}==False       Click Element         ${checkbox_notify_2.1}
    Wait until page contains element    ${bt_delete}         timeout=30
    Click Element                       ${bt_delete}
    Sleep  5 
    Go Back

Verify Detail Notify 
    Wait until page contains            ${WCMS["inbox_notification_title"]}        timeout=30
    Click Text        ${WCMS["inbox_notification_title"]}
    Wait until page contains element    ${detail_notify}         timeout=30
    Click Element                       ${detail_notify}
    Wait until page contains element    ${detail_notify_header}         timeout=30
    Wait until page contains element    ${detail_notify_image}
    Run keyword and return status                Wait until page contains            ${WCMS["inbox_incoming_text"]}          
    Wait until page contains element    ${detail_notify_descrip}
    Go Back

Verify Inbox Page
    Wait until page contains    ${WCMS["label.global.header.inbox"]}            timeout=30
    Wait until page contains    ${WCMS["inbox_notification_title"]}
    Wait until page contains    ${WCMS["inbox_notification_text"]}
    Wait until page contains    ${WCMS["inbox_promo_title"]}
    Wait until page contains    ${WCMS["inbox_promo_text"]}
    Wait until page contains    ${WCMS["global_edit_label"]}
    Wait until page contains    ${WCMS["inbox_transaction_title"]}
    Page Should Contain Element         ${Promo_icon}
    Page Should Contain Element         ${Notify_icon}

Verify Inbox Edit Mode 
    Wait Until Page Contains Element          ${Inbox_Edit}        timeout=30
    Click Element       ${Inbox_Edit}
    Wait until page contains    ${WCMS["label.inbox.body.select_all"]}       timeout=30
    Wait until page contains    ${WCMS["label.inbox.body.delete"]}  
    Wait until page contains    ${WCMS["inbox_mark_as_read_text"]}  
    Wait until page contains    ${WCMS["TITLE-done"]}
    Wait Until Page Contains Element        ${Inbox_List_CheckBox}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Click Element       ${Inbox_List_CheckBox}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       true
    Click Element       ${Inbox_List_CheckBox}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Click Element       ${Inbox_SelectAll}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       true
    Click Element       ${Inbox_SelectAll}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Click Element       ${Inbox_SelectAll}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       true
    Click Element       ${Inbox_Done}
     Wait Until Page Contains Element         ${Inbox_Edit}    timeout=30  
    Click Element       ${Inbox_Edit}
    Valid CheckBox Result      ${Inbox_List_CheckBox}       false
    Valid CheckBox Result      ${Inbox_SelectAll}       false
    Click Element       ${Inbox_Done}
    
Read Single Transaction and Delete Single Transaction
    Wait until page contains element    ${Inbox_Edit}        timeout=30  
    Click Element                       ${Inbox_Edit}  
    Wait until page contains element    ${Inbox_List_CheckBox}        timeout=30  
    Click Element                       ${Inbox_List_CheckBox}
    Wait until page contains element    ${mark_read}        timeout=30
    Click Element              ${mark_read}          
    Sleep  5    
    ${mark_read_success}       Run Keyword And Return Status            Wait Until Page Does Not Contain Element        ${mark_read}       timeout=30
    Run Keyword if                      ${mark_read_success}==False                  Click Element       ${Inbox_Done}
    Wait until page contains element    ${Inbox_Edit}     timeout=30
    Click Element                       ${Inbox_Edit}
    Wait until page contains element    ${Inbox_List_CheckBox}        timeout=30  
    Click Element                       ${Inbox_List_CheckBox}
    Wait until page contains element    ${bt_delete}             timeout=30
    Click Element                       ${bt_delete}
    Sleep  5 

Read Multi Transaction and Delete Multi Transaction

    Wait until page contains            ${WCMS["inbox_transaction_title"]}        timeout=30
    Wait until page contains element    ${Inbox_Edit}        
    Click Element                       ${Inbox_Edit}  

    ${result_1}                 Run Keyword And Return Status        Wait until page contains element    ${checkbox_transaction_1.1}         timeout=30
    Run Keyword if              ${result_1}==True        Click Element         ${checkbox_transaction_1.1} 
    Run Keyword if              ${result_1}==False       Wait until page contains element      ${checkbox_transaction_1.1'}         timeout=30
    Run Keyword if              ${result_1}==False       Click Element         ${checkbox_transaction_1.1'} 
    ${result_2}                 Run Keyword And Return Status        Wait until page contains element    ${checkbox_transaction_1.2}         timeout=30
    Run Keyword if              ${result_2}==True        Click Element         ${checkbox_transaction_1.2}
    Run Keyword if              ${result_1}==False       Wait until page contains element       ${checkbox_transaction_2.1}           timeout=30
    Run Keyword if              ${result_1}==False       Click Element         ${checkbox_transaction_2.1}
    Wait until page contains element    ${mark_read}        timeout=30
    Click Element                       ${mark_read} 
    ${mark_read_success}       Run Keyword And Return Status        Wait Until Page Does Not Contain Element        ${mark_read}       timeout=30
    Run Keyword if             ${mark_read_success}==False                  Click Element       ${Inbox_Notify_Done}
    Sleep  3
    Wait until page contains element    ${Inbox_Edit}      timeout=30
    Click Element                       ${Inbox_Edit} 

    ${result_1}                 Run Keyword And Return Status        Wait until page contains element    ${checkbox_transaction_1.1}         timeout=30
    Run Keyword if              ${result_1}==True        Click Element         ${checkbox_transaction_1.1} 
    Run Keyword if              ${result_1}==False       Wait until page contains element      ${checkbox_transaction_1.1'}         timeout=30
    Run Keyword if              ${result_1}==False       Click Element         ${checkbox_transaction_1.1'} 
    ${result_2}                 Run Keyword And Return Status        Wait until page contains element    ${checkbox_transaction_1.2}         timeout=30
    Run Keyword if              ${result_2}==True        Click Element         ${checkbox_transaction_1.2}
    Run Keyword if              ${result_1}==False       Wait until page contains element       ${checkbox_transaction_2.1}           timeout=30
    Run Keyword if              ${result_1}==False       Click Element         ${checkbox_transaction_2.1}
    Wait until page contains element    ${bt_delete}         timeout=30
    Click Element                       ${bt_delete}
    Sleep  5 
    # Go Back

Verify Transaction Detail Page

    Wait until page contains element        ${detail_trans}     timeout=30
    Click Element                           ${detail_trans}
    Wait until page contains element        ${detail_transaction_header}        timeout=30
    Page Should Contain Element             ${trans_icon} 
    Run Keyword and Return Status           Page Should Contain Text        ${WCMS["inbox_incoming_text"]} 
    Page Should Contain Text                ${WCMS["inbox_help_info_button"]}        timeout=30 
    Click Text                              ${WCMS["inbox_help_info_button"]} 
    Go Back  
    Wait Until Page Contains                ${WCMS["inbox_redeem_again_button"]}        timeout=30
    Click Text                              ${WCMS["inbox_redeem_again_button"]} 
    ${Result}    Run Keyword and Return Status    Wait until page contains            ${App_Name}
    Run Keyword If    ${Result}==True             Click Text                          ${App_Name}
    ${Result1}    Run Keyword and Return Status    Wait until page contains           ${choose_time}
    Run Keyword If    ${Result1}==True            Click Text                          ${choose_time}
    Wait until page contains         ${poin_Dashboard}          timeout=30   


*** Test Cases ***
    
Check Inbox GUI
    [Documentation]
        ...     |*TC IDs*|Android TC244    TC249|
        ...     |*TC IDs*|iOS TC1384    TC1389|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Social_login    Inbox      Android     iOS
    Check VOC Dispaly And Skip
    Check Reminder
    Check Tutup popup
    # Wait until page contains    ${TW_LinkAccount_Phonenumber}   timeout=30
    # Click Element            ${Inbox_icon}
    Verify Inbox Page
    # Go Back

Verify Promo Page
    [Documentation]
        ...     |*TC IDs*|Android TC245    TC246|
        ...     |*TC IDs*|iOS TC1385    TC1386|
        ...     |*TC Type*| Positive Case| 
    [Tags]        Promo
    # Wait until page contains         ${TW_LinkAccount_Phonenumber}   timeout=30
    # Click Element                    ${Inbox_icon}
    Wait until page contains         ${WCMS["inbox_promo_title"]}    timeout=30
    Click Text                       ${WCMS["inbox_promo_title"]}
    ${api_error}            Run Keyword And Return Status         Wait until page contains      ${WCMS["global_error_button_text"]}          timeout=20    
    Run Keyword If          ${api_error}==True                    Click Button                  ${WCMS["global_error_button_text"]}
    Verify Promo Page
    Click Element                    ${Inbox_Promo_back}
    # Go Back

Verify Notify Page
    [Documentation]
        ...     |*TC IDs*|Android TC247    TC248|
        ...     |*TC IDs*|iOS TC1387    TC1388|
        ...     |*TC Type*| Positive Case| 
    [Tags]        Notify
    # Wait until page contains         ${Inbox_icon}   timeout=30
    # Click Element                    ${Inbox_icon}
    Wait until page contains            ${WCMS["inbox_notification_title"]}        timeout=30
    Click Text        ${WCMS["inbox_notification_title"]}
    ${api_error}            Run Keyword And Return Status         Wait until page contains      ${WCMS["global_error_button_text"]}          timeout=20    
    Run Keyword If          ${api_error}==True                    Click Button                  ${WCMS["global_error_button_text"]}
    Verify Notification Page
    ${no_notify}           Run Keyword And Return Status    Wait until page contains         ${WCMS["inbox_empty_state_title"]} 
    ${emty_state}          Replace String         ${WCMS["inbox_empty_state_text"]}       %username%    ${user_name}
    Run Keyword if        ${no_notify}==True         Run Keyword And Ignore Error            Wait until page contains       ${emty_state}
    Run Keyword if        ${no_notify}==False        Verify Notification Page When Exist Notify
    Run Keyword if        ${no_notify}==False        Read Single Notify and Delete Single Notify
    Run Keyword if        ${no_notify}==False        Read Multi Notify and Delete Multi Notify           
    Run Keyword if        ${no_notify}==False        Verify Detail Notify
    Click Element         ${Inbox_Notify_back}
    Wait until page contains    ${WCMS["label.global.header.inbox"]}    timeout=30
    BuiltIn.Sleep   5s
    # Go Back

Verify Transaction Page
    [Tags]        Transaction
    # Wait until page contains         ${Inbox_icon}   timeout=30
    # Click Element                    ${Inbox_icon}
    Wait until page contains            ${WCMS["inbox_transaction_title"]}         timeout=30
    ${no_transaction}           Run Keyword And Return Status    Wait until page contains         ${WCMS["inbox_empty_state_title"]} 
    ${emty_state}               Replace String         ${WCMS["inbox_empty_state_text"]}       %username%    ${user_name}
    Run Keyword if              ${no_transaction}==True         Run Keyword And Ignore Error            Wait until page contains       ${emty_state}
    Run Keyword if              ${no_transaction}==False        Verify Inbox Edit Mode
    Run Keyword if              ${no_transaction}==False        Read Single Transaction and Delete Single Transaction
    Run Keyword if              ${no_transaction}==False        Read Multi Transaction and Delete Multi Transaction
    Run Keyword if              ${no_transaction}==False        Verify Transaction Detail Page



# Check Inbox GUI
#     [Tags]    Social_login    Inbox      Android     iOS
#     Check VOC Dispaly And Skip
#     Wait until page contains    ${TW_LinkAccount_Phonenumber}   timeout=30

#     Click Element    ${Hoome_Page_Inbox}
#     Verify Inbox Page

#     Click Text    ${WCMS["inbox_promo_title"]}
#     Verify Promo Page

#     Click Text    ${WCMS["inbox_notification_title"]}
#     Verify Notification Page

#     ${str1} =	Convert To Upper Case	${WCMS["label.global.header.inbox"]} 
#     Wait until page contains    ${str1}    timeout=30
#     BuiltIn.Sleep   5s
#     Click Element       ${Inbox_Edit}
#     Verify Inbox Edit Mode 
#     Click Element       ${Inbox_Done}

#     Wait until page contains    ${WCMS["label.global.header.inbox"]}    timeout=30
#     FOR    ${i}    IN RANGE    30
#         ${visible}=    Run Keyword And Return Status    Text Should Be Visible         ${Inbox_Date}         #20 April 2021
#         log to console      ${visible}
#         ${result}=    Evaluate    ${visible} == True
#         Exit For Loop If    ${result}
#         Swipe	500	    400	    500 	0	1000
#         BuiltIn.Sleep   0.5s
#     END

    
#     Click Text           ${Inbox_Date}               #20 April 2021
#     Verify Transaction Page
   
#     BuiltIn.Sleep   1s

    
    
    
    
