#!/bin/bash
RENDAPATH=$(dirname "$0");
VIDEODIR=$(dirname "$1");
DATADIR=$(dirname "$2");
CONFIGDIR=$(dirname "$3");

docker run \
	-v /run/user/$UID/pulse/native:/run/pulse/native \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=$DISPLAY \
	-v $RENDAPATH:/gpsrenda \
	-v /etc/localtime:/etc/localtime \
	-v /etc/timezone:/etc/timezone \
	-u $UID \
	-v $RENDAPATH:/gpsrenda \
	-v $VIDEODIR:$VIDEODIR \
	-v $DATADIR:$DATADIR \
	-v $CONFIGDIR:$CONFIGDIR \
	--rm \
	--name renda-containa \
	gpsrenda "$@"
