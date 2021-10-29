*** Variables ***
# Permission first time login
${MakeCall_Permission}              Allow ${App_Name} to make and manage phone calls?
${MakeCall_Permission_Allow}        com.android.permissioncontroller:id/permission_allow_button
${Photo_Permission}                 Allow ${App_Name} to access photos, media, and files on your device?
${Photo_Permission_Allow}           com.android.permissioncontroller:id/permission_allow_button
${Location_Permission}                 Allow ${App_Name} to access this device's location?
${Location_Permission_Allow}           com.android.permissioncontroller:id/permission_allow_foreground_only_button



#TabBar
${TabBar_Home}                       ${APP_PACKAGE}:id/navigation_home
${TabBar_Reward}                     ${APP_PACKAGE}:id/navigation_reward
${TabBar_Shop}                       ${APP_PACKAGE}:id/navigation_shop
${TabBar_Explore}                    ${APP_PACKAGE}:id/navigation_explore
${TabBar_Menu}                       ${APP_PACKAGE}:id/navigation_account	


# Common
${Check_Box}                            class=android.widget.CheckBox
${App_Name}                             MT-Native-Preprod                    #MT-Native_Preprod        #pre-prod 
# ${App_Name}                             MyTelkomsel        #prod 
${Choose_App_Name}                      JUST ONCE
${Terms_&_Conditions}                   //android.widget.LinearLayout[@content-desc="Terms & Conditions"]/android.widget.TextView
${Terms_&_Condition}                    //android.widget.LinearLayout[@content-desc="Terms & Condition"]/android.widget.TextView
# Common UI Load Content
${Load_Content_Close}                ${APP_PACKAGE}:id/ib_backButton
${Load_Content_Title}                ${APP_PACKAGE}:id/tv_headerTitle

${Load_Content_3dot}                 ${APP_PACKAGE}:id/ib_rightButton

${WebView_Request_SSL_Title}              Security Certificate is not trusted
${WebView_Confirm_SSL}               ${APP_PACKAGE}:id/btn_continue