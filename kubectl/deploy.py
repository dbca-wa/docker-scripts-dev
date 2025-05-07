import requests
import sys
import json
import re
import secrets
import subprocess
import os
import base64

system = sys.argv[1]
namespace = "jason"
deployment_json = {}
hash_random = secrets.token_hex(nbytes=6)

def deploy_workload(deployment_json,system_to_deploy):

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
        subprocess.run(["kubectl.exe", "apply","-f",tmp_storage_path]) 
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

            subprocess.run(["kubectl.exe", "apply","-f",tmp_secrets_path]) 
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

        subprocess.run(["kubectl.exe", "apply","-f",tmp_workload_path]) 
        os.remove(tmp_workload_path)

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

# import os
# os.exit()
deploy_workload(deployment_json,system)

# if "workload_deployment_file" in deployment_json:


#     print ("Deploying "+deployment_json["name"])
#     tmp_path="./tmp/"+hash_random+"-"+deployment_json["workload_deployment_file"]
#     with open("./systems/"+system+"/"+deployment_json["workload_deployment_file"]) as file_data:
#         yaml_data = file_data.read() 
#         yaml_data = re.sub("{{namespace}}", namespace, yaml_data)
#         #print(yaml_data)
#     with open(tmp_path, "w") as f:
#         f.write(yaml_data)

#     subprocess.run(["kubectl.exe", "apply","-f",tmp_path]) 