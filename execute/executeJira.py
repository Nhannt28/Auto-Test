from jira import JIRA
from parserResult import Config
from parserResult import Suite
from parserResult import TestCase
from parserResult import TestStep
from parserResult import ParserRobotXML



import sys

print('Number of arguments:', len(sys.argv), 'arguments.')
print('Argument List:', str(sys.argv))





HOST = 'https://autophincon123.atlassian.net/'
# UserName = 'le.thanh@phincon.com'
# Token   = 'gbmk3g1Iydvehd10A0bwC2A9'
UserName = 'pham.hai@phincon.com'
Token   = 'NFNmJOBCkwNYk1UlChVt1883'
ReportPath = sys.argv[1]

xmlPath = sys.argv[2]

ConfigFile = sys.argv[3]
DeviceName = sys.argv[4]
Distribution = sys.argv[5]
App_version = sys.argv[6]

f = open(ConfigFile, "r")
DeviceTest = f.read()
postString = DeviceTest.split("\n",1)[1]
print(postString)
preconfig = '==========>Device Test Information<============' +'\n'
preconfig += postString
preconfig += '\n'
preconfig += "Distribution ENV: " + Distribution
preconfig += '\n'
preconfig += "App version: " + App_version
preconfig += '\n'
preconfig += '\n'



result = ParserRobotXML(xmlPath)

testCaseFail = result.getFailCases()

print(testCaseFail.count)
jira = JIRA(server= HOST,basic_auth=(UserName, Token))


for tc in testCaseFail:
    
    new_issue = jira.create_issue(project='AUTO', summary='['+DeviceName+']'+tc.testName, description=preconfig + tc.getStringTestCase(), issuetype={'name': 'Bug'})
    fileName = tc.captureScreen
    if fileName != "":
        path = ReportPath+fileName
        print(path)
        # jira.add_attachment(issue=new_issue, attachment=path)
        with open(path, 'rb') as f:
            jira.add_attachment(issue=new_issue, attachment=f)
    
    parent_issue = jira.issue('AUTO-135')
    jira.create_issue_link('tests', new_issue, parent_issue, None)
                        




