# build image: docker build -t ngohaibac/ubuntu14.04 .
FROM ubuntu:16.04
ARG UID=501
ARG UNAME=bacnh

# Update packages
RUN rm /bin/sh && ln -s bash /bin/sh \ 
# add user package
     &&  apt-get update && apt-get install -y \
		gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     xterm tar locales \
# add user tux
	&& useradd -m -u $UID -g staff -s /bin/bash $UNAME

# Setup the environment
RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

USER $UNAME
WORKDIR /opt
VOLUME ["/opt"]

ENTRYPOINT /bin/bash
CMD ["true"]