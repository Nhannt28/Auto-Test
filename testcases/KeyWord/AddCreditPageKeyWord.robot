*** Keywords ***
Verify Add Credit Page
    Wait until page contains                    ${WCMS["dashboard_add_credit_button"]}        timeout=60  
    Page Should Contain Text                    ${WCMS["add_credit_input_number_title"]}  
    Page Should Contain Element                 ${msisdn_logo}  
    Page Should Contain Text                    ${TW_LinkAccount_Phonenumber}   
    Page Should Contain Text                    ${WCMS["add_credit_promo_see_all_text"]}
    Page Should Contain Element                 ${AddCredit_item}
