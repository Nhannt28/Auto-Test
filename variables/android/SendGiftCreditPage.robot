*** Variables ***

#Check send gift credit page - Send Credits
${Give_gift_to_text}      ${APP_PACKAGE}:id/tvSendGiftDestinationNumber
${Credit_Transfer}      ${WCMS["send_transfer_credit_title"]}
${Credit_Send_title}      ${WCMS["send_gift_credit_title"]}
#${Credit_Send_title}            Share Credit
${Credit}                       Rp

#Check send gift credit page - Credit Transfer
${Your_credit_number}      ${APP_PACKAGE}:id/tv_number
${Credit_price}       ${APP_PACKAGE}:id/tv_price
${Title_Transfer}         ${APP_PACKAGE}:id/tvTitleTransfer
${Credit_Rp_10k}         Rp 10,000
${Credit_Rp_15k}          	Rp 15,000
${Credit_Rp_20k}            Rp 20,000 
${Credit_Rp_25k}        Rp 25,000 
${Credit_Rp_30k}        Rp 30,000
${Title_Nominal}        ${APP_PACKAGE}:id/tvTitleNominal
${input_price_TextField}        ${APP_PACKAGE}:id/edt_input_price
${btn_continue}         ${APP_PACKAGE}:id/btn_continue
${Term_Con_text}        ${WCMS["send_gift_transfer_tnc_title"]}
${arrow_package_desc}        ${APP_PACKAGE}:id/iv_ic_arrow_package_desc
${label_Total_Price}       ${APP_PACKAGE}:id/tv_labelTotalPrice
${Total_Price}        ${APP_PACKAGE}:id/tv_totalPrice
${Term_Condition_Content}           	Minimum credit balance after transfer of IDR 2.000
${Fail_message_input_number_insufficient}       ${WCMS["send_gift_transfer_error_insufficient_text"]}
${Fail_message_input_number_minimum}            Minimum amount is Rp. 5000 
${Fail_message_input_number_maximum}            Maximum amount is Rp. 1,000,000
${Contact_Icon2}        ${APP_PACKAGE}:id/iv_phonebook_change_number
