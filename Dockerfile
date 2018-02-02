FROM resin/armv7hf-debian:jessie

RUN [ "cross-build-start" ]

# Install packages
RUN apt-get -qq update
RUN apt-get -qq install --no-install-recommends -y \
      alsa-utils \
      gcc \
      python3 \
      python3-dev \
      python3-pip \
      portaudio19-dev \
      libffi-dev \
      libssl-dev

# Upgrade pip and setuptools
RUN pip3 install -q pip setuptools --upgrade

# Install google-assistant-sdk
RUN pip3 install -q --upgrade google-assistant-library \
    && pip3 install -q --upgrade google-auth-oauthlib[tool]

# cleanup
RUN apt-get -qq remove -y --purge python3-pip python3-dev \
    && apt-get -qq autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Copy data
COPY asoundrc.config /root/.asoundrc
COPY GA.sh  /root
RUN chmod +x /root/GA.sh

# Run google-assistant
CMD /root/GA.sh
    
RUN [ "cross-build-end" ]

# Common directory
VOLUME /root/.config/google-oauthlib-tool
