java -jar jenkins.war --httpPort=9090
set projectFolder =".\"

set tc = %projectFolder%"testcases"
set report = %projectFolder%"report"
mkdir $report
set port=4725
set lang=en
set TAG=Inbox

set i = %DeviceName%
set output = %report%"\%i%\"
mkdir $output
set output=$OutputFolder

set fail=fail


start cmd /k appium --address 0.0.0.0 --port %port%



robot --variable device:%i% --variable port:%port% --variable lang:%lang% --output %output%%i% --log %output%%i%  %tc%
   

exit 0