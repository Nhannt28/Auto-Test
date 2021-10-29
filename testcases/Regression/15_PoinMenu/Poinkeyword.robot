*** Keywords ***

    

Go to Poin page 
    Wait until page Contains element        ${TabBar_Reward}             timeout=30
    Page Should Contain Text                ${WCMS["footer_menu_poin"]}  
    Click element                           ${TabBar_Reward}         
    Wait until page Contains element        ${APP_PACKAGE}:id/ll_poin_info        timeout=30
    Loading Poin fail 
    Sleep  5

Loading Poin fail 
    ${Error}       Run Keyword And Return Status          Wait until page Contains        ${WCMS["label.dashboard_app_43.button.maintenace_poin_reload"]}    timeout=30
    Run Keyword If             ${Error}==True             Click Text                    ${WCMS["label.dashboard_app_43.button.maintenace_poin_reload"]}     
    Sleep  5

Active Poin
    Click Element         ${APP_PACKAGE}:id/ll_poin_info 
    Wait until page Contains                ${WCMS["poin_register_header"]}       timeout=30
    Element Should Contain Text             ${APP_PACKAGE}:id/tv_headerTitle         ${WCMS["poin_register_header"]}  
    Page Should Contain Text                ${WCMS["poin_register_title"]}    
    Page Should Contain Text                ${WCMS["poin_register_button"]}  
    Click Text                              ${WCMS["poin_register_button"]}  
    ${Error}       Run Keyword And Return Status          Wait until page Contains        ${WCMS["poin_register_popup_error_header"]}
    Run Keyword If             ${Error}==True             Page Should Contain Text        ${WCMS["poin_register_popup_error_text"]} 
    Run Keyword If             ${Error}==False             Page Should Contain Text                ${WCMS["poin_register_success_title"]}  
    Run Keyword If             ${Error}==False             Page Should Contain Text                ${WCMS["poin_register_success_desc"]}  
    Run Keyword If             ${Error}==False             Page Should Contain Text                ${WCMS["poin_register_success_button"]} 
    Run Keyword If             ${Error}==False             Page Should Contain Text                ${WCMS["poin_register_success_gohome_button"]}     
    Run Keyword If             ${Error}==False             Click Text           ${WCMS["poin_register_success_gohome_button"]} 
    Wait until page Contains element         ${TabBar_Home}  

Verify Header sticky
    Wait until page Contains element            ${APP_PACKAGE}:id/ll_contentRewardPoint        timeout=30
    Swipe	    200	    1800	    200 	600	  1000
    Page Should Contain element                 ${APP_PACKAGE}:id/ll_contentRewardPoint
    Go Back 

View All by Category
    Wait until page Contains element        ${APP_PACKAGE}:id/rv_fst_category_general        timeout=30
    ${Category}       Get Text            ${APP_PACKAGE}:id/tv_chip_title
    # RBFindElement.find element in list view android       ${APP_PACKAGE}:id/rv_fst_category_general           ${APP_PACKAGE}:id/cv_youtube       ${APP_PACKAGE}:id/tv_fst_viewAll       right
    RBFindElement.find text in list view android               ${APP_PACKAGE}:id/rv_fst_category_general          View All          right
    Click element                         ${APP_PACKAGE}:id/tv_fst_viewAll
    Wait until page Contains element             ${APP_PACKAGE}:id/tv_headerTitle        timeout=30
    Element Should Contain Text             ${APP_PACKAGE}:id/tv_headerTitle        ${Category} 
    Page Should Contain element          ${APP_PACKAGE}:id/iv_item_banner
    Page Should Contain element          ${APP_PACKAGE}:id/tv_title
    Page Should Contain element          ${APP_PACKAGE}:id/tv_value_discount
    Go Back
    Sleep  5

See All by Category
    # Swipe	    200	    1800	    200 	600	  1000
    Wait until page Contains element        ${APP_PACKAGE}:id/rv_fst_category_general        timeout=30
    ${Category}       Get Text            ${APP_PACKAGE}:id/tv_fst_category_title
    RBFindElement.find element in section android        ${APP_PACKAGE}:id/ll_1         ${APP_PACKAGE}:id/tv_label_see_all        
    Click element                          ${APP_PACKAGE}:id/tv_label_see_all  
    Wait until page Contains element             ${APP_PACKAGE}:id/tv_headerTitle        timeout=30
    Element Should Contain Text             ${APP_PACKAGE}:id/tv_headerTitle        ${Category} 
    Page Should Contain element          ${APP_PACKAGE}:id/iv_item_banner
    Page Should Contain element          ${APP_PACKAGE}:id/tv_title
    Page Should Contain element          ${APP_PACKAGE}:id/tv_value_discount
    Click element                        ${APP_PACKAGE}:id/iv_item_banner
    Wait until page Contains element             ${APP_PACKAGE}:id/tv_headerTitle        timeout=30
    Page Should Contain element                ${APP_PACKAGE}:id/iv_itemHeartIcon
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_headerTitle         ${WCMS["rewards_detail_header"]}
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_title               ${Title_promocard} 
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_point_value         ${Poin_promocard} 
    Page Should Contain element                    com.telkomsel.mytelkomsel:id/tv_remaining_stock
    Page Should Contain element                    com.telkomsel.mytelkomsel:id/tv_stockPoin
    Go Back
    Sleep  5   

Verify Location about Promotion
    Page Should Contain element                ${APP_PACKAGE}:id/explayout_location_usage
    RBFindElement.click child elements from parent             ${APP_PACKAGE}:id/explayout_location_usage               ${APP_PACKAGE}:id/iv_ic_arrow_expand_layout            
    Page Should Contain element        ${APP_PACKAGE}:id/tv_address
    Log to console                Get Text                 ${APP_PACKAGE}:id/tv_address
    Page Should Contain element         ${APP_PACKAGE}:id/tv_distance
    Log to console                Get Text                 ${APP_PACKAGE}:id/tv_distance
    RBFindElement.click child elements from parent           ${APP_PACKAGE}:id/explayout_location_usage              ${APP_PACKAGE}:id/iv_ic_arrow_expand_layout

Verify Term and Condition
    Page Should Contain element          ${APP_PACKAGE}:id/explayout_tnc
    RBFindElement.click child elements from parent             ${APP_PACKAGE}:id/explayout_tnc                 ${APP_PACKAGE}:id/iv_ic_arrow_expand_layout            
    Swipe	    200	    1800	    200 	1500	  1000
    Run keyword and ignore error         Page Should Contain element       ${APP_PACKAGE}:id/wv_expand_content_tnc
    RBFindElement.click child elements from parent             ${APP_PACKAGE}:id/explayout_tnc                 ${APP_PACKAGE}:id/iv_ic_arrow_expand_layout            
    
Verify Reward Category 
    Wait until page Contains element       ${APP_PACKAGE}:id/rv_catalog        timeout=30
    Page Should Contain element              ${APP_PACKAGE}:id/cv_item_explore_rewards
    Page Should Contain element              ${APP_PACKAGE}:id/tv_title
    
    
    Wait until page Contains            ${WCMS["rewards-page.explore-section.travel.title"]}     timeout=30
    # Click Text                 ${WCMS["rewards-page.explore-section.travel.title"]} 
    ${name_category}               Get Text          ${APP_PACKAGE}:id/tv_title
    Click element                  ${APP_PACKAGE}:id/iv_icon
    Wait until page Contains element             ${APP_PACKAGE}:id/tv_headerTitle        timeout=30
    Element Should Contain Text             ${APP_PACKAGE}:id/tv_headerTitle      ${WCMS["label.telkomsel_poin_page_app.body.choose_category"]}          
    Element Attribute Should Match                     //android.widget.LinearLayout[@content-desc="Travelling"]      selected        true
    Go Back
    Sleep  3

Verify Poin Category Page
    Click element         	//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[5]/android.widget.TextView
    Sleep  5
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_headerTitle         ${WCMS["poin_category_header"]}
    Wait until page Contains element         ${APP_PACKAGE}:id/rv_catalog        timeout=30
    Page Should Contain element           com.telkomsel.mytelkomsel:id/tv_rightButton
    Element Should Contain Text                 ${APP_PACKAGE}:id/tv_rightButton         ${WCMS["poin_category_edit_text"]}
    Page Should Contain Text                ${WCMS["poin_category_favorite_title"]}  
    Page Should Contain element          com.telkomsel.mytelkomsel:id/rv_catalog
    Page Should Contain element           com.telkomsel.mytelkomsel:id/iv_icon
    Page Should Contain element         com.telkomsel.mytelkomsel:id/tv_title
    Page Should Contain Text              
    Page Should Contain Text                 ${WCMS["type_category_poin_utama_title"]}    
    Page Should Contain element             com.telkomsel.mytelkomsel:id/tv_catalogSize
    Page Should Contain element            com.telkomsel.mytelkomsel:id/iv_icArrow
    Click element          com.telkomsel.mytelkomsel:id/iv_icArrow
    Page Should Contain Text                 ${WCMS["type_category_poin_event_title"]}    
    Page Should Contain Text                 ${WCMS["type_category_poin_program_title"]}    
    Page Should Contain Text                 ${WCMS["type_category_poin_game_title"]}  
    Click element                 com.telkomsel.mytelkomsel:id/iv_icArrow
    Sleep  3
    ${count}            Get text             com.telkomsel.mytelkomsel:id/tv_catalogSize
    ${count1}        Remove string          ${count}            (    ) 
    ${count2}        RBFindElement.count element by class name            com.telkomsel.mytelkomsel:id/rv_catalogCategory            	android.widget.ImageView
    Should be true         ${count1}==${count2} 
    Page Should Contain element           /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]/android.widget.FrameLayout
    Click element       ${APP_PACKAGE}:id/tv_rightButton 
    Sleep  3
    Page Should Contain element            (//android.widget.ImageView[@content-desc="Add or remove category"])[4]
    Click element                 (//android.widget.ImageView[@content-desc="Add or remove category"])[4]
    Page Should Contain element           com.telkomsel.mytelkomsel:id/iv_emptyState
    Element Attribute Should Match                   ${APP_PACKAGE}:id/tv_rightButton     clickable        false
    RBFindElement.click element active        com.telkomsel.mytelkomsel:id/rv_catalogCategory                com.telkomsel.mytelkomsel:id/cv_item_explore_rewards
    Page Should Not Contain Element                 com.telkomsel.mytelkomsel:id/iv_emptyState
    Click element       ${APP_PACKAGE}:id/tv_rightButton 





