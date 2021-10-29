*** Settings ***
Resource            ../../CommonKeyWord.robot
Resource            ../../../variables/${ENV}/LoginPage.robot
Resource            ../../../variables/${ENV}/HomePage.robot
Resource            ../../../variables/${ENV}/ShopPage.robot
Resource            ../../../variables/${ENV}/DetailSendgiftPage.robot
Resource            ../../../variables/${ENV}/SharePackage.robot
Resource            ../../../variables/account.robot
Resource            ./PoinKeyword.robot
Library    String
Library    Collections

Suite Setup         Check PreConditional
Test Setup          Go to Poin page 
Test Teardown       Go Back 
Suite Teardown      Quit Application

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

*** Variables ***

${icon_Voucher}           //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]                       
${icon_Coupon}            //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[2]  
${icon_Search}           //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[3]  
${tab_My_vouncher}       //android.widget.LinearLayout[@content-desc="My Voucher"] 
${tab_History}           //android.widget.LinearLayout[@content-desc="History"]
${tab_My_coupon}         //android.widget.LinearLayout[@content-desc="My Coupon"] 

*** Test Cases ***

# Active Poin 
#     [Documentation]    Home POIN Revamp-Header and ordering
#         ...     |TC Android|TC181  TC182   TC183    TC184|
#     [Tags]      Poin
#     Wait until page Contains element        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TextView[2]
#     ${Active_poin}            Get Text           //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TextView[2]
#     Log to console       ${Active_poin}  
#     Run keyword If       "${Active_poin}" == "${WCMS["poin_activate_button"]}"        Active Poin
    
# Verify Poin Page with 3 icon menu
#     [Documentation]   Home POIN Revamp-Header and ordering
#         ...     |TC Android|TC185    TC188|
#     [Tags]      Poin
#     Wait until page Contains element            ${APP_PACKAGE}:id/rv_poin_utilization     timeout=30
#     Wait until page Contains element            ${icon_Voucher}             timeout=20
#     Click element                               ${icon_Voucher} 
#     Wait until page Contains element            ${APP_PACKAGE}:id/tv_headerTitle      timeout=30
#     Element Should Contain Text                 ${APP_PACKAGE}:id/tv_headerTitle         ${WCMS["detail_loyalty_header"]}  
#     Wait until page Contains element            ${tab_My_vouncher}           timeout=30
#     Element Attribute Should Match              ${tab_My_vouncher}      selected           true
#     Page Should Contain Text                    ${WCMS["my_vouchers_list_veronika_info_text"]} 
#     Element Attribute Should Match              ${tab_History}          selected           false
#     Element Attribute Should Match              ${tab_My_coupon}       selected            false
#     Go Back
#     Wait until page Contains element            ${icon_Coupon}             timeout=20
#     Click element                               ${icon_Coupon} 
#     Wait until page Contains element            ${APP_PACKAGE}:id/tv_headerTitle      timeout=30
#     Element Should Contain Text                 ${APP_PACKAGE}:id/tv_headerTitle         ${WCMS["detail_loyalty_header"]}  
#     Wait until page Contains element            ${tab_My_coupon}           timeout=30
#     Element Attribute Should Match              ${tab_My_coupon}      selected           true
#     Element Attribute Should Match              ${tab_History}        selected           false
#     Element Attribute Should Match              ${tab_My_vouncher}       selected          false
#     Go Back
#     Wait until page Contains element            ${icon_Search}             timeout=20
#     Click element                               ${icon_Search} 
#     Wait until page Contains element            ${APP_PACKAGE}:id/tv_headerTitle      timeout=30
#     Element Should Contain Text                 ${APP_PACKAGE}:id/tv_headerTitle      Search Rewards    
#     Page Should Contain Text                    ${WCMS["search_reward_choose_category"]} 
#     Go Back
#     Sleep  5

# Verify Poin Page with total poin 
#     [Documentation]    Home POIN Revamp-Header and ordering
#         ...     |TC Android|TC190    TC196|
#     [Tags]      Poin
#     Wait until page Contains element            ${APP_PACKAGE}:id/llPointActive   timeout=30
#     Page Should Contain element                 ${APP_PACKAGE}:id/iv_tierIcon
#     Page Should Contain element                 ${APP_PACKAGE}:id/tv_loyaltypoin_summary
#     ${total_poin}            Get Text            ${APP_PACKAGE}:id/tv_loyaltypoin_summary     
#     Log to console           ${total_poin}      
#     Page Should Contain element                 ${APP_PACKAGE}:id/iv_chevron_right
#     Click element                               ${APP_PACKAGE}:id/llPointActive
#     Wait until page Contains element            ${APP_PACKAGE}:id/tv_headerTitle      timeout=30
#     Element Should Contain Text                 ${APP_PACKAGE}:id/tv_headerTitle         ${WCMS["detail_loyalty_header"]}  
#     Wait until page Contains element            ${tab_History}           timeout=30
#     Element Attribute Should Match              ${tab_History}      selected           true
#     Page Should Contain Text                    ${WCMS["detail_loyalty_tab_history"]} 

# Verify Header sticky
#     [Documentation]    Home POIN Revamp-Header and ordering
#         ...     |TC Android|TC195    |
#     [Tags]      Poin
#     Wait until page Contains element            ${APP_PACKAGE}:id/ll_contentRewardPoint        timeout=30
#     Swipe	    200	    1800	    200 	600	  1000
#     Page Should Contain element                 ${APP_PACKAGE}:id/ll_contentRewardPoint
#     Swipe	    200	    600	    200 	1800	  1000
#     # Go Back 

Verify Promotion Page
    [Documentation]    Home POIN Revamp-Header and ordering and POIN - Information for stock
        ...     |TC Android|TC200/TC198    TC199    TC201    TC202    TC203    TC204|
    [Tags]      Poin
    Element Attribute Should Match              ${TabBar_Reward}      selected           true
    Wait until page Contains element            ${APP_PACKAGE}:id/fragment_promo_card    timeout=30
    Page Should Contain element                 ${APP_PACKAGE}:id/rl_showFstByCategory
    Page Should Contain element                 ${APP_PACKAGE}:id/rv_fst_entertainment_category
    ${Fst_Category}                Get Text                     ${APP_PACKAGE}:id/tv_chip_title
    Log to console           ${Fst_Category}     
    Page Should Contain element                 ${APP_PACKAGE}:id/fl_fst_hotoffer_card
    Page Should Contain element                 ${APP_PACKAGE}:id/rl_fstHotOfferBodyContainer
    View All by Category
    Wait until page Contains element            ${APP_PACKAGE}:id/tv_fstHotOfferCardTitleText
    ${Title_promocard}                Get Text                   ${APP_PACKAGE}:id/tv_fstHotOfferCardTitleText
    Log to console           ${Title_promocard}           
    ${Poin_promocard}                Get Text                   ${APP_PACKAGE}:id/tv_fstHotOfferCardPoin 
    Log to console           ${Poin_promocard}            
    Sleep  5 
    Click element             ${APP_PACKAGE}:id/rl_fstHotOfferBodyContainer
    Wait until page Contains element             ${APP_PACKAGE}:id/tv_headerTitle        timeout=30
    Page Should Contain element                ${APP_PACKAGE}:id/iv_itemHeartIcon
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_headerTitle         ${WCMS["rewards_detail_header"]}
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_title               ${Title_promocard} 
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_point_value         ${Poin_promocard} 
    Page Should Contain element                    com.telkomsel.mytelkomsel:id/tv_remaining_stock
    Page Should Contain element                    com.telkomsel.mytelkomsel:id/tv_stockPoin
    Log to console                Get Text                 com.telkomsel.mytelkomsel:id/tv_stockPoin
    Swipe  	    200	    1800	    200 	800	  1000
    ${Location}            Run keyword and return status             Page Should Contain element                com.telkomsel.mytelkomsel:id/explayout_location_usage
    Run Keyword If             ${Location}==True              Verify Location about Promotion
    Verify Term and Condition

Verify Rewards Category 
    [Documentation]    Browse Poin/Rewards Category 
        ...     |TC Android|    TC205    206    207    208    209    210    211    212|
    [Tags]      Poin2
    Swipe  	    200	    500	    200 	1800	  1000
    Page Should Contain element              com.telkomsel.mytelkomsel:id/fragment_explore_rewards
    Page Should Contain element              com.telkomsel.mytelkomsel:id/rl_container
    Page Should Contain element              com.telkomsel.mytelkomsel:id/cv_item_explore_rewards
    Wait until page Contains element         ${APP_PACKAGE}:id/rv_catalog        timeout=30
    Page Should Contain element              ${APP_PACKAGE}:id/cv_item_explore_rewards
    Page Should Contain element              ${APP_PACKAGE}:id/tv_title
    Wait until page Contains            ${WCMS["rewards-page.explore-section.travel.title"]}     timeout=30
    # Click Text                 ${WCMS["rewards-page.explore-section.travel.title"]} 
    # ${name_category}               Get Text          ${APP_PACKAGE}:id/tv_title
    # Click element                  ${APP_PACKAGE}:id/iv_icon
    # Wait until page Contains element             ${APP_PACKAGE}:id/tv_headerTitle        timeout=30
    # Element Should Contain Text             ${APP_PACKAGE}:id/tv_headerTitle      ${WCMS["label.telkomsel_poin_page_app.body.choose_category"]}          
    # Element Attribute Should Match                     //android.widget.LinearLayout[@content-desc="Travelling"]      selected        true

    RBFindElement.click text in section android            com.telkomsel.mytelkomsel:id/rl_container            Travelling        com.telkomsel.mytelkomsel:id/iv_icon
    Element Should Contain Text             ${APP_PACKAGE}:id/tv_headerTitle      ${WCMS["label.telkomsel_poin_page_app.body.choose_category"]}          
    Element Attribute Should Match                     //android.widget.LinearLayout[@content-desc="Travelling"]      selected        true
    Go Back
    Sleep  3
    Verify Poin Category Page

Verify Card Poin
    [Documentation]    Card poin - Promotion Banner Card
        ...     |TC Android|    TC213    TC214    215    216    217    218    219|
    [Tags]      Poin2
    Swipe  	    200	    1800	    200 	500	  1000
    Wait until page Contains            ${WCMS["rewards_nearby_title"]}     timeout=30 
    Page Should Contain element             com.telkomsel.mytelkomsel:id/rl_showFstByCategory
    Page Should Contain element             com.telkomsel.mytelkomsel:id/tv_label_see_all
    Page Should Contain element             com.telkomsel.mytelkomsel:id/rv_fst_category_general
    Page Should Contain element              com.telkomsel.mytelkomsel:id/tv_fst_hotoffer_poinCategory
    Page Should Contain element            ${APP_PACKAGE}:id/tv_fstHotOfferCardTitleText
    Page Should Contain element              com.telkomsel.mytelkomsel:id/iv_fst_hotoffer_contentImage
    Page Should Contain element               com.telkomsel.mytelkomsel:id/iv_fstHotOfferCardIcon
    Page Should Contain element             com.telkomsel.mytelkomsel:id/tv_fstHotOfferCardPoin
    Page Should Contain element              com.telkomsel.mytelkomsel:id/tv_fstHotOfferCardPoinText
    Wait until page Contains element            ${APP_PACKAGE}:id/tv_fstHotOfferCardTitleText
    ${Title_promocard}                Get Text                   ${APP_PACKAGE}:id/tv_fstHotOfferCardTitleText
    Log to console           ${Title_promocard}           
    ${Poin_promocard}                Get Text                   ${APP_PACKAGE}:id/tv_fstHotOfferCardPoin 
    Log to console           ${Poin_promocard}            
    Sleep  5 
    Click element             ${APP_PACKAGE}:id/rl_fstHotOfferBodyContainer
    Wait until page Contains element             ${APP_PACKAGE}:id/tv_headerTitle        timeout=30
    Page Should Contain element                ${APP_PACKAGE}:id/iv_itemHeartIcon
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_headerTitle         ${WCMS["rewards_detail_header"]}
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_title               ${Title_promocard} 
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_point_value         ${Poin_promocard} 
    Page Should Contain element                    com.telkomsel.mytelkomsel:id/tv_remaining_stock
    Page Should Contain element                    com.telkomsel.mytelkomsel:id/tv_stockPoin
    Verify Term and Condition
    See All by Category
    Swipe  	    200	    1800	    200 	500	  1000
    Go Back

Verify Browse Merchant - Detail Browse Merchant Page
    [Documentation]    Browse Merchant - Detail Browse Merchant Page
        ...     |TC Android|    TC220    |
    [Tags]      Poin4
    Wait until page Contains element         ${APP_PACKAGE}:id/rv_catalog        timeout=30
    Wait until page Contains            ${WCMS["rewards-page.explore-section.travel.title"]}     timeout=30
    RBFindElement.click text in section android            com.telkomsel.mytelkomsel:id/rl_container            Travelling        com.telkomsel.mytelkomsel:id/iv_icon
    Element Should Contain Text             ${APP_PACKAGE}:id/tv_headerTitle      ${WCMS["label.telkomsel_poin_page_app.body.choose_category"]}          
    Page Should Contain element                     com.telkomsel.mytelkomsel:id/tl_browse_merchant
    Element Attribute Should Match                     //android.widget.LinearLayout[@content-desc="Travelling"]      selected        true
    


    Page Should Contain element                     com.telkomsel.mytelkomsel:id/ll_layout_filter
    Click element                 com.telkomsel.mytelkomsel:id/cpn_chip
    Wait until page Contains element             com.telkomsel.mytelkomsel:id/bottom_sheet_main_content
    Page Should Contain element                    com.telkomsel.mytelkomsel:id/ll_filter_category
    Page Should Contain text          ${WCMS["rewards_category_filter_location_text"]}   
    Page Should Contain text          ${WCMS["rewards_category_filter_poin_text"]}   
    Page Should Contain text          ${WCMS["rewards_category_filter_order_text"]}  
    Click element             //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.RelativeLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.LinearLayout/android.widget.CheckBox
    Sleep  3    
    Click element             //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.RelativeLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]/android.widget.LinearLayout/android.widget.CheckBox
    Sleep  3
    Click element             //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[2]/android.widget.LinearLayout
    Sleep  3
    Click element             com.telkomsel.mytelkomsel:id/ivClose
    Sleep  3 

    Click element             com.telkomsel.mytelkomsel:id/checkbox_selection
    Sleep  3
    Click element             //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[3]/android.widget.LinearLayout
    Click element             com.telkomsel.mytelkomsel:id/checkbox_selection
    Click element                 com.telkomsel.mytelkomsel:id/bt_apply_filter


    