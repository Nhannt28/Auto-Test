*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/SharePackage.robot
Resource            ../../../variables/account.robot
Resource            ./PurchaseCommonKeyword.robot
Suite Setup         Check PreConditional
Test Setup          Launch Application
Test Teardown       Tear Down Test Cases
Suite Teardown      Close Application

*** Variables ***
${Roam_Package_Scheduled}           DATA_PR_SRA27CTRYSHORT_2.5GB_1_1

*** Keywords ***
Check PreConditional  
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC Android*| TC531     TC535    TC536    TC537    TC538|
        ...     |*TC IOS*| TC1669    TC1673    TC1674    TC1675     TC1676|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Invalid Phone Number
    Reopen App      ${EMPTY}
    Check Launching New version 
    Check Permission First Launch
    Check Tutup popup
    Check Reminder
    Check Tutup popup
    Check Logined Default User
    Check Tutup popup
    Check Reminder
    Check Permission Location Display

*** Test Cases ***
Verifying Package Payment
    [Documentation]    Verify Package Detail, Bottom Dialog, and See Details in Payment Method
        ...     |TC Android|TC121 - TC125   &&  TC128 - TC132|
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Go To KuotaKeluarga Page
    Verify Package Detail
    Click Element                           ${Btn_Buy_Package}
    Verify See Details Menu
    Verify Bottom Dialog

Verifying Add Credit
    [Documentation]    Verify Bottom Dialog and See Details in Add Credit Page & Revamp Payment Method Page
        ...     |TC Android|TC126   TC127  &&  TC144 - TC146|
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Wait Until Page Contains            ${WCMS["dashboard_add_credit_button"]}   timeout=30s
    Click Text                          ${WCMS["dashboard_add_credit_button"]}
    Wait Until Page Contains Element    ${Add_Credit_Package}   timeout=30s
    Wait Until Page Contains Element    ${Add_Credit_Contact_Logo}
    Click Element                       ${Add_Credit_Package}
    Wait Until Page Contains Element    ${Load_Content_Title}   timeout=30s
    Verify See Details Menu
    Verify Bottom Dialog

# note: TC128 - TC132 same as TC121 - TC125

Success Purchase Family Plan Package
    # note: can not identify icon & sms notif
    [Documentation]    Success Purchasing Family Plan Package
        ...     |TC Android|TC133  TC134  TC135|
        ...     |TC Type|Positive Case|
    # [Tags]      Android
    Go To KuotaKeluarga Page
    Purchase Family Plan Package        ${TW2_Phonenumber}
    # TC136 (purchase package)  
    # check inbox using multi login
    # Wait until page contains            ${Home_Page_Open_Popup_Account}    timeout=30
    # Click Element                       ${Home_Page_Open_Popup_Account}
    # Wait until page contains            ${Popup_Add_Account_Add_message}   timeout=30
    # Click Element                       ${Popup_Add_Account_Add_btn}
    # Add More Social Account Twitter     ${TW4_Phonenumber}   ${TW4_Account}     ${TW4_Password}     ${TW4_Email}    #use child phone number
    # Wait Until Page Contains Element    ${Hoome_Page_Inbox}     timeout=30s
    # Click Element                       ${Hoome_Page_Inbox}
    # Verify Inbox Page

Verify Warning Snackbar
    # note: cannot verify color
    [Documentation]    User Will See Warning Snackbar
        ...     |TC Android|TC138|
        ...     |TC Type|Negative Case|
    [Tags]      Android
    Go To KuotaKeluarga Page
    Verify Package Detail
    Click Element                       ${Btn_Buy_Package}
    Verify See Details Menu
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}     timeout=30s
    Click Element                       ${Payment_Page_Continue_Pay}
    Wait Until Page Contains            ${WCMS["quota_setup_warning_text"]}

Fail Purchase Family Plan Package
    [Documentation]    Fail Purchase Family Plan Package Because Not Enough Credit Balance
        ...     |TC Android|TC139   TC140|
        ...     |TC Type|Negative Case|
    [Tags]      Android
    Go To KuotaKeluarga Page
    Purchase Family Plan Package  ${TW2_Phonenumber}
    Wait Until Page Contains      ${WCMS["paymentmethod_confirmation_insufficient_header"]}     timeout=30s
    Wait Until Page Contains      ${WCMS["paymentmethod_confirmation_insufficient_text"]}
    Wait Until Page Contains Element        ${Button_Other_Payments} 
    Wait Until Page Contains Element        ${Button_TopUp}
    Click Element                           ${Button_TopUp}
    Wait Until Page Contains Element        ${Load_Content_Title}   timeout=30s
    Wait Until Page Contains Element        ${Add_Credit_Package}   timeout=30s

# Success Repurchase Family Plan Package
#     [Documentation]    Success Repurchasing Family Plan Package
#         ...     |TC Android|TC141|
#         ...     |TC Type|Positive Case|
#     # [Tags]      Android
#     Go To KuotaKeluarga Page
#     Purchase Family Plan Package  ${TW2_Phonenumber}
    # same as TC 133 but different at point 18

Verify Roaming Package
    # note: point 13 (checkbox not exist in roaming package)
    [Documentation]    Verifying Roaming Package
        ...     |TC Android|TC142   TC143|
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Wait Until Page Contains Element        ${TabBar_Shop}      timeout=30s
    Click Element                           ${TabBar_Shop}
    Wait Until Page Contains                ${WCMS["shop_package_category_roaming_text"]}   timeout=30s 
    Wait Until Page Contains                ${Roam_Package_Scheduled}
    Click Text                              ${Roam_Package_Scheduled}
    # Click Text                              ${WCMS["shop_package_category_roaming_text"]}
    # Swipe By Percent	                    50	90	50	50
    # Wait Until Page Contains Element        ${Roaming_Package_Image}  timeout=30s
    # Click Element                           ${Roaming_Package_Image}
    # Wait Until Page Contains                ${Promo_Display}    timeout=30s
    # Click Element                           ${Promo_Display}
     # Detail Package
    Wait Until Page Contains                ${Load_Content_Title}   timeout=30s
    Wait Until Page Contains Element        ${Btn_Buy_Package}
    Click Element                           ${Btn_Buy_Package}
    Verify See Details Menu
    Wait Until Page Contains Element        ${Checkbox_Active_Later}
    Wait Until Page Contains Element        ${Checkbox_Active_Now}

# note: TC144 - TC146 same as 126

Verify Package In Postpaid Number
    # note: use postpaid number
    [Documentation]    Verifying See Details In Payment Method Using Pospaid number
        ...     |TC Android|TC147|
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Wait Until Page Contains Element        ${TabBar_Shop}      timeout=30s
    Click Element                           ${TabBar_Shop}
    Wait Until Page Contains Element        ${First_Package}      timeout=30s
    Swipe By Percent	                    50	90	50	50
    Click Element                           ${First_Package}
    Wait Until Page Contains Element        ${Load_Content_Title}   timeout=30s
    Click Element                           ${Btn_Buy_Package}
    Wait Until Page Contains Element        ${PrimaryBill_Logo}     timeout=30s
    Verify See Details Menu