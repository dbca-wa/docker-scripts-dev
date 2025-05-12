#!/usr/bin/env python
import sys
import json
import re
import secrets
import subprocess
import os
import base64
import sys

system = sys.argv[1]
settings_json = {}
with open("./config/settings.json") as json_data:
    settings_json = json.load(json_data)
namespace  = settings_json["namespace"]
print ("JKJ")
print (namespace)
os.exit()
deployment_json = {}
hash_random = secrets.token_hex(nbytes=6)

kubectl_cmd = "kubectl.exe"
git_cmd = "git.exe"

if os.name == 'posix':
    kubectl_cmd = "kubectl"
    git_cmd = "git"

try:
    subprocess.run([kubectl_cmd, "version"]) 
except Exception as e:
    print ("Error: kubectl command not found")
    print (e)
    sys.exit(1)

try:
    subprocess.run([git_cmd, "version"]) 
except Exception:
    print ("Error: git command not found")
    sys.exit(1)

def deploy_workload(deployment_json,system_to_deploy):

    try:
        subprocess.run([kubectl_cmd, "scale", "--replicas=0", "deployment/"+deployment_json["workload_name"]]) 
    except Exception as e:
        print ("Error: scaling deployment down")
        print (e)
        
    # deploy storage    
    if "workload_storage_file" in deployment_json:    
        print ("Deploying storage for "+deployment_json["name"])
        tmp_storage_path="./tmp/"+hash_random+"-"+deployment_json["workload_storage_file"]
        with open("./systems/"+system_to_deploy+"/"+deployment_json["workload_storage_file"]) as file_data:
            yaml_data = file_data.read() 
            yaml_data = re.sub("{{namespace}}", namespace, yaml_data)
            #print(yaml_data)
        with open(tmp_storage_path, "w") as f:
            f.write(yaml_data)
        subprocess.run([kubectl_cmd, "apply","-f",tmp_storage_path]) 
        os.remove(tmp_storage_path)

    # deploy secrets
    if "use_generic_file" in deployment_json:
        if deployment_json["use_generic_file"] is True:  
            print ("Deploying secrets for "+deployment_json["name"])
            tmp_secrets_path="./tmp/"+hash_random+"-"+system_to_deploy+"-secrets.yaml"                
            with open(deployment_json["environment_file"]) as file_data:
                env_data = file_data.read()                         
                # print (env_data)

            with open("./generic/generic-secrets.yaml") as file_data:
                yaml_data = file_data.read() 
                yaml_data = re.sub("{{namespace}}", namespace, yaml_data)
                yaml_data = re.sub("{{system}}", system_to_deploy, yaml_data)                       
                
            for line in env_data.splitlines():
                line_array = line.split("=")
                key_value=line_array[0]
                value_value = re.sub("^"+line_array[0]+"=", "", line)
                base64_value = base64.b64encode(value_value.encode())
                base64_value_decoded = base64_value.decode()
                yaml_data = yaml_data + "  "+key_value+" : "+base64_value_decoded+"\n"
            with open(tmp_secrets_path, "w") as f:
                f.write(yaml_data)

            subprocess.run([kubectl_cmd, "apply","-f",tmp_secrets_path]) 
            os.remove(tmp_secrets_path)

    if "workload_deployment_file" in deployment_json:
        # deploy workloads
        print ("Deploying workload for "+deployment_json["name"])
        tmp_workload_path="./tmp/"+hash_random+"-"+deployment_json["workload_deployment_file"]
        with open("./systems/"+system_to_deploy+"/"+deployment_json["workload_deployment_file"]) as file_data:
            yaml_data = file_data.read() 
            yaml_data = re.sub("{{namespace}}", namespace, yaml_data)
            yaml_data = re.sub("{{system}}", system_to_deploy, yaml_data)            
        with open(tmp_workload_path, "w") as f:
            f.write(yaml_data)

        subprocess.run([kubectl_cmd, "apply","-f",tmp_workload_path]) 
        os.remove(tmp_workload_path)

    if "workload_service_file" in deployment_json:
        # deploy workloads
        print ("Deploying service for "+deployment_json["name"])
        tmp_workload_path="./tmp/"+hash_random+"-"+deployment_json["workload_service_file"]
        with open("./systems/"+system_to_deploy+"/"+deployment_json["workload_service_file"]) as file_data:
            yaml_data = file_data.read() 
            yaml_data = re.sub("{{namespace}}", namespace, yaml_data)
            yaml_data = re.sub("{{system}}", system_to_deploy, yaml_data)            
        with open(tmp_workload_path, "w") as f:
            f.write(yaml_data)

        subprocess.run([kubectl_cmd, "apply","-f",tmp_workload_path]) 
        os.remove(tmp_workload_path)

# Function End
# Start of Initialisation
try:
    subprocess.run([git_cmd, "pull"]) 
except Exception:
    print ("Error: Unable to Update Respository")
    sys.exit(1)

try:
    subprocess.run([kubectl_cmd,"config","set-context","--current","--namespace="+namespace]) 
except Exception:
    print ("Error: Unable to Update Respository")
    sys.exit(1)

if not os.path.exists("./tmp/"):
    os.mkdir("./tmp/")

#1. add check if file doesn't exist

with open("./systems/"+system+"/deployment.json") as json_data:
    deployment_json = json.load(json_data)

print ("Preparing deployment for "+deployment_json["name"])
if "dependency_workloads" in deployment_json:
    dependency_workloads= deployment_json["dependency_workloads"]    
    for dw in dependency_workloads:        
        with open("./systems/"+dw+"/deployment.json") as json_data:
            dependant_deployment_json = json.load(json_data)            
            deploy_workload(dependant_deployment_json,dw)

    deploy_workload(deployment_json,system)
