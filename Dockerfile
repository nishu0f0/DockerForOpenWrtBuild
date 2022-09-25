FROM ubuntu:18.04
MAINTAINER Nishanth Vurumalla

ARG userid
ARG groupid
ARG username

#Please add your dependencies here
# Some of them taken from https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem

RUN apt-get update && apt-get install -y build-essential git-core git ccache ecj fastjar file g++ gawk gettext  java-propose-classpath libelf-dev libncurses5-dev libncursesw5-dev libssl-dev python python2.7-dev python3 unzip wget python-distutils-extra python3-setuptools python3-dev rsync subversion swig time xsltproc zlib1g-dev zip curl unzip  software-properties-common nano sudo


# Create the user and groups same as host computer 

RUN groupadd -g $groupid $username \
 && useradd -m -u $userid -g $groupid $username \
 && usermod -aG sudo $username \
 && echo $username >/root/username \
 && export USER=$username \
 && export USERNAME=$username


COPY gitconfig /home/$username/.gitconfig

RUN chown $userid:$groupid /home/$username/.gitconfig

ENV HOME=/home/$username
ENV USER=$username


ENTRYPOINT tail -f /dev/null
