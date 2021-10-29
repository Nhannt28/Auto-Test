*** Settings ***
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


Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Check test Setup
Test Teardown       Tear Down Test Cases




*** Keywords ***

Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Revamp Payment Method
    Reopen App      ${EMPTY}
    Check Reminder
    Check Tutup popup
    Check Logined Default User
    Check Reminder
    Check Tutup popup
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s

Check test Setup
    Launch Application   
    Check Reminder 


*** Test Cases *** 
Redirect to term and condition page gopay after selected Denom credit
    [Documentation]    Redirect to term and condition page gopay after selected Denom credit
        ...     |*TC IDs*|iOS TC1597 - Android TC456|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech2
    # Wait until page contains Element         ${AddCredit_Btn}        timeout=60 
    # Click Element                            ${AddCredit_Btn} 
    Check Logined Default User
    Wait until page contains Element        ${TopUp_ShopPage_Btn}        timeout=30 
    Click Element                            ${TopUp_ShopPage_Btn} 
    Verify Add Credit Page
    Click Element                            ${AddCredit_30Rupi}  
    Verify Payment Method Page
    Verify App Payment Method                Gopay    ${Tnc_GOPAY}


Redirect to term and condition page gopay after selected Category package in shop page
    [Documentation]   Redirect to term and condition page gopay after selected Category package in shop page
        ...     |*TC IDs*|iOS TC1598 - Android TC457|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech5
    Go to Shop Page
    Verify GUI Shop Page 
    Wait until page contains Element                ${Roaming_Btn}     timeout=30
    Click Element                              ${Roaming_Btn} 
    RBFindElement.find text in list view android    ${ScrollView_ShopPage}     ${Internet_Roaming_package_OfferTitle}     down
    Wait until page contains                ${Internet_Roaming_package_OfferTitle}
    Click Text                              ${Internet_Roaming_package_OfferTitle}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Wait until page contains Element         ${Payment_Page_Continue_Pay}
    Click Element                            ${Payment_Page_Continue_Pay}
    Verify Payment Method Page 
    Verify App Payment Method                Gopay    ${Tnc_GOPAY}


Redirect to term and condition page Dana after selected Denom credit
    [Documentation]    Redirect to term and condition page Dana after selected Denom credit
        ...     |*TC IDs*|iOS TC1599 - Android TC458|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech2
    Check Logined Default User
    Wait until page contains Element        ${TopUp_ShopPage_Btn}        timeout=60 
    Click Element                            ${TopUp_ShopPage_Btn}  
    Verify Add Credit Page
    Click Element                            ${AddCredit_30Rupi}  
    Verify Payment Method Page
    Verify App Payment Method - for unconnected e-wallets                DANA    ${Tnc_DANA}

Redirect to term and condition page Dana after selected internet package in shop page
    [Documentation]    Redirect to term and condition page Dana after selected internet package in shop page
        ...     |*TC IDs*|iOS TC600 - Android TC459|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech
    Go to Shop Page
    Verify GUI Shop Page 
    Wait until page contains Element                ${Roaming_Btn}     timeout=30
    Click Element                              ${Roaming_Btn} 
    RBFindElement.find text in list view android    ${ScrollView_ShopPage}     ${Internet_Roaming_package_OfferTitle}     down
    Wait until page contains                ${Internet_Roaming_package_OfferTitle}
    Click Text                              ${Internet_Roaming_package_OfferTitle}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Wait until page contains Element         ${Btn_Buy_Package}
    Click Element                            ${Btn_Buy_Package}
    Verify Payment Method Page 
    Verify App Payment Method - for unconnected e-wallets                DANA    ${Tnc_DANA}
    
Redirect to term and condition page OVO after selected Denom credit
    [Documentation]    Redirect to term and condition page OVO after selected Denom credit
        ...     |*TC IDs*|iOS TC1601 - Android TC460|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech2
    Check Logined Default User
    Wait until page contains Element        ${TopUp_ShopPage_Btn}        timeout=30 
    Click Element                            ${TopUp_ShopPage_Btn}  
    Verify Add Credit Page
    Click Element                            ${AddCredit_30Rupi}  
    Verify Payment Method Page
    Verify App Payment Method                OVO    ${Tnc_OVO}

Redirect to term and condition page OVO after selected Category package in shop page
    [Documentation]    Redirect to term and condition page OVO after selected Category package in shop page
        ...     |*TC IDs*|iOS TC1602 - Android TC461|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech
    Go to Shop Page
    Verify GUI Shop Page 
    Wait until page contains Element                ${Roaming_Btn}     timeout=30
    Click Element                              ${Roaming_Btn} 
    RBFindElement.find text in list view android    ${ScrollView_ShopPage}     ${Internet_Roaming_package_OfferTitle}     down
    Wait until page contains                ${Internet_Roaming_package_OfferTitle}
    Click Text                              ${Internet_Roaming_package_OfferTitle}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Wait until page contains Element         ${Btn_Buy_Package}
    Click Element                            ${Btn_Buy_Package}
    Verify Payment Method Page 
    Verify App Payment Method                OVO    ${Tnc_OVO}

Directed to ShopeePay Term and Condition Page after selected Denom credit
    [Documentation]    Directed to ShopeePay Term and Condition Page after selected Denom credit
        ...     |*TC IDs*|Android TC462|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech2
    Check Logined Default User
    Wait until page contains Element        ${TopUp_ShopPage_Btn}        timeout=60 
    Click Element                            ${TopUp_ShopPage_Btn}  
    Verify Add Credit Page
    Click Element                            ${AddCredit_30Rupi}  
    Verify Payment Method Page
    Verify App Payment Method                ShopeePay    ${Tnc_SHOPEEPAY}

Directed to ShopeePay Term and Condition Page after internet package in shop page
    [Documentation]    Directed to ShopeePay Term and Condition Page internet package in shop page
        ...     |*TC IDs*|Android TC463|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech
    Go to Shop Page
    Verify GUI Shop Page 
    Wait until page contains Element                ${Roaming_Btn}     timeout=30
    Click Element                              ${Roaming_Btn} 
    RBFindElement.find text in list view android    ${ScrollView_ShopPage}     ${Internet_Roaming_package_OfferTitle}     down
    Wait until page contains                ${Internet_Roaming_package_OfferTitle}
    Click Text                              ${Internet_Roaming_package_OfferTitle}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Wait until page contains Element         ${Btn_Buy_Package}
    Click Element                            ${Btn_Buy_Package}
    Verify Payment Method Page 
    Verify App Payment Method                ShopeePay    ${Tnc_SHOPEEPAY}

