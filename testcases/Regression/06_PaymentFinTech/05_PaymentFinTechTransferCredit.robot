*** Settings ***
Documentation     TDW7TL-145
Library             ../../../libraries/SMS.py
Library             ../../../libraries/RBFindElement.py
Library             ../../../libraries/RPString.py

Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/Common.robot
Resource            ../../../variables/${ENV}/DetailSendgiftPage.robot
Resource            ../../../variables/${ENV}/PaymentMethobPage.robot
Resource            ../../../variables/${ENV}/SendGiftCreditPage.robot
Resource            ../../../variables/${ENV}/SendGiftPage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/PackageDetail.robot
Resource            ../../../variables/${ENV}/ConfirmOTP.robot
Resource            ../../../variables/account.robot

Resource            ../../KeyWord/ShopPageKeyWord.robot
Resource            ../../KeyWord/PackageDetailPageKeyWord.robot
Resource            ../../KeyWord/AddCreditPageKeyWord.robot
Resource            ../../KeyWord/PaymentMethodPageKeyWord.robot
Resource            ../../KeyWord/DetailInfoPopUpKeyWord.robot
Resource            ../../KeyWord/SendGiftPageDetailKeyWord.robot
Resource            ../../KeyWord/SendGiftPageKeyWord.robot
Resource            ../../KeyWord/SendGiftCreditPageKeyWord.robot


Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Go to Send Gift Page
Test Teardown       Quit Application

*** Variables ***

${Valid_Phone_Number}           081211063948  
${Manually_Nominal_input_number_incorrect}              4999      
${Manually_Nominal_input_number_insufficient}           900000
${Manually_Nominal_input_number_min}                    4000 
${Manually_Nominal_input_number_max}                    10000000
${Manually_Nominal_input_number_correct}                10,000

${Fail_message_input_number_incorrect}                  Please input the correct amount to transfer!
${Fail_message_input_number_insufficient}               ${WCMS["send_gift_transfer_error_insufficient_text"]}
${Fail_message_input_number_min}                        Minimum amount is Rp. 5000
${Fail_message_input_number_maximum}                    Maximum amount is Rp. 1,000,000

${I_understand}                                     ${APP_PACKAGE}:id/btSecondTypePrimary
${Rp_number}                                     ${APP_PACKAGE}:id/tv_price
*** Keywords ***

Check PreConditional
    Reopen App      ${EMPTY}
    Check Reminder
    Check Tutup popup
    Check default lang and swtich 
    Check Banner on the login page
    Check Logined Default User
    Check Reminder
    Check Tutup popup
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s

Verify Transfer Credit success
    [Arguments]    ${number_amount}
    Wait until page contains                ${btn_continue}        timeout=20
    Element Attribute Should Match          ${btn_continue}       enabled   true
    Click Element                           ${btn_continue}
    Wait until page contains Element                ${PaymentMethod_title_contentproduct}           timeout=30
    Wait until page contains Element                ${PaymentMethod_headerTitle}
    Wait until page contains Element                ${PaymentMethod_view_detail}
    Wait until page contains                        ${WCMS["payment_method_see_detail"]}        timeout=30
    Click Text                                    ${WCMS["payment_method_see_detail"]}
    Run Keyword And Ignore Error                    Page Should Contain Text                        ${Credit_Transfer_title}            timeout=30
    Run Keyword And Ignore Error                    Page Should Contain Text                        ${Credit_Transfer_Amount}
    Page Should Contain Text                        ${number_amount}
    Page Should Contain Text                        ${WCMS["send_gift_transfer_fee_text"]}
    Click Button                                    ${WCMS["label.global.button.ok"]}
    Page Should Contain Text                        ${Valid_Phone_Number}
    Run Keyword And Return Status                   Page Should Contain Text                        ${WCMS["payment_method_reset_cls_veronika_text"]}
    Wait until page contains Element                ${PaymentMethod_labelTotalPrice}
    Wait until page contains Element                ${PaymentMethod_totalPriceSumConfigPayment} 
    Wait until page contains Element                ${PaymentMethod_Back_Home} 
    Page Should Contain Text                        ${WCMS["offer-buy"]} 
    # Element Attribute Should Match       
    # Click Button                                  ${WCMS["label.global.button.pay"]}
    Go Back

Go to Send Gift Page
    [Documentation]    Go to Send Gift Page   
        ...     |*TC IDs*|Android TC503|
        ...     |*TC IDs*|iOS TC1641|       
        ...     |*TC Type*| Positive Case| 
    ${status}               Run Keyword And Return Status       Wait until page contains Element     ${TabBar_Home}    timeout=60        
    Run Keyword If          ${status} ==False                   Launch Application
    Check Reminder
    Wait until page contains                ${TW_LinkAccount_Phonenumber}   timeout=60
    Check VOC Dispaly And Skip
    Wait until page contains Element        ${TabBar_Shop}        
    Click Element                           ${TabBar_Shop} 
    Wait Until Page Contains Element        ${Send_Btn}             
    Check Button Clickable                  ${Send_btn}     true
    Click Element                           ${Send_btn}
    ${Permission_allow_button}    Run Keyword And Return Status    Wait until page contains Element    ${Permission_allow_button}
    Run Keyword If      ${Permission_allow_button}==True           Click Button    
    BuiltIn.Sleep   2s

Check Maximum Daily Limit of Transfer Credit
    ${maximum_daily}       Run Keyword And Return Status          Wait until page Contains         ${WCMS["send_gift_transfercredit_popup_limit_desc"]}    timeout=30
    ${limit_title}        RPString.escape HTML         ${WCMS["send_gift_transfercredit_popup_limit_title"]}
    Run Keyword If       ${maximum_daily}==True                  Run Keyword And Ignore Error      Wait until page contains                ${limit_title}
    Run Keyword If       ${maximum_daily}==True                   Wait until page Contains         ${WCMS["send_gift_transfercredit_popup_limit_desc"]}
    Run Keyword If       ${maximum_daily}==True                   Wait until page Contains         ${WCMS["send_gift_transfercredit_popup_limit_button"]}
    Run Keyword If       ${maximum_daily}==True                   Click Element                     ${I_understand}
    Sleep    5
    Run Keyword If       ${maximum_daily}==True                   Wait until page contains Element        ${Credit_Transfer_title}        timeout=30s 
    Run Keyword If       ${maximum_daily}==True                   Click Element                           ${Credit_Transfer_title}

*** Test Cases *** 

Verify Transfer Credit page BUT your Credit insufficient, limit amount
    [Documentation]   Choose a Nominal Credit BUT Your Credit is not enough, limit amount
        ...     |*TC IDs*|Android TC515    TC516    TC517|
        ...     |*TC IDs*|iOS TC1653    TC1654    TC1655|
        ...     |*TC Type*|Negative Case| 
    [Tags]    TransferCredit1

    ${Permission_allow_button}    Run Keyword And Return Status    Wait until page contains Element    ${Permission_allow_button}
    Run Keyword If      ${Permission_allow_button}==True           Click Button                       Allow 
    Click Element                            ${Input_Number_Text_Field}
    Input Text                               ${Input_Number_Text_Field}      ${Valid_Phone_Number} 
    Wait until page contains                 ${Valid_Phone_Number} 
    Check Button Clickable                   ${Continue_Btn}        true
    Click Got It Btn in SendGift Page
    Click Element                            ${Continue_Btn} 
    # Input correct Telkomsel Number          ${Valid_Phone_Number} 
    Wait until page contains Element        ${Credit_Transfer_title}        timeout=30s
    Click Element                           ${Credit_Transfer_title}
    Check Maximum Daily Limit of Transfer Credit
      # Choose a Nominal Credit 
    ${Rp_current_1}            Get Text                   ${Rp_number}
    ${Rp_current_2}            Remove String              ${Rp_current_1}        Rp 
    # ${Rp_current_3}            Remove String              ${Rp_current_2}        ${SPACE}
    ${Rp_current_3}            Replace String             ${Rp_current_2}        ,       .
    ${Rp_current_4}            Convert To Number          ${Rp_current_3}        
    ${status}                  Run Keyword And Return Status        Should be true 	      0 < ${Rp_current_4} < 30.000
    Run Keyword If             ${status}==True         Wait until page contains                ${Credit_Rp_30k} 
    Run Keyword If             ${status}==True         Click Text                              ${Credit_Rp_30k}
    ${error_system}    Run Keyword And Return Status   Wait until page contains      ${WCMS["send_gift_transfer_fee_popup_error_title"]}    timeout=30
    Run Keyword If      ${error_system}==True          Click Text       ${WCMS["send_gift_transfer_fee_popup_error_secondary_button"]}        
    Run Keyword If             ${status}==True         Wait until page contains                ${WCMS["send_gift_transfer_error_insufficient_text"]}            
    Run Keyword If             ${status}==True         Element Attribute Should Match          ${btn_continue}       enabled      false
        # Input manually nominal 
    Swipe	    200	    1000	    200 	500	  1000
    Click Element                           ${input_price_TextField}
    Input Text                              ${input_price_TextField}        ${Manually_Nominal_input_number_incorrect}
    Hide Keyboard
    Wait until page contains                ${Manually_Nominal_input_number_incorrect}
    Wait until page contains                ${Fail_message_input_number_incorrect} 
    Element Attribute Should Match          ${btn_continue}       enabled       false 
    Clear Text                              ${input_price_TextField}
    Wait Until Page Does Not Contain        ${Manually_Nominal_input_number_incorrect} 
    Wait Until Page Does Not Contain        ${Fail_message_input_number_incorrect}

    Click Element                           ${input_price_TextField}
    Input Text                              ${input_price_TextField}        ${Manually_Nominal_input_number_insufficient}
    Hide Keyboard
    Wait until page contains                ${Manually_Nominal_input_number_insufficient}
    Wait until page contains                ${Fail_message_input_number_insufficient}    
    Element Attribute Should Match          ${btn_continue}       enabled   false 
    Clear Text                              ${input_price_TextField}
    Wait Until Page Does Not Contain        ${Manually_Nominal_input_number_insufficient} 
    Wait Until Page Does Not Contain        ${Fail_message_input_number_insufficient} 

    Click Element                           ${input_price_TextField}
    Input Text                              ${input_price_TextField}        ${Manually_Nominal_input_number_min} 
    Hide Keyboard
    Wait until page contains                ${Manually_Nominal_input_number_min} 
    Wait until page contains                ${Fail_message_input_number_min}   
    Element Attribute Should Match          ${btn_continue}       enabled   false
    Clear Text                              ${input_price_TextField}
    Wait Until Page Does Not Contain        ${Manually_Nominal_input_number_min} 
    Wait Until Page Does Not Contain        ${Fail_message_input_number_min} 

    Click Element                           ${input_price_TextField}
    Input Text                              ${input_price_TextField}        ${Manually_Nominal_input_number_max} 
    Hide Keyboard
    Wait until page contains                ${Manually_Nominal_input_number_max} 
    Wait until page contains                ${Fail_message_input_number_maximum}   
    Element Attribute Should Match          ${btn_continue}       enabled   false
    Clear Text                              ${input_price_TextField}
    Wait Until Page Does Not Contain        ${Manually_Nominal_input_number_min} 
    Wait Until Page Does Not Contain        ${Fail_message_input_number_min} 

Smoke Test - Transfer Credit success
    [Documentation]   Transfer Credit success
        ...     |*TC IDs*|Android TC515    TC516    TC517|
        ...     |*TC IDs*|iOS TC1653    TC1654    TC1655|
        ...     |*TC Type*|Negative Case|
    [Tags]    TransferCredit2 

    ${Permission_allow_button}    Run Keyword And Return Status    Wait until page contains Element    ${Permission_allow_button}
    Run Keyword If      ${Permission_allow_button}==True           Click Button                       Allow 
    Click Element                            ${Input_Number_Text_Field}
    Input Text                               ${Input_Number_Text_Field}      ${Valid_Phone_Number} 
    Wait until page contains                 ${Valid_Phone_Number} 
    Check Button Clickable                   ${Continue_Btn}        true
    Click Element                            ${Continue_Btn}
    # Input correct Telkomsel Number          ${Valid_Phone_Number}
    Wait until page contains Element        ${Credit_Transfer_title}        timeout=30s 
    Click Element                           ${Credit_Transfer_title}
    Check Maximum Daily Limit of Transfer Credit
    # Choose a Nominal Credit 
    Wait until page contains                ${Credit_Rp_10k}
    Click Text                              ${Credit_Rp_10k}
    ${error_system}    Run Keyword And Return Status    Wait until page contains      ${WCMS["send_gift_transfer_fee_popup_error_title"]}    timeout=30
    Run Keyword If      ${error_system}==True           Click Text       ${WCMS["send_gift_transfer_fee_popup_error_secondary_button"]}   
    ${enough}          Run Keyword And Return Status    Element Attribute Should Match          ${btn_continue}       enabled   true
    Run Keyword If      ${enough}==True           Verify Transfer Credit success          ${Credit_Rp_10k}
    Run Keyword If      ${enough}==False          Wait until page contains                ${WCMS["send_gift_transfer_error_insufficient_text"]}       
    # Input manually nominal 
    Swipe	    200	    1000	    200 	500	  1000
    Click Element                           ${input_price_TextField}
    Input Text                              ${input_price_TextField}        ${Manually_Nominal_input_number_correct}
    Hide Keyboard
    Wait until page contains                ${Manually_Nominal_input_number_correct}  
    ${enough}          Run Keyword And Return Status    Element Attribute Should Match          ${btn_continue}       enabled   true
    Run Keyword If      ${enough}==True           Verify Transfer Credit success           ${Manually_Nominal_input_number_correct}
    Run Keyword If      ${enough}==False          Wait until page contains                ${Fail_message_input_number_insufficient}
