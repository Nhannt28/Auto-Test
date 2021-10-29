*** Keywords ***
Load Roaming package fail  
    [Documentation]      Roaming Detail (Country and Region)-when user get error in page roaming detail-click refresh
       ...     |TC Android|TC453   TC454|
    ${error}      Run keyword and return status         Wait until page Contains          ${WCMS["roaming_error_page_title"]}     timeout=30
    Run keyword If      ${error}==True       Page Should Contain Text          ${WCMS["roaming_error_page_title"]}     
    Run keyword If      ${error}==True       Click Text               ${WCMS["roaming_error_page_button_text"]}       

Roaming Package is emty  
    ${error}      Run keyword and return status         Wait until page Contains          ${WCMS["roaming_empty_page_title"]}     timeout=30
    Run keyword If      ${error}==True       Page Should Contain Text          ${WCMS["roaming_empty_page_text"]}     
    Run keyword If      ${error}==True       Click Text               ${WCMS["roaming_empty_page_button_text"]}      
    Run keyword If      ${error}==True       Page Should Contain Element      ${Roaming_category} 

Count card Populer Destination
    # ${count}        Get Count     com.telkomsel.mytelkomsel:id/recyclerview            android.view.ViewGroup
    ${count}        RBFindElement.count element by class name        ${APP_PACKAGE}:id/recyclerview         android.view.ViewGroup
    Log to console   ${count} 
    Should be true          ${count}<7 

Verify Destination Detail list 
    [Arguments]    	${title}
    Wait until page Contains element        ${APP_PACKAGE}:id/tv_headerTitle     timeout=30
    Element Should Contain Text             ${APP_PACKAGE}:id/tv_headerTitle            ${title}        
    Page Should Contain Element             ${APP_PACKAGE}:id/iv_background 
    Page Should Contain Element             ${APP_PACKAGE}:id/tv_label
    Page Should Contain Element             ${APP_PACKAGE}:id/tv_title
