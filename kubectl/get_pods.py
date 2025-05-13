#!/usr/bin/env python
import subprocess
import os
import json

kubectl_cmd = "kubectl.exe"
settings_json = {}
with open("./config/settings.json") as json_data:
    settings_json = json.load(json_data)
namespace  = settings_json["namespace"]

if os.name == 'posix':
    kubectl_cmd = "kubectl"
    git_cmd = "git"

try:
    subprocess.run([kubectl_cmd, "get", "pods", "--namespace="+namespace]) 
except Exception as e:
    print ("Error: scaling deployment down")
    print (e)