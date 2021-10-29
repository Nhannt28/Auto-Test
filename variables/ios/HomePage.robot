*** Variables ***

#VOC screen
	
${VOC_Skip}                          bt_skip_voc
${VOC_Continue}                      bt_continue
${VOC_rating}                        rb_voc_rating

${VOC_Submit}                        bt_submit
${VOC_Skip_2}                        bt_skip_voc_slider
${VOC_textField}                     et_freeText

${VOC_Store}                         bt_openPlaystore
${VOC_Home}                          bt_go_to_home


#Home page
${Hoome_Page_Inbox}                 email

${Home_Page_Open_Popup_Account}     ${TW_LinkAccount_Phonenumber} 
${Popup_Add_Account_Add_message}    Add phone number
${Popup_Add_Account_Add_btn}        //XCUIElementTypeApplication[@name="MyTelkomsel"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeButton

#chua sua
${AddCredit_Btn}                        ${APP_PACKAGE}:id/btn_prepaidAddCredit

#Add Credit Page
${AddCredit_headerTitle}                ${APP_PACKAGE}:id/tv_headerTitle
${AddCredit_creditMsisdnIcon}           ${APP_PACKAGE}:id/iv_creditMsisdnIcon
${AddCredit_30Rupi}                        30