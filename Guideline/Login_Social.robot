*** Settings ***
Resource    ../../resources/controller.robot
Resource    ../../variables/${ENV}/account_menu_variables.robot
Test Setup    Initialize System

*** Keywords ***
Initialize System
  Open App
#  wait until page contains  ${Access_galary}  timeout=10
  Wait until page contains    ${Accept_Access_galary}    timeout=30
  Click Element    ${Accept_Access_galary}
  Wait until page contains element  ${Button_Login}
  Click element  ${Button_Login}
  Wait until page contains element    ${Login_phone_text_field}
  Click Element    ${Login_phone_text_field}
  Input text    ${Login_phone_text_field}    ${phone_number_1}
  Click element    ${Login_Continue_btn}
  Wait until page contains    ${Navigation_Account_Menu}    timeout=30
  Click element    ${Navigation_Account_Menu}
Version should be matching
  Wait until page contains    ${Application_Version}    timeout=30
  Element Should Contain Text    ${Application_Version}    V.5.6
#Account language should be matching
#  wait until page contains    ${account_language}    timeout=10
#  element text should be    ${account_language}    EN
#Phone number should be matching
#  wait until page contains    ${Card_Front_Msisdn}    timeout=10
#  element text should be    ${Card_Front_Msisdn}    ${phone_number_1}
#Active date should be matching
#  wait until page contains    ${Active_date}    timeout=10
#  element text should be    ${Active_date}    Active Until 17/08/2021
#See PUK label should be matching
#  wait until page contains    ${See_PUK}    timeout=10
#  element text should be    ${See_PUK}    See PUK
#Add Number button should be matching
#  wait until page contains    ${Add_Number}    timeout=10
#  element text should be    ${Add_Number}    Add Number
#Validate list menu
#  Page should contain text    ${Menu1_EN}
#  Page should contain text    ${Menu2_EN}
#  Page should contain text    ${Menu3_EN}
#  Page should contain text    ${Menu4_EN}
#  Page should contain text    ${Menu5_EN}
#  Page should contain text    ${Menu6_EN}
#  Swipe by percent    50    50    50    30
#  Page should contain text    ${Menu7_EN}
#  Swipe by percent    50    30    50    50
#Validate sub title
#  Page should contain text    ${Sub_title_prepaid_EN}
#Change language from EN to ID
#  Wait until page contains element    ${Change_language_btn}    timeout=10
#  Click element    ${Change_language_btn}
#  Wait until page contains    ${Language_ID}    timeout=10
#  Click element    ${Language_ID}
#Check result for EN to ID
#  Wait until page contains element    ${List_Menu}
#  Page should contain text    ${Menu1_ID}
#  Page should contain text    ${Menu4_ID}
#  Swipe by percent    50    50    50    30
#  Page should contain text    ${Menu7_ID}
#  Swipe by percent    50    30    50    50
#Change language from ID to EN
#  Wait until page contains element    ${Change_language_btn}    timeout=10
#  Click element    ${Change_language_btn}
#  Wait until page contains    ${Language_EN}    timeout=10
#  Click element    ${Language_EN}
#Check result for ID to EN
#  Wait until page contains element    ${List_Menu}
#  Page should contain text    ${Menu1_EN}
#  Page should contain text    ${Menu4_EN}
#  Swipe by percent    50    50    50    30
#  Page should contain text    ${Menu7_EN}
#  Swipe by percent    50    30    50    50
#Click See PUK
#  Click element    ${See_PUK}
#Check PUK information
#  Wait until page contains element    ${PUK_1}
#  element text should be    ${PUK_1}    PUK 1
#  Wait until page contains element    ${PUK_2}
#  element text should be    ${PUK_2}    PUK 2
#  Element text should be    ${PUK_Text1}    2218-2479
#  Element text should be    ${PUK_Text2}    8041-3013
#Click Account Management menu
#  Click element    ${Menu1_EN}
#Validate Account Management sub-list menu
#  Page should contain text

*** Test Cases ***
Should open account menu and then check version
  Version should be matching

#Should open account menu and then check account language
#  [Tags]    abc
#  Account language should be matching
#Should open account menu and then check phone number
#  [Tags]    abc
#  Phone number should be matching
#Should open account menu and then check active date
#  Active date should be matching
#Should open account menu and then check See PUK label
#  See PUK label should be matching
#Should open account menu and then check Add Number button
#  Add Number button should be matching
#Should open account menu and then check list menu
#  Validate list menu
#Should open account menu and then check sub title
#  Validate sub title
#Change language and then check for change
#  Change language from EN to ID
#  Check result for EN to ID
#  Change language from ID to EN
#  Check result for ID to EN
#Change display simcard and then check information
#  Click See PUK
#  Check PUK information
#Should click on Account Management menu and then Check sub-list Menu
#  Click Account Management menu
#  Validate Account Management sub-list menu