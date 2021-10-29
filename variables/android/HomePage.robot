*** Variables ***

#VOC screen
	
${VOC_Skip}                          ${APP_PACKAGE}:id/bt_skip_voc
${VOC_Continue}                      ${APP_PACKAGE}:id/bt_continue
${VOC_rating}                        ${APP_PACKAGE}:id/rb_voc_rating

${VOC_Submit}                        ${APP_PACKAGE}:id/bt_submit
${VOC_Skip_2}                        ${APP_PACKAGE}:id/bt_skip_voc_slider
${VOC_textField}                     ${APP_PACKAGE}:id/et_freeText

${VOC_Store}                         ${APP_PACKAGE}:id/bt_openPlaystore
${VOC_Home}                          ${APP_PACKAGE}:id/bt_go_to_home


#Home page
${Hoome_Page_Inbox}                  ${APP_PACKAGE}:id/imageView

${Home_Page_Open_Popup_Account}      ${APP_PACKAGE}:id/ib_prepaidMultiMsisdn
${Popup_Add_Account_Add_message}    Add phone number
${Popup_Add_Account_Add_btn}         ${APP_PACKAGE}:id/ib_multimsisdnAddNumber

${Add_Credit}                        ${APP_PACKAGE}:id/btn_prepaidAddCredit
${Add_Credit_Package}                ${APP_PACKAGE}:id/rl_creditVoucherTopContainer
${Add_Credit_Contact_Logo}           ${APP_PACKAGE}:id/iv_contact_logo




${AddCredit_Btn}                        ${APP_PACKAGE}:id/btn_prepaidAddCredit
	
${TopUp_ShopPage_Btn}                    ${APP_PACKAGE}:id/topup_account_balance
#Add Credit Page
${AddCredit_headerTitle}                ${APP_PACKAGE}:id/tv_headerTitle
${AddCredit_creditMsisdnIcon}           ${APP_PACKAGE}:id/iv_creditMsisdnIcon
${AddCredit_30Rupi}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout[2]/android.widget.ScrollView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/androidx.cardview.widget.CardView[3]/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.TextView[2]

${Current_Username_Prepaid}          ${APP_PACKAGE}:id/tv_UserInfoName_prepaid
${Current_Username_Postpaid}         ${APP_PACKAGE}:id/tv_UserInfoName_postpaid
${Current_PhoneNunber_Id}            ${APP_PACKAGE}:id/tv_prepaidMsisdnSelected

${notify}                            //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]
${Close}                             //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]