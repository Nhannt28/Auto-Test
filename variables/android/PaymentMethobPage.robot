*** Variables ***
#Payment method page
${PaymentMethod_headerTitle}     ${APP_PACKAGE}:id/tv_headerTitle
${PaymentMethod_title_contentproduct}        ${APP_PACKAGE}:id/tv_title_contentproduct
${PaymentMethod_view_detail}        ${APP_PACKAGE}:id/tv_view_detail
${PaymentMethod_title_giftto}        ${APP_PACKAGE}:id/tv_title_giftto
${PaymentMethod_giftto_phonenumber}       ${APP_PACKAGE}:id/tv_giftto
${Wallet_Gopay}     Gopay




#pricing details
#After User Selected Package on Shop Page
${PaymentMethod_btn_bottom_sheet}               //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[4]/android.widget.RelativeLayout/android.widget.RelativeLayout[2]
#after User Selected Denom Credit
${PaymentMethod_btn_bottom_sheet1}                //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[4]/android.widget.RelativeLayout/android.widget.RelativeLayout[2]/android.widget.LinearLayout[1]
# /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[4]/android.widget.RelativeLayout
	
${purchase_detail_title}                        ${APP_PACKAGE}:id/tv_purchase_detail_title
${purchase_detail_price}                        ${APP_PACKAGE}:id/tv_purchase_detail_price


#Pop Up Detail Info
${product_name_01}        ${APP_PACKAGE}:id/tv_product_name_01
${product_name_02}        ${APP_PACKAGE}:id/tv_product_name_02
${OK_Btn}                 ${APP_PACKAGE}:id/btn_ok
${Credit_Amount}          Credit Amount
${Credit_POIN}            POIN
${VoiceTSEL_time}            75 minute





${PaymentMethod_Ewallet}            ${APP_PACKAGE}:id/tv_parentname
${PaymentMethod_labelTotalPrice}        ${APP_PACKAGE}:id/tvlabelTotalPrice
${PaymentMethod_totalPriceSumConfigPayment}        ${APP_PACKAGE}:id/tvtotalPriceSumConfigPayment
${PaymentMethod_btn_continuePayment}         ${APP_PACKAGE}:id/btPrimary


${PaymentMethod_Back_Home}            ${APP_PACKAGE}:id/btPrimary


${PaymentMethod_primarypaymentDesc}            ${APP_PACKAGE}:id/tv_primarypaymentDesc
${PaymentMethod_primarypaymentPrice}            ${APP_PACKAGE}:id/tv_primarypaymentPrice
${PaymentMethod_primarypayment}                ${APP_PACKAGE}:id/rb_primarypayment

#Term&Condition Emoney
${eMoneyTnc_Logo}                 ${APP_PACKAGE}:id/iv_eMoneyTnc
${TermsCondition_EMoneyTitle}     ${APP_PACKAGE}:id/tv_termsConditionEMoneyTitle
${btn_description_Term&Con}        ${APP_PACKAGE}:id/tv_btn_description

#Term&Condition content LinkAja
${Tnc_LinkAja}                Already installed LinkAja App, have LinkAja Account and already activate LinkAja
#Term&Condition content GOPAY
${Tnc_GOPAY}                    Already installed Gojek Apps, has a Gojek Account, and activated GoPay

${Tnc_DANA}                    Have DANA account, and activate DANA payment

#Term&Condition content SHOPEEPAY
${Tnc_SHOPEEPAY}        Already installed Shopee Apps, has a Shopee Account, and activated ShopeePay
#Term&Condition content OVO
${Tnc_OVO}                Have installed OVO Apps, have an OVO Account, and activate OVO payment
${OVO_Account_Text}             OVO Account
${OVO_AccountDescription_Text}    Input your OVO account phone number
${Input_PhoneNumber_Textfield}    ${APP_PACKAGE}:id/et_phoneNumber
${Input_phone}                    ${APP_PACKAGE}:id/et_input
${btn_continute}                  ${APP_PACKAGE}:id/btn_eMoneyTermsCondition
${btn_back_to_home}                               ${APP_PACKAGE}:id/btn_primary

${promo_banner}                        ${APP_PACKAGE}:id/img_promo_banner
${AddCredit_item}                      ${APP_PACKAGE}:id/rl_creditVoucherTopContainer
${msisdn_logo}                         ${APP_PACKAGE}:id/iv_msisdn_logo
${Credit_Content}                      ${APP_PACKAGE}:id/rv_creditContent
${AddCredit_item_100kRp}               //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout[2]/android.widget.ScrollView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/androidx.cardview.widget.CardView[6]/android.widget.RelativeLayout/android.widget.LinearLayout
${AddCredit_item_150kRp}               //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.RelativeLayout/androidx.recyclerview.widget.RecyclerView/androidx.cardview.widget.CardView[6]/android.widget.RelativeLayout/android.widget.LinearLayout

${Wv_emoney}                            ${APP_PACKAGE}:id/wv_emoney

${min_payment}                            Rp 50.000
${radio_btn_Akulaku}                      //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[7]/android.widget.RelativeLayout/android.widget.RelativeLayout[2]/android.widget.LinearLayout[2]/android.widget.RadioButton

${btn_close_error}                     ${APP_PACKAGE}:id/btn_activate_error
