*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/account.robot
Resource            ../../../variables/${ENV}/SendGiftPage.robot
Resource            ../../../variables/${ENV}/ContactNumber.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/Common.robot
Resource            ../../KeyWord/SendGiftPageKeyWord.robot
Library             ../../../libraries/RBFindElement.py

Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Go to Send Gift Page
Test Teardown       Tear Down Test Cases

*** Variables ***
#Send Gift Page
${Valid_Phone_Number}           081211063948     
# ${Favorit_Number}               6282167564380 
# ${Favorit_Number_08}            082167564380
${Favorit_Number}          6281394074354 
${Favorit_Number_08}           081394074354 
${Transaction_Number}           6281394074354 
${Transaction_Number_08}           081394074354 
    
${contact_name1}                    Le Ngoc Thanh                        
${contact_number1}                  081298233574                      
${Search_Contact_Name2}             Trang
${Search_Contact_PhoneNumber2}      0811   
${contact_name2}                    Nguyen Minh Trang
${contact_number2}                  0811893731

${coachmark_Btn}                    Got It

*** Keywords ***
Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Contact
    Reopen App      ${EMPTY}
    Check Launching New version 
    Check Permission First Launch
    Check Tutup popup
    Check Reminder
    Check Tutup popup
    Check Logined Default User
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s

Go to Send Gift Page
    [Documentation]    Go to Send Gift Page   
        ...     |*TC IDs*|Android TC503|
        ...     |*TC IDs*|iOS TC1641|       
        ...     |*TC Type*| Positive Case| 
    Launch Application
    Check Reminder
    Wait until page contains                ${TW_LinkAccount_Phonenumber}   timeout=60
    Check VOC Dispaly And Skip
    Wait until page contains Element        ${TabBar_Shop}        
    Click Element                           ${TabBar_Shop} 
    Wait Until Page Contains Element        ${Send_Btn}             
    Check Button Clickable                  ${Send_btn}     true
    Click Element                           ${Send_btn}
    BuiltIn.Sleep   2s


*** KeyWord *** 
Check Display Allow Contact Permission pop-up
    Click Got It Btn in SendGift Page 
    Wait until page contains Element        ${Permission_icon}        timeout=30   
    Wait until page contains Element        ${Permission_message}    
    Wait until page contains Element        ${Permission_deny_button}  
    Wait until page contains Element        ${Permission_allow_button}

Check Display Allow Contact Permission pop-up and Deny Contact Permission pop-up
    Check Display Allow Contact Permission pop-up  
    Click Element                           ${Permission_deny_button}
    Wait until page contains                ${Send_Gift_Header_title}    timeout=30   
    Wait until page contains Element        ${Back_Btn}    
    Wait until page contains Element        ${Ib_right_Btn}                 
    Wait until page contains Element        ${Send_Gift_Title_Btn}          
    Wait until page contains Element        ${Input_Number_Text_Field}                         
    Wait until page contains Element        ${Contact_Icon}          
    Wait until page contains Element        ${Continue_Btn}   
    Wait Until Page Does Not Contain Element        ${Favorit_title}
    Wait Until Page Does Not Contain Element        ${Last_Transaction_Title} 

Check Contact List When don’t have Telkomsel Number in contact list
    [Documentation]    Check Check Allow Contact Permission pop-up and Search Contact in Contact List
        ...     |*TC IDs*|iOS TC569|
        ...     |*TC IDs*|Android TC1707|
        ...     |*TC Type*|Positive Case| 
    [Tags]    Contact
    # ${Permission_allow_button}    Run Keyword And Return Status    Wait until page contains Element    ${Permission_allow_button}
    # Run Keyword If      ${Permission_allow_button}==True           Click Element                       ${Permission_allow_button}
    # Check Send Gift page
    # Click Element                           ${Contact_Icon}
    Wait until page contains Element        ${send_gift_empty_contact_image} 
    Wait until page contains Element        ${send_gift_empty_contact_title}
    Wait until page contains Element        ${send_gift_empty_contact_text}
    Wait until page contains Element        ${global_popup_close_text}

Check Allow Contact Permission pop-up and Search Contact in Contact List
    [Documentation]    Check Check Allow Contact Permission pop-up and Search Contact in Contact List
        ...     |*TC IDs*|iOS TC568    TC532|
        ...     |*TC IDs*|Android TC1706    TC1670|
        ...     |*TC Type*|Positive Case| 
    [Tags]    Contact2
    # Wait until page contains Element        ${Contact_Icon} 
    # Click Element                            ${Contact_Icon} 
    # ${Permission_allow_button}    Run Keyword And Return Status    Wait until page contains Element    ${Permission_allow_button}
    # Run Keyword If      ${Permission_allow_button}==True           Click Element                       ${Permission_allow_button}
    # #Check Display Allow Contact Permission pop-up
    # #Click Element                           ${Permission_allow_button}
    # Check Send Gift page
    # Click Element                           ${Contact_Icon} 
    Wait until page contains Element        ${send_gift_pick_number_title}
    Wait until page contains Element        ${send_gift_pick_number_subtitle} 
    Wait until page contains Element        ${search_contact_textfield}
    Wait until page contains                ${contact_name1}   
    Wait until page contains                ${contact_number1} 
    Wait until page contains                ${contact_name2}   
    Wait until page contains                ${contact_number2} 
    Click Element                                ${search_contact_textfield}
    Input Text                                   ${search_contact_textfield}    ${Search_Contact_Name2}
    Wait until page contains                    ${contact_name2}        timeout=30   
    Wait until page contains                     ${contact_number2}   
    Wait Until Page Does Not Contain            ${contact_name1}
    Wait Until Page Does Not Contain            ${contact_number1}    
    Clear Text                                   ${search_contact_textfield}
    Click Element                                ${search_contact_textfield}
    Input Text                                   ${search_contact_textfield}    ${Search_Contact_PhoneNumber2}
    Wait until page contains                    ${contact_name2}        timeout=30   
    Wait until page contains                    ${contact_number2}   
    Wait Until Page Does Not Contain            ${contact_name1}
    Wait Until Page Does Not Contain            ${contact_number1}   
    

*** Test Cases ***  

Check Display Allow Contact Permission pop-up and Deny Contact Permission pop-up
    [Documentation]    Check Display Allow Contact Permission pop-up and user click No on Allow Contact Permission pop-up
        ...     |*TC IDs*|iOS TC1705    TC1708|
        ...     |*TC IDs*|Android TC567   TC570|
        ...     |*TC Type*| Positive Case and Negative Case| 
    [Tags]    Contact
    ${Contact_permission}       Run Keyword And Return Status       Wait until page contains Element        ${Permission_icon}    timeout=30
    Run Keyword If      ${Contact_permission}==True       Check Display Allow Contact Permission pop-up and Deny Contact Permission pop-up

Check Contact List When don’t have Telkomsel Number in contact list OR Check Allow Contact Permission pop-up and Search Contact in Contact List
    ${Permission_allow_button}    Run Keyword And Return Status    Wait until page contains Element    ${Permission_allow_button}
    Run Keyword If      ${Permission_allow_button}==True           Click Element                       ${Permission_allow_button}
    Check Send Gift page
    Click Element                           ${Contact_Icon}
    ${Contact_list_emty}       Run Keyword And Return Status       Wait until page contains Element        ${send_gift_empty_contact_text}       timeout=30
    Run Keyword If      ${Contact_list_emty}==False       Check Allow Contact Permission pop-up and Search Contact in Contact List
    Run Keyword If      ${Contact_list_emty}==True        Check Contact List When don’t have Telkomsel Number in contact list
















