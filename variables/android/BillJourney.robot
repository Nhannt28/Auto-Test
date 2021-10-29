*** Variables ***

# Bill PAGE
#${Bill_Page_Header_Tittle}                          ${APP_PACKAGE}:id/tv_headerTitl  # Can not find by id, maybe same id on UI
${Bill_Page_Header_Tittle}                          //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[1]/android.widget.RelativeLayout/android.widget.TextView
${Bill_Page_header_text}                            Usage & Billing 
${Bill_Page_i_icon}                                 ${APP_PACKAGE}:id/ib_rightButton

${Bill_Page_Domestic_Usage_value}                   ${APP_PACKAGE}:id/tv_usage_text_value
${Bill_Page_Domestic_Credit_value}                  ${APP_PACKAGE}:id/tv_current_usage_value
${Bill_Page_Domestic_Usage_Period_value}            ${APP_PACKAGE}:id/tv_usage_limit_value
${Bill_Page_Domestic_icon}                          ${APP_PACKAGE}:id/ivBillingUsage
${Bill_Page_Domestic_detail_btn}                    ${APP_PACKAGE}:id/btn_see_detail_usage


${Bill_Page_MyBilling_icon}                         ${APP_PACKAGE}:id/iv_icon_billing
${Bill_Page_MyBilling_Value}                        ${APP_PACKAGE}:id/tv_bill_value
${Bill_Page_MyBilling_bill_detail}                  ${APP_PACKAGE}:id/btn_view_bill
${Bill_Page_MyBilling_pay_bill}                     ${APP_PACKAGE}:id/btn_pay_bill
${Bill_Page_MyBilling_pay_bill_bill_detail}         ${APP_PACKAGE}:id/btn_paybill

${Bill_Page_E_Bill_icon}                            ${APP_PACKAGE}:id/ivIconEbillDeliv
${Bill_Page_E_Bill_Value}                           ${APP_PACKAGE}:id/tvCurrentEmail

${Bill_Page_Reminder_icon}                          ${APP_PACKAGE}:id/ivReminderBilling
${Bill_Page_Reminder_Value}                         ${APP_PACKAGE}:id/tvReminderBillingDate

${Bill_Page_History_icon}                          ${APP_PACKAGE}:id/ivIconHistoryBilling


# Email Password
${Bill_Page_Password_Email}                         ${APP_PACKAGE}:id/pin_view_bill
${Bill_Page_Current_Email}                          //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.EditText
${Bill_Page_New_Email}                              //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.EditText
${Bill_Page_Re_Email}                               //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.EditText
${Bill_Page_Confirm_Change_Email}                   ${APP_PACKAGE}:id/btn_submit_register_ebill

# Send Bill Email
${Bill_Page_Check_Email_To_Send}                    ${APP_PACKAGE}:id/rb_selected
${Bill_Page_Confirm_Send_Email}                     ${APP_PACKAGE}:id/bt_ok


#	ABOUT USAGE & BILLING
${Bill_Page_About_Usage_billing_header}             ${APP_PACKAGE}:id/tv_headerTitle
${Bill_Page_About_Usage_billing_header_text}        About Usage & Billing
${Bill_Page_About_Usage_billing_back}               ${APP_PACKAGE}:id/ib_backButton


# Popup Bill 
	
${Bill_Page_Popup_History_icon}                     ${APP_PACKAGE}:id/ivIconInfoDetail
${Bill_Page_Password_PDF_TF}                        ${APP_PACKAGE}:id/et_password
${Bill_Page_Password_PDF_Cancel}	                ${APP_PACKAGE}:id/btn_cancel
${Bill_Page_Password_PDF_Open}	                    ${APP_PACKAGE}:id/btn_open
${Bill_Page_Popup_History_back}                     ${APP_PACKAGE}:id/ib_backButton