*** Settings ***
Library     ../libraries/RBFindElement.py
Library     ../libraries/RPString.py

Resource    ../resources/controller.robot
Resource    ../variables/${ENV}/LoginPage.robot
Resource    ../variables/${ENV}/HomePage.robot
Resource    ../variables/${ENV}/Common.robot
Resource    ./Regression/01_Login/LoginCommonKeyWord.robot\
Resource    ./KeyWord/ShopPageKeyWord.robot

*** variables ***
${Gifting_Journey_SubCategory_List}                ${APP_PACKAGE}:id/rv_subcategory_menu	
${Tutup_Btn}            ${APP_PACKAGE}:id/insider_adjacent1
${IRIS_2}      IRIS 2
${IRIS_FamilyPlan_Package}  Prepaid Family Plan Main (Basic) - Revamp

*** Keywords ***
Initialize System
  Open App
  Check Launching New version 
  Check Tutup popup
  Check Permission First Launch

Check Launching New version 
  ${Skip}       Run Keyword And Return Status       Wait until page contains  ${WCMS["onboarding_skip_button"]}
  Run Keyword If      ${Skip}==True     Click Text      ${WCMS["onboarding_skip_button"]}
Check Permission First Launch
  Run Keyword If      '${ENV}'=='ios'       Check Permission iOS
  Run Keyword If      '${ENV}'=='android'      Check Permission Android
  # ${Permission}   Run Keyword And Return Status   Wait until page contains element   ${MakeCall_Permission}
  # Run Keyword If      ${Permission}==True       Check Permission Android

Check Tutup popup
  ${Tutup}       Run Keyword And Return Status       Wait until page contains element  ${Tutup_Btn} 
  Run Keyword If      ${Tutup}==True       Click Element            ${Tutup_Btn}
Check Permission iOS
  Wait until page contains    ${Location_Permission}    timeout=30
  Click Element    ${Accept_Location_Permission}
  Wait until page contains    ${Notification_Permission}    timeout=30
  Click Element    ${Accept_Notification_Permission}

Check Permission Android
  ${Permission}       Run Keyword And Return Status       Wait until page contains  ${MakeCall_Permission}
  Run Keyword If      ${Permission}==True       Verify Permission Android

Verify Permission Android
  Wait until page contains    ${MakeCall_Permission}     timeout=30
  Click Element    ${MakeCall_Permission_Allow}
  Wait until page contains    ${Photo_Permission}     timeout=30
  Click Element    ${Photo_Permission_Allow}

Switch WebView Context
  ${all_contexts}=     get contexts
  log to console      ${all_contexts}
  #switch to context   ${all_contexts}[1]

Check Banner on the login page             #splash
  ${banner}       Run Keyword And Return Status          Wait until page contains        ${WCMS["onboarding_skip_button"]}      timeout=30
  Run Keyword If       ${banner}==True                   Click Text                      ${WCMS["onboarding_skip_button"]}

Check default lang and swtich 
  ${Lang}       Run Keyword And Return Status           Wait until page Contains          ID      timeout=30
  Run Keyword If       ${Lang}==True       Click Text               ID 
  Run Keyword If       ${Lang}==True       Click Text               (United States)
  Run Keyword If       ${Lang}==True       Wait until page Contains          EN             timeout=30
  Run Keyword If       ${Lang}==True       Wait until page Contains          EN             timeout=30

Logout Application From Menu
  Click Element    ${TabBar_Menu}
  BuiltIn.Sleep   2s
  Swipe	    200	    1200	    200 	400	  1000
  Click Element    ${Menu_Setting}
  # ${str1} =	Convert To Upper Case	${WCMS["account_application_setting_text"]}
  ${Notif}       Run Keyword And Return Status       Wait until page contains element    ${insider_single_btn}
  Run Keyword If      ${Notif}==True       Verify Promo InApp Notif
  ${error_api}   Run keyword and return status         Wait until page contains    ${WCMS["account_application_setting_header"]}   timeout=30
  Run Keyword If      ${error_api}==False              Click           ${WCMS["global_button_text"]}  
  Wait until page contains    ${WCMS["account_application_setting_header"]}   timeout=30
  Click Element    ${Setting_logout}
  BuiltIn.Sleep   2s

Click Got It Btn in SendGift Page
  ${Got_it}       Run Keyword And Return Status       Wait until page contains    ${coachmark_Btn} 
  Run Keyword If      ${Got_it}       Click Text        ${coachmark_Btn} 
#Display when click Menu bar
Verify Promo InApp Notif
  Wait until page contains element    ${insider_single_btn}
  Wait until page contains element    ${closeBt_btn}
  Click Element                       ${closeBt_btn}

Tear Down Test Cases
  BuiltIn.Sleep   3s
  Quit Application

Tear Down Test Cases And Logout
  BuiltIn.Sleep   3s
  Logout Application From Menu
  Quit Application


Scroll Up If Need
    Swipe	    200	    100	    200 	400	  1000
    

Scroll Down If Need
    Swipe	    200	    400	    200 	100	  1000
    


Check Logined User
  [Arguments]    ${LinkAccount_Phonenumber}    ${Phonenumber}   ${Account}     ${Password}     ${Email}
  ${Result}   Run Keyword And Return Status   Wait until page contains    ${LinkAccount_Phonenumber}   timeout=30 
  Run Keyword If      ${Result}==False      Check Current In HomePage To Logout and Login    ${LinkAccount_Phonenumber}    ${Phonenumber}   ${Account}     ${Password}     ${Email}

Check Current In HomePage To Logout and Login
    [Arguments]    ${LinkAccount_Phonenumber}    ${Phonenumber}   ${Account}     ${Password}     ${Email}
    ${Result}   Run Keyword And Return Status   Wait until page contains element    ${TabBar_Menu}   timeout=5
    Run Keyword If      ${Result}==True      Logout Application From Menu    
    Check First Time Install App And Login    ${LinkAccount_Phonenumber}    ${Phonenumber}   ${Account}     ${Password}     ${Email}

Check First Time Install App And Login
  [Arguments]    ${LinkAccount_Phonenumber}    ${Phonenumber}   ${Account}     ${Password}     ${Email}
  ${Result}   Run Keyword And Return Status     Check Permission First Launch
  Login Social Account Twitter    ${Phonenumber}   ${Account}     ${Password}     ${Email}
  Wait until page contains    ${LinkAccount_Phonenumber}   timeout=30  


Check Logined Default User
  ${Result}   Run Keyword And Return Status   Wait until page contains    ${TW_LinkAccount_Phonenumber}   timeout=30 
  Run Keyword If      ${Result}==False      Check First Time Install App And Login    ${TW_LinkAccount_Phonenumber}    ${TW_Phonenumber}   ${TW_Account}     ${TW_Password}     ${TW_Email}

Check Logined Default UserTW3
  ${Result}   Run Keyword And Return Status   Wait until page contains    ${TW3_LinkAccount_Phonenumber}   timeout=30 
  Run Keyword If      ${Result}==False      Check First Time Install App And LoginTW3    ${TW3_LinkAccount_Phonenumber}    ${TW3_Phonenumber}   ${TW3_Account}     ${TW3_Password}     ${TW3_Email}

Check First Time Install App And LoginTW3
  [Arguments]    ${TW3_LinkAccount_Phonenumber}    ${TW3_Phonenumber}   ${TW3_Account}     ${TW3_Password}     ${TW3_Email}
  ${Result}   Run Keyword And Return Status     Check Permission First Launch
  Login Social Account Twitter    ${TW3_Phonenumber}   ${TW3_Account}     ${TW3_Password}     ${TW3_Email}
  Wait until page contains    ${TW3_LinkAccount_Phonenumber}   timeout=60      

Check VOC Dispaly And Skip
  ${Result}   Run Keyword And Return Status   Wait until page contains    ${WCMS["voc_scale_rating_default"]}    timeout=20 
  Run Keyword If      ${Result}==True      Click Element    ${VOC_Skip}
  
Check Permission Location Display
  ${Result}   Run Keyword And Return Status   Wait until page contains    ${Location_Permission}     timeout=15 
  Run Keyword If      ${Result}==True      Click Element    ${Location_Permission_Allow}

Valid CheckBox Result
  [Arguments]    ${element}       ${expected}
  Run Keyword If      '${ENV}'=='android'      Element Attribute Should Match      ${element}      checked   ${expected}
  Run Keyword If      '${ENV}'=='ios'          Valid CheckBox Result iOS      ${element}       ${expected}


Valid CheckBox Result iOS
  [Arguments]    ${element}       ${expected}
  ${att}=     Get Element Attribute      ${element}        value 
  Run Keyword If      '${expected}'=='true'     Should Be True    ${att}==1
  Run Keyword If      '${expected}'=='false'     Should Be True    ${att}==None

Check Button Clickable 
  [Arguments]    ${element}       ${expected}
  Run Keyword If      '${ENV}'=='android'     Element Attribute Should Match      ${element}      clickable   ${expected}
  Run Keyword If      '${ENV}'=='ios'     Element Attribute Should Match      ${element}      enabled   ${expected}

Go To KuotaKeluarga Page
    Go to Shop Page
    Verify GUI Shop Page
    Wait Until Page Contains Element    ${Gifting_Journey_SubCategory_List}  timeout=30s
    ${Special_for_you}       Run Keyword And Return Status          Wait until page Contains          Special for You 
    Run Keyword If       ${Special_for_you}==True       Swipe	    200	    1800	    200 	600	  1000
    Click Text                          ${IRIS_2}
    Wait Until Page Contains            ${IRIS_FamilyPlan_Package}  timeout=30s
    Click Text                          ${IRIS_FamilyPlan_Package}

Verify See Details Menu
    Wait Until Page Contains Element    ${Detail_Payment_Title}     timeout=30s
    Click Element                       ${Detail_Payment_Title}
    Wait Until Page Contains Element    ${Product_Name_Detail_Payment}    timeout=30s
    Wait Until Page Contains Element    ${Product_Quota_Detail_Payment}
    Wait Until Page Contains Element    ${BtnOK_Detail_Payment}
    Click Element                       ${BtnOK_Detail_Payment}  

Verify Package Detail
    Wait Until Page Contains Element    ${Load_Content_Title}   timeout=60s
    Wait Until Page Contains Element    ${Desc_Package_Detail}
    Wait Until Page Contains Element    ${Icon_Package_Detail}
    Wait Until Page Contains Element    ${Quota_Package_Detail}
    Wait Until Page Contains            ${WCMS["shop_package_detail_description_tab"]}
    Wait Until Page Contains Element    ${Terms_&_Conditions}
    Wait Until Page Contains Element    ${Total_Price_Package}
    Wait Until Page Contains Element    ${Btn_Buy_Package}

Verify VOC GUI
    [Documentation]    Verify Login Page #TC470
    Wait until page contains    ${WCMS["voc_heading"]}    timeout=30
    Wait until page contains    ${WCMS["voc_feedback"]}
    Wait until page contains    ${WCMS["voc_login_text"]}
    Wait until page contains    ${WCMS["voc_scale_rating_default"]}
    Wait until page contains    ${WCMS["skip"]}
    Click Element    ${VOC_rating}
    Click Element    ${VOC_Continue}
    Wait until page contains    ${WCMS["voc_buy_package_text"]}    timeout=30
    Wait until page contains    ${WCMS["voc_notice"]}
    Wait until page contains    ${WCMS["voc_rating"]}
    Wait until page contains    ${WCMS["not_likely_title"]}
    Wait until page contains    ${WCMS["very-likely.title"]}
    Wait until page contains    ${WCMS["voc_textarea_text"]}
    Wait until page contains    ${WCMS["feedback2_title_fourth"]}
    Wait until page contains    ${WCMS["label.global.button.submit"]}
    Wait until page contains    ${WCMS["skip"]}

    Click Element    ${VOC_textField}
    Input text    ${VOC_textField}   test comment
    Swipe	500	    400	    500 	0	1000
    Click Element    ${VOC_Submit}
    Wait until page contains    ${WCMS["voc_success_feedback"]}    timeout=30
    Wait until page contains    ${WCMS["voc_thankyou_text"]}
    Wait until page contains    ${WCMS["voc_rate_text_android"]}
    Wait until page contains    ${WCMS["payment-go-to-dashboard"]}
    Click Element    ${VOC_Home}

Skip VOC GUI
    ${Result}   Run Keyword And Return Status   Wait until page contains    ${WCMS["voc_scale_rating_default"]}    timeout=30
    Run Keyword If      ${Result}==True       Click Element    ${VOC_Skip}

Check Logout Default User
    ${Result}   Run Keyword And Return Status   Wait until page contains element    ${TW_LinkAccount_Phonenumber}   timeout=30
    Run Keyword If      ${Result}==True      Logout Application From Menu  

Notify Home Page
  ${notify_1}         Run Keyword And Return Status          Wait until page Contains element      ${notify}    timeout=30
  Run Keyword If       ${notify_1}==True                     Click element       ${Close} 
