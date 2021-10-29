*** Variables ***


${Search_Placeholder}           ${APP_PACKAGE}:id/et_search_bundling
${Search_Icon}                  ${APP_PACKAGE}:id/iv_icon_search
${Filter_Button}                ${APP_PACKAGE}:id/rl_button_filter
${Sort_Button}                  ${APP_PACKAGE}:id/rl_button_sorting
${Brand_Category}               ${APP_PACKAGE}:id/rv_brand_category
${Product_Display}              ${APP_PACKAGE}:id/ll_container
${Roaming_Package_Image}        ${APP_PACKAGE}:id/iv_background

#Package Detail
${First_Package}        //androidx.recyclerview.widget.RecyclerView[@resource-id="${APP_PACKAGE}:id/rv_subcategory_content"]/android.widget.LinearLayout[@index="0"]
${Icon_Package_Detail}          ${APP_PACKAGE}:id/iv_package
${Desc_Package_Detail}          ${APP_PACKAGE}:id/tv_title
${Quota_Package_Detail}         ${APP_PACKAGE}:id/tv_packageItemQuota
${Total_Price_Package}          ${APP_PACKAGE}:id/rltotalPriceViewPayment
${Btn_Buy_Package}              ${APP_PACKAGE}:id/btPrimary

#Detail Payment
${Detail_Payment_Title}             ${APP_PACKAGE}:id/rl_titleContentDetailProduct
${Quota_Setup}                      ${APP_PACKAGE}:id/rl_quota_setup
${Total_Price_Detail_Payment}       ${APP_PACKAGE}:id/rltotalPriceViewPayment
${Btn_Continue_Pay2}                ${APP_PACKAGE}:id/btn_continuePayment
${Product_Name_Detail_Payment}      ${APP_PACKAGE}:id/tv_product_name_01
${Product_Quota_Detail_Payment}     ${APP_PACKAGE}:id/tv_product_name_02
${Icon_Detail_Payment}              ${APP_PACKAGE}:id/iv_packageIconPayment
${Desc_Detail_Payment}              ${APP_PACKAGE}:id/rl_descpaymentcontent
${BtnOK_Detail_Payment}             ${APP_PACKAGE}:id/btn_ok
${CheckBox_Family_Quota}            ${APP_PACKAGE}:id/cb_familyPlan
${PhoneNumber_Slot}                 ${APP_PACKAGE}:id/et_input
${PhoneNumber_Icon}                 ${APP_PACKAGE}:id/text_input_end_icon
${Button_CheckNumber_FamilyPlan}    ${APP_PACKAGE}:id/btFirstTypePrimary
${Close_Quota_Setup}                ${APP_PACKAGE}:id/close
${Bottom_Sheet}                     ${APP_PACKAGE}:id/llBottomSheet
${Bottom_Sheet_Detail_Title}        ${APP_PACKAGE}:id/tv_purchase_detail_title
${Bottom_Sheet_Detail_Price}        ${APP_PACKAGE}:id/tv_purchase_detail_price
${Seekbar_Quota}                    ${APP_PACKAGE}:id/seekbar_quota
${Back_Select_Member}               ${APP_PACKAGE}:id/btFirstTypeSecondary
${Confirm_Button}                   ${APP_PACKAGE}:id/btFirstTypePrimary


#Payment Method
${Insufficient_Balance}             Oops, Your Balance is Not Enough
${Button_Other_Payments}            ${APP_PACKAGE}:id/btn_activate_error
${Button_TopUp}                     ${APP_PACKAGE}:id/btn_cancel


# SHOP PAGE
${Buy_Package_Btn}                  ${APP_PACKAGE}:id/btn_buyPackages
${Top_up_Btn}                       //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[1]/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.Button
${Balance_Text}                     ${WCMS["shop_balance_text"]}	
${Credit_Package_Text}              Credit and Package
${Send_Btn}                         //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[1]/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.Button
${offer_title}                      ${APP_PACKAGE}:id/tv_offer_title
${See_all_Text}                     ${APP_PACKAGE}:id/tv_see_all
${Choose_Package}                   ${APP_PACKAGE}:id/tv_categoryTitle
${Internet_text}                    ${WCMS["send_gift_category_internet_text"]}
${Roaming_text}                     ${WCMS["send_gift_category_roaming_text"]}
${Entertainment_text}               ${WCMS["send_gift_category_multimedia_text"]}
${Call&SMS_text}                    ${WCMS["send_gift_category_voiceandsms_text"]}
${Offer_NoFeeLoan}                  //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/androidx.viewpager.widget.ViewPager/android.widget.RelativeLayout[1]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.LinearLayout[1]/android.widget.TextView
${RPmoney_offerPrice}                Rp 110,000                
${30GB_offerAmount}                    30 GB                  
${30Days_offerExpireDate}                30 Days            
${value_Credit_Rp10k}               //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/androidx.viewpager.widget.ViewPager/android.widget.RelativeLayout[1]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.LinearLayout[4]/android.widget.TextView
${type_package}                     ${APP_PACKAGE}:id/tv_type_package
${Combo_SAKTI_Btn}                  Combo SAKTI
${Ekstra_Unlimited_Btn}             Ekstra Unlimited
${Kuota_Keluarga_Btn}               Kuota Keluarga

${submenu_family}                   IRIS 2
${family_package}                   //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[3]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[1]/androidx.cardview.widget.CardView/android.widget.RelativeLayout/android.widget.LinearLayout[1]/android.widget.TextView


${Package_Timor_Leste_text}            Timor Leste
${Roaming_Btn}                        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.TextView
${ScrollView_ShopPage}                //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.ScrollView
#${ScrollView_ShopPage}                //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView



${Internet_Roaming_package_OfferTitle}       Diaspora Hongkong Pre 30D   #Diaspora UAE Post 30D 300rb 10       #pre-prod
# ${Internet_Roaming_package_OfferTitle}        Surprise Deal FUP 80 GB 30 hari       #prod

#DESTINATION Page
${Destination_headerTitle}                    ${APP_PACKAGE}:id/tv_headerTitle
${Internet_RoaMAX_Timor_Leste_offerTitle}          ROAMax Cambodia Internet 10GB
${10GB_offerAmount}                           10 GB
${7days_offerExpireDate}                      7 Days
${Rp150k_offerPrice}                          Rp 150,000






# PACKAGE DETAIL
${Shop_Page_Package_Detail_Buy} 	    ${APP_PACKAGE}:id/btn_packageBuy


# PAYMENT PAGE
${Payment_Page_Bottom_Sheet}          ${APP_PACKAGE}:id/bottom_sheet
${Payment_Page_Continue_Pay}          ${APP_PACKAGE}:id/btPrimary
${Payment_Page_Share}                 ${APP_PACKAGE}:id/ib_rightButton

#Product Popup
${Product_Popup_Name}                   ${APP_PACKAGE}:id/tv_product_name_01	
${Product_Popup_OK}                   ${APP_PACKAGE}:id/btn_ok

#purchase confirmation in Shop Page
${confirmation_title}            ${APP_PACKAGE}:id/tv_confirmation
${confirmation_Buy_Btn}         ${APP_PACKAGE}:id/tv_buy
${confirmation_Close_Btn}        ${APP_PACKAGE}:id/iv_closeAbandon

${PrimaryBill_Logo}                 ${APP_PACKAGE}:id/iv_primarypaymentItemLogo

#Roaming Package
${Checkbox_Active_Now}              ${APP_PACKAGE}:id/rb_schedule_activation_option_now
${Checkbox_Active_Later}            ${APP_PACKAGE}:id/rb_schedule_activation_option_later
${Roaming_category}                 //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.HorizontalScrollView/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.TextView
${count_popular}                    ${APP_PACKAGE}:id/recyclerview
${Popular_item}                     ${APP_PACKAGE}:id/iv_background
${Popular_item_emty}                //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]
${Popular_item3}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]
${Title_country}                    ${APP_PACKAGE}:id/tv_title_country
${Duration}                         //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[2]
# ${Duration}                        ${APP_PACKAGE}:id/cpn_chip

${count_combined}                   //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView
${Combined_item}                    ${APP_PACKAGE}:id/tv_title

# Credit Details
${Credit_Details_BuyBtn}            ${APP_PACKAGE}:id/btn_buy
