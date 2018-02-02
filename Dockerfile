FROM resin/armv7hf-debian:jessie

RUN [ "cross-build-start" ]

# Install packages
RUN apt-get -qq update
RUN apt-get -qq install --no-install-recommends -y \
      alsa-utils \
      python3 \
      python3-pip 

# Upgrade pip and setuptools
RUN pip3 install -q pip setuptools --upgrade

# Install google-assistant-sdk
RUN pip3 install -q --upgrade google-assistant-library \
    && pip3 install -q --upgrade google-auth-oauthlib[tool]

# cleanup
RUN apt-get -qq remove -y --purge python3-pip \
    && apt-get -qq autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Copy data
COPY asoundrc.config /root/.asoundrc

COPY GA.sh  /root
RUN chmod +x /root/GA.sh

COPY installCred.sh /root
RUN chmod +x /root/installCred.sh

RUN [ "cross-build-end" ]

# Run google-assistant
CMD /root/GA.sh

# Persistent directory
VOLUME /root/.config/google-oauthlib-tool
