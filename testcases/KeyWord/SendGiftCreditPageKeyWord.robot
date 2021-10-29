*** Keywords ***
Verify Send Gift Page Category
    
    # ${popup_limit_button}       Run Keyword And Return Status       Wait until page contains    ${WCMS["send_gift_credit_popup_limit_button"]} 
    # Run Keyword If      ${popup_limit_button}==True       Click Text        ${WCMS["send_gift_credit_popup_limit_button"]}
    Wait until page Contains                ${Send_Gift_Header_title}                           
    Wait until page contains                ${Valid_Phone_Number}         
    Wait until page contains Element        ${brand_logo}                         
    Wait until page contains Element        ${Contact_Icon2}    
    Wait until page contains Element        ${Cross_Btn}
    Wait until page contains Element        ${Give_gift_to_text}
    Wait until page Contains                ${WCMS["send_transfer_credit_title"]}  
    Wait until page contains                ${WCMS["send_gift_credit_title"]}  
    # Element Attribute Should Match          ${WCMS["send_gift_credit_title"]}    selected    true
    # Element Attribute Should Match          ${WCMS["send_transfer_credit_title"]}    selected    false
    RBFindElement.find elements from parent    ${Credit_ListView}     ${Credit_Item}     ${Credit_valid_items}


Verify transfer credit page without tab credit
    Wait until page Contains                ${Send_Gift_Header_title}                           
    Wait until page contains                ${Valid_Phone_Number}         
    Wait until page contains Element        ${brand_logo}                         
    Wait until page contains Element        ${Contact_Icon2}    
    Wait until page contains Element        ${Cross_Btn}
    Wait until page contains Element        ${Give_gift_to_text}
    Wait until page contains Element        ${WCMS["send_transfer_credit_title"]} 
    Wait until page contains Element        ${Your_credit_number} 
    Wait until page contains Element        ${Credit_price} 
    Wait until page contains Element        ${Title_Nominal} 
    Wait until page contains Element        ${Title_Transfer}  
    Wait until page contains                ${input_price_TextField} 
    Wait until page contains                ${WCMS["send_gift_transfer_tnc_title"]} 
    Wait Until Page Does Not Contain        ${Credit_Send_title}


Verify send gift credit page without transfer credit
    Wait until page Contains                ${Send_Gift_Header_title}                           
    Wait until page contains                ${Valid_Phone_Number}         
    Wait until page contains Element        ${brand_logo}                         
    Wait until page contains Element        ${Contact_Icon2}    
    Wait until page contains Element        ${Cross_Btn}
    Wait until page contains Element        ${Give_gift_to_text}
    Wait Until Page Does Not Contain        ${WCMS["send_transfer_credit_title"]}  
    Wait until page contains                ${Credit_Send_title}  
    RBFindElement.find elements from parent    ${Credit_ListView}     ${Credit_Item}     ${Credit_valid_items}