

*** Settings ***

Resource    ./CommonKeyWord.robot
Resource    ../variables/${ENV}/Common.robot
Resource    ../variables/account.robot


Suite Setup         Open App      ${EMPTY}
Suite Teardown      Close Application
Test Setup          Launch Application
Test Teardown       Tear Down Test Cases

*** Keywords ***



*** Test Cases ***

#Get Version Application
#    [Tags]    Init 
#    Check Logined Default User
#    Check Permission Location Display
#    Check VOC Dispaly And Skip
#    BuiltIn.Sleep   2s

Launch App And PreSetup
    [Documentation]    Configuration EN ID and accept permission
    [Tags]    Init       Android        iOS
    Initialize System
    BuiltIn.Sleep   20
    

