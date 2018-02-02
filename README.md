# GoogleAssistant
Docker build for Google Assistant for Raspberry Pi

## Configure a Google Developer Project

A Google Developer Project gives your device access to the Google Assistant API. The project tracks quota usage and gives you valuable metrics for the requests made from your device.

To enable access to the Google Assistant API, do the following:
[[Go to the Projects Page]](https://console.cloud.google.com/project)

    In the Cloud Platform Console, go to the Projects page. Select an existing project or create a new project.

    [![Go to the Projects Page]](https://console.cloud.google.com/project)

    Enable the Google Assistant API on the project you selected (see the Terms of Service).

    Enable the API

    Click Enable.

    Create an OAuth Client ID with the following steps:

        Create the client ID.
        Create an OAuth Client ID

        You may need to set a product name for the product consent screen. On the OAuth consent screen tab, give the product a name and click Save.

        Click Other and give the client ID a name.

        Click Create. A dialog box appears that shows you a client ID and secret. (No need to remember or save this, just close the dialog.)

        Click ⬇ (at the far right of screen) for the client ID to download the client secret JSON file (client_secret_<client-id>.json).  Save the file.



