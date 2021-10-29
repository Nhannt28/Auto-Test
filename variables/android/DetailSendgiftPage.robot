*** Variables ***
#Detail Send Gift Page
${Send_Gift_Header_title}       ${APP_PACKAGE}:id/tv_headerTitle
${SIM_Msisdn_logo}       ${APP_PACKAGE}:id/iv_sendgift_sim
${Cross_Btn}      ${APP_PACKAGE}:id/iv_cross_button_sendgift
${Credit_Gifts_title}      ${APP_PACKAGE}:id/tv_credit_pulse_title
${Start_from_Rp10.000}      ${APP_PACKAGE}:id/tv_credit_pulse_desc
${Credit_Gifts_Image}      ${APP_PACKAGE}:id/imv_credit_pulsa
${Credit_Transfer_title}       ${APP_PACKAGE}:id/tv_transfer_pulse_title
${Credit_Transfer_Image}        ${APP_PACKAGE}:id/imv_credit_transfer_pulsa
${Send_Regular_Package_title}        ${APP_PACKAGE}:id/tv_categoryTitle

${Internet_text}        ${WCMS["send_gift_category_internet_text"]}

${Roaming_text}        ${WCMS["send_gift_category_roaming_text"]}

${Entertainment_text}        ${WCMS["send_gift_category_multimedia_text"]}

${Call&SMS_text}            Voice & SMS
${brand_logo}        ${APP_PACKAGE}:id/iv_brand_logo

${InternetPackage_offerTitle}        ${APP_PACKAGE}:id/tv_offerTitle
${Package_offerTitle}        ${APP_PACKAGE}:id/tv_offerTitle
${Package_OfferAmout}        ${APP_PACKAGE}:id/tv_offerAmount
${Package_ExpireDate}        ${APP_PACKAGE}:id/tv_offerExpireDate
${Package_OfferPrice}        ${APP_PACKAGE}:id/tv_offerPrice
${Package_type}                ${APP_PACKAGE}:id/tv_type_package
${InternetPackage_OMG}            Internet OMG!
# ${InternetPackage_OMG_14GB}         14 GB
${InternetPackage_10GB}         10 GB



${Item_Internet}            //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.HorizontalScrollView/android.widget.LinearLayout/android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.TextView

${Item_Roaming}            //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.HorizontalScrollView/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.TextView

${Item_Entertaiment}            //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.HorizontalScrollView/android.widget.LinearLayout/android.widget.LinearLayout[3]/android.widget.LinearLayout/android.widget.TextView

${Item_CallSMS}            //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.HorizontalScrollView/android.widget.LinearLayout/android.widget.LinearLayout[4]/android.widget.LinearLayout/android.widget.TextView
${Item_Image_Category}        ${APP_PACKAGE}:id/iv_icon
	
${Package_Section}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.HorizontalScrollView/android.widget.LinearLayout

${Internet_icon}             //android.widget.ImageView[@content-desc="TODO"][4]
${Roaming_icon}             //android.widget.ImageView[@content-desc="TODO"][5]
${Entertainment_icon}             //android.widget.ImageView[@content-desc="TODO"][6]
${Call&SMS_icon}             //android.widget.ImageView[@content-desc="TODO"][7]


    #Detail Package
${Package_item}                ${APP_PACKAGE}:id/offerCardContainer
${Package_name}                ${APP_PACKAGE}:id/tv_packageName
${Package_quota}               ${APP_PACKAGE}:id/tv_packageQuota
${Package_purchase_type}       ${APP_PACKAGE}:id/tv_purchase_type
${Package_infor}                ${APP_PACKAGE}:id/rv_otherPackage
${Package_Price}                ${APP_PACKAGE}:id/tvtotalPriceSumConfigPayment
