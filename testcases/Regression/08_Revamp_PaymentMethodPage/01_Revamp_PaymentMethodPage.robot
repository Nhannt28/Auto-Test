*** Settings ***
Library             ../../../libraries/RBFindElement.py
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/Common.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/PackageDetail.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/PaymentMethobPage.robot
Resource            ../../../variables/account.robot

Resource            ../../KeyWord/ShopPageKeyWord.robot
Resource            ../../KeyWord/PackageDetailPageKeyWord.robot
Resource            ../../KeyWord/AddCreditPageKeyWord.robot
Resource            ../../KeyWord/PaymentMethodPageKeyWord.robot
Resource            ../../KeyWord/DetailInfoPopUpKeyWord.robot


Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Check test Setup
Test Teardown       Tear Down Test Cases

*** Variables ***

${InternetPackage_offerTitle}                Diaspora UAE Post 30D 300rb 10
${InternetPackage_10GB_offerAmount}            10 GB 
${InternetPackage_30Days_offerExpireDate}        30 Days
${Package_Detail_30DAYS_offerExpireDate}        30 DAYS
${InternetPackage_RPmoney_offerPrice}            Rp 300,000
${Package_Detail_ROAMax_Diaspora_UAE}            ROAMax Diaspora UAE

${HomePage_TopUp_Btn}        ${APP_PACKAGE}:id/topup_account_balance

*** Keywords ***

Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Revamp Payment Method
    Reopen App      ${EMPTY}
    Check Logined Default User
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s

    
Check test Setup
    Launch Application   
    Check Reminder 

Select package in Shop page
    Wait until page contains Element                ${Roaming_Btn}     timeout=30
    Click Element                              ${Roaming_Btn} 
    Wait until page Contains                    ${InternetPackage_offerTitle}
    Wait until page contains                    ${InternetPackage_10GB_offerAmount}  
    Wait until page contains                    ${InternetPackage_30Days_offerExpireDate}
    Wait until page contains                    ${InternetPackage_RPmoney_offerPrice}  
    Wait until page contains                    ${WCMS["subscribe_one_time_package_text"]}


*** Test Cases *** 
Verify GUI Shop Page
    [Documentation]    Verify GUI Shop Page   
        ...     |*TC IDs*|Android TC121|
        ...     |*TC IDs*|iOS TC1261|       
        ...     |*TC Type*| Positive Case|  
    [Tags]    SendGift1
    Go to Shop Page
    Verify GUI Shop Page 
    Select package in Shop page
Directly to Package Detail Page
    [Documentation]    Go to Package Detail Page  
        ...     |*TC IDs*|Android TC122    TC128|
        ...     |*TC IDs*|iOS TC1262    TC1268|       
        ...     |*TC Type*| Positive Case|
    [Tags]    SendGift
    Go to Shop Page
    Verify GUI Shop Page 
    Select package in Shop page
    Go to Package Detail Page
Check Pop Up Detail Info After Selected Package on Shop Page
    [Documentation]    Check Pop Up Detail Info After Selected Package on Shop Page   
        ...     |*TC IDs*|Android TC123    TC124    TC129    TC130    TC131|
        ...     |*TC IDs*|iOS TC1263    TC1264    TC1269    TC1270    TC1271|       
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift
    Go to Shop Page
    Verify GUI Shop Page 
    Select package in Shop page
    Go to Package Detail Page
    Click Element                           ${PaymentMethod_btn_continuePayment} 
    Verify Payment Method Page
    Click Element                           ${PaymentMethod_view_detail}
    Wait until page contains Element        ${product_name_01}
    Wait until page contains Element        ${product_name_02}
    Wait until page Contains                ${InternetPackage_offerTitle}
    Wait until page contains                ${Active_Period} 
    Wait until page contains                ${InternetPackage_30Days_offerExpireDate} 
    Wait until page contains                ${InternetPackage_10GB_offerAmount} 
    Wait until page contains                ${Package_Detail_ROAMax_Diaspora_UAE}
    Wait until page contains                ${OK_Btn} 
#Close Pop Up
    Click Element                                   ${OK_Btn}
    Wait until page contains Element                ${PaymentMethod_headerTitle}
    Wait until page contains Element                ${PaymentMethod_view_detail} 
    Wait Until Page Does Not Contain Element        ${product_name_01}
    Wait Until Page Does Not Contain Element        ${product_name_02}
    Wait Until Page Does Not Contain Element        ${OK_Btn} 


Check Pop Up Detail Info After Selected Denom Credit 
    [Documentation]    Check Pop Up Detail Info After Selected Denom Credit   
        ...     |*TC IDs*|Android TC126|
        ...     |*TC IDs*|iOS TC1266|       
        ...     |*TC Type*| Positive Case|
    [Tags]    SendGift
#Select Denom Credit  
    # Wait until page contains Element         ${AddCredit_Btn}        timeout=60 
    # Click Element                            ${AddCredit_Btn}   
    Check Logined Default User
    Wait until page contains Element         ${HomePage_TopUp_Btn}        timeout=60 
    Click Element                            ${HomePage_TopUp_Btn}   
    Verify Add Credit Page
    Click Element                            ${AddCredit_30Rupi}  
    Verify Payment Method Page
    Check Pop Up Detail Info After Selected Denom Credit 
    Close Pop Up Detail Info After Selected Denom Credit 


Check Pop Up Detail Info After Selected Top up Credit
    [Documentation]    Check Pop Up Detail Info After Selected Top up Credit   
        ...     |*TC IDs*|Android TC144    TC145    TC146|
        ...     |*TC IDs*|iOS TC1284    TC1285    TC1286|       
        ...     |*TC Type*| Positive Case|   
    [Tags]    SendGift
    Go to Shop Page
    Verify GUI Shop Page 
    Select package in Shop page 
    Click Element                              ${Top_up_Btn} 
    Verify Add Credit Page
    Click Element                            ${AddCredit_30Rupi}
    Verify Payment Method Page 
    Check Pop Up Detail Info After Selected Denom Credit 
    Close Pop Up Detail Info After Selected Denom Credit 

Check Pop Up Detail Info After Selected Roaming Package
    [Documentation]    Check Pop Up Detail Info After Selected Roaming Package  
        ...     |*TC IDs*|Android TC142    TC143|
        ...     |*TC IDs*|iOS TC1282    TC1283|       
        ...     |*TC Type*| Positive Case|
    [Tags]    SendGift
    Go to Shop Page
    Verify GUI Shop Page
    Click Text                    ${WCMS["send_gift_category_roaming_text"]}
    Swipe	1000	    1000	    1000 	0	1500
    Wait until page contains      ${Package_Timor_Leste_text}        timeout=30
    Click Text                    ${Package_Timor_Leste_text}
#Destination page
    Wait until page contains Element        ${Destination_headerTitle}        timeout=30
    Wait until page contains                ${Internet_RoaMAX_Timor_Leste_offerTitle}
    Wait until page contains                ${10GB_offerAmount} 
    Wait until page contains                ${7days_offerExpireDate} 
    Wait until page contains                ${Rp150k_offerPrice}
    Wait until page contains                ${WCMS["subscribe_one_time_package_text"]}

    Click Text                              ${Internet_RoaMAX_Timor_Leste_offerTitle}
#Package Detail
    Wait until page contains                ${WCMS["bundling_detail_package_title"]}        timeout=30
    Wait until page contains                ${Internet_RoaMAX_Timor_Leste_offerTitle}
    Wait until page contains                ${WCMS["subscribe_one_time_package_text"]}
    Swipe	700	    700	    700 	0	1200
    Wait until page contains                ${10GB_offerAmount}
    Wait until page contains                ${7DAYs_packageItemQuota} 
    Wait until page contains                ${10GB_offerAmount}
    Wait until page contains                ${Active_Period}
    Wait until page contains                ${Package_Description}
    Wait until page contains                ${Internet_RoaMAX_Timor_Leste_offerTitle}
    Wait until page contains Element        ${PaymentMethod_labelTotalPrice}
    Wait until page contains                ${Rp150k_offerPrice} 
    Wait until page contains Element        ${PaymentMethod_btn_continuePayment}
    Click Element                            ${PaymentMethod_btn_continuePayment}
#Payment Method Page 
    Verify Payment Method Page 
    Wait until page contains Element        ${PaymentMethod_primarypaymentDesc}        timeout=30
    Wait until page contains Element        ${PaymentMethod_primarypaymentPrice}
    Wait until page contains Element        ${PaymentMethod_primarypayment}
    Element Attribute Should Match          ${PaymentMethod_primarypayment}    checkable    true





Check bottom dialog will up and see pricing details After User Selected Package on Shop Page
    [Documentation]    Check bottom dialog will up and see pricing details After User Selected Package on Shop Page 
        ...     |*TC IDs*|Android TC125|
        ...     |*TC IDs*|iOS TC1265|       
        ...     |*TC Type*| Positive Case|   
    [Tags]    SendGift
    Go to Shop Page
    Verify GUI Shop Page 
    Select package in Shop page
    Go to Package Detail Page
    Click Element                               ${PaymentMethod_btn_continuePayment} 
    Wait until page contains Element            ${PaymentMethod_btn_bottom_sheet}        timeout=30
    RBFindElement.drag element with director    ${PaymentMethod_btn_bottom_sheet}    up    700
    Wait until page contains Element            ${purchase_detail_title} 
    Wait until page contains Element            ${purchase_detail_price}

Check bottom dialog will up and see pricing details after User Selected Denom Credit
    [Documentation]    Check bottom dialog will up and see pricing details after User Selected Denom Credit
        ...     |*TC IDs*|Android TC127|
        ...     |*TC IDs*|iOS TC1267|       
        ...     |*TC Type*| Positive Case|   
    [Tags]    SendGift
    Check Logined Default User
    Wait until page contains Element         ${HomePage_TopUp_Btn}        timeout=60 
    Click Element                            ${HomePage_TopUp_Btn}   
    Verify Add Credit Page
    Click Element                            ${AddCredit_30Rupi}  
    Verify Payment Method Page
    Wait until page contains Element            ${PaymentMethod_btn_bottom_sheet1}
    RBFindElement.drag element with director    ${PaymentMethod_btn_bottom_sheet1}    up    700
    Wait until page contains Element            ${purchase_detail_title} 
    Wait until page contains Element            ${purchase_detail_price}










    