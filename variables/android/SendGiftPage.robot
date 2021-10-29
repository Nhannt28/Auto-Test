*** Variables ***
#Send Gift Page
${Send_Gift_Header_title}           ${APP_PACKAGE}:id/tv_headerTitle
${Back_Btn}                         ${APP_PACKAGE}:id/ib_backButton
${Ib_right_Btn}                     ${APP_PACKAGE}:id/ib_rightButton
${Send_Gift_Title_Btn}              ${APP_PACKAGE}:id/tv_sendGiftTitle
${favorite_section}                 ${APP_PACKAGE}:id/cl_favorite_section
${last_transaction_section}         ${APP_PACKAGE}:id/cl_last_transaction_section
# ${Input_Number_Text_Field}          ${APP_PACKAGE}:id/et_sendGiftMsisdnRecipient
${Input_Number_Text_Field}          ${APP_PACKAGE}:id/et_input
${Input_Number_Text_Field2}         ${APP_PACKAGE}:id/tv_contact_number
${Send_Gift_Sim_Icon}               ${APP_PACKAGE}:id/iv_sendgift_sim
${Input_Number_Hide_Text}          Enter the number here
${Save_As_Favorit_Checkbox}         ${APP_PACKAGE}:id/cb_sendgift_add_favorite_number
# ${Rename_label}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.TextView[2]
${Rename_label}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.TextView[2]
${Contact_Icon}                      ${APP_PACKAGE}:id/iv_contact_logo
${Continue_Btn}                     ${APP_PACKAGE}:id/btn_sendGiftContinueBtn
# ${Favorit_title}                    ${WCMS["send_gift_favorite_title"]}
${Favorit_title}                     Favorite Numbers
${Max_Favorit}                      (Max. 5)
# ${Last_Transaction_Title}        ${WCMS["send_gift_last_transaction_title"]}
${Last_Transaction_Title}           ${APP_PACKAGE}:id/tv_last_transaction_title
${Clear_Number_Btn}                 ${APP_PACKAGE}:id/iv_clear_number
${Message_Warning}                 ${WCMS["send_gift_wrong_number_label"]}
${clock_icon}                      ${APP_PACKAGE}:id/imv_clock
${see_all}                          ${APP_PACKAGE}:id/tv_see_all
${Love_icon}                        ${APP_PACKAGE}:id/imv_heart
# ${Love_icon_Favorit}                //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ImageView
${Love_icon_Favorit}                //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ImageView
# ${Love_icon_LastTransaction}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ImageView[2]
${Love_icon_LastTransaction}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.ImageView[2]
${send_gift_remove_favorite_success_text}        Number has been successfully remove from favorites
${send_gift_add_favorite_success_text}           Number has been successfully added to favorites


#About Send Gift Page
${About_Send_Gift_header}       ${APP_PACKAGE}:id/tv_headerTitle
${backButton}                   ${APP_PACKAGE}:id/ib_backButton
${gift_title_sender}            ${APP_PACKAGE}:id/tv_gift_title_sender
${arrow_desc_sender}            ${APP_PACKAGE}:id/iv_arrow_desc_sender
${gift_title_receiver}          ${APP_PACKAGE}:id/tv_gift_title_receiver
${arrow_desc_receiver}          ${APP_PACKAGE}:id/iv_arrow_desc_receiver
${gift_title_price}             ${APP_PACKAGE}:id/tv_gift_title_price
${arrow_desc_price}             ${APP_PACKAGE}:id/iv_arrow_desc_price
${gift_title_others}            ${APP_PACKAGE}:id/tv_gift_title_others
${arrow_desc_others}            ${APP_PACKAGE}:id/iv_arrow_desc_others


#bottom dialog to saved number
${Name_Phone_Numbers_title}                ${WCMS["send_gift_save_number_title"]}
${Name_Phone_Numbers_content}              ${WCMS["send_gift_save_number_text"]}
${Save_Name_Phone_Numbers_Btn}             ${WCMS["send_gift_save_number_confirm_text"]}
${Cancel_Btn}                               ${WCMS["global_cancelation_text"]}


#Save Contact App
${Create_New_Contact_title}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.TextView
${Editor_menu_save_button}        com.android.contacts:id/editor_menu_save_button
${First_Name_TextField}            //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.EditText[1]
${Last_Name_TextFiled}             //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.EditText[2]
${Phone_TextFiled}             //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.EditText

${photo_touch_intercept_overlay}    com.android.contacts:id/photo_touch_intercept_overlay
${title_gradienty}     com.android.contacts:id/title_gradient


${coachmark_Btn}                    Got It
${Sub_menu}                        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[3]
${Package_item_send_gift}          ${APP_PACKAGE}:id/tv_offerTitle
${Telkomsel_Credit}                ${APP_PACKAGE}:id/rl_primarypaymentMethodContainer
