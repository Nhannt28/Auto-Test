import requests
import json
from jsonmerge import merge
from hashlib import sha256
from datetime import datetime
import time

# current date and time
now = datetime.now()
ts = time.gmtime()
timestamp = time.strftime("%s",ts)
print("timestamp =", timestamp)

appID = "A301"
msisdn = "08118192828"
msisdnStripped = "92828"
changeableDigit = "0"
    
transId = appID + timestamp + msisdnStripped + changeableDigit

print(transId)
        
mobileVersion = "5.10"
word = "https://tdwqa.telkomsel.com/preprod/api/inbox/v3"
versionApi  = "5.10.3"
configKeyHashRSA256 = "1414ta7132ad4t612bs14"
joinString = transId + word + configKeyHashRSA256
hashHeaderApi = sha256(joinString.encode('utf-8')).hexdigest()

print(hashHeaderApi)


headers = {
    "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJraWQiOiJ3VTNpZklJYUxPVUFSZVJCL0ZHNmVNMVAxUU09IiwiYWxnIjoiUlMyNTYifQ.eyJhdF9oYXNoIjoiRmJka0lEWC1tcnZHOXk2X2d2VFhGQSIsInN1YiI6IjBlNTg0OTU4LTdhYjAtNGI3OS1iODY2LTk3NWUwNzAyYWMwMiIsIm9sZFVpZCI6IjBlNTg0OTU4LTdhYjAtNGI3OS1iODY2LTk3NWUwNzAyYWMwMiIsImF1ZGl0VHJhY2tpbmdJZCI6ImIwNzk0MmQ2LTUzZDYtNDIwMy1hNDg5LTU2NGM2ZmFiMTU1YS0yMjQyNTkyIiwiaXNzIjoiaHR0cHM6Ly9jaWFtYW1wcmVwZGFwcC5jaWFtLnRlbGtvbXNlbC5jb206MTAwMDMvb3BlbmFtL29hdXRoMi90c2VsL215dGVsa29tc2VsL21vYmlsZSIsInRva2VuTmFtZSI6ImlkX3Rva2VuIiwiZ2l2ZW5fbmFtZSI6InRpYWFhIiwidXVpZCI6IjBlNTg0OTU4LTdhYjAtNGI3OS1iODY2LTk3NWUwNzAyYWMwMiIsImF1ZCI6IjgzNTg2MjhkOGEwNzBiMGY0NzJmY2JkNGRlZjRiYTdkIiwiYWNyIjoiMCIsIm9yZy5mb3JnZXJvY2sub3BlbmlkY29ubmVjdC5vcHMiOiJoSHdSTWJMNUhZUHhKeHRvZXljY3h6N0VYRVUiLCJpZGVudGlmaWVySUQiOiJ0d2l0dGVyLTEzNjIwNTU3ODI2MTE2MDc1NTYiLCJpZGVudFR5cGUiOiJpZGVudFR5cGUiLCJhenAiOiI4MzU4NjI4ZDhhMDcwYjBmNDcyZmNiZDRkZWY0YmE3ZCIsImF1dGhfdGltZSI6MTYxNTc4MzU1MCwicmVhbG0iOiIvdHNlbC9teXRlbGtvbXNlbC9tb2JpbGUiLCJtc2lzZG4iOiIrNjI4MTI5ODIzMzU3NCIsImV4cCI6MTYxNTk1NjQ3OCwidG9rZW5UeXBlIjoiSldUVG9rZW4iLCJpYXQiOjE2MTU4NzAwNzh9.VK4xNw6Dp2ZTFQprKb-GXi6uRZW-FkDsmjHrP_G4L2MbFkS0sWQym4sxBdWr9_3fF5Kk-rGQBLjCn9DkWx-W9exxVKFF4gZqWUupxXPwarc9sOENSR1EEu1cCDhk1zp6RKu6Gb_DMly_mv-KXQNTuba8fQvJ-mVTh8P304m2YVCTSBbZaMD0G10k6OUqNd9GOnGglvG1dPAM2imIyU0tDDf8uJRhj7HfPjx9U2-h829cFpOPRKc8xDR46aJyQ-yvcVp6udnW_xEBj2qfUbo-5-entnjwfcoJ4sOx5FxQ2SK03Zy5yflkvBV_t2NOAaLYZaJibJt8Uws9HYJAQl4iqw",
    "accessauthorization": "Bearer eyJ0eXAiOiJKV1QiLCJraWQiOiJ3VTNpZklJYUxPVUFSZVJCL0ZHNmVNMVAxUU09IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiIwZTU4NDk1OC03YWIwLTRiNzktYjg2Ni05NzVlMDcwMmFjMDIiLCJjdHMiOiJPQVVUSDJfR1JBTlRfU0VUIiwiYXV0aF9sZXZlbCI6MCwiYXVkaXRUcmFja2luZ0lkIjoiYjA3OTQyZDYtNTNkNi00MjAzLWE0ODktNTY0YzZmYWIxNTVhLTIyNDI1OTEiLCJpc3MiOiJodHRwczovL2NpYW1hbXByZXBkYXBwLmNpYW0udGVsa29tc2VsLmNvbToxMDAwMy9vcGVuYW0vb2F1dGgyL3RzZWwvbXl0ZWxrb21zZWwvbW9iaWxlIiwidG9rZW5OYW1lIjoiYWNjZXNzX3Rva2VuIiwidG9rZW5fdHlwZSI6IkJlYXJlciIsImF1dGhHcmFudElkIjoiR3MwVElTUy1kanlWYXl4OU5jX29GUXdXZlJrLl95YVQydTVCTjlQdHV3T0FUTFFZMk1PVGRObyIsImF1ZCI6IjgzNTg2MjhkOGEwNzBiMGY0NzJmY2JkNGRlZjRiYTdkIiwibmJmIjoxNjE1ODcwMDc4LCJncmFudF90eXBlIjoicmVmcmVzaF90b2tlbiIsInNjb3BlIjpbImlkZW50aWZpZXIiLCJwaG9uZSIsIm9wZW5pZCIsInByb2ZpbGUiXSwiYXV0aF90aW1lIjoxNjE1NzgzNTUwLCJyZWFsbSI6Ii90c2VsL215dGVsa29tc2VsL21vYmlsZSIsImV4cCI6MTYxNTk1NjQ3OCwiaWF0IjoxNjE1ODcwMDc4LCJleHBpcmVzX2luIjo4NjQwMCwianRpIjoiR3MwVElTUy1kanlWYXl4OU5jX29GUXdXZlJrLkhsbGJiVWZmOE1UdGZ5VF9KaE4tLVpSUXRGRSJ9.z3CUQzoc5RANk55_LL5I0xhWh9z5BwdgjiXtCwgc6PwfK6jcJtRPxYkjYAPUQkQJ_npfPXvld2ZETh1wGc0LJfE16FlTa6EqNezhUiQ2rdRiNrCq25dwdhifgZ4UXeqay5E69-0tLesvT713VY0AwQFi0EDcWjYDUyPaelL5Rw3K3AYlvVsauGgE01dp2G-pXr0vOmSiS3obXvqkx2RMoaTTCRcErMXQnBQ7Ys4twVqEXpgtyqU7PtuMbyeGn22GYvsZymVHbK50fXHjdjdm4_QjXHeBQTPAAHhQ6ySA_2-c3cp8kd2DqdKplvg1qAmsUW2atTH2QH-SoJYWeFDXSg",
    "TRANSACTIONID": transId,
    "hash": hashHeaderApi
}

url = "https://tdwqa.telkomsel.com/preprod/api/inbox/v3?sortasc=true&pagesize=20&page=1&category=%5B%5D&custType=prepaid"
response = requests.get(url,headers=headers)
json = response.json()
print(json)