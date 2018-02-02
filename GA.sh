#!/bin/bash

# check for credentials.json
if [ -e /root/.config/google-oauthlib-tool/credentials.json ] ; then
	# run gassistant
	/usr/local/bin/google-assistant-demo --device_model_id rpi
else
	echo " "
	echo "Credentials not installed"
	echo "Run '/root/installCred.sh' and reboot"
	# bash
	exec /bin/bash
fi
