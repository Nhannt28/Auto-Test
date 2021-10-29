*** Variables ***

## Login Page Id
${Login_page_ID}                    idOff2
${Login_page_Language}              enOff2
${Login_page_Phone_TextField}       //XCUIElementTypeApplication[@name="MyTelkomsel"]/XCUIElementTypeWindow/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeTextField
${Login_page_Phone_TextField_Re}       //XCUIElementTypeApplication[@name="MyTelkomsel"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeTextField
${Login_page_Login_btn}             ${WCMS["login_button"]}




# Common UI Load Content
${Load_Content_Close}               //XCUIElementTypeOther[@name="My Telkomsel"]/XCUIElementTypeImage

# Buy Sim Card
${Buy_SimCard_Header}               BUY SIM CARD


# Other Login Page
${Other_login_Page_Resend}          //XCUIElementTypeApplication[@name="MyTelkomsel"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeButton[2]
${Other_Login_Page_Button}          ${WCMS["login_other_method_text"]}

${FB_Page_Header}                   Log in to your Facebook account to connect to MyTelkomsel
${FB_fill_email}                    //XCUIElementTypeOther[@name="main"]/XCUIElementTypeTextField
${FB_fill_pw}                       //XCUIElementTypeOther[@name="main"]/XCUIElementTypeSecureTextField
${FB_Login_btn}                     //XCUIElementTypeButton[@name="Log In"]

${TW_Page_Header}                   Authorize MyTelkomsel App to access your account?
${TW_fill_email}                    //XCUIElementTypeOther[@name="main"]/XCUIElementTypeOther[3]/XCUIElementTypeOther[1]/XCUIElementTypeTextField
${TW_fill_pw}                       //XCUIElementTypeOther[@name="main"]/XCUIElementTypeOther[3]/XCUIElementTypeOther[2]/XCUIElementTypeSecureTextField
${TW_Login_btn}                     Authorize app

${TW_Page_Verify_Header}            Help us keep your account safe.
${TW_Page_Verify_check}             Your phone number ends in
${TW_Page_Verify_Answer}            //XCUIElementTypeOther[@name="Verify your identity"]/XCUIElementTypeOther[9]/XCUIElementTypeTextField
${TW_Page_Verify_Submit}            //XCUIElementTypeButton[@name="Submit"]
${TW_Page_Final_Confirm}            Authorize app


${GG_Page_Header}                   Email hoặc số điện thoại
${GG_fill_email}                    Email hoặc số điện thoại
${GG_fill_email_next}               Tiếp theo
${GG_Page_Header_PW}                Chào mừng
${GG_fill_pw}                       Nhập mật khẩu của bạn
${GG_Login_btn}                     Tiếp theo