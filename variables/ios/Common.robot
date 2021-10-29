*** Variables ***
# Permission first time login
${Location_Permission}              Allow “MyTelkomsel” to use your location?
${Accept_Location_Permission}        Allow While Using App
${Notification_Permission}          Would Like to Send You Notifications
${Accept_Notification_Permission}   Allow


#TabBar
${TabBar_Home}                      Home
${TabBar_Reward}                    POIN
${TabBar_Shop}                      Shop
${TabBar_Explore}                   Explore
${TabBar_Menu}                      Menu


# Common
${back_item}                            backIcon
${Check_Box}                            class=android.widget.CheckBox
${App_Name}                             MT-Native-Preprod               #MT-Native_Preprod
${Choose_App_Name}                      JUST ONCE

# Common UI Load Content
${Load_Content_Close}               //XCUIElementTypeOther[@name="My Telkomsel"]/XCUIElementTypeImage
#chua sua
${WebView_Request_SSL_Title}              Security Certificate is not trusted
${WebView_Confirm_SSL}               ${APP_PACKAGE}:id/btn_continue