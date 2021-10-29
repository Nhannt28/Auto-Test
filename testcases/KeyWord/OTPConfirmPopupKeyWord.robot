*** Keywords ***

Verify OTP Confirm Popup
    [Arguments]     ${ReceiverGifPhoneNumber}
    Wait Until Page Contains                ${WCMS["upgrade_cls_otp_text"]}    timeout=30
    Wait Until Page Contains                ${ReceiverGifPhoneNumber}
    Wait Until Page Contains Element        ${OTP_TextField}
    Wait Until Page Contains Element        ${OTP_Confirm_Button}  
    Wait Until Page Contains Element        ${OTP_Resend}  
    Wait Until Page Contains                ${WCMS["send_gift_otp_resend_text"]}