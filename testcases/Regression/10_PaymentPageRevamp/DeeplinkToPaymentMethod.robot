*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/SharePackage.robot
Resource            ../../../variables/account.robot
Resource            ../../../variables/${ENV}/Deeplink.robot
Suite Setup         Check PreConditional
Test Teardown       Tear Down Test Cases
Suite Teardown      Close Application

*** Keywords ***
Check PreConditional
    [Documentation]    Pre Step to make sure user already login, check premission HomePage appear (TEST DOCUMENT)
        ...     |*TC IDs*|iOS TC054 - Android TC1194|
        ...     |*TC Type*| Positive Case| 
    [Tags]    Social_login    HomePage      Twitter     Android     iOS
    Reopen App      ${EMPTY}
    Check VOC Dispaly And Skip
    # Check Logout Default User
    Check Permission Location Display
    Quit Application
    BuiltIn.Sleep   5s

Valid Selected Result
  [Arguments]    ${element}       ${expected}
  Element Attribute Should Match      ${element}      selected   ${expected}

Verify Back From Payment Method
    Wait Until Page Contains        ${WCMS["label.global.header.payment_method"]}           timeout=30s
    Wait Until Page Contains Element        ${Btn_Buy_Package}      timeout=30s
    Wait Until Page Contains Element        ${Load_Content_Close}
    Click Element                           ${Load_Content_Close}
    Wait Until Page Contains Element        ${TabBar_Shop}      timeout=30s
    Valid Selected Result                   ${TabBar_Shop}      True

*** Test Cases ***
Verify Deeplink Payment Method Page
    [Documentation]    Verify Payment Method Page Using Deeplink Before Login
        ...     |TC Android|TC171  &  TC173|
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Go To Url                       ${Payment_Method_Page_DL}
    LoginCommonKeyWord.Verify Login Page
    Login Social Account FaceBook    0811893731     @330punG    kyueijob@gmail.com
    ${status}=      Run Keyword and Return Status    Wait Until Page Contains    SET TO ALWAYS OPEN    timeout=30s
    Run Keyword If      ${status}==True     Click Text    SET TO ALWAYS OPEN  
    Verify Back From Payment Method

Verify Deeplink Payment Method Page 2
    [Documentation]    Verify Payment Method Page Using Deeplink After Login
        ...     |TC Android|TC172  &  TC173|
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Go To Url                       ${Payment_Method_Page_DL}
    Verify Back From Payment Method

Verify Deeplink Family Plan Package
    [Documentation]    Verify Family Plan Package Using Deeplink
        ...     |TC Android|TC174|
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Go To Url                           ${Family_Plan_DL}
    Wait Until Page Contains Element    ${CheckBox_Family_Quota}    timeout=30s
    Click Element                       ${CheckBox_Family_Quota}
    Wait Until Page Contains Element    ${PhoneNumber_Icon}     timeout=30s
    Input Text          ${PhoneNumber_Slot}     ${TW2_Phonenumber}
    Click Element                   ${Button_CheckNumber_FamilyPlan}
    Wait Until Page Contains Element    ${Confirm_Button}      timeout=30s
    Click Element                       ${Confirm_Button}
    Wait Until Page Contains Element    ${Seekbar_Quota}  timeout=30s
    Wait Until Page Contains Element    ${Confirm_Button}
    Click Element                       ${Confirm_Button}
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}     timeout=30s
    Click Element                       ${Payment_Page_Continue_Pay}
    Wait Until Page Contains Element    ${Load_Content_Title}
    Wait Until Page Contains Element    ${Payment_Page_Continue_Pay}     timeout=30s     

Verify Deeplink Roaming Package
    [Documentation]    Verify Roaming Package Using Deeplink
        ...     |TC Android|TC175|
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Go To Url                               ${Roaming_Package_URL}
    Wait Until Page Contains Element        ${Btn_Buy_Package}  timeout=30s
    Click Element                           ${Btn_Buy_Package}
    Wait Until Page Contains Element        ${Checkbox_Active_Later}    timeout=30s
    Wait Until Page Contains Element        ${Checkbox_Active_Now}

Verify Deeplink Top Up Credit
    # note: user directed to credit details page and need to click but button to directed to payment method page. back button will bring user back to credit details page
    [Documentation]    Verify Top Up Credit Using Deeplink
        ...     |TC Android|TC176   TC177|
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Go To Url                       ${TopUp_Credit_DL}
    Wait Until Page Contains Element        ${Credit_Details_BuyBtn}    timeout=30s
    Click Element                   ${Credit_Details_BuyBtn}
    Wait Until Page Contains        ${WCMS["label.global.header.payment_method"]}           timeout=30s
    Wait Until Page Contains Element        ${Payment_Page_Continue_Pay}
    Wait Until Page Contains        ${WCMS["label.global.body.linkaja_title"]}
    Wait Until Page Contains        ${WCMS["emoneygopay"]}
    Wait Until Page Contains        ${WCMS["emoneyshopeepay"]}
    Scroll Down If Need
    Wait Until Page Contains        ${WCMS["emoneyovo"]}
    Wait Until Page Contains        ${WCMS["emoneydana"]}
    Click Element                   ${Load_Content_Close}
    Wait Until Page Contains Element        ${TabBar_Shop}      timeout=30s
    Valid Selected Result                   ${TabBar_Shop}      True

# Verify Deeplink Payment Method Billing
#     #note: need deeplink
#     [Documentation]    Verify Payment Method Billing Using Deeplink
#         ...     |TC Android|TC178|
#         ...     |TC Type|Positive Case|
#     # [Tags]      Android
#     Go To Url                       https://my.telkomsel.com/app/payment-method?link=71d6bcc6844a508eb83083fb618de0df
#     Wait Until Page Contains        

# note : TC179 & TC180 -> how to get error message?