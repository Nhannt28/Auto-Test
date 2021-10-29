*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/DetailSendgiftPage.robot
Resource            ../../../variables/${ENV}/SharePackage.robot
Resource            ../../../variables/account.robot
Resource            ./RoamingPackageKeyword.robot
Library    String
Library    Collections

Suite Setup         Check PreConditional
Test Setup          Launch Application
Test Teardown       Quit Application
Suite Teardown      Close Application

*** Keywords ***
Check PreConditional  
    Reopen App      ${EMPTY}
    Check Launching New version 
    Check Permission First Launch
    Check Tutup popup
    Check Reminder
    Check Tutup popup
    Check default lang and swtich 
    Check Banner on the login page
    Check Logined Default User
    Check Tutup popup
    Check Reminder
    Check Permission Location Display

*** Test Cases ***

Verify count card Package Populer Destination
    [Documentation]    Roaming Shop Off - Populer Destination
        ...     |TC Android|TC435  TC436   TC437    TC438| #TC439    TC440    TC441 - pending 
    [Tags]      Roaming
    Go to Shop Page
    Sleep  5
    ${Special_for_you}       Run Keyword And Return Status          Wait until page Contains        ${WCMS["shop_offer_title"]}   
    Run Keyword If       ${Special_for_you}==True       Swipe	    200	    1500	    200 	600	  1000
    Click Element                         ${Roaming_category} 
    Load Roaming package fail 
    Run Keyword And Return Status     Page Should Contain Text        ${WCMS["roaming_populer_destination_header"]}  
    Run Keyword And Return Status     Page Should Contain Text        ${WCMS["roaming_populer_destination_subtitle"]}  
    Swipe	    200	    1800	    200 	1000	  1000
    Count card Populer Destination
    Click Element             ${APP_PACKAGE}:id/iv_background
    Wait until page Contains             ${WCMS["roaming_detail_header_title"]}       timeout=30     
    Element Should Contain Text         ${Destination_headerTitle}           ${WCMS["roaming_detail_header_title"]}   
    Page Should Contain Text            ${WCMS["roaming_internet_title"]} 
    Go Back 
    Sleep  5 
    Swipe	    200	    1000	    200 	1800	  1000
    Page Should Contain Element            ${Roaming_category} 
    Page Should Contain Text               ${APP_PACKAGE}:id/iv_background

Verifying Package Populer Destination
    [Documentation]    Roaming Detail - Populer Destination
        ...     |TC Android|TC442    TC443    TC444    TC445    TC446|
    [Tags]      Roaming
    Go to Shop Page
    ${Special_for_you}       Run Keyword And Return Status          Wait until page Contains        ${WCMS["shop_offer_title"]}   
    Run Keyword If       ${Special_for_you}==True       Swipe	    200	    1500	    200 	600	  1000
    Click Element                         ${Roaming_category} 
    Load Roaming package fail 
    Run Keyword And Return Status     Page Should Contain Text        ${WCMS["roaming_populer_destination_header"]}  
    Run Keyword And Return Status     Page Should Contain Text        ${WCMS["roaming_populer_destination_subtitle"]}  
    Wait until page Contains element        ${APP_PACKAGE}:id/tv_label_see_all    timeout=30
    Click Element                ${APP_PACKAGE}:id/tv_label_see_all      
    Verify Destination Detail list             ${WCMS["roaming_popular_destination_title"]}   
    Wait until page Contains          ${Popular_item}        timeout=30
    ${title_country_package}          Get Text                ${Desc_Package_Detail}
    Click element    ${Popular_item} 
    ${not_availabel}       Run Keyword And Return Status          Wait until page Contains        ${WCMS["roaming_empty_page_title"]}   
    Run Keyword If       ${not_availabel}==True            Go Back
    Run Keyword If       ${not_availabel}==True           Wait until page Contains          ${Popular_item2}        timeout=30
    Run Keyword If       ${not_availabel}==True           ${title_country_package}           Get Text                ${Desc_Package_Detail}
    
    Run Keyword If       ${not_availabel}==True            Click element    ${Popular_item3}
    Element Should Contain Text         ${Destination_headerTitle}           ${WCMS["roaming_detail_header_title"]}   
    Element Should Contain Text         ${Title_country}                     ${title_country_package} 
    Page Should Contain Text        ${WCMS["roaming_internet_title"]} 

    Wait until page Contains element       ${Duration}      
    Click element           ${Duration}     
    ${Title_submenu}              Get Text           ${Duration}
    ${Internet_Exprite_Date}      Get Text           ${Package_ExpireDate}
    Log to console    ${Internet_Exprite_Date} 
    Run keyword and return status         ${Title_submenu}==${Internet_Exprite_Date}
    Sleep  1s
    ${Internet_Title_package}     Get Text         ${Package_offerTitle}
    ${Internet_Amout_package}     Get Text         ${Package_OfferAmout}
    ${Internet_Exprite_Date}      Get Text         ${Package_ExpireDate} 
    ${Internet_Price_package}     Get Text         ${Package_OfferPrice} 
    ${Internet_Type_package}      Get Text         ${Package_type}  
    
    Sleep  5
    Page Should Contain Text        ${WCMS["roaming_combo_title"]}
    Click Text           ${WCMS["roaming_combo_title"]}
    Sleep  5 

    Wait until page Contains     ${WCMS["roaming_internet_title"]}     timeout=30
    Click Text                ${WCMS["roaming_internet_title"]} 
    Click Element             ${Package_offerTitle}
    Wait until page Contains             ${Destination_headerTitle}     timeout=30
    Element Should Contain Text          ${Destination_headerTitle}          ${WCMS["package_detail_header"]}            
    Element Should Contain Text          ${Package_name}                ${Internet_Title_package} 
    Element Should Contain Text          ${Package_quota}               ${Internet_Amout_package} 
    Element Should Contain Text          ${Package_Price}               ${Internet_Price_package}
    Element Should Contain Text          ${Package_purchase_type}               ${Internet_Type_package}
    Swipe   500    1000    500    300    1000
    Page Should Contain Text            ${WCMS["roaming_schedule_activate_info"]}

Verifying Package Combined Destination    
    [Documentation]    Roaming Detail - Combined Destination    
        ...     |TC Android|TC447    TC448    TC449    TC450    TC451    TC452|
    [Tags]      Roaming
    Go to Shop Page
    ${Special_for_you}       Run Keyword And Return Status          Wait until page Contains        ${WCMS["shop_offer_title"]}   
    Run Keyword If       ${Special_for_you}==True       Swipe	    200	    1500	    200 	600	  1000
    Click Element                         ${Roaming_category} 
    Swipe	    200	    1800	    200 	300	  1000
    Wait until page Contains           ${WCMS["roaming_combine_destination_title"]}      timeout=30 
    Page Should Contain Text            ${WCMS["roaming_combine_destination_title"]}  
    Page Should Contain Text            ${WCMS["roaming_combine_destination_subtitle"]}  
    Wait until page Contains element        ${APP_PACKAGE}:id/tv_label_see_all    timeout=30
    Click Element                ${APP_PACKAGE}:id/tv_label_see_all  
    Verify Destination Detail list          ${WCMS["roaming_combine_destination_title"]} 
    Click element               ${Combined_item}  
    Sleep  5
    Element Should Contain Text         ${Destination_headerTitle}           ${WCMS["roaming_detail_combined_header_title"]}   
    Wait until page Contains element         ${Title_country}     timeout=30
    ${Title_Comnined_package}            Get Text        ${Title_country} 
    Log to console      ${Title_Comnined_package}             
    ${List_country}       Run Keyword And Return Status          Wait until page Contains       See All List
    Run Keyword If       ${List_country}==True      Click Text               See All List     
    ${title_popup}       Replace String         ${WCMS["roaming_pop_up_country_text"]}       %regionName%       ${Title_Comnined_package}
    Run Keyword If       ${List_country}==True     Run keyword And Continue On Failure        Page Should Contain Text     ${title_popup}
    Run Keyword If       ${List_country}==True     Click Text              ${WCMS["roaming_pop_up_country_button"]}   
    Page Should Contain Text        ${WCMS["roaming_internet_title"]} 

    Wait until page Contains element       ${Duration}      
    Click element           ${Duration}     
    ${Title_submenu}              Get Text           ${Duration}
    ${Internet_Exprite_Date}      Get Text           ${Package_ExpireDate}
    Log to console    ${Internet_Exprite_Date} 
    Run keyword and return status         ${Title_submenu}==${Internet_Exprite_Date}
    Sleep  1s

    ${Internet_Title_package}     Get Text         ${Package_offerTitle}
    ${Internet_Amout_package}     Get Text         ${Package_OfferAmout}
    ${Internet_Exprite_Date}      Get Text         ${Package_ExpireDate} 
    ${Internet_Price_package}     Get Text         ${Package_OfferPrice} 
    ${Internet_Type_package}      Get Text         ${Package_type}  

    Page Should Contain Text        ${WCMS["roaming_combo_title"]}
    Click Text           ${WCMS["roaming_combo_title"]}
    Wait until page Contains     ${WCMS["roaming_internet_title"]}     timeout=30
    Click Text                ${WCMS["roaming_internet_title"]} 
    Click Element             ${Package_offerTitle}
    Wait until page Contains             ${Destination_headerTitle}     timeout=30
    Element Should Contain Text          ${Destination_headerTitle}          ${WCMS["package_detail_header"]}            
    Element Should Contain Text          ${Package_name}                ${Internet_Title_package} 
    Element Should Contain Text          ${Package_quota}               ${Internet_Amout_package} 
    Element Should Contain Text          ${Package_Price}               ${Internet_Price_package}
    Element Should Contain Text          ${Package_purchase_type}               ${Internet_Type_package}

Verify Roaming Package emty 
    [Documentation]    Roaming Detail (Country and Region)-Empty state only in tab Internet / Combo 
        ...     |TC Android|TC455|
    [Tags]      Roaming
    Go to Shop Page
    ${Special_for_you}       Run Keyword And Return Status          Wait until page Contains        ${WCMS["shop_offer_title"]}   
    Run Keyword If       ${Special_for_you}==True       Swipe	    200	    1500	    200 	600	  1000
    Click Element                         ${Roaming_category} 
    Load Roaming package fail 
    Run Keyword And Return Status     Page Should Contain Text        ${WCMS["roaming_populer_destination_header"]}  
    Run Keyword And Return Status     Page Should Contain Text        ${WCMS["roaming_populer_destination_subtitle"]}  
    Wait until page Contains element        ${APP_PACKAGE}:id/tv_label_see_all    timeout=30
    Click Element            ${APP_PACKAGE}:id/tv_label_see_all      
    Wait until page Contains element          ${Popular_item_emty}        timeout=30
    Click element    ${Popular_item_emty} 
    ${empty}      Run keyword and return status         Wait until page Contains          ${WCMS["roaming_empty_page_title"]}     timeout=30
    Run keyword If      ${empty}==True       Page Should Contain Text          ${WCMS["roaming_empty_page_text"]}     
    Run keyword If      ${empty}==True       Click Text               ${WCMS["roaming_empty_page_button_text"]}      
    Run keyword If      ${empty}==True       Page Should Contain Element      ${Roaming_category}  
