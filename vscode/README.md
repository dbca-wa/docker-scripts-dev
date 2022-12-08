# Run and debug in Visual Studio Code

## 1. Installation

### 1.1 Install extensions

#### 1.1.1 Python:

<img src="./media/image1.png" style="width:6.26806in;height:3.13681in"
alt="Graphical user interface, text, website Description automatically generated" />

#### 1.1.2 Remote – SSH:

<img src="./media/image2.png" style="width:6.26806in;height:3.2875in"
alt="Graphical user interface, text Description automatically generated" />

#### 1.1.3 Dev Containers:

<img src="./media/image3.png" style="width:6.26806in;height:2.94306in"
alt="Graphical user interface, text Description automatically generated" />

#### 1.1.4 Summary

Should have these extensions installed:

<img src="./media/image4.png" style="width:2.35429in;height:3.25711in"
alt="Graphical user interface Description automatically generated" />

### 1.2 Check installation

#### 1.2.1 Connect to the remote VM and check the setup is working

This assumes the respective container is already running on the VM, e.g.
in a terminal.

#### 1.2.2 SSH connect to the VM

Either click the green button in the bottom left corner or invoke the
command palette (CTRL+SHIFT+P, F1) …

<img src="./media/image5.png" style="width:1.75704in;height:0.56947in"
alt="Graphical user interface, text, application, chat or text message Description automatically generated" />

… and select Connect to Host…

<img src="./media/image6.png" style="width:6.0767in;height:0.27085in" />

Type in user and host address, e.g. docker@10.17.0.10, and enter the
password when prompted for:

<img src="./media/image7.png" style="width:2.16678in;height:0.36807in"
alt="Graphical user interface Description automatically generated" />

#### 1.2.3 Connect to the Docker container

This opens a new VSCode window. Select Remote Explorer from the left
menu bar and chose Containers from the top REMOTE EXPLORER drop down
menu:

<img src="./media/image8.png" style="width:2.95849in;height:2.91682in"
alt="Graphical user interface, text, application Description automatically generated" />

Click Attach to Container and enter the password when prompted for:

<img src="./media/image9.png" style="width:6.26806in;height:1.27153in"
alt="Graphical user interface, text, application, website Description automatically generated" />

This should connect to the container, probably as root and to the /app
directory:

<img src="./media/image10.png"
style="width:6.26806in;height:2.26528in" />

## 2. Configuration

### 2.1 Manually point VSCode to the correct container user and project root

This step can be omitted, because we want VSCode to automatically start
the container when opening the project, and it’s left here for
documentation purposes. To set up automatically opening the project in
docker jump to Connect to the VM and start the dev container.

In the Remote Explorer view chose Open Container Configuration File:

<img src="./media/image11.png" style="width:4.75024in;height:1.02783in"
alt="Graphical user interface, text, application Description automatically generated" />

In the json configuration file edit the workspaceFolder and remoteUser
keys and save the file:

```
{
    "workspaceFolder": "/data/data/projects/leases-licensing",
    "remoteUser": "docker"
}
```

After saving refresh the containers or close the window and attach to
the container again. Now the Explorer view should show the content of
the workspace folder and running a terminal should show that the docker
user is connected to the dev container. If there appears another user,
like root, something went wrong.

<img src="./media/image12.png" style="width:5.05582in;height:0.73615in"
alt="Text Description automatically generated" />

### 2.2 Environment

Create a /vscode-env/leaseslicensing.env environment file and replace
the three instances of YOUR.NAME with your name. This is the same env
file that is picked up in the respective docker load shell script, e.g.
docker-scripts-dev/windows_vbox/leaseslicensing_docker_load.sh. Thus, it
can also be copied to the before-mentioned location within the VM.

```yaml
DEBUG=True
DATABASE_URL="postgis://leaselicensing_dev:leaselicensing_dev@172.17.0.1:5432/leaselicensing_dev"
LEDGER_DATABASE_URL=postgis://ledger_dev:ledger_dev@172.17.0.1:5432/ledger_dev
LEDGER_API_URL="http://10.17.0.10:7001"
LEDGER_API_KEY="1HZ56KOJU6OVB6PPR31I8G8X359359S2RP3K5A8DZXRNNZ4CPGUN3BRLDT6YDEK218SJ14MJDMYMROWPIF3LWF4ZMNM6A5UVXWM8"
PAYMENT_INTERFACE_SYSTEM_PROJECT_CODE="0344"
PAYMENT_INTERFACE_SYSTEM_ID="1"
SYSTEM_GROUPS=['Leases Admin']
SITE_PREFIX='leases-dev'
SITE_DOMAIN='dbca.wa.gov.au'
SECRET_KEY='SECRET_KEY_YO'
PRODUCTION_EMAIL=False
NOTIFICATION_EMAIL=YOUR.NAME@dbca.wa.gov.au'
CRON_NOTIFICATION_EMAIL='[YOUR.NAME]'
NON_PROD_EMAIL='YOUR.NAME@dbca.wa.gov.au'
EMAIL_INSTANCE='DEV'
EMAIL_HOST='smtp.corporateict.domain'
DJANGO_HTTPS=True
DEFAULT_FROM_EMAIL='no-reply@dbca.wa.gov.au'
ALLOWED_HOSTS=['*']
DEV_APP_BUILD_URL="http://10.17.0.10:9073/static/leaseslicensing_vue/js/app.js"
ENABLE_DJANGO_LOGIN=True
```
### 2.3 Dev-container

Edit or create and edit .devcontainer/devcontainer.json

```
{
    "name": "Leases Licensing",
    "image": "dbcawa/docker_app_dev:leaseslicensing_dev_latest",
    "remoteUser": "docker",
    "workspaceFolder": "/data/data/projects/leases-licensing",
    "mounts": ["type=bind,source=/data/,target=/data/",           
 "type=bind,source=/data/data/dockerhome/,target=/home/docker/"
              ],
    "appPort": [ "7008:8080", "9071:9071","9072:9072","9073:9073","9074:9074","9075:9075","9076:9076", "9077:9077", "9078:9078","9079:9079", "9080:9080"],  
    "runArgs": ["--env-file","\${localEnv:HOME}/vscode-env/leaseslicensing.env"]
}
```

The .devcontainer directory should hierarchically be at the same level
as .vscode

<img src="./media/image13.png" style="width:1.64592in;height:1.12506in"
alt="A screenshot of a computer Description automatically generated with low confidence" />

### 2.4 Check configuration

Reopening (or opening) a folder at the project root should now have
VSCode automatically pick up the .devcontainer configuration file and
prompt to reopen the folder again in a container:

<img src="./media/image14.png" style="width:3.79186in;height:0.81949in"
alt="Graphical user interface, application Description automatically generated" />

<img src="./media/image15.png" style="width:4.71552in;height:1.0695in"
alt="Graphical user interface, text, application Description automatically generated" />

Maybe for this to work it is required to locally install the Docker
Desktop app, and VSCode will prompt for the install.

## 3. Django Server

### 3.1 Launch configuration

In the Run and Debug view chose create a launch.json file or directly
edit the file.

<img src="./media/image16.png" style="width:4.06271in;height:1.97232in"
alt="Graphical user interface, text, application Description automatically generated" />

<img src="./media/image17.png" style="width:2.264in;height:1.57647in"
alt="Graphical user interface, application Description automatically generated" />

The launch.json should look like the following:

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: Django",
            "type": "python",
            "request": "launch",
            "program": "${workspaceFolder}/manage.py",
            "args": [
                "runserver",
                "0.0.0.0:9071"
            ],
            "django": true
        }
    ]
  }
```

### 3.2 Server launch

In Run and Debug chose Python: Django (or whatever has been chosen as
name):

<img src="./media/image18.png" style="width:2.56958in;height:0.84727in"
alt="Graphical user interface, application Description automatically generated" />

Now, <img src="./media/image19.png"
style="width:0.14584in;height:0.17362in" /> or F5 will start the Django
server and the VSCode debugger to the project. The VSCode terminal can
be checked for correct execution:

<img src="./media/image20.png" style="width:5.31972in;height:1.42368in"
alt="Text Description automatically generated" />

### 3.3 Open project in browser

After starting the server, VSCode should prompt for opening the app in a
browser:

<img src="./media/image21.png" style="width:4.65302in;height:1.04172in"
alt="Graphical user interface, text, application, chat or text message Description automatically generated" />

A Python Debug Console should now be available in the Terminal tab

<img src="./media/image22.png" style="width:6.26806in;height:1.31181in"
alt="Text Description automatically generated" />

and the respective port, e.g 9071, should be forwarded to the local
machine, allowing to access the app in a browser:

<img src="./media/image23.png" style="width:5.65307in;height:2.93071in"
alt="Graphical user interface, text, application, chat or text message Description automatically generated" />

## 4. Node server

Adds a dropdown menu item to run a node server, automatically start the app in a browser and enables debugging in frontend files (html, js, vue).

### 4.1 Launch configuration

Make sure `vue.config.js` has source-mapping enabled:

```
  configureWebpack: {
      devtool: "source-map",
      [...]
```

Add the following configuration to `launch.json`:

```
{
  "type": "chrome",
  "request": "launch",
  "env": { "PORT": "9073" },
  "name": "Node: Chrome",
  "url": "http://localhost:9071",
  "webRoot": "${workspaceFolder}/leaseslicensing/frontend/leaseslicensing/",
  "skipFiles": [
      "${workspaceFolder}/leaseslicensing/frontend/leaseslicensing/node_modules/**/",
      "<node_internals>/**"
  ],
  "sourceMaps": true,
  "smartStep": true,
  "outFiles": [
      "${workspaceFolder}/leaseslicensing/frontend/leaseslicensing/src/**/*.js",
      "${workspaceFolder}/leaseslicensing/frontend/leaseslicensing/src/**/*.vue",
      "${workspaceFolder}/leaseslicensing/templates/leaseslicensing/**/*.html"
  ],
  "preLaunchTask": "node: serve"
}
```

Create a task in `tasks.json`:

```
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "node: serve",
      "path": "/leaseslicensing/frontend/leaseslicensing",
      "options": {"env": {"PORT": "9073"}},
      "type": "npm",
      "script": "serve",
      "isBackground": true,
      "problemMatcher": [{
        "base": "$tsc-watch",
        "background": {
            "activeOnStart": true,
            "beginsPattern": "Starting development server",
            "endsPattern": "Compiled successfully"
        }
    }],
    }
  ]
}
```

## 5. Additional Setups

To also run the node server on container start, add the following line
to devcontainer.json:

```json
"postStartCommand": "nohup bash -c 'PORT=9073 npm run serve --prefix
/data/data/projects/leases-licensing/leaseslicensing/frontend/leaseslicensing
&'"
```

## 6. TODO

- SSH-key server login
- Also start other containers (ledger, postgres) in VSCode
