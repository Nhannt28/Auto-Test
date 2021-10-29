*** Variables ***

# Login Page Id
# ${Login_page_ID}                     ${APP_PACKAGE}:id/bt_id
# ${Login_page_Language}               ${APP_PACKAGE}:id/bt_en
# ${Login_page_Phone_TextField}        ${APP_PACKAGE}:id/et_msisdn
# ${Login_page_Phone_TextField_Re}        ${APP_PACKAGE}:id/et_msisdn
${Login_page_Language}               ${APP_PACKAGE}:id/tv_login_language
${Login_page_Login_btn}              ${APP_PACKAGE}:id/bt_login
${Login_page_Phone_TextField}        ${APP_PACKAGE}:id/et_input
${Login_page_Desc}                   ${APP_PACKAGE}:id/tv_sk
${Login_page_KeepLogin_Checkbox}     ${APP_PACKAGE}:id/chkKeepLogin




# Buy Sim Card
${Buy_SimCard_Header}               Buy Sim Card

# Other Login Page
# ${Other_login_Page_Resend}           ${APP_PACKAGE}:id/bt_send_link
${Other_login_Page_send_link_sms}               ${APP_PACKAGE}:id/bt_send_link_sms
${Other_login_Page_send_link_email}             ${APP_PACKAGE}:id/bt_send_link_email
${Other_Login_Page_Button}                       ${APP_PACKAGE}:id/bt_other_login


# ${FB_Page_Header}                   Log in to your Facebook account to connect to MyTelkomsel
${FB_Page_Header}                   facebook
${FB_fill_email}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[2]/android.view.View[3]/android.view.View[1]/android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View/android.widget.EditText
${FB_fill_pw}                       //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[2]/android.view.View[3]/android.view.View[1]/android.view.View[2]/android.view.View[1]/android.view.View[2]/android.widget.EditText
${FB_Login_btn}                     //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[1]/android.view.View[2]/android.view.View[3]/android.view.View[1]/android.view.View[2]/android.view.View[2]/android.widget.Button

${TW_Page_Header}                   Authorize MyTelkomsel App to access your account?
${TW_fill_email}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[2]/android.view.View/android.view.View[3]/android.view.View[1]/android.view.View[1]/android.widget.EditText
${TW_fill_pw}                       //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[2]/android.view.View/android.view.View[3]/android.view.View[1]/android.view.View[2]/android.widget.EditText
#${TW_Login_btn1}                     //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[2]/android.view.View/android.view.View[3]/android.view.View[2]/android.widget.Button[1]
${TW_Login_btn1}                     Sign In
${TW_Login_btn2}                     Authorize app
${TW_Page_Verify_Header}            Help us keep your account safe.
${TW_Page_Verify_check}             Your phone number ends in
${TW_Page_Verify_Answer}            //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[6]/android.widget.EditText
${TW_Page_Verify_Submit}            //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[6]/android.widget.Button
${TW_Page_Final_Confirm}            //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[2]/android.view.View/android.view.View[3]/android.view.View/android.widget.Button[1]

${GG_Page_Header}                   telkomsel.com
${GG_fill_email}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View[1]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View[1]/android.widget.EditText
# ${GG_fill_email_next}               //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View[1]/android.view.View[5]/android.view.View/android.widget.Button
${GG_fill_email_next}               Tiếp theo
${GG_fill_pw}                       //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View[1]/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View[1]/android.widget.EditText
# ${GG_Login_btn}                     //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View[1]/android.view.View[5]/android.view.View/android.widget.Button
${GG_Login_btn}                     Tiếp theo

#Verify Promo InApp Notif
${insider_single_btn}    ${APP_PACKAGE}:id/insider_single
${closeBt_btn}           ${APP_PACKAGE}:id/closeBt


#Check Security Certificate popup when first time open Buy New Sim
${Security_Certificate_Confirm_Title}               ${APP_PACKAGE}:id/tv_title
${Security_Certificate_Confirm_Description}         ${APP_PACKAGE}:id/tv_description
${Security_Certificate_Confirm_BtnCancel}           ${APP_PACKAGE}:id/btn_cancel
${Security_Certificate_Confirm_BtnContinue}         ${APP_PACKAGE}:id/btn_continue