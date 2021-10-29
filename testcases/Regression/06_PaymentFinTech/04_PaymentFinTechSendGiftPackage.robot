*** Settings ***
Documentation     TDW7TL-144
Library             ../../../libraries/SMS.py
Library             ../../../libraries/RBFindElement.py
Library             ../../../libraries/RPString.py

Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/Common.robot
Resource            ../../../variables/${ENV}/DetailSendgiftPage.robot
Resource            ../../../variables/${ENV}/PaymentMethobPage.robot
Resource            ../../../variables/${ENV}/SendGiftCreditPage.robot
Resource            ../../../variables/${ENV}/SendGiftPage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/PackageDetail.robot
Resource            ../../../variables/${ENV}/ConfirmOTP.robot
Resource            ../../../variables/account.robot

Resource            ../../KeyWord/ShopPageKeyWord.robot
Resource            ../../KeyWord/PackageDetailPageKeyWord.robot
Resource            ../../KeyWord/AddCreditPageKeyWord.robot
Resource            ../../KeyWord/PaymentMethodPageKeyWord.robot
Resource            ../../KeyWord/DetailInfoPopUpKeyWord.robot
Resource            ../../KeyWord/SendGiftPageDetailKeyWord.robot
Resource            ../../KeyWord/SendGiftPageKeyWord.robot
Resource            ../../KeyWord/SendGiftCreditPageKeyWord.robot


Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Go to Send Gift Page
Test Teardown       Quit Application


*** Variables ***

#Send Gift Page
${Valid_Phone_Number}              081211063948     
${Favorit_Number}                  6281394074354 
${Favorit_Number_08}               081394074354 
${Transaction_Number}              6281394074354 
${Transaction_Number_08}           081394074354 
${Change_Phone_Number}             082122697613   

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
    Check Logined Default User
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

Verify Send Gift Package via Credit
    [Documentation]     
        ...     |*TDW7TL-144_01|
    [Tags]  SendPackage1
    Check Send Gift page
    # Input correct Telkomsel Number           ${Valid_Phone_Number}
    Click Element                            ${Input_Number_Text_Field}
    Input Text                               ${Input_Number_Text_Field}      ${Valid_Phone_Number} 
    Wait until page contains                 ${Valid_Phone_Number} 
    Click Got It Btn in SendGift Page
    Check Button Clickable                   ${Continue_Btn}        true
    Click Element                            ${Continue_Btn}   
    Verify GUI Detail SendGift Page          ${Valid_Phone_Number} 
    Swipe	    200	    1500	    200 	500	  1000
    Wait until page contains Element         ${Sub_menu}     timeout=30
    Click Element                            ${Sub_menu}
    Wait until page contains Element         ${Package_item_send_gift}    timeout=30
    Click Element                            ${Package_item_send_gift}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Page Should Contain Text                 ${WCMS["package_detail_header"]}
    Page Should Contain Element              ${Package_name}
    Page Should Contain Element              ${Package_quota}
    Page Should Contain Element              ${Package_purchase_type}
    Page Should Contain Text                 ${WCMS["send_gift_destination_number_text"]}
    Run Keyword And Ignore Error             Page Should Contain Text                 ${TW_LinkAccount_Phonenumber}
    Page Should Contain Element              ${Package_infor}
    Page Should Contain Text                 ${WCMS["label.global.body.offer_active_period"]}
    Swipe	    200	    1200	    200 	600	  1000
    Sleep   3
    Page Should Contain Text                 ${WCMS["label.package_details_app.body.package_desc"]}
    ${term&condition}         RPString.escape_HTML          ${WCMS["paymentmethod_emoney_tnc_titles"]}
    Run Keyword And Ignore Error             Page Should Contain Text                  ${term&condition}
    Page Should Contain Element              ${PaymentMethod_labelTotalPrice}

    Wait until page contains Element         ${Payment_Page_Continue_Pay}           timeout=30
    Click Element                            ${Payment_Page_Continue_Pay}
    Wait until page contains Element         ${Telkomsel_Credit}                timeout=60
    Click Element                            ${Telkomsel_Credit}
    Wait until page contains Element         ${Btn_Buy_Package}              timeout=60
    Click Element                            ${Btn_Buy_Package}
    ${Not_enough}           Run Keyword And Return Status           Wait until page Contains          ${WCMS["paymentmethod_confirmation_insufficient_header"]}      timeout=30
    Run Keyword If          ${Not_enough}==True                     Click Button        ${WCMS["paymentmethod_confirmation_insufficient_primary_button"]}           
    Run Keyword If          ${Not_enough}==False                    Wait until page contains                 ${WCMS["upgrade_cls_otp_text"]}       timeout=30
    
    #     #Verify Payment Package success 
    # ${system_error}      Run Keyword And Return Status       Wait until page contains       ${WCMS["paymentmethod_confirmation_popup_error_secondary_button"]}     timeout=30                           
    # Run Keyword If      ${system_error}==True            Click Button               ${WCMS["paymentmethod_confirmation_popup_error_secondary_button"]}   
    # ${header_title1}                                 Convert To Lower Case            ${WCMS["payment_progress_header"]}
    # ${header_title2}                                 Convert To Title Case            ${header_title1}
    # Run Keyword If      ${system_error}==False       Wait until page contains                        ${header_title2}            timeout=30
    # Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${WCMS["payment_progress_package_description"]}
    # Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${TW_LinkAccount_Phonenumber}
    # Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${WCMS["label.global.header.credit_tab_title_app"]}
    # Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${WCMS["label.browse_package_success_buy_app.body.trans_number"]} 
    # Swipe	    200	    1500	    200 	500	  1000
    # Run Keyword If      ${system_error}==False       Page Should Contain Text                        ${WCMS["payment_progress_button"]}
    # Run Keyword If      ${system_error}==False       Element Attribute Should Match                  ${btn_back_to_home}           Enabled        True
    # Run Keyword If      ${system_error}==False       Click Element                                   ${btn_back_to_home} 
    # Run Keyword If      ${system_error}==False       Wait until page contains Element                ${TabBar_Home}  


Verify Send Gift Package via E-Money (Go Pay, Shopee Pay, Dana, LinkAja, Ovo, Kredivo)
    [Documentation]     
        ...     |*TC IDs*|Android    TC499    TC500    TC501   TC502|
    [Tags]  SendPackage2
    Check Send Gift page
    # Input correct Telkomsel Number           ${Valid_Phone_Number}
    Click Element                            ${Input_Number_Text_Field}
    Input Text                               ${Input_Number_Text_Field}      ${Valid_Phone_Number} 
    Wait until page contains                 ${Valid_Phone_Number} 
    Check Button Clickable                   ${Continue_Btn}        true
    Click Element                            ${Continue_Btn} 
    Verify GUI Detail SendGift Page          ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page          ${Valid_Phone_Number} 
    Swipe	    200	    1500	    200 	500	  1000
    Wait until page contains Element         ${Sub_menu}     timeout=30
    Click Element                            ${Sub_menu}
    Wait until page contains Element         ${Package_item_send_gift}    timeout=30
    Click Element                            ${Package_item_send_gift}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Page Should Contain Text                 ${WCMS["package_detail_header"]}
    Page Should Contain Element              ${Package_name}
    Page Should Contain Element              ${Package_quota}
    Page Should Contain Element              ${Package_purchase_type}
    Page Should Contain Text                 ${WCMS["send_gift_destination_number_text"]}
    Run Keyword And Ignore Error             Page Should Contain Text                 ${TW_LinkAccount_Phonenumber}
    Page Should Contain Element              ${Package_infor}
    Page Should Contain Text                 ${WCMS["label.global.body.offer_active_period"]}
    Swipe	    200	    1200	    200 	600	  1000
    Sleep   3
    Page Should Contain Text                 ${WCMS["label.package_details_app.body.package_desc"]}
    ${term&condition}         RPString.escape_HTML          ${WCMS["paymentmethod_emoney_tnc_titles"]}
    Run Keyword And Ignore Error             Page Should Contain Text                  ${term&condition}
    Page Should Contain Element              ${PaymentMethod_labelTotalPrice}

    Wait until page contains Element         ${Payment_Page_Continue_Pay}           timeout=30
    Click Element                            ${Payment_Page_Continue_Pay}
    Verify Payment Method Page
    Page Should Contain Text                 ${Valid_Phone_Number}
    Verify All App Payment Method
