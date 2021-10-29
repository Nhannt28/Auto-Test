
echo %path%
set DeviceName=%1
set OutputFolder=%2

set port=4725
set lang=en
set TAG=Inbox


set projectFolder=.\

set tc=%projectFolder%testcases\
set report=%projectFolder%report\
mkdir %report%

echo %tc%
set i = %DeviceName%
set output=%OutputFolder%
mkdir %output%
set fail=fail


start cmd /k appium --address 0.0.0.0 --port %port%


robot --variable device:%DeviceName% --variable port:%port% --variable lang:%lang% --output %output%output --log %output%output   %tc%




echo 'Start push bug Jira'
set jira=%projectFolder%execute\executeJira.py
set xmlfile=%output%output.xml
python %jira% %output% %xmlfile% %DeviceName% 
echo 'Done push bug Jira'

exit 0

