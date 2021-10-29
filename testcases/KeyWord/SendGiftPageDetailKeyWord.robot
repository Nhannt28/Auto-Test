*** Keywords ***
Verify GUI Detail SendGift Page 
    [Arguments]     ${ReceiverGifPhoneNumber} 
    Wait until page contains Element        ${Send_Gift_Header_title}        timeout=30
    # Wait until page contains Element        ${SIM_Msisdn_logo}    timeout=30
    Wait until page contains                ${ReceiverGifPhoneNumber}        timeout=30
    Wait until page contains Element        ${Cross_Btn}        timeout=30
    Wait until page contains Element        ${Start_from_Rp10.000}
    Wait until page contains Element        ${Credit_Gifts_Image}
    Wait until page contains Element        ${Credit_Transfer_title}
    Wait until page contains Element        ${Credit_Gifts_title}
    Page Should Contain Text                ${WCMS["send_gift_credit_text"]}    
    Page Should Contain Text                ${WCMS["send_gift_credit_info"]}    
    Page Should Contain Text                ${WCMS["send_gift_credit_transfer_text"]} 
    Page Should Contain Text                ${WCMS["send_gift_credit_transfer_info"]}   
    Wait until page contains Element        ${Credit_Transfer_Image}     
    Wait until page contains Element        ${Send_Regular_Package_title}        timeout=30
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_Internet}        ${Item_Image_Category}
    Wait until page contains         ${WCMS["send_gift_category_internet_text"]}
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_Roaming}        ${Item_Image_Category}
    Wait until page contains        ${Roaming_text}
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_Entertaiment}        ${Item_Image_Category}
    Wait until page contains        ${Entertainment_text}
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_CallSMS}        ${Item_Image_Category}
    # ${str}    RPString.escape HTML        ${Call&SMS_text}
    # Wait until page contains        ${str} 


Verify GUI Detail SendGift Page When Input Prepaid Phone Number
    [Arguments]     ${ReceiverGifPhoneNumber} 
    Wait until page contains Element                ${Send_Gift_Header_title}        timeout=30
    Wait until page contains                        ${ReceiverGifPhoneNumber}
    Wait until page contains Element                ${Cross_Btn}
    Wait until page contains Element                ${Start_from_Rp10.000}
    Wait until page contains Element                ${Credit_Gifts_Image}
    Wait until page contains Element                ${Credit_Gifts_title}
    Wait Until Page Does Not Contain Element        ${Credit_Transfer_title} 
    Wait Until Page Does Not Contain Element        ${Credit_Transfer_Image}     
    Wait until page contains Element        ${Send_Regular_Package_title}        timeout=30
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_Internet}        ${Item_Image_Category}
    Wait until page contains         ${WCMS["send_gift_category_internet_text"]}
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_Roaming}        ${Item_Image_Category}
    Wait until page contains        ${Roaming_text}
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_Entertaiment}        ${Item_Image_Category}
    Wait until page contains        ${Entertainment_text}
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_CallSMS}        ${Item_Image_Category}
    # ${str}    RPString.escape HTML        ${Call&SMS_text}
    # Wait until page contains        ${str} 
    Wait until page contains        ${WCMS["send_gift_category_voiceandsms_text"]}
Verify GUI Detail SendGift Page When Input PostPaid Phone Number
    [Arguments]     ${ReceiverGifPhoneNumber} 
    Wait until page contains Element        ${Send_Gift_Header_title}        timeout=30
    Wait until page contains                ${ReceiverGifPhoneNumber}
    Wait until page contains Element        ${Cross_Btn}
    Wait until page contains Element        ${Start_from_Rp10.000}
    Wait Until Page Does Not Contain Element        ${Credit_Gifts_Image}
    Wait Until Page Does Not Contain Element        ${Credit_Gifts_title}
    Wait until page contains Element                ${Credit_Transfer_title}  
    Wait until page contains Element        ${Credit_Transfer_Image}     
    Wait until page contains Element        ${Send_Regular_Package_title}        timeout=30
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_Internet}        ${Item_Image_Category}
    Wait until page contains         ${WCMS["send_gift_category_internet_text"]}
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_Roaming}        ${Item_Image_Category}
    Wait until page contains        ${Roaming_text}
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_Entertaiment}        ${Item_Image_Category}
    Wait until page contains        ${Entertainment_text}
    ${element}    RBFindElement.wait until element appear in parrent        ${Item_CallSMS}        ${Item_Image_Category}
    ${str}    RPString.escape HTML        ${Call&SMS_text}
    Wait until page contains        ${str} 