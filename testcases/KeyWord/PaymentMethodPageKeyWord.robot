*** Settings ***
Resource           ../../variables/${ENV}/PaymentMethobPage.robot



*** Keywords ***
Verify Payment Method Page 
    Wait until page contains Element                ${PaymentMethod_title_contentproduct}           timeout=30
    Wait until page contains Element                ${PaymentMethod_headerTitle}
    Wait until page contains Element                ${PaymentMethod_view_detail}
    Wait until page contains Element                ${PaymentMethod_labelTotalPrice} 
    Wait until page contains Element                ${PaymentMethod_totalPriceSumConfigPayment}
    Wait until page contains Element                ${PaymentMethod_Back_Home} 


Verify App Payment Method
    [Arguments]    ${paymentName}       ${paymentmethod_emoney_tnc}        ${title_payment-method}
    Swipe	    200	    600	    200 	1800	  1000
    Sleep    2
    Wait until page contains Element                ${PaymentMethod_title_contentproduct}           timeout=30
    Scroll Down If Need 
    Scroll Down If Need                                                      
    Wait until page contains                         ${paymentName}           timeout=30
    Click Text     ${paymentName}
    Click Element                                   ${PaymentMethod_btn_continuePayment} 
    # ${name}        Convert To Upper Case	        ${paymentName} 
    Wait until page contains                        ${title_payment-method}           timeout=30
    Wait until page contains Element                ${TermsCondition_EMoneyTitle}
    Wait until page contains Element                ${btn_description_Term&Con}
    Wait until page contains Element                ${eMoneyTnc_Logo}
    Run Keyword And Ignore Error                    Wait until page contains                        ${paymentmethod_emoney_tnc}
    Wait until page contains                        Continue           timeout=30
    Click Element                                   ${Load_Content_Close}

Verify App Payment Method - for unconnected e-wallets
    [Arguments]    ${paymentName}       ${paymentmethod_emoney_tnc}            ${title_payment-method}       
    Swipe	    200	    600	    200 	1800	  1000
    Sleep    2
    Wait until page contains Element                ${PaymentMethod_title_contentproduct}           timeout=30
    Swipe	    200	    1200	    200 	300	  1000                                                
    Wait until page contains                        ${paymentName}           timeout=30
    Click Text                                      ${paymentName}
    ${connect}       Run Keyword And Return Status       Wait until page contains    Connect   timeout=30
    Run Keyword If      ${connect}==False                Click Element               ${PaymentMethod_btn_continuePayment}   ## keyword for mt prod 
    ${insufficient}       Run Keyword And Return Status       Wait until page contains        ${WCMS["paymentmethod_confirmation_emoney_insufficient_header"]}      timeout=30
    Run Keyword If      ${insufficient}==True                 Wait until page contains           ${WCMS["paymentmethod_confirmation_emoney_insufficient_text"]}    timeout=20
    Run Keyword If      ${insufficient}==True                 Click Button                    ${WCMS["paymentmethod_confirmation_insufficient_primary_button"]}   
    # Run Keyword If      ${insufficient}==True                 Swipe	    200	    600	    200 	1000	  1000

    # ${name}        Convert To Upper Case	        ${paymentName} 
    Run Keyword If      ${insufficient}==False        Wait until page contains                        ${title_payment-method}           timeout=30
    Run Keyword If      ${insufficient}==False        Wait until page contains Element                ${TermsCondition_EMoneyTitle}
    Run Keyword If      ${insufficient}==False        Wait until page contains Element                ${btn_description_Term&Con}
    Run Keyword If      ${insufficient}==False        Wait until page contains Element                ${eMoneyTnc_Logo}
    Run Keyword If      ${insufficient}==False       Wait until page contains                        ${paymentmethod_emoney_tnc}
    Run Keyword If      ${insufficient}==False        Wait until page contains                        ${WCMS["paymentmethod_emoney_dana_button_connect"]}
    Run Keyword If      ${insufficient}==False        Click Element                                   ${Load_Content_Close}

Verify App Payment Method - for OVO
    [Arguments]    ${paymentmethod_emoney_tnc}        ${title_payment-method}
    Swipe	    200	    600	    200 	1800	  1000
    Sleep    2
    Wait until page contains Element                ${PaymentMethod_title_contentproduct}           timeout=30
    Scroll Down If Need 
    Scroll Down If Need                                                      
    Wait until page contains                        ${WCMS["emoneyovo"]}           timeout=30
    Click Text                                      ${WCMS["emoneyovo"]} 
    Click Element                                   ${PaymentMethod_btn_continuePayment} 
    Wait until page contains                        ${title_payment-method}           timeout=30
    Wait until page contains Element                ${TermsCondition_EMoneyTitle}
    Wait until page contains Element                ${btn_description_Term&Con}
    Wait until page contains Element                ${eMoneyTnc_Logo}
    Run Keyword And Ignore Error                    Wait until page contains                        ${paymentmethod_emoney_tnc}
    Wait until page contains                        Continue           timeout=30
    Element Attribute Should Match                  ${btn_continute}       Enabled        False
    Input Text                                      ${Input_phone}                      ${TW_LinkAccount_Phonenumber}
    Element Attribute Should Match                  ${btn_continute}       Enabled        True
    Click Element                                   ${btn_continute} 
    ${system_error}      Run Keyword And Return Status       Wait until page contains       ${WCMS["paymentmethod_confirmation_popup_error_secondary_button"]}     timeout=30                           
    Run Keyword If      ${system_error}==True            Click Button               ${WCMS["paymentmethod_confirmation_popup_error_secondary_button"]}   
    ${header_title1}                                 Convert To Lower Case            ${WCMS["payment_progress_header"]}
    ${header_title2}                                 Convert To Title Case            ${header_title1}
    Run Keyword If      ${system_error}==False       Wait until page contains                        ${header_title2}            timeout=30
    Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${WCMS["payment_progress_ovo_notification_sent_text"]}
    Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${TW_LinkAccount_Phonenumber}
    Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${WCMS["payment_progress_ovo_notification_sent_info"]}
    Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${WCMS["paymentmethod_emoney_ovo_purchasestatus_howtopay_title"]}
    Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${WCMS["label.browse_package_success_buy_app.body.trans_number"]}
    ${OVO}                        Convert To Upper Case             ${WCMS["paymentmethod_emoney_ovo_text"]}
    Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${OVO} 
    Swipe	    200	    1500	    200 	500	  1000
    Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${WCMS["payment_progress_button"]}
    Run Keyword If      ${system_error}==False       Element Attribute Should Match                  ${btn_back_to_home}           Enabled        True
    Run Keyword If      ${system_error}==False       Click Element                                   ${btn_back_to_home} 
    Run Keyword If      ${system_error}==False       Wait until page contains Element                ${TabBar_Home}  

Verify Payment Method - Kredivo
    Page Should Contain Text                        ${WCMS["payment_method_kredivo_text"]}          timeout=30
    Click Text                                      ${WCMS["payment_method_kredivo_text"]}
    Click Element                                   ${PaymentMethod_btn_continuePayment} 
    ${error_systerm}        Run Keyword And Return Status       Wait until page contains    ${WCMS["layout_state_no_fst_title"]}       timeout=30
    Run Keyword If      ${error_systerm}==True                Click Element          ${btn_close_error}                
    ${header_Title}        Convert To Upper Case    ${WCMS["payment_method_kredivo_text"]}
    Run Keyword If      ${error_systerm}==False                Wait until page contains                        ${header_Title}          timeout=30
    Run Keyword If      ${error_systerm}==False                Page Should Contain Element                     ${Wv_emoney} 
    Run Keyword If      ${error_systerm}==False                Go Back
    Sleep   5
    
Verify Payment Method - AkuLaku when select a denomination below minimum payment
    Page Should Contain Text                        ${WCMS["payment_method_akulaku_text"]}          timeout=30
    ${akulaku_min_text}      Replace String         ${WCMS["payment_method_akulaku_min_text"]}      %minPayment%        ${min_payment}
    Run Keyword and Return Status                   Page Should Contain Text      ${akulaku_min_text}                                                   
    Run Keyword and Return Status                   Element Attribute Should Match      ${radio_btn_Akulaku}       checked       False
    Click Element                                   ${Load_Content_Close}
    
Verify Payment Method - AkuLaku when select a denomination above minimum payment
    Swipe	    200	    600	    200 	1800	  1000
    Sleep       2
    Wait until page contains Element                ${PaymentMethod_title_contentproduct}           timeout=30
    Swipe	    200	    1200	    200 	300	  1000
    Swipe	    200	    1000	    200 	500	  1000
    Wait until page contains                        ${WCMS["payment_method_akulaku_text"]}          timeout=30                                                  
    Run Keyword and Return Status                   Element Attribute Should Match      ${radio_btn_Akulaku}       checked       True
    Click Text                                      ${WCMS["payment_method_akulaku_text"]} 
    Run Keyword and Return Status                   Page Should Contain Text                        ${WCMS["payment_method_akulaku_warning_text"]} 
    Click Element                                   ${PaymentMethod_btn_continuePayment}
    Wait until page contains                        ${WCMS["payment_method_akulaku_header_text"]} 
    Click Element                                   ${Load_Content_Close}          timeout=30


