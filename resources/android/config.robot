*** Settings ***
Library    AppiumLibrary
Library    BuiltIn
# Resource    ${distribution_env}.robot
*** Variables ***

${APP_PACKAGE}        com.telkomsel.mytelkomsel  #pre
# ${APP_PACKAGE}        com.telkomsel.telkomselcm  #pro

${APP_PACKAGE_ID}        com.telkomsel.mytelkomsel  

${Activity_Splash}      ${APP_PACKAGE_ID}.view.splash.SplashActivity
${Activity_Login}       ${APP_PACKAGE_ID}.view.login.form.LoginFormRevampActivity
#${APP}                /opt/my-telkomsel.apk
#${APP}                ${CURDIR}/../../app/my-telkomsel.apk

${APP}                ${CURDIR}/../../app/${ENV}/${DISTRIBUTION_ENV}/${APP_VERSION}

#my-telkomsel_pro.apk

${HOST}                 http://127.0.0.1
# ${HOST}                 http://192.168.99.100       
*** Keywords ***
Open App
    [Arguments]    ${appActivity}=${EMPTY}
    open application    ${HOST}:${port}/wd/hub  automationName=${AUTOMATION_NAME}
    ...  app=${APP}   platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}
    ...  appPackage=${APP_PACKAGE} 
    ...  appActivity=${Activity_Splash}
    ...  deviceName=${Device_Name}
    ...  autoGrantPermissions=true



Reopen App
    [Arguments]    ${appActivity}=${EMPTY}
    open application    ${HOST}:${port}/wd/hub  automationName=${AUTOMATION_NAME}
    ...  app=${APP}  platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}
    ...  appPackage=${APP_PACKAGE}
    ...  appActivity=${Activity_Splash}
    ...  deviceName=${Device_Name}
    ...  autoGrantPermissions=true
    ...  noReset=true
