import xml.etree.ElementTree as ET

dict = {"en":{},"id":{}}
mytree = ET.parse('/Users/phamhaituan/Documents/PROJECTS/TelkomselAutomationTest/Phincon-AutoTest/SourceCode/PhinconAutoTest/variables/language/temp/Android/en.xml')
myroot = mytree.getroot()

for x in myroot:
     print(x.attrib["name"], x.text)
     dict["en"][x.attrib["name"]] = x.text


mytree = ET.parse('/Users/phamhaituan/Documents/PROJECTS/TelkomselAutomationTest/Phincon-AutoTest/SourceCode/PhinconAutoTest/variables/language/temp/Android/id.xml')
myroot = mytree.getroot()

for x in myroot:
     print(x.attrib["name"], x.text)
     dict["id"][x.attrib["name"]] = x.text
print(dict)