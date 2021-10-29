*** Variables ***
# INBOX

${Inbox_ListView}                       //XCUIElementTypeApplication[@name="MyTelkomsel"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable
${Inbox_Place_display_Transaction}      //XCUIElementTypeApplication[@name="MyTelkomsel"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[4]
${Inbox_Edit}                           //XCUIElementTypeStaticText[@name="${WCMS["global_edit_label"]}"]
${Inbox_Done}                           //XCUIElementTypeStaticText[@name="${WCMS["TITLE-done"]}"]
${Inbox_SelectAll}                      inbox_header_checkboxAllButton
${Inbox_List_CheckBox}                  //XCUIElementTypeButton[@name="inbox_cell_checkboxButton"][1]

${Inbox_Promo_back}                     backIcon
${Inbox_Promo_Edit}                     //XCUIElementTypeButton[@name="${WCMS["global_edit_label"]}"]
${Inbox_Promo_Done}                     //XCUIElementTypeButton[@name="${WCMS["TITLE-done"]}"]


${Inbox_Notify_back}                    backIcon
${Inbox_Notify_Edit}                    //XCUIElementTypeButton[@name="${WCMS["global_edit_label"]}"]
${Inbox_Notify_Done}                    //XCUIElementTypeButton[@name="${WCMS["TITLE-done"]}"]

${Inbox_Transaction_Buy}                //XCUIElementTypeOther[@name="inboxDetail_view"]/XCUIElementTypeWebView/XCUIElementTypeWebView/XCUIElementTypeWebView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[14]
${Inbox_Transaction_Close}              backIcon