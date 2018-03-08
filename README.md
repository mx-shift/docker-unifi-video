[linuxserverurl]: https://linuxserver.io
[unifihub]: https://hub.docker.com/r/linuxserver/unifi
[appurl]: https://www.ubnt.com/download/unifi-video/
[hub]: https://hub.docker.com/r/kc8apf/unifi-video/

# kc8apf/unifi-video
[![](https://images.microbadger.com/badges/version/kc8apf/unifi-video.svg)](https://microbadger.com/images/kc8apf/unifi-video "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/commit/kc8apf/unifi-video.svg)](https://microbadger.com/images/kc8apf/unifi-video "Get your own commit badge on microbadger.com")[![](https://images.microbadger.com/badges/image/kc8apf/unifi-video.svg)](https://microbadger.com/images/kc8apf/unifi-video "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/kc8apf/unifi-video.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/kc8apf/unifi-video.svg)][hub]

[UniFi® Video][appurl] is a powerful and flexible, integrated IP video management surveillance system designed to work with UniFi® Video Cameras.

## Usage

```
docker create \
  --name=unifi-video \
  -v <path to data>:/config \
  -p 7080:7080 \
  -p 7443:7443 \
  -p 6666:6666 \
  -p 7442:7442 \
  -p 7445:7445 \
  -p 7446:7446 \
  -p 7447:7447 \
  kc8apf/unifi-video
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`

* `-p 7080` - port(s) required for Unifi to function
* `-p 7443` - port(s)
* `-p 6666` - port(s)
* `-p 7442` - port(s)
* `-p 7445` - port(s)
* `-p 7446` - port(s)
* `-p 7447` - port(s)
* `-v /config` - where unifi stores it config files etc, needs 3gb free

It is based on xenial with s6 overlay, for shell access whilst the container is running do `docker exec -it unifi /bin/bash`.

## Setting up the application

The webui is at https://ip:7443 , setup with the first run wizard.

To adopt a Unifi Camera that isn't showing as unmanaged in the UI:

1. Nagivate to the camera's IP in a web browser.  Use ubnt for both the username and password.
1. Enter the IP address of the Unfi Video server
1. Click Save Changes
1. Look for the camera in the server UI in the Unmanaged category

## Info

* Shell access whilst the container is running: `docker exec -it unifi-video /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f unifi-video`


* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' unifi-video`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' kc8apf/unifi-video`

## Credits

Thanks to [linuxserver.io][linuxserverurl] who provided much inspiration with [linuxserver/unifi][unifihub].


## Versions

+ **2018-03-08:** Update UniFi video to 3.9.3.
+ **2018-02-22:** Update UniFi video to 3.9.2.
+ **2018-01-06:** Update UniFi Video to 3.9.0.
+ **2017-12-10:** Initial Release with UniFi Video 3.8.5.
