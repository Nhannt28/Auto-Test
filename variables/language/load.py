import requests
import os
import json
from jsonmerge import merge
import xml.etree.ElementTree as ET
import sys

dir_path = os.path.dirname(os.path.realpath(__file__))
dict = {"en":{},"id":{}}
mytree = ET.parse(dir_path  + '/temp/Android/en.xml')

myroot = mytree.getroot()

for x in myroot:
    
     dict["en"][x.attrib["name"]] = x.text



mytree = ET.parse(dir_path  + '/temp/Android/id.xml')

myroot = mytree.getroot()

def new_func(dict, x):
    dict["id"][x.attrib["name"]] = x.text

for x in myroot:
     
     new_func(dict, x)




# data = json.load(open(dir_path + '\\wcmstranslation.json'), encoding="utf8" )
# base = data


response = requests.get("https://tdwstcontent.telkomsel.com/api/translation/all/mobile")       #preprod
# response = requests.get("https://tdwcontent.telkomsel.com/api/translation/all/mobile")        #prod
json = response.json()
head = json
# result = merge(merge(dict, base), head)
result = merge(dict, head)

langEN = result["en"]
langID = result["id"]
