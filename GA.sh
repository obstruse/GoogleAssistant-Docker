#!/bin/bash

# check for credentials.json
# if [ ! -e /root/.config/google-oauthlib-tool/credentials.json ] ; then
while [ ! -e /root/.config/google-oauthlib-tool/credentials.json ] ; do
	# not found, create
	# get client_secret.json
	echo "Paste the client_secret.json here:"
	read secret
	[ ! -z "$secret" ] && echo $secret > /root/client_secret.json

	# install credentials
	google-oauthlib-tool \
		--client-secrets /root/client_secret.json \
		--scope https://www.googleapis.com/auth/assistant-sdk-prototype \
		--save --headless

done

# run gassistant
#python3 /root/gassistant.py /root/.config/google-oauthlib-tool/credentials.json 
/usr/local/bin/google-assistant-demo --device_model_id rpi

# bash
#exec /bin/bash
