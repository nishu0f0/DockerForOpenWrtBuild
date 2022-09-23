FROM ubuntu:18.04
MAINTAINER Nishanth Vurumalla

ARG userid
ARG groupid
ARG username

#Please add your dependencies here
RUN apt-get update && apt-get install -y git-core build-essential zip curl unzip python software-properties-common nano sudo


# Create the user and groups same as host computer 

RUN groupadd -g $groupid $username \
 && useradd -m -u $userid -g $groupid $username \
 && usermod -aG sudo $username \
 && echo $username >/root/username \
 && echo "export USER="$username >>/home/$username/.gitconfig


COPY gitconfig /home/$username/.gitconfig

RUN chown $userid:$groupid /home/$username/.gitconfig

ENV HOME=/home/$username
ENV USER=$username


ENTRYPOINT tail -f /dev/null
