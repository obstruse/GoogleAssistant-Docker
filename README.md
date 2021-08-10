# GoogleAssistant
Docker build for Google Assistant on Raspberry Pi.

https://github.com/obstruse/GoogleAssistant-Docker<br>
https://hub.docker.com/r/obstruse/googleassistant

Intended for use on LibreELEC(Kodi) with Docker and Portainer addons.

## Hardware

- Raspberry Pi 3 (e.g.: https://www.adafruit.com/product/3776)
- USB microphone (e.g.: https://www.adafruit.com/product/3367)


## Configure a Google Developer Project

To create a Google Developer Project and enable access to the Google Assistant API, do the following:

* In the Cloud Platform Console, go to the Projects page. Select an existing project or create a new project.

[[Go to the Projects Page]](https://console.cloud.google.com/project)

* Enable the Google Assistant API on the project you selected (see the Terms of Service).

[[Enable the API]](https://console.developers.google.com/apis/api/embeddedassistant.googleapis.com/overview)

* Click **Enable.**

Create an OAuth Client ID with the following steps:

* Create the client ID.  [[Create an OAuth Client ID]](https://console.developers.google.com/apis/credentials/oauthclient)

* You may need to set a product name for the product consent screen. On the OAuth consent screen tab, give the product a name and click **Save**.

* Click **Other** and give the client ID a name.

* Click **Create**. A dialog box appears that shows you a client ID and secret. Click **OK**

* Click the download icon: *⬇* (at the far right of screen) for the client ID to download the client secret JSON file. (you may need to scroll the page to the right to see the icon) Save the file.


## Prepare Raspberry Pi

### Install LibreELEC

Boot the Pi using LibreELEC from PINN (PINN Is Not NOOBS):

https://sourceforge.net/projects/pinn/

or using the LibreELEC installer:

https://libreelec.tv/downloads/

#### Enable SSH

* Kodi main menu -> Add-ons -> LibreELEC Configuration -> Services -> Enable SSH

![SSH](http://github.com/obstruse/GoogleAssistant-Docker/raw/master/Images/ssh.png "SSH")

#### Enable Audio Output

* Connect using SSH and edit the boot config:

```
mount -o remount,rw /flash
vi /flash/config.txt
```

* Add this parameter:

```
dtparam=audio=on
```

* Reboot

### Install Add-ons:

Install the Docker add-on :

* Kodi main menu ->  Add-ons -> Install from repository 

![Install from Repo](http://github.com/obstruse/GoogleAssistant-Docker/raw/master/Images/installFromRep.png "Install from Repo")

* LibreELEC Add-ons -> Services -> Docker

![Docker](http://github.com/obstruse/GoogleAssistant-Docker/raw/master/Images/docker.png "Docker")

Install the Portainer add-on:
* LibreELEC Add-ons -> Add-on Repository -> LinuxServer.io's Docker Add-ons

![Docker Repo](http://github.com/obstruse/GoogleAssistant-Docker/raw/master/Images/dockerRepo.png "Docker Repo")

* Kodi main menu -> Add-ons -> Install from repository 
* LinuxServer.io's Docker Add-ons -> Services -> Portainer

![Portainer](http://github.com/obstruse/GoogleAssistant-Docker/raw/master/Images/portainer.png "Portainer")



## Install and Configure Google Assistant

Access Portainer at:  http://192.168.1.12:9000 (replace the IP with the address of your Raspberry Pi)

![Dashboard](http://github.com/obstruse/GoogleAssistant-Docker/raw/master/Images/dashboard.png "Dashboard")

### Deploy Container

* Containers -> Add container
  * Container name: GoogleAssistant
  * Image configuration Name: obstruse/googleassistant
  * Disable Access control
  * Console:  Interactive & TTY
  * Restart policy: Unless stopped
  * Runtime & Resources: add device:  /dev/snd
* Click **Deploy the container**

![Container-1](http://github.com/obstruse/GoogleAssistant-Docker/raw/master/Images/container1.png "Container-1")
![Restart Policy](http://github.com/obstruse/GoogleAssistant-Docker/raw/master/Images/restartpolicy.png "Restart Policy")
![Resources](http://github.com/obstruse/GoogleAssistant-Docker/raw/master/Images/resource.png "Resources")

### Install Credentials

* Click on the container name and select ">_ Console"
* click Connect
* In the console window, enter:
```
/root/installCred.sh
```
![Client Secret](http://github.com/obstruse/GoogleAssistant-Docker/raw/master/Images/clientsecret.png "Client Secret")

* Paste the contents of the client_secret.json file saved at the beginning of the proceedure
* Copy the URL displayed in the console window and paste it in a browser
* Copy and paste the returned access code into the console window
* Restart the container


## Audio Output

### Volume

The output audio level is set to 60% after installation.  To increase the volume, say the following:
```
"Hey Google, set volume to maximum"
```

### Output Device

The Raspberry Pi automatically selects either HDMI or speaker jack for audio output, depending on what's available at boot time. If both are available, it defaults to HDMI.  To force it to always use the speaker jack:
* Connect using SSH and edit/create autostart.sh:
```
vi /storage/.config/autostart.sh
```
* Add this line:
```
amixer cset numid=3 1
```
* Reboot

Google Assistant will use the speaker jack for output, and Kodi will continue to use HDMI



