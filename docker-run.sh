#!/bin/bash
DATAVOLUME=/mnt/v

docker run \
	-v /run/user/$UID/pulse/native:/run/pulse/native \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=$DISPLAY \
	-v $RENDAPATH:/gpsrenda \
	-v /etc/localtime:/etc/localtime \
	-v /etc/timezone:/etc/timezone \
	-u $UID \
	-v $(realpath $(dirname $0)):/gpsrenda \
	-v $DATAVOLUME:/data \
	-it \
	--rm \
	--name renda-containa \
	gpsrenda
