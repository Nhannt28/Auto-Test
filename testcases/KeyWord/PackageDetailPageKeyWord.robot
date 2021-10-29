*** Keywords ***
Go to Package Detail Page
    Click Text                           ${InternetPackage_30Days_offerExpireDate}
    Wait until page contains                ${WCMS["bundling_detail_package_title"]}        timeout=30
    Wait until page contains                ${Package_Detail_ROAMax_Diaspora_UAE} 
    Wait until page contains                ${Active_Period}
    Wait until page contains                ${InternetPackage_10GB_offerAmount}
    Wait until page contains                ${30DAY_packageItemQuota}
    Wait until page contains                ${InternetPackage_RPmoney_offerPrice}
    Wait until page contains                 ${Package_Description}
    Wait until page contains Element        ${PaymentMethod_btn_continuePayment}