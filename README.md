# GoogleAssistant
Docker build for Google Assistant on Raspberry Pi.

Intended for use with LibreELEC(Kodi) with Docker and Portainer addons, but not required.

## Hardware

- Raspberry Pi 3 (https://www.adafruit.com/product/3055)
- USB microphone, (e.g. https://www.adafruit.com/product/3367)


## Configure a Google Developer Project

A Google Developer Project gives your device access to the Google Assistant API. The project tracks quota usage and gives you valuable metrics for the requests made from your device.

To enable access to the Google Assistant API, do the following:

In the Cloud Platform Console, go to the Projects page. Select an existing project or create a new project.

[[Go to the Projects Page]](https://console.cloud.google.com/project)

Enable the Google Assistant API on the project you selected (see the Terms of Service).

[[Enable the API]](https://console.developers.google.com/apis/api/embeddedassistant.googleapis.com/overview)

Click **Enable.**

Create an OAuth Client ID with the following steps:

* Create the client ID.  [[Create an OAuth Client ID]](https://console.developers.google.com/apis/credentials/oauthclient)

* You may need to set a product name for the product consent screen. On the OAuth consent screen tab, give the product a name and click Save.

* Click Other and give the client ID a name.

* Click Create. A dialog box appears that shows you a client ID and secret. (No need to remember or save this, just close the dialog.)

* Click ⬇ (at the far right of screen) for the client ID to download the client secret JSON file (client_secret_<client-id>.json).  Save the file.


## Prepare Raspberry Pi

### Install LibreELEC
### Enable Audio Output
### Install Docker
### Install Portainer

## Install and Configure Google Assistant
