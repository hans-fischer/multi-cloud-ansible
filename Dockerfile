# because this image will not be internet facing, no hardend images needed
FROM ubuntu:20.04

# Google the newest version and upgrade if you want
ARG PACKER_VERSION=1.6.6

# Install docker-cli
RUN apt update -y
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get install -y docker-ce-cli

# Install software needed to provision successfuly
RUN apt update \
    && apt install -y unzip wget openssh-client ansible

# Download Packer-Version and make availible under /opt/packer/packer

RUN wget --progress=dot:giga https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -O /tmp/packer-${PACKER_VERSION}.zip \
    && mkdir -p /opt/packer/packer-${PACKER_VERSION} \
    && unzip -d /opt/packer/packer-${PACKER_VERSION} /tmp/packer-${PACKER_VERSION}.zip \
    && ln -s /opt/packer/packer-${PACKER_VERSION} /opt/packer/packer \
    && rm -R /tmp/*

# Make packer available in shell
ENV PATH="/opt/packer/packer:$PATH"

# Generate RSA-keys to connect to the cloud instances
RUN ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""

# We working as root - not internet facing - no big deal
USER root
WORKDIR /root/packer