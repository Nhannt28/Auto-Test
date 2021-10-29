*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/SharePackage.robot
Resource            ../../../variables/account.robot
Suite Setup         Check PreConditional
Test Setup          Launch Application
Test Teardown       Tear Down Test Cases
Suite Teardown      Close Application

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
Enable Share Package
    [Documentation]    Enabling Share Package With Encrypt Deeplink
        ...     |TC Android|TC291|
        ...     |TC Type|Positive Case|
    [Tags]      Android
    Wait Until Page Contains Element        ${TabBar_Shop}  timeout=30s
    Click Element                           ${TabBar_Shop}
    Wait Until Page Contains Element        ${First_Package}      timeout=30s
    ${Special_for_you}       Run Keyword And Return Status          Wait until page Contains          Special for You 
    Run Keyword If       ${Special_for_you}==True       Swipe	    200	    1800	    200 	600	  1000
    Click Element                           ${First_Package}
    Wait Until Page Contains Element        ${Load_Content_Title}   timeout=30s
    Wait Until Page Contains Element        ${ShareLink_Button}
    Click Element                           ${ShareLink_Button}
    Wait Until Page Contains Element        ${ShareContent_Title}   timeout=30s
    Wait Until Page Contains Element        ${ShareContent_Preview}
    Wait Until Page Contains Element        ${ShareContent_Copy_Button}
    Press Keycode                           4