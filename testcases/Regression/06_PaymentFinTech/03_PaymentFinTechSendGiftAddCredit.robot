*** Settings ***
Documentation       TDW7TL-139
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
Resource            ../../KeyWord/PaymentMethodPageKeyWord.robot
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


#Check send gift credit page - Credit Transfer  
${Manually_Nominal_input_number_insufficient}       20000       
${Manually_Nominal_input_number_min}                20 
${Manually_Nominal_input_number_max}                2000000000000 

${Gifting_Journey_SubCategory_List}                ${APP_PACKAGE}:id/rv_subcategory_menu
${Gifting_Journey_SubCategory_List_Content}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView
${Packet_Internet_Combo_Youtube}                    	Kuota Ketengan YouTube
${Packet_Internet_Youtube_Item}                Kuota Ketengan YouTube
${Packet_Internet_Youtube_Item_Price}                Rp 2,900
${Internet_Package_Charge_Bill}            	512 MB +Unlimited
${Template_SMS_Gift_OTP}                    Jangan berikan password Anda kpd org lain! Password:


# ${Credit_ListView}          ${APP_PACKAGE}:id/vp_credit_and_transfer
	
${Credit_ListView}        ${APP_PACKAGE}:id/rcv_credit_content
${Credit_Item}              //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.RelativeLayout/android.widget.RelativeLayout[1]/android.widget.FrameLayout/android.widget.RelativeLayout

${creditVoucherValidility}      ${APP_PACKAGE}:id/tv_creditVoucherValidility 	#+45 Days
	
${creditVoucherRupiah}     ${APP_PACKAGE}:id/tv_creditVoucherRupiah     #RP
${creditVoucherBalance1}     ${APP_PACKAGE}:id/tv_creditVoucherBalance1   #20
${creditVoucherBalance2}     ${APP_PACKAGE}:id/tv_creditVoucherBalance2   #,000
	
${creditVoucherPoin}         ${APP_PACKAGE}:id/tv_creditVoucherPoin 	#+5 POIN
${Credit_valid_items}         [${creditVoucherValidility}, ${creditVoucherRupiah}, ${creditVoucherBalance1}, ${creditVoucherBalance2}, ${creditVoucherPoin}]


	
${Gifting_Journey_SendCredit_List_Content}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ScrollView
${Gifting_Journey_SendCredit_Term$Condition}        Terms &amp; Conditions
${SenGiftDetail_ListView_Package}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView



*** Keywords ***

Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift
    Reopen App      ${EMPTY}
    # Check Logined Default User
    Check default lang and swtich 
    Check Banner on the login page
    Check Logined User    ${TW_LinkAccount_Phonenumber}    ${TW_Phonenumber}   ${TW_Account}     ${TW_Password}     ${TW_Email}
    Check Tutup popup
    Check Reminder
    Check Tutup popup
    Check VOC Dispaly And Skip
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

Verify Send Gift Add Credit via E-Wallet (Go Pay, Shopee Pay, Dana, LinkAja, Ovo)
    [Documentation]    Send Gift Add Credit via E-Wallet 
        ...     |*TC IDs*|Android    TC493    TC494    TC495    TC496    TC497    TC498|
        ...     |*TC IDs*|IOS    TC1631    TC1632    TC1633    TC1634    TC1635    TC1636|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech1
    # Go to Send Gift Page
    ${Permission_allow_button}    Run Keyword And Return Status    Wait until page contains Element    ${Permission_allow_button}
    Run Keyword If      ${Permission_allow_button}==True           Click Button    
    Check Send Gift page
    Click Element                            ${Input_Number_Text_Field}
    Input Text                               ${Input_Number_Text_Field}      ${Valid_Phone_Number} 
    Wait until page contains                 ${Valid_Phone_Number} 
    Click Got It Btn in SendGift Page
    Check Button Clickable                   ${Continue_Btn}        true
    Click Element                            ${Continue_Btn}
    # Input correct Telkomsel Number           ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page          ${Valid_Phone_Number}            
    Wait until page contains Element         ${Credit_Gifts_title}          timeout=30
    Click Element                            ${Credit_Gifts_title} 
    ${error}           Run Keyword And Return Status       Wait until page Contains         ${WCMS["send_gift_error_title"]}       timeout=30
    Run Keyword If       ${error}==True                    Click Button                  ${WCMS["send_gift_error_button"]}    
    Wait until page contains Element         ${AddCredit_item}          timeout=30
    Click Element                            ${AddCredit_item}  
    Verify Payment Method Page
    Page Should Contain Text                 ${Valid_Phone_Number}
    Verify All App Payment Method
    
Verify Send Gift Add Credit via Method AkuLaku when select a denomination below minimum payment
    [Documentation]     
        ...     |*TC IDs*|Android    D7M-4445|
    [Tags]  AddCredit
    Check Send Gift page
    Click Element                            ${Input_Number_Text_Field}
    Input Text                               ${Input_Number_Text_Field}      ${Valid_Phone_Number} 
    Wait until page contains                 ${Valid_Phone_Number} 
    Check Button Clickable                   ${Continue_Btn}        true
    Click Element                            ${Continue_Btn}
    # Input correct Telkomsel Number           ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page          ${Valid_Phone_Number}            
    Wait until page contains Element         ${Credit_Gifts_title}          timeout=30
    Click Element                            ${Credit_Gifts_title}  
    ${error}           Run Keyword And Return Status       Wait until page Contains         ${WCMS["send_gift_error_title"]}       timeout=30
    Run Keyword If       ${error}==True                    Click Button                     ${WCMS["send_gift_error_button"]}    
    Wait until page contains Element         ${AddCredit_item}          timeout=30
    Click Element                            ${AddCredit_item}  
    Verify Payment Method Page
    Page Should Contain Text                 ${Valid_Phone_Number}                                                   
    Swipe	    200	    1500	    200 	500	  1000
    Swipe	    200	    1500	    200 	500	  1000
    ${Akulaku}           Run Keyword And Return Status       Wait until page Contains         ${WCMS["payment_method_akulaku_text"]}       timeout=30
    Run Keyword If       ${Akulaku}==True                Verify Payment Method - AkuLaku when select a denomination below minimum payment
    Go Back


Verify Send Gift Add Credit via Kredivo and Akulaku
    [Documentation]     
        ...     |*TC IDs*|Android    D7M-4445|
    [Tags]  AddCredit
    Check Send Gift page
    # Input correct Telkomsel Number           ${Valid_Phone_Number}   
    Click Element                            ${Input_Number_Text_Field}
    Input Text                               ${Input_Number_Text_Field}      ${Valid_Phone_Number} 
    Wait until page contains                 ${Valid_Phone_Number} 
    Check Button Clickable                   ${Continue_Btn}        true
    Click Element                            ${Continue_Btn}
    Verify GUI Detail SendGift Page          ${Valid_Phone_Number}            
    Wait until page contains Element         ${Credit_Gifts_title}          timeout=30
    Click Element                            ${Credit_Gifts_title}  
    ${error}           Run Keyword And Return Status       Wait until page Contains         ${WCMS["send_gift_error_title"]}       timeout=30
    Run Keyword If       ${error}==True                    Click Button                  ${WCMS["send_gift_error_button"]}    
    Wait until page contains Element         ${AddCredit_item_150kRp}       timeout=30
    Click Element                            ${AddCredit_item_150kRp}
    Verify Payment Method Page
    Page Should Contain Text                 ${Valid_Phone_Number}         
    Wait until page contains Element                ${PaymentMethod_title_contentproduct}         timeout=30 
    Swipe	    200	    1800	    200 	600	  1000
    Swipe	    200	    1500	    200 	500	  1000
    Sleep  5
    ${Kredivo}           Run Keyword And Return Status       Wait until page Contains         ${WCMS["payment_method_kredivo_text"]}      timeout=30
    Run Keyword If       ${Kredivo}==True                Verify Payment Method - Kredivo    

    ${Akulaku}           Run Keyword And Return Status       Wait until page Contains         ${WCMS["payment_method_akulaku_text"]}       timeout=30
    Run Keyword If       ${Akulaku}==True                Verify Payment Method - AkuLaku when select a denomination above minimum payment        
    Go Back
    Sleep  5

