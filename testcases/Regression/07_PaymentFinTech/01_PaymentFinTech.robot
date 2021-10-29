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
Resource            ../../KeyWord/PaymentMethodPageKeyWord.robot
Resource            ../../KeyWord/SendGiftCreditPageKeyWord.robot

Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Go to Send Gift Page
Test Teardown       Tear Down Test Cases

*** Variables ***

#Send Gift Page
${Valid_Phone_Number}           081211063948     
${Favorit_Number}          6281394074354 
${Favorit_Number_08}           081394074354 
${Transaction_Number}           6281394074354 
${Transaction_Number_08}           081394074354 
#Change Number page
${Change_Phone_Number}          082122697613   


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
    Check Logined User    ${TW_LinkAccount_Phonenumber}    ${TW_Phonenumber}   ${TW_Account}     ${TW_Password}     ${TW_Email}
    Check Tutup popup
    Check Reminder
    Check Tutup popup
    Check VOC Dispaly And Skip
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s


*** Test Cases ***  
Redirect to TnC LinkAja page after selected credit
    [Documentation]    Redirect to TnC LinkAja page after selected credit
        ...     |*TC IDs*|iOS TC1632 - Android TC494|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech1
    Check Send Gift page
    Input correct Telkomsel Number          ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page         ${Valid_Phone_Number}
    Click Element                           ${Credit_Gifts_title}
    Verify Send Gift Page Category
    Click Element                            ${creditVoucherBalance1}
    Verify Payment Method Page 
    Verify App Payment Method                LinkAja    ${Tnc_LinkAja}

Redirect to TnC Gopay page after selected credit
    [Documentation]    Redirect to TnC Gopay page after selected credit
        ...     |*TC IDs*|iOS TC1633 - Android TC495|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech1
    Check Send Gift page
    Input correct Telkomsel Number          ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page         ${Valid_Phone_Number}
    Click Element                           ${Credit_Gifts_title}
    Verify Send Gift Page Category
    Click Element                            ${creditVoucherBalance1}
    Verify Payment Method Page 
    Verify App Payment Method                Gopay    ${Tnc_GOPAY}

Redirect to TnC DANA page after selected credit
    [Documentation]    Redirect to TnC DANA page after selected credit
        ...     |*TC IDs*|iOS TC1635 - Android TC497|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech1
    Check Send Gift page
    Input correct Telkomsel Number          ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page         ${Valid_Phone_Number}
    Click Element                           ${Credit_Gifts_title}
    Verify Send Gift Page Category
    Click Element                            ${creditVoucherBalance1}
    Verify Payment Method Page 
    Verify App Payment Method - for unconnected e-wallets               DANA    ${Tnc_DANA}


Redirect to TnC ShopeePay page after selected credit
    [Documentation]    Redirect to TnC ShopeePay page after selected credit
        ...     |*TC IDs*|iOS TC1636 - Android TC498|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech1
    Check Send Gift page
    Input correct Telkomsel Number          ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page         ${Valid_Phone_Number}
    Click Element                           ${Credit_Gifts_title}
    Verify Send Gift Page Category
    Click Element                            ${creditVoucherBalance1}
    Verify Payment Method Page 
    Verify App Payment Method                ShopeePay    ${Tnc_SHOPEEPAY}


Redirect to TnC LinkAja page after selected package
    [Documentation]    Redirect to TnC LinkAja page after selected package
        ...     |*TC IDs*|iOS TC1637 - Android TC499|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech
    Check Send Gift page
    Input correct Telkomsel Number          ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page         ${Valid_Phone_Number}           
    # Wait until page contains                ${InternetPackage_OMG}        timeout=30
    # Click Text                              ${InternetPackage_OMG}
    RBFindElement.find text in list view android    ${SenGiftDetail_ListView_Package}     ${InternetPackage_10GB}     down
    Wait until page contains                ${InternetPackage_10GB}
    Click Text                            ${InternetPackage_10GB}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Wait until page contains Element         ${PaymentMethod_btn_continuePayment}
    Click Element                            ${PaymentMethod_btn_continuePayment}
    Verify Payment Method Page 
    Verify App Payment Method                LinkAja    ${Tnc_LinkAja}

Redirect to TnC GOPAY page after selected package
    [Documentation]    Redirect to TnC GOPAY page after selected package
        ...     |*TC IDs*|iOS TC1638 - Android TC500|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech
    Check Send Gift page
    Input correct Telkomsel Number          ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page         ${Valid_Phone_Number}            
    # Wait until page contains                ${InternetPackage_OMG}
    # Click Text                              ${InternetPackage_OMG}
    RBFindElement.find text in list view android    ${SenGiftDetail_ListView_Package}     ${InternetPackage_10GB}     down
    Click Text                            ${InternetPackage_10GB}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Wait until page contains Element         ${PaymentMethod_btn_continuePayment}
    Click Element                            ${PaymentMethod_btn_continuePayment}
    Verify Payment Method Page 
    Verify App Payment Method                Gopay    ${Tnc_GOPAY}

Redirect to TnC ShopeePay page after selected package
    [Documentation]    Redirect to TnC ShopeePay page after selected package
        ...     |*TC IDs*|iOS TC1640 - Android TC502|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech
    Check Send Gift page
    Input correct Telkomsel Number          ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page         ${Valid_Phone_Number}            
    # Wait until page contains                ${InternetPackage_OMG}
    # Click Text                              ${InternetPackage_OMG}
    RBFindElement.find text in list view android    ${SenGiftDetail_ListView_Package}     ${InternetPackage_10GB}     down
    Click Text                            ${InternetPackage_10GB}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Wait until page contains Element         ${PaymentMethod_btn_continuePayment}
    Click Element                            ${PaymentMethod_btn_continuePayment}
    Verify Payment Method Page 
    Verify App Payment Method                ShopeePay    ${Tnc_SHOPEEPAY}

Redirect to TnC OVO page after selected package
    [Documentation]    Redirect to TnC OVO page after selected package
        ...     |*TC IDs*|iOS TC1639 - Android TC501|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Fintech
    Check Send Gift page
    Input correct Telkomsel Number          ${Valid_Phone_Number}   
    Verify GUI Detail SendGift Page         ${Valid_Phone_Number}            
    # Wait until page contains                ${InternetPackage_OMG}
    # Click Text                              ${InternetPackage_OMG}
    RBFindElement.find text in list view android    ${SenGiftDetail_ListView_Package}     ${InternetPackage_10GB}     down
    Click Text                            ${InternetPackage_10GB}
    Wait until page contains Element         ${PackageDetail_headerTitle}        timeout=30
    Wait until page contains Element         ${PaymentMethod_btn_continuePayment}
    Click Element                            ${PaymentMethod_btn_continuePayment}
    Verify Payment Method Page 
    Verify App Payment Method                OVO    ${Tnc_OVO}

