*** Settings ***
Library    AppiumLibrary
Library    BuiltIn

*** Variables ***
${APP}                    ${CURDIR}/../../app/${EVN}/${DISTRIBUTION_ENV}/${PLATFORM_VERSION}.app

*** Keywords ***
Open App
    [Arguments]    ${appActivity}=${EMPTY}
    open application  http://127.0.0.1:${port}/wd/hub  automationName=${AUTOMATION_NAME}
    ...  app=${APP}  platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}
    ...  deviceName=${DEVICE_NAME}
    ...  waitForIdleTimeout=1000
    ...  waitForQuiescence=false
    ...  autoGrantPermissions=true

Reopen App
    [Arguments]    ${appActivity}=${EMPTY}
    open application  http://127.0.0.1:${port}/wd/hub  automationName=${AUTOMATION_NAME}
    ...  app=${APP}  platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}
    ...  deviceName=${DEVICE_NAME}
    ...  fullReset=false
    ...  noReset=true
    ...  waitForIdleTimeout=1000
    ...  waitForQuiescence=false
    ...  autoGrantPermissions=true