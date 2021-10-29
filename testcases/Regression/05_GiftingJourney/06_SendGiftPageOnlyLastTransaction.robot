*** Settings ***
Library             ../../../libraries/SMS.py
Library             ../../../libraries/RBFindElement.py
Library             ../../../libraries/RPString.py

Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/Common.robot
Resource            ../../../variables/${ENV}/SendGiftPage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/account.robot
Resource            ../../KeyWord/SendGiftPageKeyWord.robot

Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Launch Application
Test Teardown       Tear Down Test Cases


*** Keywords ***

Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift
    Reopen App      ${EMPTY}
    Check Logined User    ${TW2_LinkAccount_Phonenumber}    ${TW2_Phonenumber}   ${TW2_Account}     ${TW2_Password}     ${TW2_Email}
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s


*** Test Cases ***   
Only section last transaction in send gift page
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC1692 - Android TC554|
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift

    #Go to Send Gift Page
    Wait until page contains                ${TW2_LinkAccount_Phonenumber}   timeout=60
    Check VOC Dispaly And Skip
    Wait until page contains Element        ${TabBar_Shop}        
    Click Element                           ${TabBar_Shop} 
    Wait Until Page Contains Element        ${Send_Btn}             
    Check Button Clickable                  ${Send_btn}     true
    Click Element                           ${Send_btn}
    BuiltIn.Sleep   2s

    #Check Only section last transaction in send gift page
    Click Got It Btn in SendGift Page 
    Wait until page contains                ${Send_Gift_Header_title}    timeout=30   
    Wait until page contains Element        ${Back_Btn}    
    Wait until page contains Element        ${Ib_right_Btn}  
    Wait Until Page Does Not Contain Element    ${favorite_section}
    Wait until page contains Element        ${last_transaction_section}       
    Wait until page contains Element        ${Send_Gift_Title_Btn}
    Click Got It Btn in SendGift Page          
    Wait until page contains Element        ${Input_Number_Text_Field}                         
    Wait until page contains Element        ${Contact_Icon}          
    Wait until page contains Element        ${Continue_Btn}  
    Check Button Clickable                  ${Continue_Btn}        true           
    Wait until page contains Element        ${Last_Transaction_Title}
    # [Teardown]      Tear Down Test Cases And Logout
    
    