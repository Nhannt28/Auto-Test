*** Settings ***
Documentation       Verifying Account Menu Revamp - List Menu Section TC#292 - TC#335
Resource            ../../CommonKeyWord.robot
Resource            ../01_Login/LoginCommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/SettingPage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/SharePackage.robot
Resource            ../../../variables/account.robot
Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Launch Application
Test Teardown       Tear Down Test Cases

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

Verify Menu Page Info
    Wait Until Page Contains Element    ${TabBar_Menu}  timeout=60s
    Wait Until Page Contains Element    ${Current_PhoneNunber_Id}     timeout=60s
    Click Element                       ${TabBar_Menu}
    Valid Selected Result               ${TabBar_Menu}  True
    Wait Until Page Contains Element    ${App_Languange}    timeout=60s
    Wait Until Page Contains Element    ${MyTsel_Version}      timeout=60s
    Wait Until Page Contains            ${WCMS["account_management_text"]}  timeout=30s
    Wait Until Page Contains            ${WCMS["account_poin_reward_text"]}
    Wait Until Page Contains            ${WCMS["account_telkomsel_product_text"]}
    Wait Until Page Contains            ${WCMS["account_entertaiment_text"]}
    Wait Until Page Contains            ${WCMS["account_promotionads_text"]}
    Swipe By Percent	                50	90	50	40
    Wait Until Page Contains            ${WCMS["account_help_center_text"]}
    Wait Until Page Contains            ${WCMS["account_application_setting_text"]}

Verify Profile Page Info
    Wait Until Page Contains            ${WCMS["editprofile_header_title"]}    timeout=30s
    Wait Until Page Contains            ${Sub_Title_Profile_1}
    Wait Until Page Contains Element    ${Profile_Name}
    Wait Until Page Contains Element    ${Card_Brand}
    Wait Until Page Contains Element    ${Validity}
    Wait Until Page Contains Element    ${PUK}
    Wait Until Page Contains Element    ${Email}
    Swipe By Percent	                50	90	50	20
    Wait Until Page Contains            ${Sub_Title_Profile_2}
    Wait Until Page Contains            ${WCMS["label.global.body.facebook_title_app"]}
    Wait Until Page Contains            ${Twitter_Title}
    Wait Until Page Contains            ${Google_Title}
    Wait Until Page Contains            ${Sub_Title_Profile_3}
    Click Element                       ${Load_Content_Close}

Verify Package & Subcription Info
    Wait Until Page Contains      ${WCMS["label.account_app.body.my_packages_title"]}    timeout=30s
    Wait Until Page Contains      ${WCMS["label.global.header.scheduled_packages_title"]}
    Wait Until Page Contains      ${WCMS["label.global.header.active_packages_title"]}
    ${active_page}=          Run Keyword And Return Status    Wait Until Page Contains Element    ${No_Package_Title}     timeout=15s
    Run Keyword If                ${active_page}==True   No Active or Schedule Package
    Run Keyword If                ${active_page}==False  Have Active or Schedule Package
    Click Text                    ${WCMS["label.global.header.scheduled_packages_title"]}
    ${schedule_page}=        Run Keyword And Return Status    Wait Until Page Contains    ${WCMS["label.my_packages.body.no_active_scheduled_desc"]}     timeout=15s
    Run Keyword If                ${schedule_page}==True   No Active or Schedule Package
    Run Keyword If                ${schedule_page}==False  Have Active or Schedule Package
    Click Element                 ${Load_Content_Close}

Have Active or Schedule Package
    Wait Until Page Contains Element    ${Last_Update}  timeout=30s
    Wait Until Page Contains            ${WCMS["global_button_refresh"]}  
    Click Text                          ${WCMS["global_button_refresh"]}
    Wait Until Page Contains Element    ${Package}
    Wait Until Page Contains            ${WCMS["my_package_buy_addon_button"]}

No Active or Schedule Package
    ${no_schedule}=     Run Keyword And Return Status    Wait Until Page Contains Element    ${BuyPackage_Button}     timeout=15s
    Run keyword if      ${no_schedule}==False   Wait Suggestion Promo To Appear

Wait Suggestion Promo To Appear
    Wait Until Page Contains Element    ${Promo_Header}     timeout=15s
    Wait Until Page Contains Element    ${Promo_Display}
    Wait Until Page Contains Element    ${Promo_All}

Verify Last Usage Info
    Wait Until Page Contains          ${WCMS["label.account_app.body.history_transaction"]}
    Wait Until Page Contains          ${WCMS["label.last_transaction.body.last_update_title"]}
    Wait Until Page Contains Element  ${Last_Update_LU}
    Wait Until Page Contains Element  ${Last_Transaction}       
    Click Element                     ${Load_Content_Close}

Verify Purchase History Info
    Wait Until Page Contains    ${WCMS["label.my_history.header.my_history"]}  timeout=30s
    Wait Until Page Contains    ${WCMS["history-page.Purchase"]}
    Wait Until Page Contains    ${WCMS["history-page.Ticket"]}
    ${purchase_page}=          Run Keyword And Return Status    Wait Until Page Contains    No Purchase History     timeout=15s
    Run Keyword If                ${purchase_page}==True   No Purchase History
    Run Keyword If                ${purchase_page}==False  Have Purchase History
    Click Text                  ${WCMS["history-page.Ticket"]}
    ${ticket_page}=          Run Keyword And Return Status    Wait Until Page Contains    No Ticket History     timeout=15s
    Run Keyword If                ${ticket_page}==False   Have Ticket History
    Click Element               ${Load_Content_Close}

Have Ticket History
    Wait Until Page Contains Element        ${Ticket_Title} timeout=30s
    Wait Until Page Contains Element        ${Ticket_Desc}
    Wait Until Page Contains Element        ${Ticket_Date}

Have Purchase History
    Wait Until Page Contains Element        ${Purchase_Title}   timeout=30s
    Wait Until Page Contains Element        ${Purchase_Logo}
    Wait Until Page Contains Element        ${Date_Purchase}
    Wait Until Page Contains Element        ${Time_Purchase}
    # FOR  ${i}   IN RANGE    10
    #     Swipe By Percent	                50	90	50	40
    #     ${btn}=      Run Keyword And Return Status    Wait Until Page Contains    ${Load_More_Btn}
    #     Exit For Loop IF    ${btn}==True
    # END
    # Click Element               ${Load_More_Btn}
    # Swipe By Percent	        50	90	50	40
    # Wait Until Page Contains    30 October 2020

No Purchase History
    Wait Until Page Contains    Go To Shop

Verify Payment Method Info
    Wait Until Page Contains            ${WCMS["TITLE-menu-mypayment"]}   timeout=30s
    Wait Until Page Contains Element    ${Learn_More_Btn}
    Click Element                       ${Load_Content_Close}

Verify Buy New SimCard Info
    Wait until page contains    Buy Sim Card    timeout=30
    Click Element                       ${Load_Content_Close}

Verify TopUp Credit Info
    Wait until page contains    ${WCMS["TITLE-add-credit"]}    timeout=30
    Wait until page contains element    ${Logo}
    Element Text Should Be    ${Phonenumber_TopUp_Credit}    ${Current_Phonenumber}
    Wait until page contains element    ${Credit_Display}
    Wait until page contains element    ${Contact}
    Click Element                       ${Load_Content_Close}

Skip Coachmark
    Wait Until Page Contains            ${WCMS["billing_coachmark_1"]}  timeout=30s
    Click Element                       ${Skip_Coachmark}

Verify Coachmark
    Wait Until Page Contains            ${WCMS["billing_coachmark_1"]}  timeout=30s
    Click Element                       ${Next_Coachmark}
    Wait Until Page Contains            ${WCMS["billing_coachmark_2"]}  timeout=30s
    Click Element                       ${Next_Coachmark}
    Wait Until Page Contains            ${WCMS["billing_coachmark_4"]}  timeout=30s
    Click Element                       ${Next_Coachmark}
    Wait Until Page Contains            For more information, please click the information icon (i).  timeout=30s
    Click Element                       ${Close_Coachmark}
    # Wait Until Page Contains            ${WCMS["billing_coachmark_5"]}  timeout=30s
    # Click Element                       ${APP_PACKAGE}:id/btn_close

Verify Billing Usage Info
    ${status}   Run Keyword And Return Status   Wait Until Page Contains    ${WCMS["billing_coachmark_1"]}  timeout=15s
    Run Keyword If      ${status}==True     Verify Coachmark
    Wait Until Page Contains            ${WCMS["domestic_usage_text"]}  timeout=30s
    Element Text Should Be              ${Load_Content_Title}   Usage & Billing
    Wait Until Page Contains            ${WCMS["my_billing_e_bill_delivery_text"]}
    Wait Until Page Contains            ${WCMS["my_billing_reminder_title"]}
    Wait Until Page Contains            ${WCMS["my_billing_history_title"]}
    Click Element                       ${Load_Content_Close}

Verify Usage & Limit information
    Wait Until Page Contains            ${WCMS["usage_current_usage"]}      timeout=30s
    Wait Until Page Contains            ${WCMS["credit_limit"]}
    Wait Until Page Contains            ${WCMS["domestic"]}
    Wait Until Page Contains            ${WCMS["roaming"]}
    Wait Until Page Contains            ${WCMS["usage_current_desc"]}  
    Wait Until Page Contains            ${WCMS["TITLE_upgrade_usage_limit"]}
    Wait Until Page Contains            ${WCMS["usage_warning"]}
    Swipe By Percent                    50	90	50	60
    Wait Until Page Contains            ${WCMS["TITLE_remaining_quota"]}
    Wait Until Page Contains            ${WCMS["usage_data"]}
    Wait Until Page Contains            ${WCMS["usage_voice"]}
    Wait Until Page Contains            ${WCMS["usage_sms"]}
    Wait Until Page Contains            ${WCMS["usage_monetary"]}
    Wait Until Page Contains            ${WCMS["usage_buy_pakets"]}
    Wait Until Page Contains            ${Load_Content_Title}
    Click Element                       ${Load_Content_Close}

Valid Selected Result
  [Arguments]    ${element}       ${expected}
  Element Attribute Should Match      ${element}      selected   ${expected}

Verify Quota & Package Info
    Wait Until Page Does Not Contain    Quota &amp; Package  timeout=30s
    Valid Selected Result               ${TabBar_Shop}  True
    Wait Until Page Contains Element    ${TabBar_Menu}
    Click Element                       ${TabBar_Menu}

Verify Handphone Bundling Info
    Wait Until Page Contains Element    ${Search_Placeholder}
    Wait Until Page Contains Element    ${Search_Icon}
    # Wait Until Page Contains Element    ${Filter_Button}
    # Wait Until Page Contains Element    ${Sort_Button}
    # Wait Until Page Contains Element    ${Product_Display}
    # Wait Until Page Contains Element    ${Brand_Category}
    Click Element                       ${Load_Content_Close}
    Wait until page contains element    ${TabBar_Menu}
    Click Element                       ${TabBar_Menu}

Verify VAS Info
    Wait until page contains    ${WCMS["label.global.header.vas_service_app_title"]}    timeout=30
    Click Element                       ${Load_Content_Close}
    Wait until page contains element    ${TabBar_Menu}
    Click Element                       ${TabBar_Menu}

Verify Personal Ringtone Info
    Wait Until Page Contains            Buy Nsp  timeout=30s
    Wait Until Page Contains Element    ${Load_Content_3dot}
    Click Element                       ${Load_Content_Close}

Verify Open Iframe
    Wait Until Page Contains Element    ${Load_Content_Title}   timeout=15s
    Wait Until Page Contains Element    ${Load_Content_3dot}
    Wait Until Page Contains Element    ${Load_Content_Close}
    Click Element                       ${Load_Content_Close}
Verify Open Maxstream on Playstore
    Wait Until Page Contains            MAXstream- Live Sports, TV &amp; Movies  timeout=30s
    Press Keycode                       4

Verifying Card In Video Streaming
    FOR     ${i}    IN RANGE    36
        Wait Until Page Contains Element    ${Load_Content_Title}   timeout=15s
        ${title}    Get Text        //androidx.recyclerview.widget.RecyclerView/androidx.cardview.widget.CardView[@index="${i}"]/android.widget.LinearLayout/android.widget.RelativeLayout[@index="1"]/android.widget.LinearLayout/android.widget.TextView[@resource-id="${APP_PACKAGE}:id/tv_title"]
        Click Element               //androidx.recyclerview.widget.RecyclerView/androidx.cardview.widget.CardView[@index="${i}"]
        BuiltIn.Sleep       3s
        ${status}   Run Keyword And Return Status   Wait Until Page Contains Element    ${Load_Content_Title}   timeout=7s
        Run Keyword If      ${status}==False    Verify Open Maxstream on Playstore
        Run Keyword If      ${status}==True     Verify Open Iframe
        ${scroll}           Evaluate            (${i} + 1) % 3 == 0
        BuiltIn.Sleep       3s
        Run Keyword If      ${scroll}==True     Swipe By Percent    50  90  50  50
    END

Verify Video Streaming Info
    Wait Until Page Contains            ${WCMS["fst_product_tab_title"]}    timeout=30s
    Wait Until Page Contains            Terms &amp; Conditions
    Verifying Card In Video Streaming
    Click Element                       ${Load_Content_Close}

Verify Music Streaming Info
    Wait Until Page Contains            ${WCMS["title_langitmusik"]}    timeout=30s
    Click Element                       ${Load_Content_Close}

Verify Games Info
    Wait Until Page Contains            ${WCMS["title_games"]}    timeout=30s
    Wait Until Page Contains Element    ${Load_Content_Close}
    Wait Until Page Contains Element    ${ShareLink_Button}
    Wait Until Page Contains            ${WCMS["fst_tab_special_offer"]}
    ${term&condition}         RPString.escape_HTML          ${WCMS["fst_tnc_tab_title"]}
    Wait Until Page Contains                  ${term&condition}
    Wait Until Page Contains            ${WCMS["label.subgroup.title.mobiledg"]}
    Swipe	    200	    2000	    200 	400	  1000
    Wait Until Page Contains            ${WCMS["label.subgroup.title.pcdg"]}
    Swipe	    200	    2000	    200 	400	  1000
    # Wait Until Page Contains            ${WCMS["label.subgroup.title.consoldg"]}  #Consol Gaming
    Wait Until Page Contains            Console Gaming
    Swipe	    200	    2000	    200 	400	  1000
    Wait Until Page Contains            Event Dunia Games
    Click Element                       ${Load_Content_Close}

Check Questions
    [Arguments]     ${question}
    Wait Until Page Contains    ${question}     timeout=30s
    Click Text                  ${question}
    Wait Until Page Contains    Faq Detail   timeout=30s
    Wait Until Page Contains    ${question}
    Click Element               ${Load_Content_Close}

Verify FAQ Info
    Wait Until Page Contains            ${WCMS["label.explore_app.body.get_help_title"]}
    Wait Until Page Contains            ${WCMS["label.faq_app.body.top_question"]}
    Wait Until Page Contains            ${WCMS["smart_faq_tutorial"]}
    Wait Until Page Contains            ${WCMS["smart_faq_tutorial_item_ver"]}
    Check Questions     ${1st_Question}
    Check Questions     ${2nd_Question}
    Check Questions     ${3rd_Question}
    Check Questions     ${4th_Question}
    Swipe By Percent	50	90	50	40
    Check Questions     ${5th_Question}
    Check Questions     ${6th_Question}
    Check Questions     ${7th_Question}
    Swipe By Percent	50	90	50	40
    Check Questions     ${8th_Question}
    Check Questions     ${9th_Question}
    Check Questions     ${10th_Question}
    Wait Until Page Contains Element    ${Load_Content_Close}   timeout=30s
    Click Element                       ${Load_Content_Close}

Verify Migration Support Info
    Wait Until Page Contains            Upgrade 4G Ready
    Wait Until Page Contains            ${WCMS["history_empty_button_text"]}
    Wait Until Page Contains            ${WCMS["usim_upgrade_page_title"]}
    Wait Until Page Contains            ${WCMS["label.4g-smart.body.title"]}
    Wait Until Page Contains            ${WCMS["label.4g-smart.body.description_case_1"]}
    Wait Until Page Contains            ${WCMS["label.4g-smart.body.4g_phone"]}
    Wait Until Page Contains            ${WCMS["label.4g-smart.body.4g_simcard"]}
    Wait Until Page Contains Element    ${Phone_Icon}
    Wait Until Page Contains Element    ${Simcard_Icon}
    Wait Until Page Contains Element    ${Phone_Icon_Check}
    Wait Until Page Contains Element    ${Simcard_Icon_Check}
    Click Element                       ${Load_Content_Close}

Verify Grapari Appointment Info
    Wait Until Page Contains            ${WCMS["label.explore_app.body.grapari_appointment_title"]}     timeout=30s
    Wait Until Page Contains Element    ${My_Location}
    Click Element                       ${Filter_Loc_Button}
    Wait Until Page Contains            ${WCMS["label.grapari_app.button.filter"]}
    Wait Until Page Contains            ${WCMS["grapari_service_text"]}
    Wait Until Page Contains            ${WCMS["grapari_sales_text"]}
    Wait Until Page Contains            ${WCMS["title_maximum_distance"]}
    Wait Until Page Contains            ${WCMS["max_distance1"]}
    Wait Until Page Contains            ${WCMS["max_distance2"]}
    Wait Until Page Contains            ${WCMS["max_distance3"]}
    Click Element                       ${Ok_FilterBtn}
    Wait Until Page Contains Element    ${Load_Content_Close}
    Click Element                       ${Load_Content_Close}

Verify Social Media Account Info
    Wait Until Page Contains Element    ${Chat_Bot_Button}
    Wait Until Page Contains            ${WCMS["get_help_contact_us_veronika_title"]}
    # More Channel
    Wait Until Page Contains            ${WCMS["contact_us_channel_title"]}
    Swipe By Percent	                50	80	50	20
    Wait Until Page Contains            ${WCMS["get_help_contact_us_channel_facebook_text"]}
    Wait Until Page Contains            ${WCMS["get_help_contact_us_channel_telegram_text"]}
    Wait Until Page Contains            ${WCMS["get_help_contact_us_channel_line_text"]}
    Wait Until Page Contains            ${WCMS["get_help_contact_us_channel_twitter_text"]}
    #Contact Us
    Swipe By Percent	                50	80	50	40
    Wait Until Page Contains            ${WCMS["help_page_contact_us"]}
    Wait Until Page Contains            ${WCMS["bundling_detail_term_condition_title"]}
    Wait Until Page Contains            ${WCMS["contact_us_privacy"]}
    Click Element                       ${Load_Content_Close}

Verify Chat With Veronika Info
    Wait Until Page Contains Element    ${Load_Content_Title}   timeout=30s
    sleep   8s
    # Wait Until Page Contains Element    ${Load_Content_Close}   timeout=30s
    Click Element                       ${Load_Content_Close}

Is Prepaid
    ${type_number}  Set Variable    prepaid
    Set Global Variable     ${type_number}
Is Postpaid
    ${type_number}  Set Variable    postpaid
    Set Global Variable     ${type_number}

Get Current Phonenumber
    ${prepaid}     Run Keyword and return status     Wait Until Page Contains    ${TW_LinkAccount_Phonenumber}    timeout=15s
    ${postpaid}    Run Keyword and return status     Wait Until Page Contains    ${TW3_LinkAccount_Phonenumber}    #later change this to Linkaccount postpaid number
    Run keyword if   ${prepaid}==True    Run Keywords   Is Prepaid
    Run keyword if   ${postpaid}==True   Run Keywords   Is Postpaid
    ${Current_Phonenumber}     Get Text        ${Current_PhoneNunber_Id}
    Set Global Variable     ${Current_Phonenumber}

Go To This Page
    [Arguments]     ${Text1}
    Wait Until Page Contains            ${Text1}    timeout=30s
    Click Text                          ${Text1}

*** Test Cases ***
Verify Menu Page
    [Documentation]    Verify Menu Page
        ...     |TC Android|TC292 - TC295|	
        ...     |TC Type| Positive Case|
    [Tags]      Android
    Wait Until Page Contains Element    ${Current_PhoneNunber_Id}   timeout=60s
    sleep   2s
    Get Current Phonenumber
    Verify Menu Page Info
    log to console        ${type_number}

Verify Account Management
    [Documentation]    Verify Account Management
        ...     |TC Android|TC296 - TC311|	
        ...     |TC Type| Positive Case|
    [Tags]      Android
    Verify Menu Page Info
    Click Text                          ${WCMS["account_management_text"]}
    # Go To This Page                     ${WCMS["account_my_profile_text"]}
    # Verify Profile Page Info
    Wait Until Page Contains            Package &amp; Subscription  timeout=30s
    Click Text                          ${WCMS["account_package_text"]}
    Verify Package & Subcription Info
    ${status}       Run Keyword And Return Status    Should Be Equal As Strings  ${type_number}   postpaid
    Run Keyword If   ${status}==True     Run Keywords   
        ...          Go To This Page    ${WCMS["account_billing_text"]}        AND
        ...          Verify Billing Usage Info      AND
        ...          Go To This Page    ${WCMS["account_usagelimit_text"]}        AND
        ...          Verify Usage & Limit Info
    Go To This Page  ${WCMS["account_last_usage_text"]}
    Verify Last Usage Info
    Go To This Page  ${WCMS["account_purchase_history_text"]}  
    Verify Purchase History Info
    Go To This Page  ${WCMS["account_payment_method_text"]}
    Verify Payment Method Info
    Wait Until Page Contains            ${WCMS["account_management_text"]}
    Click Text                          ${WCMS["account_management_text"]}
    
Verify Telkomsel Product
    # note: Verify Personal Ringtone Info not found in test cases but exist in apk
    [Documentation]    Verify Telkomsel Product
        ...     |TC Android|TC312 - TC318|	
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Verify Menu Page Info
    Click Text                          ${WCMS["account_telkomsel_product_text"]}
    Swipe By Percent	                50	90	50	60
    Wait Until Page Contains Element       ${New_Simcard_Xpath}     timeout=30s
    Click Element                          ${New_Simcard_Xpath}
    Verify Buy New SimCard Info
    ${status}       Run Keyword And Return Status      Should Be Equal As Strings  ${type_number}   prepaid
    Run Keyword If   ${status}==True     Run Keywords  
        ...          Go To This Page  ${WCMS["account_topup_credit_text"]}    AND
        ...          Verify TopUp Credit Info
    Wait Until Page Contains            Quota &amp; Package     timeout=30s
    Click Text                          Quota & Package
    Verify Quota & Package Info
    Go To This Page  ${WCMS["account_handphone_bundling_text"]}
    Verify Handphone Bundling Info
    Go To This Page  ${WCMS["account_vas_text"]}
    Verify VAS Info
    Go To This Page  ${WCMS["account_personal_ringtone_text"]}
    Verify Personal Ringtone Info
    Wait Until Page Contains            ${WCMS["account_telkomsel_product_text"]}
    Click Text                          ${WCMS["account_telkomsel_product_text"]}

Verify Entertainment Menu
    [Documentation]    Verify Entertainment Menu
        ...     |TC Android|TC318 - TC322|	
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Verify Menu Page Info
    Click Text                          ${WCMS["account_entertaiment_text"]}
    Go To This Page  ${WCMS["account_video_stream_text"]}
    Verify Video Streaming Info 
    Go To This Page  ${WCMS["account_music_stream_text"]}
    Verify Music Streaming Info 
    Go To This Page  ${WCMS["account_games_text"]}
    Verify Games Info
    Wait Until Page Contains            ${WCMS["account_entertaiment_text"]}
    Click Text                          ${WCMS["account_entertaiment_text"]}

Verify Help Center Menu
    [Documentation]    Verify Center Menu
        ...     |TC Android|TC324 - TC329|	
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Verify Menu Page Info
    Click Text                          ${WCMS["account_help_center_text"]}
    Swipe By Percent	                50	90	50	60
    Go To This Page  ${WCMS["account_faq_text"]}
    Verify FAQ Info
    Go To This Page  ${WCMS["account_migration_support_text"]}
    Verify Migration Support Info
    Go To This Page  ${WCMS["account_grapari_text"]}
    Verify Grapari Appointment Info
    Go To This Page  ${WCMS["account_social_media_text"]}
    Verify Social Media Account Info
    Go To This Page  ${WCMS["account_chat_veronika_text"]}
    Verify Chat With Veronika Info
    Wait Until Page Contains            ${WCMS["account_help_center_text"]}  timeout=30s
    Click Text                          ${WCMS["account_help_center_text"]}

Verify Application Settings Menu
    # note: in TC#331 dropdown Application Setting but in the apk it's not type of dropdown
    [Documentation]    Verify Application Settings Menu
        ...     |TC Android|TC330 - TC335|	
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Verify Menu Page Info
    Click Text                          ${WCMS["account_application_setting_text"]}
    Wait Until Page Contains Element    ${Load_Content_Title}   timeout=60s  
    Wait Until Page Contains            ${WCMS["account_daily_checkin_text"]}
    Wait Until Page Contains            ${WCMS["experienceprogram_termcondition_button"]}
    Wait Until Page Contains            ${WCMS["account_rate_mytelkomsel_text"]}
    Click Element                       ${Toggle_Checkin}
    Wait Until Page Contains            ${Snackbar_Checkin_Message}
    Click Element                       ${Toggle_Checkin}
    Click Element                       ${Toggle_JoinTheProgram}
    Wait Until Page Contains            ${WCMS["editprofile_experienceprogram_label"]}  timeout=30s
    Click Element                       ${Load_Content_Close}
    Wait Until Page Contains            ${WCMS["account_rate_mytelkomsel_text"]}  timeout=30s
    Click Text                          ${WCMS["account_rate_mytelkomsel_text"]}  
    Wait Until Page Contains            ${MyTelkom_Playstore}     timeout=30s
    Press Keycode                       4
    Wait Until Page Contains Element    ${Setting_logout}       timeout=30s
    # Click Element                       ${Setting_logout}
    # Verify Login Page
