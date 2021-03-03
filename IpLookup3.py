import os
import urllib.request
import json

while True:
    ip = input("Digite o ip: ")
    url = "http://ip-api.com/json/"
    response = urllib.request.urlopen(url + ip)
    data = response.read()
    values = json.loads(data)

    print ("IP: " + values['query'])
    print ("City: " + values['city'])
    print ("ISP: " + values['isp'])
    print ("Country: " + values['country'])
    print ("Region: " + values['region'])
    print ("Time zone: " + values['timezone'])

    break