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
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/account.robot

Resource            ../../KeyWord/SendGiftPageKeyWord.robot
Resource            ../../KeyWord/SendGiftPageDetailKeyWord.robot
Resource            ../../KeyWord/OTPConfirmPopupKeyWord.robot
Resource            ../../KeyWord/SendGiftCreditPageKeyWord.robot
Resource            ../../KeyWord/ShopPageKeyWord.robot

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

${Prepaid_Phone_Number}            08128025167
${PostPaid_Phone_Number}           08111447224 

${Manually_Nominal_input_number}            Please input the correct amount to transfer!
${Fail_message_input_number_maximum}        Maximum amount is Rp. 1,000,000        


#Check send gift credit page - Credit Transfer  
${Manually_Nominal_input_number_insufficient}       200      
${Manually_Nominal_input_number_min}                70 
${Manually_Nominal_input_number_max}                200000000 

${Gifting_Journey_SubCategory_List}                ${APP_PACKAGE}:id/rv_subcategory_menu
${Gifting_Journey_SubCategory_List_Content}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView
${Packet_Internet_Combo_Youtube}                    	Kuota Ketengan YouTube
${Packet_Internet_Youtube_Item}                Kuota Ketengan YouTube
${Packet_Internet_Youtube_Item_Price}                Rp 2,900
${Internet_Package_Charge_Bill}            	512 MB +Unlimited
${Template_SMS_Gift_OTP}                    Jangan berikan password Anda kpd org lain! Password:


${Credit_ListView}          ${APP_PACKAGE}:id/vp_credit_and_transfer
${Credit_Item}              ${APP_PACKAGE}:id/fl_addCreditItem

${creditVoucherValidility}      ${APP_PACKAGE}:id/tv_creditVoucherValidility 	#+45 Days
	
${creditVoucherRupiah}     ${APP_PACKAGE}:id/tv_creditVoucherRupiah     #RP
${creditVoucherBalance1}     ${APP_PACKAGE}:id/tv_creditVoucherBalance1   #20
${creditVoucherBalance2}     ${APP_PACKAGE}:id/tv_creditVoucherBalance2   #,000
	
${creditVoucherPoin}         ${APP_PACKAGE}:id/tv_creditVoucherPoin 	#+5 POIN
${Credit_valid_items}         [${creditVoucherValidility}, ${creditVoucherRupiah}, ${creditVoucherBalance1}, ${creditVoucherBalance2}, ${creditVoucherPoin}]


	
# ${Gifting_Journey_SendCredit_List_Content}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ScrollView
${Gifting_Journey_SendCredit_List_Content}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ScrollView
${Gifting_Journey_SendCredit_TermCondition}        Terms & Conditions

${Credit_Transfer_title}                          Credit Transfer
${Credit_Transfer_Amount}                         Credit Transfer Amount  

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
Check send gift credit page after selected Credit Transfer
    [Documentation]    Check send gift credit page after selected Credit Transfer and Term and Condition About Transfer Credit
        ...     |*TC IDs*|Android TC508    TC509    TC510|
        ...     |*TC IDs*|iOS TC1646    TC1647    TC1648|
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift
#Go to send gift credit page
    Check Send Gift page
    Input correct Telkomsel Number        ${Valid_Phone_Number} 
    Verify GUI Detail SendGift Page        ${Valid_Phone_Number}
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
    RBFindElement.find text in list view android    ${Gifting_Journey_SendCredit_List_Content}    ${Gifting_Journey_SendCredit_TermCondition}     down
    ${term&condition}     RPString.escape_HTML        ${WCMS["paymentmethod_emoney_tnc_titles"]}
    Wait until page contains                ${term&condition} 

    Wait until page contains Element        ${arrow_package_desc}     
    Wait until page contains                ${btn_continue}  
    Element Attribute Should Match          ${btn_continue}       enabled   false    
    Check Button Clickable                  ${btn_continue}        true 

#Term and Condition About Transfer Credit
    Click Element                           ${arrow_package_desc}  
    RBFindElement.drag element with director    ${arrow_package_desc}    up    1500
    Wait until page contains                    ${Term_Condition_Content}        timeout=60

Select Transfer Credit show error
    [Documentation]    Check Select Transfer Credit and Input Manually Nominal show error   
        ...     |*TC IDs*|Android TC515    TC516    TC517|
        ...     |*TC IDs*|iOS TC1653    TC1654    TC1655|
        ...     |*TC Type*|Negative Case| 
    [Tags]    SendGift
#Go to send gift credit page
    Check Send Gift page
    Input correct Telkomsel Number        ${Valid_Phone_Number} 
    Verify GUI Detail SendGift Page        ${Valid_Phone_Number}
    Click Element                           ${Credit_Transfer_title}

#Select List Transfer Credit
    Wait until page contains        ${Credit_Rp_30k}
    click Text                      ${Credit_Rp_30k}
    Wait until page contains        ${WCMS["send_gift_transfer_error_insufficient_text"]}
    Element Attribute Should Match  ${btn_continue}       enabled   false   

Check Input Manually Nominal Credit show error
    [Documentation]    Check Input Manually Nominal Credit
        ...     |*TC IDs*|Android TC515    TC516    TC517|
        ...     |*TC IDs*|iOS TC1653    TC1654    TC1655|
        ...     |*TC Type*|Negative Case| 
    [Tags]    SendGift1
#Go to send gift credit page
    Check Send Gift page
    Input correct Telkomsel Number        ${Valid_Phone_Number} 
    Verify GUI Detail SendGift Page        ${Valid_Phone_Number}
    Click Element                           ${Credit_Transfer_title}
    Wait until page contains element    ${input_price_TextField}


    Click Element                   ${input_price_TextField}
    Input Text                      ${input_price_TextField}        ${Manually_Nominal_input_number_insufficient}
    Hide Keyboard
    Wait until page contains        ${Manually_Nominal_input_number_insufficient}
    Wait until page contains        ${Manually_Nominal_input_number} 
    # Wait until page contains        ${WCMS["send_gift_transfer_error_insufficient_text"]} 
    Element Attribute Should Match  ${btn_continue}       enabled   false 
    Clear Text                      ${input_price_TextField}
    Wait Until Page Does Not Contain    ${Manually_Nominal_input_number_insufficient} 
    Wait Until Page Does Not Contain    ${WCMS["send_gift_transfer_error_insufficient_text"]}

    Click Element                       ${input_price_TextField}
    Input Text                          ${input_price_TextField}        ${Manually_Nominal_input_number_min}
    Hide Keyboard
    Wait until page contains            ${Manually_Nominal_input_number_min}
    Wait until page contains            ${Manually_Nominal_input_number}  
    # Wait until page contains            ${Fail_message_input_number_minimum}   
    Element Attribute Should Match      ${btn_continue}       enabled   false 
    Clear Text                          ${input_price_TextField}
    # Wait Until Page Does Not Contain    ${Manually_Nominal_input_number_min} 
    Wait Until Page Does Not Contain    ${Fail_message_input_number_minimum} 

    Click Element                       ${input_price_TextField}
    Input Text                          ${input_price_TextField}        ${Manually_Nominal_input_number_max} 
    Hide Keyboard
    Wait until page contains            ${Manually_Nominal_input_number_max} 
    Wait until page contains            ${Fail_message_input_number_maximum}   
    Element Attribute Should Match      ${btn_continue}       enabled   false 





In Category Send Gift User will See only Category Credit
    [Documentation]    Check In Category Send Gift User will See only Category Credit
        ...     |*TC IDs*|Android TC519|
        ...     |*TC IDs*|iOS TC1657|
        ...     |*TC Type*|Positive Case| 
    [Tags]    SendGift
    Check Send Gift page
    Input correct Telkomsel Number        ${PostPaid_Phone_Number}  
    Verify GUI Detail SendGift Page When Input PostPaid Phone Number    ${PostPaid_Phone_Number} 
    Click Element                        ${Credit_Gifts_title}
    Verify send gift credit page without transfer credit

In Category Send Gift User will See only Category "Credits Transfer"
    [Documentation]    Check In Category Send Gift User will See only Category "Credits Transfer"
        ...     |*TC IDs*|Android TC520|
        ...     |*TC IDs*|iOS TC1658|
        ...     |*TC Type*|Negative Case| 
    [Tags]    SendGift
    Check Send Gift page
    Input correct Telkomsel Number        ${Prepaid_Phone_Number}    
    Verify GUI Detail SendGift Page When Input Prepaid Phone Number    ${Prepaid_Phone_Number} 
    Click Element                         ${Credit_Transfer_title}
    Verify transfer credit page without tab credit
