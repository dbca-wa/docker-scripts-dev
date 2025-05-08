#!/usr/bin/env python
import subprocess
import os

kubectl_cmd = "kubectl.exe"
namespace = "jason"

if os.name == 'posix':
    kubectl_cmd = "kubectl"
    git_cmd = "git"

try:
    subprocess.run([kubectl_cmd, "scale", "--replicas=0", "--all", "deployments","--namespace="+namespace]) 
except Exception as e:
    print ("Error: scaling deployment down")
    print (e)