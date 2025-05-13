## User Guide

[Setup Guide](./docs/SetupGuide.md) - Instructions for setting up kubectl on windows

[Development Deployment Scripts](./docs/DeploymentScript.md) - Instruction for using the scripts to deploy development environments to kubernets.

[Visual Studio Code User Guide (VSCode)](./docs/VSCodeUserGuide.md) - Instructions for accessing a development environment in kubernets


## Development Commands

Deploy a development environment to Kubernetes
```
python deploy.py <system>
```

List running pods in Kubernetes in current namespace
```
python get_pods.py
```

Stop all running pods in current namespace.
```
python stop_all_workloads.py
```
