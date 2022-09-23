# DockerForOpenWrtBuild



## Setup Docker


 Install docker from the link https://docs.docker.com/engine/install/ubuntu/

 Instead you can also install from following commands

 ```
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin


 ```



 Run following command to add current user to docker group.

```
sudo usermod -a -G docker $(id -un)
```

Reboot computer for above command to take effect.

The above command removes the necessity for sudo when running docker command.





## Setup image:

Clone this repo and enter the repo in the terminal


Build docker image
```
docker build -t openwrt-build-env-base .
```

Create docker container from the image generated from above command
```
docker run --name openwrt-build -v <host computer repos directory path>:/home/$(id -un)/repos openwrt-build-env-base &
```

This docker file creates a user in the image with the same details of user of host computer when built.
Set password for the created user in the root shell.  To get root shell of the docker container, please use following command
```
docker exec -it openwrt-build bash
```

You can get the user shell of running container with the following to start your build
```
docker exec -it -u $(id -u):$(id -g) openwrt-build
