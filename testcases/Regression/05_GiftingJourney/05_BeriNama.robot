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
Resource            ../../KeyWord/OTPConfirmPopupKeyWord.robot

Suite Setup         Check PreConditional
Suite Teardown      Close Application
Test Setup          Go to Send Gift Page
Test Teardown       Tear Down Test Cases



*** Variables ***

#Send Gift Page
${Valid_Phone_Number}           081211063948     
${Favorit_Number}               6281394074354 
${Transaction_Number}           6281394074354 

${touch_outside}                ${APP_PACKAGE}:id/touch_outside
${First_Name}            Siam
${Last_Name}             Robert

${section_rename_phonenumber}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout


*** Keywords ***

Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    SendGift
    Reopen App      ${EMPTY}
    Check Reminder
    Check Logined Default User
    Check Permission Location Display
    Check VOC Dispaly And Skip
    BuiltIn.Sleep   10s




*** Test Cases ***  
Check bottom dialog to saved number
    [Documentation]    Check bottom dialog to saved number  
        ...     |*TC IDs*|Android TC563    TC564    TC565    TC566|
        ...     |*TC IDs*|iOS TC1701   TC1702    TC1703    TC1704|
        ...     |*TC Type*|Negative Case| 
    [Tags]    Rename
    Check Send Gift page
    RBFindElement.find text in section android    ${section_rename_phonenumber}     ${Transaction_Number} 
    RBFindElement.find element in section android    ${section_rename_phonenumber}     ${Rename_label}  
    Click Element                           ${Rename_label} 
#show bottom dialog to saved number
    Wait until page contains                ${WCMS["send_gift_save_number_title"]}
    Wait until page contains                ${WCMS["send_gift_save_number_text"]}        
    Wait until page contains                ${WCMS["send_gift_save_number_confirm_text"]}
    Wait until page contains                ${WCMS["global_cancelation_text"]}
    Click Text                              ${WCMS["send_gift_save_number_confirm_text"]}
#directed to save contact apps
    Wait until page contains Element        ${Create_New_Contact_title}
    Hide Keyboard
    Wait until page contains Element        ${Editor_menu_save_button}
    Wait until page contains Element        ${First_Name_TextField}
    Wait until page contains Element        ${Last_Name_TextFiled} 
    Click Element                           ${First_Name_TextField}    
    Input Text                              ${First_Name_TextField}    ${First_Name}
    Wait until page contains                ${First_Name}
    Click Element                           ${Last_Name_TextFiled}
    Input Text                              ${Last_Name_TextFiled}        ${Last_Name}
    Wait until page contains                ${Last_Name}
    Click Element                           ${Editor_menu_save_button}
    Wait until page contains Element        ${photo_touch_intercept_overlay}
    Wait until page contains Element        ${title_gradienty}
    Go Back
    Wait until page contains                ${WCMS["send_gift_save_number_success_text"]}
    RBFindElement.find text in section android    ${last_transaction_section}     ${First_Name}



