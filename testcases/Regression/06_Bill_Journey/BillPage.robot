

*** Settings ***
# | Variables | Inbox_api.py
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/BillJourney.robot
Resource            ../../../variables/account.robot
Resource            ../../../variables/regex.robot
Resource            ./BillPageKeyword.robot
Library             ../../../libraries/MathLib.py
Resource            ../../KeyWord/PaymentMethodPageKeyWord.robot

Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Go To Bill Menu
Test Teardown       Tear Down Test Cases

*** Variables ***
${Wrong_Email}                  wrongemail
${Diffirent_Email}              wrongemail@gmail.com
${Bill_Date}                    April 2021
${File_Protected}               File is Protected


*** Test Cases ***
Check Bill Page
    [Documentation]    Verify GUI Bill Page
        ...     |*TC iOS*|TC1541    TC1542  TC1553|
        ...     |*TC Android*|TC400     TC401   TC412|	
        ...     |*TC Type*| Positive Case| 	
    [Tags]    BillJourney      Android     iOS
    ${skip}    Run Keyword And Return Status    Page Should Contain Text    ${WCMS["onboarding_skip_button"]}
    Run Keyword If      ${skip}==True           Click Text                  ${WCMS["onboarding_skip_button"]}
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}
    Page Should Contain Element             ${Bill_Page_i_icon}


    Wait until page contains                ${WCMS["domestic_usage_text"]}      timeout=30
    Page Should Contain Element             ${Bill_Page_Domestic_icon} 
    Wait until page contains                ${WCMS["domestic_usage_text"]}
    ${value}        Get Text                ${Bill_Page_Domestic_Usage_value}
    ${value}        Strip String            ${value}
    BuiltIn.Should Match Regexp              ${value}    ${Money_REGEX}
    
    Wait until page contains                ${WCMS["domestic_usage_limit_text"]}
    ${value}        Get Text                ${Bill_Page_Domestic_Credit_value}
    ${value}        Strip String            ${value}
    BuiltIn.Should Match Regexp              ${value}    ${Money_REGEX}
    Wait until page contains                ${WCMS["usage_period_text"]}
    ${value}        Get Text                ${Bill_Page_Domestic_Usage_Period_value}
    ${value}        Strip String            ${value}
    BuiltIn.Should Match Regexp              ${value}    ${Date_From_To_REGEX}
    Page Should Contain Element             ${Bill_Page_Domestic_detail_btn}
    Wait until page contains                ${WCMS["see_detail_button"]}


    Page Should Contain Element             ${Bill_Page_Domestic_icon}
    Wait until page contains                ${WCMS["my_billing_text"]}
    ${value}        Get Text                ${Bill_Page_MyBilling_Value}
    ${value}        Strip String            ${value}
    BuiltIn.Should Match Regexp              ${value}    ${Money_REGEX}
    #Page Should Contain Element             ${Bill_Page_MyBilling_bill_detail}
    # not sure GUI when have bills
    ${Result}   Run Keyword And Return Status   Page Should Contain Element             ${Bill_Page_MyBilling_bill_detail}
    Run Keyword If      ${Result}==False      wait until page contains                ${WCMS["label.ebill_app.body.no_outstanding_bills"]}
    Run Keyword If      ${Result}==True      Page Should Contain Element             ${Bill_Page_MyBilling_pay_bill}
# 6.0.0 ver not contain E - bill - Delivery
    # Page Should Contain Element             ${Bill_Page_E_Bill_icon}
    # Wait until page contains                ${WCMS["my_billing_e_bill_delivery_text"]}
    # ${value}        Get Text                ${Bill_Page_E_Bill_Value}
    # ${value}        Strip String            ${value}
    # BuiltIn.Should Match Regexp              ${value}    ${Email_REGEX}

    Page Should Contain Element             ${Bill_Page_Reminder_icon}
    Wait until page contains                ${WCMS["my_billing_reminder_title"]}
    ${value}        Get Text                ${Bill_Page_Reminder_Value}
    ${value}        Strip String            ${value}
    BuiltIn.Should Match Regexp              ${value}    ${Text_REGEX}

    Page Should Contain Element             ${Bill_Page_History_icon}
    Wait until page contains                ${WCMS["my_billing_history_title"]}
    Wait until page contains                ${WCMS["my_billing_history_text"]}
    
Check Bill Page About Usage Screen
    [Documentation]    Verify GUI Bill Page
        ...     |*TC iOS*|TC1518   TC1519|
        ...     |*TC Android*|TC377   TC378|	
        ...     |*TC Type*| Positive Case| 	
    [Tags]    BillJourney      Android     iOS
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}
    Page Should Contain Element             ${Bill_Page_i_icon}
    Click Element                           ${Bill_Page_i_icon}
    
    Wait until page contains element        ${Bill_Page_About_Usage_billing_header}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_About_Usage_billing_header}      text   ${WCMS["mybilling_info_header"]}
    Element Attribute Should Match          ${Bill_Page_About_Usage_billing_header}      text   ${Bill_Page_About_Usage_billing_header_text}
    Wait until page contains element        ${Bill_Page_About_Usage_billing_back} 

    Click Element                           ${Bill_Page_About_Usage_billing_back}
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}

#fail do chưa có bill nào
Check Bill Page Pay Bill Button
    [Documentation]    Verify GUI Bill Page
        ...     |*TC iOS*|TC1522	TC1521	|
        ...     |*TC Android*|TC381    TC380|	
        ...     |*TC Type*| Positive Case| 	
    [Tags]    BillJourney      Android     iOS
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}
    Wait until page contains                ${WCMS["see_detail_button"]}
    ${value}        Get Text                ${Bill_Page_MyBilling_Value}
    Click Element                           ${Bill_Page_MyBilling_pay_bill} 
    Verify Payment Method Page 
    Wait until page contains                ${value}
    Verify App Payment Method                OVO
    Verify App Payment Method                ShopeePay
    Verify App Payment Method                LinkAja


#fail do chưa có bill nào
Check Bill Page Pay Bill From View Detail
    [Documentation]    Verify GUI Bill Page
        ...     |*TC iOS*|TC1526	|
        ...     |*TC Android*|TC385|	
        ...     |*TC Type*| Positive Case| 	
    [Tags]    BillJourney      Android     iOS
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}
    Wait until page contains                ${WCMS["see_detail_button"]}
    ${value}        Get Text                ${Bill_Page_MyBilling_Value}
    Click Element                           ${Bill_Page_MyBilling_bill_detail} 
    Wait until page contains                ${WCMS["my_billing_view_bill_button"]}   timeout=30 
    Click Element                           ${Bill_Page_MyBilling_pay_bill_bill_detail} 
    Wait until page contains                ${WCMS["see_detail_button"]}
    Verify Payment Method Page 
    Wait until page contains                ${value}
    
    

#fail do chưa có bill nào
Check Bill Page Show Bill Detail
    [Documentation]    Verify GUI Bill Page
        ...     |*TC iOS*|TC1525	TC1524	    |
        ...     |*TC Android*|TC384    TC383    |	
        ...     |*TC Type*| Positive Case| 	
    [Tags]    BillJourney      Android     iOS
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}
    Wait until page contains                ${WCMS["see_detail_button"]}

    Click Element                           ${Bill_Page_MyBilling_bill_detail} 
    Wait until page contains                ${WCMS["my_billing_view_bill_button"]}   timeout=30 
    Wait until page contains                ${WCMS["my_billing_download_bill_button"]}
    Wait until page contains                ${WCMS["my_billing_download_bill_info"]}
    #Wait until page contains element        ${Bill_Page_Popup_History_icon}

    Click Text                               ${WCMS["my_billing_view_bill_button"]}
    Wait until page contains                ${File_Protected}       timeout=30 
    Wait until page contains element        ${Bill_Page_Password_PDF_TF} 
    Wait until page contains element        ${Bill_Page_Password_PDF_Cancel} 
    Wait until page contains element        ${Bill_Page_Password_PDF_Open} 
    Click Element                           ${Bill_Page_Password_PDF_TF}
    Input text                              ${Bill_Page_Password_PDF_TF}   ${TW_PW_Bill_Email}
    Click Element                           ${Bill_Page_Password_PDF_Cancel}
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}

    Click Text                              ${Bill_Date}
    Click Text                              ${WCMS["my_billing_view_bill_button"]}   timeout=30 
    Wait until page contains element        ${Bill_Page_Password_PDF_TF}   timeout=30
    Click Element                           ${Bill_Page_Password_PDF_TF}
    Input text                              ${Bill_Page_Password_PDF_TF}   ${TW_PW_Bill_Email}
    Click Element                           ${Bill_Page_Password_PDF_Open}
    ${str1} =	Convert To Upper Case	    ${Bill_Date}
    Wait until page contains                ${str1}       timeout=30 
    Click Element                           ${Bill_Page_Popup_History_back}
    Click Text                              ${Bill_Date}
    Click Text                              ${WCMS["my_billing_download_bill_button"]}
    Wait until page contains                ${WCMS["my_billing_download_snack_bar"]}   timeout=30 

#fail do chưa có bill nào
Check Bill Page See Detail
    [Documentation]    Verify GUI Bill Page
        ...     |*TC iOS*||
        ...     |*TC Android*||	
        ...     |*TC Type*| Positive Case| 	
    [Tags]    BillJourney      Android     iOS
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}
    Wait until page contains                ${WCMS["see_detail_button"]}

    Click Text                               ${Bill_Date} 
    Wait until page contains                ${WCMS["my_billing_view_bill_button"]}   timeout=30 
    Wait until page contains                ${Bill_Date} 
    Wait until page contains                ${WCMS["my_billing_download_bill_button"]}
    Wait until page contains                ${WCMS["my_billing_download_bill_info"]}
    Wait until page contains element        ${Bill_Page_Popup_History_icon}

    Click Text                               ${WCMS["my_billing_view_bill_button"]}
    Wait until page contains                ${File_Protected}       timeout=30 
    Wait until page contains element        ${Bill_Page_Password_PDF_TF} 
    Wait until page contains element        ${Bill_Page_Password_PDF_Cancel} 
    Wait until page contains element        ${Bill_Page_Password_PDF_Open} 
    Click Element                           ${Bill_Page_Password_PDF_TF}
    Input text                              ${Bill_Page_Password_PDF_TF}   ${TW_PW_Bill_Email}
    Click Element                           ${Bill_Page_Password_PDF_Cancel}
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}

    Click Text                              ${Bill_Date}
    Click Text                              ${WCMS["my_billing_view_bill_button"]}   timeout=30 
    Wait until page contains element        ${Bill_Page_Password_PDF_TF}   timeout=30
    Click Element                           ${Bill_Page_Password_PDF_TF}
    Input text                              ${Bill_Page_Password_PDF_TF}   ${TW_PW_Bill_Email}
    Click Element                           ${Bill_Page_Password_PDF_Open}
    ${str1} =	Convert To Upper Case	    ${Bill_Date}
    Wait until page contains                ${str1}       timeout=30 
    Click Element                           ${Bill_Page_Popup_History_back}
    Click Text                              ${Bill_Date}
    Click Text                              ${WCMS["my_billing_download_bill_button"]}
    Wait until page contains                ${WCMS["my_billing_download_snack_bar"]}   timeout=30 
    
    
#hiện tại api không trả về E-Billing nên không thể chạy các case change email
Valid Bill Page Change Email   
    [Documentation]    Verify Change Email 
        ...     |*TC iOS*|TC1545    TC1546  TC1547  TC1548  TC1549  TC1550  TC1551  TC1552  TC1554|
        ...     |*TC Android*|TC404     TC405   TC406   TC407   TC408   TC409   TC410   TC411   TC413|	
        ...     |*TC Type*| Positive Case| 									
    [Tags]    BillJourney1      Android     iOS
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}

    Wait until page contains                ${WCMS["my_billing_e_bill_delivery_text"]}
    ${value}        Get Text                ${Bill_Page_E_Bill_Value}
    Click Text                              ${value}
    Verify GUI Password Email Popup
    Click Element                           ${Bill_Page_Password_Email}
    Verify GUI E-Bill Page
    Click Text                              ${WCMS["my_billing_ebill_edit_text"]}
    Verify GUI Change Email

    Click Element                           ${Bill_Page_New_Email}
    Input Text                              ${Bill_Page_New_Email}      ${Wrong_Email}
    Click Element                           ${Bill_Page_Re_Email}
    Hide Keyboard
    Wait until page contains                ${WCMS["my_billing_register_ebill_input_error"]}
    Check Button Clickable                  ${Bill_Page_Confirm_Change_Email}    false

    Click Element                           ${Bill_Page_New_Email}
    Clear Text                              ${Bill_Page_New_Email}
    Input Text                              ${Bill_Page_New_Email}      ${TW_Email}
    Hide Keyboard
    Check Button Clickable                  ${Bill_Page_Confirm_Change_Email}    false

    Click Element                           ${Bill_Page_Re_Email}
    Input Text                              ${Bill_Page_Re_Email}      ${Wrong_Email}
    Click Element                           ${Bill_Page_New_Email}
    Hide Keyboard
    Wait until page contains                ${WCMS["my_billing_register_ebill_input_error"]}
    Check Button Clickable                  ${Bill_Page_Confirm_Change_Email}    false

    Click Element                           ${Bill_Page_Re_Email}
    Clear Text                              ${Bill_Page_Re_Email}
    Input Text                              ${Bill_Page_Re_Email}      ${Diffirent_Email}
    Click Element                           ${Bill_Page_New_Email}
    Hide Keyboard
    Wait until page contains                ${WCMS["my_billing_register_ebill_confirm_error"]}
    Check Button Clickable                  ${Bill_Page_Confirm_Change_Email}    false

    Click Element                            ${Bill_Page_Re_Email}
    Clear Text                              ${Bill_Page_Re_Email}
    Input Text                              ${Bill_Page_Re_Email}      ${TW_Email}

    Click Element                            ${Bill_Page_New_Email}
    Clear Text                              ${Bill_Page_New_Email}
    Input Text                              ${Bill_Page_New_Email}      ${Diffirent_Email}
    Click Element                            ${Bill_Page_Re_Email}
    Hide Keyboard
    Wait until page contains                ${WCMS["my_billing_register_ebill_confirm_error"]}      
    Check Button Clickable                  ${Bill_Page_Confirm_Change_Email}    false


#hiện tại api không trả về E-Billing nên không thể chạy các case change email
Check Bill Page Change Email
    [Documentation]    Verify Change Email 
        ...     |*TC iOS*|TC1545    TC1546  TC1547  TC1548  TC1549  TC1550  TC1551  TC1552  TC1554|
        ...     |*TC Android*|TC404     TC405   TC406   TC407   TC408   TC409   TC410   TC411   TC413|	
        ...     |*TC Type*| Positive Case| 									
    [Tags]    BillJourney      Android     iOS
    Wait until page contains element        ${Bill_Page_Header_Tittle}   timeout=30
    # Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${WCMS["mybilling_usage_header"]}
    Element Attribute Should Match          ${Bill_Page_Header_Tittle}      text   ${Bill_Page_header_text}

    Wait until page contains                ${WCMS["my_billing_e_bill_delivery_text"]}        timeout=30
    ${value}        Get Text                ${Bill_Page_E_Bill_Value}
    Click Text       ${value}
    Wait until page contains                ${WCMS["my_billing_enter_password_title"]}   timeout=30
    Page Should Contain Element             ${Bill_Page_Password_Email}
    Click Element                           ${Bill_Page_Password_Email}
    Input text                              ${Bill_Page_Password_Email}   ${TW_PW_Bill_Email}
    Click Text                              ${WCMS["my_billing_enter_password_button"]}

    Wait until page contains                ${WCMS["my_billing_register_ebill_header"]}   timeout=30
    Click Text                              ${WCMS["my_billing_ebill_edit_text"]}

    Wait until page contains                ${WCMS["my_billing_edit_ebill_header"]}   timeout=30
    Check Button Clickable                  ${Bill_Page_Confirm_Change_Email}    false

    Click Element                           ${Bill_Page_New_Email}
    Clear Text                              ${Bill_Page_New_Email}
    Input Text                              ${Bill_Page_New_Email}      ${TW_Email}

    Click Element                           ${Bill_Page_Re_Email}
    Clear Text                              ${Bill_Page_Re_Email}
    Input Text                              ${Bill_Page_Re_Email}      ${TW_Email}

    Click Element                           ${Bill_Page_New_Email}
    Hide Keyboard
    #Check Button Clickable      ${Bill_Page_Confirm_Change_Email}    true

    Click Text                              ${WCMS["my_billing_ebill_edit_text"]}
    Wait until page contains                ${WCMS["my_billing_register_ebill_header"]}   timeout=30
    Wait until page contains                ${TW_Email}
    Wait until page contains                ${WCMS["my_billing_ebill_title"]} 
    Wait until page contains                ${WCMS["my_billing_ebill_registered_text"]} 
    Wait until page contains                ${WCMS["my_billing_ebill_edit_text"]} 
    Wait until page contains                ${WCMS["my_billing_ebill_button"]} 

    Click Text                              ${WCMS["my_billing_ebill_button"]}
    Page Should Contain Element             ${Bill_Page_Check_Email_To_Send}
    Page Should Contain Element             ${Bill_Page_Confirm_Send_Email}
    Wait until page contains                ${WCMS["my_billing_send_ebill_button"]}
    Click Element                           ${Bill_Page_Check_Email_To_Send}
    Click Element                           ${Bill_Page_Confirm_Send_Email}
    # Current After this step Fail API