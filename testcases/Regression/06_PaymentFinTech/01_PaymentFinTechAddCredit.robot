*** Settings ***
Documentation       TDW7TL-139
Library             ../../../libraries/RBFindElement.py
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/Common.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/PackageDetail.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/PaymentMethobPage.robot
Resource            ../../../variables/${ENV}/DetailSendgiftPage.robot
Resource            ../../../variables/account.robot

Resource            ../../KeyWord/ShopPageKeyWord.robot
Resource            ../../KeyWord/PackageDetailPageKeyWord.robot
Resource            ../../KeyWord/AddCreditPageKeyWord.robot
Resource            ../../KeyWord/PaymentMethodPageKeyWord.robot
Resource            ../../KeyWord/DetailInfoPopUpKeyWord.robot
Resource            ../../KeyWord/SendGiftPageDetailKeyWord.robot
Resource            ../../CommonKeyWord.robot


Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Go to Shop Page
Test Teardown       Quit Application

*** Keywords ***

Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Revamp Payment Method
    Reopen App      ${EMPTY}
    Check Reminder
    Check default lang and swtich 
    Check Banner on the login page
    Check Logined User    ${TW_LinkAccount_Phonenumber}    ${TW_Phonenumber}   ${TW_Account}     ${TW_Password}     ${TW_Email}
    Check Tutup popup
    Check Reminder
    Check Tutup popup
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s

Verify All App Payment Method

    ${GoPay}       Run Keyword And Return Status       Wait until page Contains          ${WCMS["emoneygopay"]}      timeout=30
    Run Keyword If       ${GoPay}==True       Verify App Payment Method           ${WCMS["emoneygopay"]}         ${Tnc_GOPAY}           ${WCMS["TITLE-payment-method-gopay"]}
    Wait Until Page Contains Element        ${Load_Content_Title}

    ${ShopeePay}       Run Keyword And Return Status       Wait until page Contains          ShopeePay      timeout=30
    Run Keyword If       ${ShopeePay}==True       Verify App Payment Method                ShopeePay      ${Tnc_SHOPEEPAY}         Shopeepay
    Wait Until Page Contains Element        ${Load_Content_Title}

    ${Dana}       Run Keyword And Return Status       Wait until page Contains          ${WCMS["emoneydana"]}      timeout=30
    Run Keyword If       ${Dana}==True       Verify App Payment Method - for unconnected e-wallets               ${WCMS["emoneydana"]}         ${Tnc_DANA}       ${WCMS["TITLE-payment-method-dana"]} 
    Wait Until Page Contains Element        ${Load_Content_Title}

    ${LinkAja}       Run Keyword And Return Status       Wait until page Contains          LinkAja      timeout=30
    Run Keyword If       ${LinkAja}==True       Verify App Payment Method         LinkAja        ${Tnc_LinkAja}        Linkaja

    ${OVO}       Run Keyword And Return Status       Wait until page Contains          ${WCMS["emoneyovo"]}       timeout=30
    Run Keyword If       ${OVO}==True       Verify App Payment Method - for OVO             ${WCMS["emoneyovo"]}         ${Tnc_OVO}

*** Test Cases *** 

Verify Buy Credit via E-Wallet (Go Pay, Shopee Pay, Dana, LinkAja, Ovo)
    [Documentation]     
        ...     |*TC IDs*|Android    TC456    TC458    TC460    TC462    TC464|
    [Tags]  AddCredit
    Wait until page contains Element        ${TopUp_ShopPage_Btn}        timeout=30 
    Click Element                           ${TopUp_ShopPage_Btn} 
    Verify Add Credit Page
    Click Element                           ${AddCredit_item}  
    Verify Payment Method Page
    Verify All App Payment Method
          
Verify Buy Credit via Method AkuLaku when select a denomination below minimum payment
    [Documentation]     
        ...     |*TC IDs*|Android    D7M-4445|
    [Tags]  AddCredit
    Wait until page contains Element                ${TopUp_ShopPage_Btn}        timeout=30 
    Click Element                                   ${TopUp_ShopPage_Btn} 
    Wait until page contains Element                ${AddCredit_item}            timeout=30 
    Click Element                                   ${AddCredit_item}
    Verify Payment Method Page                                                               
    Swipe	    200	    1500	    200 	500	  1000
    Swipe	    200	    1500	    200 	500	  1000
    ${Akulaku}           Run Keyword And Return Status       Wait until page Contains         ${WCMS["payment_method_akulaku_text"]}       timeout=30
    Run Keyword If       ${Akulaku}==True                Verify Payment Method - AkuLaku when select a denomination below minimum payment
    Sleep  5

Verify Buy Credit via Kredivo and Akulaku
    [Documentation]     
        ...     |*TC IDs*|Android    D7M-4445|
    [Tags]  AddCredit
    Wait until page contains Element        ${TopUp_ShopPage_Btn}        timeout=30 
    Click Element                           ${TopUp_ShopPage_Btn} 
    Verify Add Credit Page
    Swipe	    200	    1800	    200 	500	  1000
    # RBFindElement.find element in section android        ${Credit_Content}        ${AddCredit_item_100kRp}   
    Wait until page contains Element        ${AddCredit_item_100kRp}            timeout=30 
    Click Element                           ${AddCredit_item_100kRp}
    
    Wait until page contains Element                ${PaymentMethod_title_contentproduct}         timeout=30 
    Swipe	    200	    1800	    200 	600	  1000
    Swipe	    200	    1000	    200 	500	  1000
    Sleep  5
    ${Kredivo}           Run Keyword And Return Status       Wait until page Contains         ${WCMS["payment_method_kredivo_text"]}      timeout=30
    Run Keyword If       ${Kredivo}==True                Verify Payment Method - Kredivo    

    ${Akulaku}           Run Keyword And Return Status       Wait until page Contains         ${WCMS["payment_method_akulaku_text"]}       timeout=30
    Run Keyword If       ${Akulaku}==True                Verify Payment Method - AkuLaku when select a denomination above minimum payment        
    Go Back
    Sleep  5


