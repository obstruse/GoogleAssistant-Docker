FROM resin/armv7hf-debian:jessie

#LABEL \
##    org.label-schema.build-date=$BUILD_DATE \
#    org.label-schema.docker.dockerfile="/Dockerfile" \
#    org.label-schema.name="Google-Assistant" \
##    org.label-schema.vcs-ref=$VCS_REF \
#    org.label-schema.vcs-type="Git" \
#    org.label-schema.vcs-url="https://github.com/Knapoc/docker-google-assistant.git"

RUN [ "cross-build-start" ]

## Set locales
#ENV \
#    LC_ALL=C.UTF-8 \
#    LANG=C.UTF-8 \
#    LANGUAGE=C.UTF-8

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

# Install google samples
#RUN pip3 install  --upgrade google-assistant-sdk[samples]

# cleanup
RUN apt-get -qq remove -y --purge python3-pip python3-dev \
    && apt-get -qq autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Copy data
COPY gassistant.py   /root
COPY asoundrc.config /root/.asoundrc
COPY GA.sh  /root

# Run google-assistant
CMD /root/GA.sh
    
RUN [ "cross-build-end" ]

# Common directory
VOLUME /root/.config/google-oauthlib-tool
