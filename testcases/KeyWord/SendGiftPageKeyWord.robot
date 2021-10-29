*** Keywords ***
Go to Send Gift Page
    ${status}               Run Keyword And Return Status       Wait until page contains Element     ${TabBar_Home}    timeout=60        
    Run Keyword If          ${status} ==False                   Launch Application
    Check Reminder
    Check Tutup popup
    Check Logined Default User
    Wait until page contains                ${TW_LinkAccount_Phonenumber}   timeout=60
    Check VOC Dispaly And Skip
    Wait until page contains Element        ${TabBar_Shop}              timeout=60  
    Click Element                           ${TabBar_Shop}
    ${Confirm}       Run Keyword And Return Status       Wait until page contains element  ${confirmation_title} 
    Run Keyword If      ${Confirm} ==True       Close purchase confirmation in Shop Page 
    Wait Until Page Contains Element        ${Send_Btn}             
    Check Button Clickable                  ${Send_btn}     true
    Click Element                           ${Send_btn}
    BuiltIn.Sleep   2s



Check Send Gift page
    Click Got It Btn in SendGift Page 
    Wait until page contains                ${Send_Gift_Header_title}    timeout=30   
    Wait until page contains Element        ${Back_Btn}    
    Wait until page contains Element        ${Ib_right_Btn}  
    Click Got It Btn in SendGift Page 
    Run Keyword And Ignore Error            Wait until page contains Element        ${favorite_section}
    Click Got It Btn in SendGift Page 
    Wait until page contains Element        ${last_transaction_section}   
    Click Got It Btn in SendGift Page 
    Run Keyword And Ignore Error            RBFindElement.find text in section android    ${favorite_section}    ${Favorit_Number}
    Click Got It Btn in SendGift Page 
    Run Keyword And Ignore Error            RBFindElement.find text in section android    ${last_transaction_section}     ${Transaction_Number}   
    Click Got It Btn in SendGift Page            
    Wait until page contains Element        ${Send_Gift_Title_Btn}  
    Click Got It Btn in SendGift Page         
    Wait until page contains Element        ${Input_Number_Text_Field}  
    Click Got It Btn in SendGift Page                  
    # Wait until page contains                ${Input_Number_Hide_Text}          
    # Wait until page contains Element        ${Contact_Icon}          
    Wait until page contains Element        ${Continue_Btn}  
    Check Button Clickable                  ${Continue_Btn}        true   
    Run Keyword And Ignore Error            Wait until page contains                ${WCMS["send_gift_favorite_title"]}     
    Run Keyword And Ignore Error            Wait until page contains                ${Max_Favorit}            timeout=30        
    Run Keyword And Ignore Error            Wait until page contains                ${WCMS["send_gift_last_transaction_title"]} 
    # Wait until page contains Element        ${clock_icon}      
    Run Keyword And Ignore Error            Wait until page contains                ${WCMS["global_see_all"]} 


# review later
Input correct Telkomsel Number
    [Arguments]                         ${ReceivePhonNumber}
    Click Element                       ${Input_Number_Text_Field}
    Input Text                          ${Input_Number_Text_Field}      ${ReceivePhonNumber}
    Wait until page contains            ${ReceivePhonNumber}
    Wait until page contains Element    ${Save_As_Favorit_Checkbox}
    Valid CheckBox Result               ${Save_As_Favorit_Checkbox}       false
    Click Got It Btn in SendGift Page
    Check Button Clickable              ${Save_As_Favorit_Checkbox}      true
    Click Got It Btn in SendGift Page 
    Click Element                       ${Save_As_Favorit_Checkbox} 
    Click Got It Btn in SendGift Page
    Valid CheckBox Result               ${Save_As_Favorit_Checkbox}   true
    Check Button Clickable              ${Continue_Btn}        true 
    Click Element                       ${Continue_Btn}



