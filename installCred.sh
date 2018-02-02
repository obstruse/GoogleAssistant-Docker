#!/bin/bash

# get client_secret.json
echo "Paste the client_secret.json here:"
read secret
[ ! -z "$secret" ] && echo $secret > /root/client_secret.json

echo ' '
# install credentials
google-oauthlib-tool \
	--client-secrets /root/client_secret.json \
	--scope https://www.googleapis.com/auth/assistant-sdk-prototype \
	--save --headless

echo ' '
echo 'Credentials installed, reboot container'

