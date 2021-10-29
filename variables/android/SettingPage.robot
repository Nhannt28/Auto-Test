*** Variables ***

#Menu Tabbar Items
${Menu_Setting}                     //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout[5]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.RelativeLayout

#Menu Setting
${MyTsel_Version}               ${APP_PACKAGE}:id/tv_account_header_version
${App_Languange}                ${APP_PACKAGE}:id/iv_account_language
${Desc_Prepaid_locator}         ${APP_PACKAGE}:id/sub_title
${New_Simcard_Xpath}            //android.widget.RelativeLayout[@index="2"]/android.widget.LinearLayout[@index="0"]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.RelativeLayout[@resource-id="${APP_PACKAGE}:id/container"]/android.widget.TextView
${Front_SIM_Card}               ${APP_PACKAGE}:id/rl_cardProfileFrontContent          
${Front_SIM_MSISDN}             ${APP_PACKAGE}:id/tv_cardFrontMsisdn
${Front_SIM_Validity}           ${APP_PACKAGE}:id/tv_cardFrontValidity
${Front_Brand_MSISDN}           ${APP_PACKAGE}:id/iv_cardFrontLogo
${Front_See_PUK}                ${APP_PACKAGE}:id/tv_card_front_see_puk
${Back_SIM_Card}                ${APP_PACKAGE}:id/rl_cardProfileBackContent
${Back_SIM_PUK1}                ${APP_PACKAGE}:id/rl_puk1_container
${Back_SIM_PUK2}                ${APP_PACKAGE}:id/rl_puk2_container
${Back_To_Front_SIM}            ${APP_PACKAGE}:id/tv_card_back
${Add_Number_Card_Profile}      ${APP_PACKAGE}:id/rl_card_profile_add_number_container
${Switch_SIM_Button}            ${APP_PACKAGE}:id/bt_card_profile_inactive_switch
${Inactive_SIM_Card}            ${APP_PACKAGE}:id/rl_card_profile_inactive_container
${Inactive_SIM_MSISDN}          ${APP_PACKAGE}:id/tv_card_profile_inactive_msisdn
${Inactive_Brand_MSISDN}        ${APP_PACKAGE}:id/iv_card_profile_inactive_msisdn_logo
${Switch_SIM_Button}            ${APP_PACKAGE}:id/bt_card_profile_inactive_switch
${Switch_Description}           ${APP_PACKAGE}:id/tvDescription
${Switch_Confirmation_SIM_Button}   ${APP_PACKAGE}:id/btSecondTypePrimary
${AddCard_Container}            ${APP_PACKAGE}:id/rv_account_card_profile

#Profile Page
${Sub_Title_Profile_1}  PERSONAL INFORMATION
${Sub_Title_Profile_2}  LINKED SOCIAL ACCOUNTS
${Sub_Title_Profile_3}  EXPERIENCE PROGRAM
${Profile_Name}         ${APP_PACKAGE}:id/textView20
${Card_Brand}           ${APP_PACKAGE}:id/tv_editProfilePersonalInformationBrand
${Validity}             ${APP_PACKAGE}:id/tv_editProfilePersonalInformationValidity
${PUK}                  ${APP_PACKAGE}:id/tv_editProfilePersonalInformationPuk
${Email}                ${APP_PACKAGE}:id/tv_editProfilePersonalInformationEmail
${Google_Title}         Google
${Twitter_Title}        Twitter

#Package Page
${Promo_Display}                ${APP_PACKAGE}:id/iv_offerImage
${Promo_Header}                 ${APP_PACKAGE}:id/tv_offer_title
${Promo_All}                    ${APP_PACKAGE}:id/tv_offer_see_all
${Last_Update}                  ${APP_PACKAGE}:id/tv_last_update
${Package}                      ${APP_PACKAGE}:id/rl_header
${BuyPackage_Button}            ${APP_PACKAGE}:id/btn_buy_package_mypackages_scheduled
${No_Package_Title}             ${APP_PACKAGE}:id/tv_empty_state_title

#LastUsage Page
${Last_Update_LU}               ${APP_PACKAGE}:id/tv_lastUpdated
${Last_Transaction}             ${APP_PACKAGE}:id/tv_lastTransaction

#PurchaseHistory Page
${Load_More_Btn}                ${APP_PACKAGE}:id/rl_load_more
${Purchase_Title}               ${APP_PACKAGE}:id/purchase_Title
${Purchase_Logo}                ${APP_PACKAGE}:id/purchase_logo
${Date_Purchase}                ${APP_PACKAGE}:id/tvDatePurchase
${Time_Purchase}                ${APP_PACKAGE}:id/purchase_Date
${Ticket_Title}                 ${APP_PACKAGE}:id/ticket_Title
${Ticket_Desc}                  ${APP_PACKAGE}:id/ticket_Desc
${Ticket_Date}                  ${APP_PACKAGE}:id/tv_ticket_Date

#Billing Page
${Next_Coachmark}               ${APP_PACKAGE}:id/btn_next    
${Skip_Coachmark}               ${APP_PACKAGE}:id/btn_skip    
${Close_Coachmark}              ${APP_PACKAGE}:id/btn_close

#PaymentMethod Page
${Learn_More_Btn}               ${APP_PACKAGE}:id/btn_learnmore

#Telkomsel Product Page
${Logo}                         ${APP_PACKAGE}:id/iv_msisdn_logo
${Phonenumber_TopUp_Credit}     ${APP_PACKAGE}:id/et_input
${Contact}                      ${APP_PACKAGE}:id/iv_contact_logo
${Credit_Display}               ${APP_PACKAGE}:id/iv_creditVoucherImgBg

#Help Center Page
${My_Location}                  ${APP_PACKAGE}:id/rl_yourlocation
${Filter_Loc_Button}            ${APP_PACKAGE}:id/filter_button
${Ok_FilterBtn}                 ${APP_PACKAGE}:id/bt_ok
${Chat_Bot_Button}              ${APP_PACKAGE}:id/bt_chatbot
${Terms&Conditions}             ${APP_PACKAGE}:id/rl_tnc
# FAQ
${1st_Question}   Why did TCASH become LinkAja?
${2nd_Question}   How do I switch from TCASH to LinkAja?
${3rd_Question}   What is the difference between TCASH and LinkAja?
${4th_Question}   Is there any additional benefit from LinkAja?
${5th_Question}   If I didn't update my app to LinkAja, can I still make a transaction?
${6th_Question}   What is LinkAja?
${7th_Question}   Can I still use TCASH TAP sticker and NFC on the app to make a transaction?
${8th_Question}   Is there any difference in the transaction method using LinkAja?
${9th_Question}   What will happen to my TCASH balance after switching or migrating to LinkAja?
${10th_Question}  What should I do if I need further information about LinkAja?
# Migration support
${Phone_Icon}           ${APP_PACKAGE}:id/phone_icon
${Phone_Icon_Check}     ${APP_PACKAGE}:id/phone_check
${Simcard_Icon}         ${APP_PACKAGE}:id/sim_icon
${Simcard_Icon_Check}   ${APP_PACKAGE}:id/sim_check


# Setting Page
${Setting_logout}               	 ${APP_PACKAGE}:id/btnLogout
${Toggle_Checkin}                    //android.widget.LinearLayout[@index='1']/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.Switch[@index='2']
${Toggle_JoinTheProgram}             //android.widget.LinearLayout[@index='3']/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.Switch[@index='2']
${Snackbar_Checkin_Message}         ${APP_PACKAGE}:id/cv_headerContainer
${MyTelkom_Playstore}               MyTelkomsel – Buy Credit/Packages &amp; Get 7.5GB

# Relogin - Delete Phone Number Popup
${Delete_Phone_Number_Confirm}           ${APP_PACKAGE}:id/btn_reloginDeleteNumber
${ReLogin_Phone_Number_Confirm}          ${APP_PACKAGE}:id/btn_reloginLogin
${Delete_Phone_number_Confirmed_2}       ${APP_PACKAGE}:id/btn_deleteNumberOK