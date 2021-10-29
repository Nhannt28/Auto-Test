*** Settings ***
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

Resource            ../../KeyWord/SendGiftPageKeyWord.robot
Resource            ../../KeyWord/SendGiftPageDetailKeyWord.robot
Resource            ../../KeyWord/SendGiftCreditPageKeyWord.robot
Resource            ../../KeyWord/PaymentMethodPageKeyWord.robot
Resource            ../../KeyWord/OTPConfirmPopupKeyWord.robot

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
#Change Number page
${Change_Phone_Number}          6281394074354   


#Check send gift credit page - Credit Transfer  
${Manually_Nominal_input_number_insufficient}       20000       
${Manually_Nominal_input_number_min}                20 
${Manually_Nominal_input_number_max}                2000000000000 

${Gifting_Journey_SubCategory_List}                ${APP_PACKAGE}:id/rv_subcategory_menu
${Gifting_Journey_SubCategory_List_Content}        	//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView

${Packet_Internet_Combo_Youtube}                    	Kuota Ketengan YouTube
${Packet_Internet_Youtube_Item}                Kuota Ketengan YouTube
${Packet_Internet_Youtube_Item_Price}                Rp 2,900
${Internet_Package_Charge_Bill}            	512 MB +Unlimited
${Template_SMS_Gift_OTP}                    Jangan berikan password Anda kpd org lain! Password:


# ${Credit_ListView}          ${APP_PACKAGE}:id/vp_credit_and_transfer
${Credit_ListView}            ${APP_PACKAGE}:id/rcv_credit_content 
# ${Credit_Item}              ${APP_PACKAGE}:id/fl_addCreditItem
${Credit_Item}             //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.RelativeLayout/android.widget.RelativeLayout[1]/android.widget.FrameLayout/android.widget.RelativeLayout

${creditVoucherValidility}      ${APP_PACKAGE}:id/tv_creditVoucherValidility 	#+45 Days
	
${creditVoucherRupiah}     ${APP_PACKAGE}:id/tv_creditVoucherRupiah     #RP
${creditVoucherBalance1}     ${APP_PACKAGE}:id/tv_creditVoucherBalance1   #20
${creditVoucherBalance2}     ${APP_PACKAGE}:id/tv_creditVoucherBalance2   #,000
	
${creditVoucherPoin}         ${APP_PACKAGE}:id/tv_creditVoucherPoin 	#+5 POIN
${Credit_valid_items}         [${creditVoucherValidility}, ${creditVoucherRupiah}, ${creditVoucherBalance1}, ${creditVoucherBalance2}, ${creditVoucherPoin}]


	
${Gifting_Journey_SendCredit_List_Content}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ScrollView
${Gifting_Journey_SendCredit_Term$Condition}        Terms &amp; Conditions


*** Keywords ***

Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift
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


*** Test Cases ***   
# Test Charge Bill And Favorite Number
#     [Documentation]    Input correct Telkomsel Number 
#         ...     |*TC IDs*|Android TC530    TC547|
#         ...     |*TC IDs*|iOS TC1668    TC1685|
#         ...     |*TC Type*| Positive Case| 
#     [Tags]    SendGift
#     Wait until page contains Element    ${Input_Number_Text_Field}    timeout=30  
#     Click Element                       ${Input_Number_Text_Field}
#     Input Text                          ${Input_Number_Text_Field}      ${Valid_Phone_Number}
#     Click Element                       ${Save_As_Favorit_Checkbox} 
#     Valid CheckBox Result               ${Save_As_Favorit_Checkbox}   true
#     Click Element                       ${Continue_Btn}
#     Verify GUI Detail SendGift Page     ${Valid_Phone_Number}
#     RBFindElement.find text in list view android    ${Gifting_Journey_SubCategory_List}    ${Packet_Internet_Combo_Youtube}     right
#     Click Text                                         ${Packet_Internet_Combo_Youtube}
#     # Scroll Down    //android.widget.TextView[contains(@text, \'Rp 2,900\')]
#     RBFindElement.find text in list view android    ${Gifting_Journey_SubCategory_List_Content}    ${Packet_Internet_Youtube_Item_Price}     down
#     # Wait until page contains         ${Internet_Package_Charge_Bill}     timeout=30
#     Click Text                                        ${Packet_Internet_Youtube_Item_Price}
#     Wait until page contains element                    ${Payment_Continue}  timeout=30
#     Click Element                                       ${Payment_Continue}
#     Wait until page contains element                    ${PaymentMethod_headerTitle}  timeout=30
#     Wait until page contains element                    ${PaymentMethod_btn_continuePayment}  timeout=30
#     Click Element                                       ${PaymentMethod_btn_continuePayment}
#     ${otp}     SMS.Get Otp From Notification Android    ${Template_SMS_Gift_OTP}
#     Verify OTP Confirm Popup                            ${Valid_Phone_Number}
#     Click Element                                       ${OTP_TextField}
#     Input Text                                          ${OTP_TextField}      ${otp}
#     Click Element                                       ${OTP_Confirm_Button} 
#     Verify Payment Status Page                          ${Valid_Phone_Number}        ${Packet_Internet_Youtube_Item_Price} 
#     Wait until page contains Element                   ${TW_LinkAccount_Phonenumber}    timeout=30  





Check Send Gift page
    [Documentation]    Verify UI Send Gift page    
        ...     |*TC IDs*|Android TC529    TC504    TC546    TC555|
        ...     |*TC IDs*|iOS TC1667    TC1642    TC1684    TC1693|       
        ...     |*TC Type*| Positive Case| 
        ...     |*TC Type*| Negative Case| 
    [Tags]    SendGift
    Check Send Gift page

Input correct Telkomsel Number
    [Documentation]    Input correct Telkomsel Number 
        ...     |*TC IDs*|Android TC530    TC547|
        ...     |*TC IDs*|iOS TC1668    TC1685|
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift
    Check Send Gift page
    Input correct Telkomsel Number        ${Valid_Phone_Number}
    
Check Detail SendGift Page
    [Documentation]    Verify UI Detail SendGift Page   
        ...     |*TC IDs*|Android TC539    TC549    TC518|
        ...     |*TC IDs*|iOS TC1677    TC1687    TC1656|
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift
    Check Send Gift page
    Input correct Telkomsel Number        ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page        ${Valid_Phone_Number}


Check Change Phone Number 
    [Documentation]    Check Change Phone Number Success and Check suggestion number from favorite or last transaction   
        ...     |*TC IDs*|Android    TC522    TC523    TC524     TC540    TC541    TC542    TC544|
        ...     |*TC IDs*|iOS    TC1660    TC1661    TC1662     TC1678    TC1679    TC1680    TC1682|
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift
#Go to Change Phone Number Page
    Check Send Gift page
    Input correct Telkomsel Number        ${Valid_Phone_Number} 
    Verify GUI Detail SendGift Page        ${Valid_Phone_Number}

#Check suggestion number from favorite or last transaction
    Click Element       ${Cross_Btn}
    Wait until page contains Element        ${Send_Gift_Header_title}    timeout=30
    Wait Until Page Does Not Contain        ${Valid_Phone_Number}
    Wait until page contains Element        ${Input_Number_Text_Field}
    # Wait until page contains                ${Input_Number_Hide_Text}
    Wait Until Page Does Not Contain Element        ${Cross_Btn}
    Check Button Clickable                  ${Continue_Btn}        true 
    Click Element                           ${Input_Number_Text_Field}
    Wait until page contains                ${WCMS["send_gift_favorite_title"]}        
    Wait until page contains                ${Favorit_Number_08}   
    Wait until page contains                ${WCMS["send_gift_last_transaction_title"]} 
    Wait until page contains                ${Transaction_Number_08}  

#Change phone number
    Input Text          ${Input_Number_Text_Field}        ${Change_Phone_Number}
    Wait until page contains        ${Change_Phone_Number}
    Check Button Clickable          ${Continue_Btn}        true 
    Click Element                   ${Continue_Btn}

#Back to send gift detail page after change phone number
    Verify GUI Detail SendGift Page        ${Change_Phone_Number} 

Check send gift credit page after selected Credit Gifts
    [Documentation]    Check UI send gift credit page and payment method page
        ...     |*TC IDs*|Android TC505    TC506    TC550|
        ...     |*TC IDs*|iOS TC1643    TC1644    TC1688|
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift1
 #Go to send gift credit page
    Check Send Gift page
    Input correct Telkomsel Number        ${Valid_Phone_Number} 
    Verify GUI Detail SendGift Page        ${Valid_Phone_Number}
    Click Element                           ${Credit_Gifts_title}
    Verify Send Gift Page Category
    Wait until page contains                ${Credit}  
    Click Text                              ${Credit}  

#directed to payment method
    Verify Payment Method Page                            
    Wait until page contains Element        ${PaymentMethod_title_giftto}        
    Wait until page contains                ${Valid_Phone_Number}       
    Wait until page contains Element        ${PaymentMethod_Ewallet}   
    Wait until page Contains                ${Wallet_Gopay}                        


Remove/Add phone number in list favorite   #fail message
    [Documentation]    Remove phone number in list favorite   
        ...     |*TC IDs*|Android TC559    TC561|
        ...     |*TC IDs*|iOS TC1697    TC1699|       
        ...     |*TC Type*| Positive Case|
    [Tags]    SendGift1
    Check Send Gift page
    Wait until page contains Element        ${Love_icon_Favorit}
    Element Attribute Should Match          ${Love_icon_Favorit}       enabled     true
    Wait until page contains Element        ${Love_icon_LastTransaction}
    Element Attribute Should Match          ${Love_icon_LastTransaction}       enabled     true
    Click Element                           ${Love_icon_Favorit}
    Wait until page Contains                ${send_gift_remove_favorite_success_text}        timeout=30
    RBFindElement.find text not in section android    ${favorite_section}    ${Favorit_Number}

    Wait until page contains Element        ${Love_icon_LastTransaction}
    Click Element                           ${Love_icon_LastTransaction}
    Wait until page Contains                ${send_gift_add_favorite_success_text}        timeout=30

    Wait until page contains Element        ${Love_icon_Favorit}
    Element Attribute Should Match          ${Love_icon_Favorit}       enabled     true
    Wait until page contains Element        ${Love_icon_LastTransaction}
    Element Attribute Should Match          ${Love_icon_LastTransaction}       enabled     true
    Click Element                           ${Love_icon_Favorit}   
    Wait until page Contains                ${send_gift_remove_favorite_success_text}        timeout=30
    RBFindElement.find text not in section android    ${favorite_section}    ${Favorit_Number}

    Click Element                           ${Love_icon_LastTransaction}
    Wait until page Contains                ${send_gift_add_favorite_success_text}
    Wait until page Contains                ${Favorit_Number}
    

Check checkbox favorite when existed maximum number favorite
    [Documentation]    Verify UI Send Gift page    
        ...     |*TC IDs*|Android TC556|
        ...     |*TC IDs*|iOS TC1694|       
        ...     |*TC Type*| Positive Case|
    [Tags]    SendGift
    Check Send Gift page   
    Click Element                       ${Input_Number_Text_Field}
    Input Text                          ${Input_Number_Text_Field}      ${Valid_Phone_Number}
    Wait until page contains            ${Valid_Phone_Number}
    Wait until page contains Element    ${Save_As_Favorit_Checkbox}
    Valid CheckBox Result               ${Save_As_Favorit_Checkbox}       false
    Check Button Clickable              ${Save_As_Favorit_Checkbox}      true
    Click Element                       ${Save_As_Favorit_Checkbox} 
    Valid CheckBox Result               ${Save_As_Favorit_Checkbox}   true
    Wait until page contains            ${send_gift_max_favorite_alert}

Check enable love icon in Last transaction when existed maximum number favorite
    [Documentation]    Verify UI Send Gift page    
        ...     |*TC IDs*|Android TC557    TC558|
        ...     |*TC IDs*|iOS TC1695    TC1696|       
        ...     |*TC Type*| Positive Case|
    Check Send Gift page 
    Wait until page contains Element        ${Love_icon_LastTransaction}
    Element Attribute Should Match          ${Love_icon_LastTransaction}       enabled     false
    Click Element                           ${Love_icon_LastTransaction}
    Wait until page contains                ${send_gift_max_favorite_alert_image}
    Wait until page contains                ${send_gift_max_favorite_alert_title}
    Wait until page contains                ${send_gift_max_favorite_alert_text}
    Wait until page contains                ${global_popup_close_text}
    Click Element                           ${Close_Btn} 
    Wait until Page Does Not Contain        ${send_gift_max_favorite_alert_image}
    Wait until Page Does Not Contain        ${send_gift_max_favorite_alert_title}
    Wait until Page Does Not Contain        ${send_gift_max_favorite_alert_text}
    Wait until Page Does Not Contain        ${global_popup_close_text}



Check information page 
    [Documentation]    Verify UI Send Gift page    
        ...     |*TC IDs*|Android TC545|
        ...     |*TC IDs*|iOS TC1683|       
        ...     |*TC Type*| Positive Case|
    [Tags]    SendGift1
    Check Send Gift page       
    Click Element                           ${Ib_right_Btn}
    Wait until page contains Element        ${About_Send_Gift_header}        timeout=30
    Wait until page contains Element        ${backButton}
    Wait until page contains Element        ${gift_title_receiver}
    Wait until page contains Element        ${gift_title_price}
    Wait until page contains Element        ${gift_title_others}

Select Phone Number from list favorite and list transaction 
    [Documentation]    Select Phone Number from list favorite and list transaction
        ...     |*TC iOS*|TC1671    TC1672|
        ...     |*TC Android*|TC533     TC4534|    
        ...     |*TC Type*| Positive Case|     
    [Tags]    SendGift1
#Select number from list favorite
    Wait until page contains        ${Favorit_Number}        timeout=30  
    Click Text                      ${Favorit_Number}
    Element Attribute Should Match  ${Input_Number_Text_Field}        text   ${Favorit_Number_08}
    # Wait until page contains Element    ${Clear_Number_Btn}    
    # Click Element                       ${Clear_Number_Btn}
    Clear Text                        ${Input_Number_Text_Field}  
    # Wait until page contains            ${WCMS["send_gift_wrong_number_label"]}


#Select number from list transaction
    Wait until page contains            ${Transaction_Number}
    Click Text                          ${Transaction_Number}
    Element Attribute Should Match      ${Input_Number_Text_Field}        text   ${Transaction_Number_08}
    # Wait until page contains Element    ${Clear_Number_Btn}    
    # Click Element                       ${Clear_Number_Btn}
    Clear Text                        ${Input_Number_Text_Field} 
    # Wait until page contains            ${WCMS["send_gift_wrong_number_label"]}
















 
    
    

    
    




