*** Keywords ***
Go to Shop Page
    ${status}               Run Keyword And Return Status       Wait until page contains Element     ${TabBar_Home}    timeout=60        
    Run Keyword If          ${status} ==False                     Launch Application
    Check Reminder 
    Check Logined Default User
    Wait until page contains                ${TW_LinkAccount_Phonenumber}               timeout=60
    Check VOC Dispaly And Skip
    Wait until page contains Element        ${TabBar_Shop}        timeout=30
    Click Element                           ${TabBar_Shop} 
    BuiltIn.Sleep   2s

Verify GUI Shop Page 
    ${Confirm}       Run Keyword And Return Status       Wait until page contains element  ${confirmation_title} 
    Run Keyword If      ${Confirm} ==True       Close purchase confirmation in Shop Page
    # Wait until page contains Element    ${Top_up_Btn}        timeout=30
    Page Should Contain Text                ${WCMS["shop_balance_text"]}
    # Wait until page contains            ${WCMS["shop_balance_text"]}
    # Wait until page contains            ${Credit_Package_Text}
    Wait until page contains            ${WCMS["shop_package_category_title"]}
    Wait until page contains Element    ${Send_Btn} 
    # Wait until page contains Element    ${offer_title}
    # Wait until page contains            ${See_all_Text}
    Wait until page contains Element    ${Choose_Package}
    Wait until page contains            ${WCMS["send_gift_category_internet_text"]}
    Wait until page contains            ${WCMS["send_gift_category_roaming_text"]}
    Wait until page contains            ${WCMS["send_gift_category_multimedia_text"]}

	
Close purchase confirmation in Shop Page
    Wait until page contains Element        ${confirmation_title}   
    Wait until page contains Element        ${confirmation_Buy_Btn} 
    Wait until page contains Element        ${confirmation_Close_Btn} 
    Click Element                            ${confirmation_Close_Btn}



