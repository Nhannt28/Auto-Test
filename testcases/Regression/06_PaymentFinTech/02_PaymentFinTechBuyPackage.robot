*** Settings ***
Documentation     TDW7TL-142
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
    Check Tutup popup
    Check default lang and swtich 
    Check Banner on the login page
    Check Logined User    ${TW_LinkAccount_Phonenumber}    ${TW_Phonenumber}   ${TW_Account}     ${TW_Password}     ${TW_Email}
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

Purchase Family Plan Package
    [Arguments]     ${phoneNumber}
    Wait Until Page Contains Element        ${Load_Content_Title}
    Click Element                           ${Btn_Buy_Package}
    Verify See Details Menu
    Scroll                              ${Bottom_Sheet}     ${Detail_Payment_Title}
    Wait Until Page Contains Element    ${Bottom_Sheet_Detail_Price}
    Wait Until Page Contains Element    ${Bottom_Sheet_Detail_Title}
    Scroll      ${Bottom_Sheet}     ${Payment_Page_Continue_Pay}
    Page Should Contain Text                 ${WCMS["quota_setup_text"]}
    ${quota_des}         RPString.escape_HTML          ${WCMS["quota_setup_description"]}
    Run Keyword And Return Status        Page Should Contain Text            ${quota_des}                 
    Wait Until Page Contains Element    ${Check_Box}    timeout=30s
    Click Element                       ${Check_Box}
    Wait Until Page Contains Element    ${PhoneNumber_Icon}     timeout=30s
    Input Text          ${PhoneNumber_Slot}     ${phoneNumber}
    Hide Keyboard
    Click Element                       ${Button_CheckNumber_FamilyPlan}
    Wait Until Page Contains Element    ${Confirm_Button}      timeout=30s
    Click Element                       ${Confirm_Button}
    Wait Until Page Contains Element    ${Seekbar_Quota}  timeout=30s
    Wait Until Page Contains Element    ${Confirm_Button}
    Click Element                       ${Confirm_Button}
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}     timeout=30s
    Click Element                       ${Payment_Page_Continue_Pay}
    Wait Until Page Contains Element    ${Load_Content_Title}
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}     timeout=30s
    # Click Element                       ${Payment_Page_Continue_Pay}

*** Test Cases *** 

Verify Buy Package via E-Money (Go Pay, Shopee Pay, Dana, LinkAja, Ovo, Kredivo)
    [Documentation]     
        ...     |*TC IDs*|Android    TC457    TC459    TC461    TC463    TC465|
    [Tags]  BuyPackage
    Verify GUI Shop Page 
    Scroll Down If Need
    Wait until page contains                       ${WCMS["shop_package_category_title"]}              timeout=60
    ${Special_for_you}       Run Keyword And Return Status          Wait until page Contains        ${WCMS["shop_offer_title"]}   
    Run Keyword If       ${Special_for_you}==True       Swipe	    200	    1800	    200 	600	  1000
    Swipe	    200	    1800	    200 	300	  1000
    Sleep    2
    # RBFindElement.find text in list view android    ${ScrollView_ShopPage}       ${Internet_Roaming_package_OfferTitle}     down
    # Wait until page contains                ${Internet_Roaming_package_OfferTitle}
    # Click Text                              ${Internet_Roaming_package_OfferTitle}
    Wait until page contains Element         ${Package_item}         timeout=30
    Click Element                            ${Package_item}
        #Verify Package detail
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Page Should Contain Text                 ${WCMS["package_detail_header"]}
    Page Should Contain Element              ${Package_name}
    Page Should Contain Element              ${Package_quota}
    Page Should Contain Element              ${Package_purchase_type}
    Run Keyword And Ignore Error             Page Should Contain Text                 ${TW_LinkAccount_Phonenumber}
    Page Should Contain Element              ${Package_infor}
    Page Should Contain Text                 ${WCMS["label.global.body.offer_active_period"]}
    Swipe	    200	    1200	    200 	600	  1000
    Sleep   3
    Page Should Contain Text                 ${WCMS["label.package_details_app.body.package_desc"]}
    ${term&condition}         RPString.escape_HTML          ${WCMS["paymentmethod_emoney_tnc_titles"]}
    Run Keyword And Ignore Error             Page Should Contain Text                  ${term&condition}
    Page Should Contain Element              ${PaymentMethod_labelTotalPrice}

    Wait until page contains Element         ${Payment_Page_Continue_Pay}
    Click Element                            ${Payment_Page_Continue_Pay}
    Verify Payment Method Page 
    Verify All App Payment Method

Verify Buy Package via Pay Later Kredivo
    [Documentation]     
        ...     |*TC IDs*|Android    D7M-4445|
    [Tags]  BuyPackage
    Verify GUI Shop Page 
    Scroll Down If Need
    Wait until page contains                       ${WCMS["shop_package_category_title"]}              timeout=60
    ${Special_for_you}       Run Keyword And Return Status          Wait until page Contains        ${WCMS["shop_offer_title"]}   
    Run Keyword If       ${Special_for_you}==True       Swipe	    200	    1800	    200 	600	  1000
    # Swipe	    200	    1800	    200 	300	  1000
    # Sleep    2
    Wait until page contains Element         ${Package_item}         timeout=30
    Click Element                            ${Package_item}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Page Should Contain Text                 ${WCMS["package_detail_header"]}
    Page Should Contain Element              ${Package_name}
    Page Should Contain Element              ${Package_quota}
    Page Should Contain Element              ${Package_purchase_type}
    Run Keyword And Ignore Error             Page Should Contain Text                 ${TW_LinkAccount_Phonenumber}
    Page Should Contain Element              ${Package_infor}
    Page Should Contain Text                 ${WCMS["label.global.body.offer_active_period"]}
    Swipe	    200	    1200	    200 	600	  1000
    Sleep   3
    Page Should Contain Text                 ${WCMS["label.package_details_app.body.package_desc"]}
    ${term&condition}         RPString.escape_HTML          ${WCMS["paymentmethod_emoney_tnc_titles"]}
    Run Keyword And Ignore Error             Page Should Contain Text                  ${term&condition}
    Page Should Contain Element              ${PaymentMethod_labelTotalPrice}

    Wait until page contains Element         ${Payment_Page_Continue_Pay}
    Click Element                            ${Payment_Page_Continue_Pay}
    Verify Payment Method Page
    Swipe	    200	    1800	    200 	600	  1000
    Swipe	    200	    1500	    200 	600	  1000
    ${Kredivo}           Run Keyword And Return Status       Wait until page Contains         ${WCMS["payment_method_kredivo_text"]}      timeout=30
    Run Keyword If       ${Kredivo}==True                Verify Payment Method - Kredivo   

Success Purchase Family Plan Package
    [Tags]  Family
    Verify GUI Shop Page
    # Go To Family Page
    Wait Until Page Contains                ${submenu_family}           timeout=30s
    Click Text                              ${submenu_family}  
    Wait Until Page Contains Element        ${family_package}           timeout=30s
    ${offerTitle_package}                   Get Text                ${family_package}
    ${offer_Amount_package}                 Get Text                ${Amount_package}
    ${offerPrice_package}                   Get Text                ${Price_package}
    ${offerExpireDate_package}              Get Text                ${ExpireDate_package} 
    ${type_package_1}                       Get Text                ${type_package}   
    Click Element                           ${family_package}

    #Verify Package detail
    Wait Until Page Contains Element         ${PackageDetail_headerTitle}        timeout=30
    Page Should Contain Text                 ${WCMS["package_detail_header"]}
    Page Should Contain Element              ${Package_name}
    Element Should Contain Text                  ${Package_name}        ${offerTitle_package}             
    Page Should Contain Element              ${Package_quota}
    # Element Should Contain Text              ${Package_quota}                 Convert To Upper Case                ${offer_Amount_package}
    Element Should Contain Text              ${Package_purchase_type}         ${type_package_1}            
    Page Should Contain Element              ${Package_infor}
    Page Should Contain Text                 ${WCMS["label.global.body.offer_active_period"]}
    Page Should Contain Text                 ${WCMS["label.package_details_app.body.package_desc"]}
    ${term&condition}         RPString.escape_HTML          ${WCMS["paymentmethod_emoney_tnc_titles"]}
    Run Keyword And Ignore Error             Page Should Contain Text                  ${term&condition}
    Page Should Contain Element              ${PaymentMethod_labelTotalPrice}
    Page Should Contain Text                 ${offerPrice_package}
    Click Element                           ${Btn_Buy_Package}
    Verify See Details Menu

    Purchase Family Plan Package            08111111111

