*** Settings ***
Documentation       Smoke Test 6.0 Android
Library             ../../libraries/RBFindElement.py
Library             ../../libraries/RPString.py

Resource            ../CommonKeyWord.robot
Resource            ../../variables/${ENV}/Common.robot
Resource            ../../variables/${ENV}/DetailSendgiftPage.robot
Resource            ../../variables/${ENV}/PaymentMethobPage.robot
Resource            ../../variables/${ENV}/SendGiftCreditPage.robot
Resource            ../../variables/${ENV}/SendGiftPage.robot
Resource            ../../variables/${ENV}/ShopPage.robot
Resource            ../../variables/${ENV}/PackageDetail.robot
Resource            ../../variables/${ENV}/ConfirmOTP.robot
Resource            ../../variables/account.robot
Resource            ../../variables/${ENV}/ContactNumber.robot

Resource            ../KeyWord/SendGiftPageKeyWord.robot
Resource            ../KeyWord/SendGiftPageDetailKeyWord.robot
Resource            ../KeyWord/OTPConfirmPopupKeyWord.robot
Resource            ../KeyWord/SendGiftCreditPageKeyWord.robot
Resource            ../KeyWord/AddCreditPageKeyWord.robot
Resource            ../KeyWord/PaymentMethodPageKeyWord.robot

Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Launch Application
Test Teardown       Tear Down Test Cases

*** Variables ***
${Redeem_Poin_Btn}                  ${APP_PACKAGE}:id/layout_btn_child
${Merchant_Point}                   ${APP_PACKAGE}:id/rl_fst_hotoffer_container
${Merchant_Point_3}                 //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.RelativeLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]/androidx.recyclerview.widget.RecyclerView[2]/android.widget.FrameLayout[3]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout
${Home_TopUp}                       Top Up
${Continue_Payment_Method}          ${APP_PACKAGE}:id/btPrimary
${Home_Poin}                        ${APP_PACKAGE}:id/container_poin
${Favorit_Number}                   6281394074354 
${Transaction_Number}               6281394074354 
${Valid_Phone_Number}               081211063948  
${Payment_Continue_BtnPrimary}      ${APP_PACKAGE}:id/btPrimary
${Input_Number_Field}               ${APP_PACKAGE}:id/et_input

${Gifting_Journey_SendCredit_List_Content}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.RelativeLayout
${Gifting_Journey_SendCredit_TermCondition}        Terms & Conditions
${TermCond_Content}         //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView
${SenGiftDetail_ListView_Package}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView

${SIM_Exp_Title_Popup_Msg}     Your number will be expired on
${SIM_Exp_Desc_Popup_Msg}      Your number is in the grace period, please top up your credit or purchase a package
${SIM_Exp_PrimaryBtn_Popup_Msg}               ${APP_PACKAGE}:id/btnPrimary
${SIM_Exp_SecondaryBtn_Popup_Msg}             ${APP_PACKAGE}:id/btnSecondary
${SIM_Exp_Close_Popup_Msg}                    ${APP_PACKAGE}:id/ivClose
${SIM_Exp_Icon_Popup_Msg}                     ${APP_PACKAGE}:id/ivIcon

${Login_Input_Field_v6}             ${APP_PACKAGE}:id/et_input
${Login_Btn_v6}                     ${APP_PACKAGE}:id/bt_login
${Other_Login_Btnv6}                ${APP_PACKAGE}:id/bt_other_login

${Skip_Onboarding}                  ${APP_PACKAGE}:id/tv_skip                    

#Check send gift credit page - Credit Transfer  
${Manually_Nominal_input_number_incorrect}              4999      
${Manually_Nominal_input_number_insufficient}           900000
${Manually_Nominal_input_number_min}                    4000 
${Manually_Nominal_input_number_max}                    10000000
${Manually_Nominal_input_number_correct}                5000

${Fail_message_input_number_incorrect}                  Please input the correct amount to transfer!
${Fail_message_input_number_insufficient}               ${WCMS["send_gift_transfer_error_insufficient_text"]}
${Fail_message_input_number_min}                        Minimum amount is Rp. 5000
${Fail_message_input_number_maximum}                    Maximum amount is Rp. 1,000,000

${I_understand}                                     ${APP_PACKAGE}:id/btSecondTypePrimary
                                                    

*** Keywords ***
Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Social_login    HomePage      Twitter     Android     iOS
    Reopen App      ${EMPTY}
    ${Result}   Run Keyword And Return Status   Wait until page contains element        ${Home_Poin}    timeout=30
    Run Keyword If      ${Result}==False      Login Social Account FaceBook
    Check Launching New version 
    Check Permission First Launch
    Check Tutup popup
    Check Reminder
    # Check Tutup popup
    # Check Logined Default User
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s

Login Social Account FaceBook               
   [Documentation]    Verify Login Page #TC470
   [Tags]    Social_login    FaceBook     iOS     Android
#    [Arguments]    ${phoneNumber}      ${password}     ${email}
    Check Banner on the login page
    # Verify Permission Android
    Wait until page contains element     ${Login_page_Language}       timeout=30
    ${Lang}       Run Keyword And Return Status       Wait until page Contains          ID      timeout=30
    Run Keyword If       ${Lang}==True       Click Element            ${Login_page_Language}
    Run Keyword If       ${Lang}==True       Click Text               (United States)        
    Wait until page contains            ${WCMS["login_page_title"]}   timeout=30
    Clear text                           ${Login_page_Phone_TextField}
    Click Element                        ${Login_page_Phone_TextField}
    Input text                           ${Login_page_Phone_TextField}            ${FB_Phonenumber}
    Swipe	500	    400	    500 	200	 1000
    Hide Keyboard
    Click Element                        ${Login_page_Login_btn}
    Wait until page contains             ${WCMS["login_page_other_methods_title"]}        timeout=30
    Click Text                           ${WCMS["login_page_other_methods_title"]}                                  
    # Verify Other Login Page
    Wait until page contains             ${WCMS["login_page_other_methods_facebook_text"]}        timeout=30
    Click Text                           ${WCMS["login_page_other_methods_facebook_text"]} 
    Wait until page contains             ${FB_Page_Header}   timeout=30
    Wait until page contains element     ${FB_fill_email}
    Click Element                        ${FB_fill_email}
    Input text                           ${FB_fill_email}        ${FB_Email}
    Click Element                        ${FB_fill_pw}
    Input text                           ${FB_fill_pw}            ${FB_Password}
    Click Element                        ${FB_Login_btn}
    
Verify App Payment Method LinkAja
    [Arguments]    ${paymentName}       ${paymentmethod_emoney_tnc}                                                  
    Wait until page contains                         ${paymentName}           timeout=30
    Click Text     ${paymentName}
    Click Element                                   ${PaymentMethod_btn_continuePayment} 
    ${name}        Convert To Upper Case	        ${paymentName} 
    Wait until page contains                         ${paymentName}           timeout=30
    Wait until page contains Element                ${TermsCondition_EMoneyTitle}
    Wait until page contains Element                ${btn_description_Term&Con}
    Wait until page contains Element                ${eMoneyTnc_Logo}
    Wait until page contains                        ${paymentmethod_emoney_tnc}
    Wait until page contains                         Continue           timeout=30
    Click Element                                    ${Load_Content_Close}

Verify All App Payment Method
    # Verify App Payment Method                LinkAja    ${Tnc_LinkAja}
    # Wait Until Page Contains Element        ${Load_Content_Title}
    # Scroll Up If Need
    # Scroll Up If Need

    ${GoPay}       Run Keyword And Return Status       Wait until page Contains          ${WCMS["emoneygopay"]}      timeout=30
    Run Keyword If       ${GoPay}==True       Verify App Payment Method           ${WCMS["emoneygopay"]}         ${Tnc_GOPAY}           ${WCMS["TITLE-payment-method-gopay"]}
    Wait Until Page Contains Element        ${Load_Content_Title}

    ${OVO}       Run Keyword And Return Status       Wait until page Contains          ${WCMS["emoneyovo"]}       timeout=30
    Run Keyword If       ${OVO}==True       Verify App Payment Method                ${WCMS["emoneyovo"]}         ${Tnc_OVO}            ${WCMS["TITLE-payment-method-ovo"]}  
    Wait Until Page Contains Element        ${Load_Content_Title}

    ${ShopeePay}       Run Keyword And Return Status       Wait until page Contains          ShopeePay      timeout=30
    Run Keyword If       ${ShopeePay}==True       Verify App Payment Method                ShopeePay      ${Tnc_SHOPEEPAY}         Shopeepay
    Wait Until Page Contains Element        ${Load_Content_Title}

    ${Dana}       Run Keyword And Return Status       Wait until page Contains          ${WCMS["emoneydana"]}      timeout=30
    Run Keyword If       ${Dana}==True       Verify App Payment Method - for unconnected e-wallets               ${WCMS["emoneydana"]}         ${Tnc_DANA}       ${WCMS["TITLE-payment-method-dana"]} 
    Wait Until Page Contains Element        ${Load_Content_Title}

    ${LinkAja}       Run Keyword And Return Status       Wait until page Contains          LinkAja      timeout=30
    Run Keyword If       ${LinkAja}==True       Verify App Payment Method         LinkAja        ${Tnc_LinkAja}        Linkaja

Switch item          # Item load fail 
    Go Back
    Swipe	    1000	    1500	    200 	1500	  500
    Click Element                           ${Merchant_Point_3}

Verify detail voucher after Redeem point success
    Run Keyword And Ignore Error    Wait until page contains        ${WCMS["payment_progress_header"]}    timeout=30
    Wait until page contains        ${WCMS["redeem_details_page_title"]}
    Wait until page contains        ${WCMS["redeem_details_page_description"]} 
    Wait until page contains        ${WCMS["transaction_number"]}
    Scroll Down If Need
    Scroll Down If Need
    Wait until page contains        ${WCMS["redeem_details_button_back_to_details"]}
    Wait until page contains        ${WCMS["redeem_details_button_back_to_rewards_page"]}

Verify Transfer Credit success
    [Arguments]    ${number_amount}
    Wait until page contains                ${btn_continue}        timeout=20
    Element Attribute Should Match          ${btn_continue}       enabled   true
    Click Element                           ${btn_continue}
    Wait until page contains Element                ${PaymentMethod_title_contentproduct}           timeout=30
    Wait until page contains Element                ${PaymentMethod_headerTitle}
    Wait until page contains Element                ${PaymentMethod_view_detail}
    Wait until page contains                        ${WCMS["payment_method_see_detail"]}
    Click Button                                    ${WCMS["payment_method_see_detail"]}
    Run Keyword And Ignore Error                    Page Should Contain Text                        ${Credit_Transfer_title}            timeout=30
    Run Keyword And Ignore Error                    Page Should Contain Text                        ${Credit_Transfer_Amount}
    Page Should Contain Text                        ${number_amount}
    Page Should Contain Text                        ${WCMS["send_gift_transfer_fee_text"]}
    Click Button                                    ${WCMS["label.global.button.ok"]}
    Page Should Contain Text                        ${Valid_Phone_Number}
    Page Should Contain Text                        ${WCMS["payment_method_reset_cls_veronika_text"]}
    Wait until page contains Element                ${PaymentMethod_labelTotalPrice}
    Wait until page contains Element                ${PaymentMethod_totalPriceSumConfigPayment} 
    Wait until page contains Element                ${PaymentMethod_Back_Home} 
    Page Should Contain Text                        ${WCMS["label.global.button.pay"]} 
    # Element Attribute Should Match       
    # Click Button                                  ${WCMS["label.global.button.pay"]}
    Go Back

Check Maximum Daily Limit of Transfer Credit
    ${maximum_daily}       Run Keyword And Return Status          Wait until page Contains         ${WCMS["send_gift_transfercredit_popup_limit_desc"]}    timeout=30
    ${limit_title}        RPString.escape HTML         ${WCMS["send_gift_transfercredit_popup_limit_title"]}
    Run Keyword If       ${maximum_daily}==True                  Run Keyword And Ignore Error      Wait until page contains                ${limit_title}
    Run Keyword If       ${maximum_daily}==True                   Wait until page Contains         ${WCMS["send_gift_transfercredit_popup_limit_desc"]}
    Run Keyword If       ${maximum_daily}==True                   Wait until page Contains         ${WCMS["send_gift_transfercredit_popup_limit_button"]}
    Run Keyword If       ${maximum_daily}==True                   Click Element                     ${I_understand}
    Sleep    5
    Run Keyword If       ${maximum_daily}==True                   Wait until page contains Element        ${Credit_Transfer_title}        timeout=30s 
    Run Keyword If       ${maximum_daily}==True                   Click Element                           ${Credit_Transfer_title}

*** Test Cases ***
Smoke Test - Add Credit
    [Documentation]     TC456
    [Tags]  AddCredit
    Notify Home Page
    Wait until page contains Element        ${TopUp_ShopPage_Btn}        timeout=30 
    Click Element                           ${TopUp_ShopPage_Btn} 
    Verify Add Credit Page
    Click Element                            ${AddCredit_30Rupi}  
    Verify Payment Method Page
    Verify All App Payment Method

Smoke Test - Buy Package
    [Tags]  BuyPackage  #TC457
    Go to Shop Page
    Verify GUI Shop Page 
    # Wait until page contains Element                ${Roaming_Btn}     timeout=30
    Scroll Down If Need
    Wait until page contains                      Choose Your Package            timeout=60
    # Click Element                              ${Roaming_Btn}
    ${Special_for_you}       Run Keyword And Return Status          Wait until page Contains          Special for You 
    Run Keyword If       ${Special_for_you}==True       Swipe	    200	    1800	    200 	600	  1000
    Swipe	    200	    1800	    200 	300	  1000
    Sleep    2
    ${View_all}       Run Keyword And Return Status       Wait until page Contains              ${WCMS["dashboard_recommend_package_see_all"]}     timeout=30
    ${View_all_2}                   Run Keyword If       ${View_all}==False       Swipe	    200	    1000	    200 	600	  1000
    Run Keyword If           ${View_all_2}==True          Click Text                ${WCMS["dashboard_recommend_package_see_all"]}
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
    Page Should Contain Element                 ${PaymentMethod_labelTotalPrice}

    Wait until page contains Element         ${Payment_Page_Continue_Pay}
    Click Element                            ${Payment_Page_Continue_Pay}
    Verify Payment Method Page 
    Verify All App Payment Method

Smoke Test - Cancel Redeem Point 
    [Tags]  RedeemPointCancel
    Wait Until Page Contains Element        ${Home_Poin}    timeout=30s
    Click Element                           ${Home_Poin} 
    Wait Until Page Contains Element        ${Merchant_Point}  timeout=30s
    Click Element                           ${Merchant_Point}
    ${Refresh}       Run Keyword And Return Status       Wait until page Contains          Sorry, a System Error Occured
    Run Keyword If       ${Refresh}==True       Switch item
    Wait Until Page Contains                ${WCMS["label_global_button_detail"]}    timeout=30s
    Wait Until Page Contains Element        ${Redeem_Poin_Btn}  timeout=30s
    Click Element                           ${Redeem_Poin_Btn}
    Wait Until Page Contains                ${WCMS["redeem_dialog_title"]}    timeout=30s
    Wait Until Page Contains                Are you sure want to redeem voucher?    timeout=30s   
    Wait Until Page Contains                Yes
    Wait Until Page Contains                No
    Click Button                            No
    Go Back

Smoke Test - Redeem Point
    [Tags]  RedeemPoint
    Wait Until Page Contains Element        ${Home_Poin}    timeout=30s
    Click Element                           ${Home_Poin}
    Wait Until Page Contains                Newest       timeout=30s 
    Click Text                              Newest 
    Wait Until Page Contains Element        ${Merchant_Point}  timeout=30s
    Click Element                           ${Merchant_Point}
    Wait Until Page Contains                ${WCMS["label_global_button_detail"]}    timeout=30s
    Wait Until Page Contains Element        ${Redeem_Poin_Btn}  timeout=30s
    Click Element                           ${Redeem_Poin_Btn}
    Wait Until Page Contains                ${WCMS["redeem_dialog_title"]}    timeout=30s
    Wait Until Page Contains                Are you sure want to redeem voucher?    timeout=30s  
    Wait Until Page Contains                Yes
    Click Button                            Yes
    Sleep    3
    Verify detail voucher after Redeem point success
    Click Button                            ${WCMS["redeem_details_button_back_to_rewards_page"]}
    # Wait Until Page Contains                ${WCMS["reward_stock_insufficient_point_title"]}    timeout=30s
    # Wait Until Page Contains                ${WCMS["reward_stock_insufficient_point_desc"]}
    # Wait Until Page Contains                ${WCMS["reward_stock_insufficient_point_button"]}




Smoke Test - Send Gift Transfer Credit page after selected Credit Transfer
    [Tags]  SendGiftTransferCredit  #TC508
    Go to Send Gift Page
    ${Permission_allow_button}    Run Keyword And Return Status    Wait until page contains Element    ${Permission_allow_button}
    Run Keyword If      ${Permission_allow_button}==True           Click Button                       Allow 
    Check Send Gift page
    Input correct Telkomsel Number          ${Valid_Phone_Number} 
    Verify GUI Detail SendGift Page         ${Valid_Phone_Number}
    Click Element                           ${Credit_Transfer_title}
#Check send gift credit page 
    Wait until page contains Element       ${Send_Gift_Header_title}        timeout=30                           
    Wait until page contains                ${Valid_Phone_Number}         
    Wait until page contains Element        ${brand_logo}                         
    Wait until page contains Element        ${Contact_Icon2}    
    Wait until page contains Element        ${Cross_Btn}
    Wait until page contains Element        ${Give_gift_to_text}
    Wait until page contains                ${WCMS["send_transfer_credit_title"]}   
    Wait until page contains                ${WCMS["send_gift_credit_title"]}    
    Wait until page contains Element        ${Credit_price}       
    Wait until page contains Element        ${Title_Transfer}         
    Wait until page contains                ${Credit_Rp_10k}         
    Wait until page contains                ${Credit_Rp_15k}          	
    Wait until page contains                ${Credit_Rp_20k}            
    Wait until page contains                ${Credit_Rp_25k}        
    Wait until page contains                ${Credit_Rp_30k}        
    Wait until page contains Element        ${Title_Nominal}        
    Wait until page contains Element        ${input_price_TextField}
    Scroll      ${Title_Nominal}    ${Title_Transfer}
    # RBFindElement.find text in list view android    ${Gifting_Journey_SendCredit_List_Content}    ${Gifting_Journey_SendCredit_TermCondition}     down
    ${str}     RPString.escape_HTML    ${WCMS["send_gift_transfer_tnc_title"]}
    Wait until page contains                ${str} 

    Wait until page contains Element        ${arrow_package_desc}     
    Wait until page contains                ${btn_continue}  
    Element Attribute Should Match          ${btn_continue}       enabled   false    
    # Check Button Clickable                  ${btn_continue}        false 

#Term and Condition About Transfer Credit
    Click Element                           ${arrow_package_desc}  
    RBFindElement.drag element with director    ${arrow_package_desc}    up    1500
    Wait until page contains Element        ${TermCond_Content}        timeout=30
# TC511

Smoke Test - Transfer Credit page BUT your Credit insufficient, limit amount
    [Documentation]   Choose a Nominal Credit BUT Your Credit is not enough, limit amount
        ...     |*TC IDs*|Android TC515    TC516    TC517|
        ...     |*TC IDs*|iOS TC1653    TC1654    TC1655|
        ...     |*TC Type*|Negative Case| 
    [Tags]    TransferCredit1
    Go to Send Gift Page
    ${Permission_allow_button}    Run Keyword And Return Status    Wait until page contains Element    ${Permission_allow_button}
    Run Keyword If      ${Permission_allow_button}==True           Click Button                       Allow 
    Input correct Telkomsel Number          ${Valid_Phone_Number} 
    Wait until page contains Element        ${Credit_Transfer_title}        timeout=30s
    Click Element                           ${Credit_Transfer_title}
    Check Maximum Daily Limit of Transfer Credit
      # Choose a Nominal Credit 
    Wait until page contains                ${Credit_Rp_30k}   
    Click Text                              ${Credit_Rp_30k}
    ${error_system}    Run Keyword And Return Status    Wait until page contains      ${WCMS["send_gift_transfer_fee_popup_error_title"]}    timeout=30
    Run Keyword If      ${error_system}==True           Click Text       ${WCMS["send_gift_transfer_fee_popup_error_secondary_button"]}        
    Wait until page contains                ${WCMS["send_gift_transfer_error_insufficient_text"]}            
    Element Attribute Should Match          ${btn_continue}       enabled      false
        # Input manually nominal 
    Swipe	    200	    1000	    200 	500	  1000
    Click Element                           ${input_price_TextField}
    Input Text                              ${input_price_TextField}        ${Manually_Nominal_input_number_incorrect}
    Hide Keyboard
    Wait until page contains                ${Manually_Nominal_input_number_incorrect}
    Wait until page contains                ${Fail_message_input_number_incorrect} 
    Element Attribute Should Match          ${btn_continue}       enabled       false 
    Clear Text                              ${input_price_TextField}
    Wait Until Page Does Not Contain        ${Manually_Nominal_input_number_incorrect} 
    Wait Until Page Does Not Contain        ${Fail_message_input_number_incorrect}

    Click Element                           ${input_price_TextField}
    Input Text                              ${input_price_TextField}        ${Manually_Nominal_input_number_insufficient}
    Hide Keyboard
    Wait until page contains                ${Manually_Nominal_input_number_insufficient}
    Wait until page contains                ${Fail_message_input_number_insufficient}    
    Element Attribute Should Match          ${btn_continue}       enabled   false 
    Clear Text                              ${input_price_TextField}
    Wait Until Page Does Not Contain        ${Manually_Nominal_input_number_insufficient} 
    Wait Until Page Does Not Contain        ${Fail_message_input_number_insufficient} 

    Click Element                           ${input_price_TextField}
    Input Text                              ${input_price_TextField}        ${Manually_Nominal_input_number_min} 
    Hide Keyboard
    Wait until page contains                ${Manually_Nominal_input_number_min} 
    Wait until page contains                ${Fail_message_input_number_min}   
    Element Attribute Should Match          ${btn_continue}       enabled   false
    Clear Text                              ${input_price_TextField}
    Wait Until Page Does Not Contain        ${Manually_Nominal_input_number_min} 
    Wait Until Page Does Not Contain        ${Fail_message_input_number_min} 

    Click Element                           ${input_price_TextField}
    Input Text                              ${input_price_TextField}        ${Manually_Nominal_input_number_max} 
    Hide Keyboard
    Wait until page contains                ${Manually_Nominal_input_number_max} 
    Wait until page contains                ${Fail_message_input_number_maximum}   
    Element Attribute Should Match          ${btn_continue}       enabled   false
    Clear Text                              ${input_price_TextField}
    Wait Until Page Does Not Contain        ${Manually_Nominal_input_number_min} 
    Wait Until Page Does Not Contain        ${Fail_message_input_number_min} 

Smoke Test - Transfer Credit success
    [Documentation]   Transfer Credit success
        ...     |*TC IDs*|Android TC515    TC516    TC517|
        ...     |*TC IDs*|iOS TC1653    TC1654    TC1655|
        ...     |*TC Type*|Negative Case|
    [Tags]    TransferCredit2 
    Go to Send Gift Page
    ${Permission_allow_button}    Run Keyword And Return Status    Wait until page contains Element    ${Permission_allow_button}
    Run Keyword If      ${Permission_allow_button}==True           Click Button                       Allow 
    Input correct Telkomsel Number          ${Valid_Phone_Number}
    Wait until page contains Element        ${Credit_Transfer_title}        timeout=30s 
    Click Element                           ${Credit_Transfer_title}
    Check Maximum Daily Limit of Transfer Credit
    # Choose a Nominal Credit 
    Wait until page contains                ${Credit_Rp_10k}
    Click Text                              ${Credit_Rp_10k}
    ${error_system}    Run Keyword And Return Status    Wait until page contains      ${WCMS["send_gift_transfer_fee_popup_error_title"]}    timeout=30
    Run Keyword If      ${error_system}==True           Click Text       ${WCMS["send_gift_transfer_fee_popup_error_secondary_button"]}   
    ${enough}          Run Keyword And Return Status    Element Attribute Should Match          ${btn_continue}       enabled   true
    Run Keyword If      ${enough}==True           Verify Transfer Credit success          ${Credit_Rp_10k}
    Run Keyword If      ${enough}==False          Wait until page contains                ${WCMS["send_gift_transfer_error_insufficient_text"]}       
    # Input manually nominal 
    Swipe	    200	    1000	    200 	500	  1000
    Click Element                           ${input_price_TextField}
    Input Text                              ${input_price_TextField}        ${Manually_Nominal_input_number_correct}
    Hide Keyboard
    Wait until page contains                ${Manually_Nominal_input_number_correct}  
    ${enough}          Run Keyword And Return Status    Element Attribute Should Match          ${btn_continue}       enabled   true
    Run Keyword If      ${enough}==True           Verify Transfer Credit success           ${Manually_Nominal_input_number_correct}
    Run Keyword If      ${enough}==False          Wait until page contains                ${Fail_message_input_number_insufficient}

Smoke Test - Send Gift Package
    [Tags]  SendGiftPackage     #TC501
    Go to Send Gift Page
    Check Send Gift page
    Input correct Telkomsel Number          ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page         ${Valid_Phone_Number}            
    # Wait until page contains                ${InternetPackage_OMG}
    # Click Text                              ${InternetPackage_OMG}
    # RBFindElement.find text in list view android    ${SenGiftDetail_ListView_Package}     ${InternetPackage_10GB}     down
    # Click Text                               ${InternetPackage_10GB}
    Wait until page contains Element         ${Package_item}         timeout=30
    Click Element                            ${Package_item} 
        #Verify Package detail
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Page Should Contain Text                 ${WCMS["package_detail_header"]}
    Page Should Contain Element              ${Package_name}
    Page Should Contain Element              ${Package_quota}
    Page Should Contain Element              ${Package_purchase_type}
    Page Should Contain Text                 ${Valid_Phone_Number}
    Page Should Contain Element              ${Package_infor}
    Page Should Contain Text                 ${WCMS["label.global.body.offer_active_period"]}
    Swipe	    200	    1200	    200 	600	  1000
    Sleep   3
    Page Should Contain Text                 ${WCMS["label.package_details_app.body.package_desc"]}
    ${term&condition}         RPString.escape_HTML          ${WCMS["paymentmethod_emoney_tnc_titles"]}
    Run Keyword And Ignore Error             Page Should Contain Text                  ${term&condition}
    Page Should Contain Element                 ${PaymentMethod_labelTotalPrice}

    Wait until page contains Element         ${PaymentMethod_btn_continuePayment}
    Click Element                            ${PaymentMethod_btn_continuePayment}
    Verify Payment Method Page
    Swipe	    200	    1200	    200 	600	  1000 
    Verify All App Payment Method

# Check send gift credit page after selected Credit Gifts
#     [Documentation]    Check UI send gift credit page and payment method page
#         ...     |*TC IDs*|Android TC505    TC506    TC550|
#         ...     |*TC IDs*|iOS TC1643    TC1644    TC1688|
#         ...     |*TC Type*| Positive Case| 
#     [Tags]    SendGift1
#  #Go to send gift credit page
#     Check Send Gift page
#     Input correct Telkomsel Number        ${Valid_Phone_Number} 
#     Verify GUI Detail SendGift Page        ${Valid_Phone_Number}
#     Click Element                           ${Credit_Gifts_title}
#     Verify Send Gift Page Category
#     Wait until page contains                ${Credit}  
#     Click Text                              ${Credit}  

# #directed to payment method
#     Verify Payment Method Page                            
#     Wait until page contains Element        ${PaymentMethod_title_giftto}        
#     Wait until page contains                ${Valid_Phone_Number}       
#     Wait until page contains Element        ${PaymentMethod_Ewallet}   
#     Wait until page Contains                ${Wallet_Gopay}      