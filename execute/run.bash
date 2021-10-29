#! /bin/bash -x

projectFolder="/Users/phamhaituan/Documents/PROJECTS/TelkomselAutomationTest/Phincon-AutoTest/SourceCode/PhinconAutoTest/"
tc=$projectFolder"testcases"
dt=`date '+%d%m%Y_%H%M%S'`
report=$projectFolder"report/$dt"
mkdir $report
port=4725
lang=en
TAG=Inbox
for i in sm_iOS_14
do
   output=$report"/$i/"
   mkdir $output
   # Start Server
   osascript -e "tell application \"Terminal\" to do script \"appium --address 0.0.0.0 --port $port\""

   sleep 5
   # Start execute test
   osascript -e "tell application \"Terminal\" to do script \"cd $tc; robot --variable device:$i --variable port:$port --variable lang:$lang --output $output$i --log $output$i --include $TAG .\""

   let "port += 1"
done


robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --output './report/output' --log './report/output'  ./testcases/

robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --output report\output --log report\output  testcases\
robot --variable device:sm_android_API8 --variable port:4723 --variable lang:en --output report\output --log report\output  testcases\\Regression\01_Login\InvalidPhoneNumber.robot
robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --output report\output --log report\output  testcases\\Regression\04_GiftingJourney\01_GiftingJourney.robot

robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --output report\output --log report\output  testcases\\Regression\04_GiftingJourney\02_InvalidPhoneNumber.robot

robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --variable distribution_env:production --variable app_version:5.11.1(prod).apk --output report\output --log report\output --include SendGift  testcases\\Regression\04_GiftingJourney\01_GiftingJourney.robot

robot --variable device:sm_android_API11 --variable port:4723 --variable lang:en --output report\output --log report\output --include SendGift  testcases\\Regression\07_Revamp_PaymentMethodPage.robot\01_Revamp_PaymentMethodPage.robot

robot --variable device:sm_android_API10 --variable port:4725 --variable lang:en --output report\output --log report\output   .\testcases\ 

robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en -variable distribution_env:production --variable app_version:5.11.1(prod).apk --output report\output --log report\output  testcases\\Regression\07_Revamp_PaymentMethodPage.robot\01_Revamp_PaymentMethodPage.robot

robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --variable distribution_env:production --variable app_version:5.11.1(prod).apk --output report\output --log report\output --include SendGift  testcases\\Regression\04_GiftingJourney\04_TransferCredit.robot
robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --variable distribution_env:production --variable app_version:5.11.1(prod).apk --output report\output --log report\output --include Rename  testcases\\Regression\04_GiftingJourney\05_BeriNama.robot
robot --variable device:sm_android_API11 --variable port:4723 --variable lang:en --output report\output --log report\output --include Contact1  testcases\\Regression\04_GiftingJourney\03_ElkomselContactNumber.robot
robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --output report\output --log report\output  testcases\\Regression\04_GiftingJourney\06_SendGiftPageOnlyLastTransaction.robot
robot --variable device:sm_android_API11 --variable port:4723 --variable lang:en --variable distribution_env:production --variable app_version:5.11.1(prod).apk --output report\output --log report\output --include Fintech1  testcases\\Regression\\06_PaymentFinTech\01_PaymentFinTech.robot
robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --variable distribution_env:production --variable app_version:5.11.1(prod).apk --output report\output --log report\output --include Fintech1  testcases\\Regression\\06_PaymentFinTech\02_PaymentFinTech.robot
robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --variable distribution_env:production --variable app_version:5.11.1(prod).apk --output report\output --log report\output --include BillJourney1 testcases\\Regression\\05_Bill_Journey\BillPage.robot

robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --variable distribution_env:preprod --variable app_version:6.0.0.apk --output report\output --log report\output --include LoginPage testcases\\Regression\\01_Login\Login_Social.robot
robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --variable distribution_env:preprod --variable app_version:6.0.0.apk --output report\output --log report\output testcases\\Regression\\01_Login\InvalidPhoneNumber.robot
robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --variable distribution_env:preprod --variable app_version:6.0.0.apk --output report\output --log report\output testcases\\Regression\\01_Login\Demo.robot

robot --variable device:sm_android_API10 --variable port:4723 --variable lang:en --variable distribution_env:preprod --variable app_version:6.0.0.apk --output report\output --log report\output --include SendGift1 testcases\\Regression\\04_GiftingJourney\01_GiftingJourney.robot