#!/bin/bash
RENDAPATH=$(realpath $(dirname "$0"));
VIDEODIR=$(realpath $(dirname "$1")); shift;
DATADIR=$(realpath $(dirname "$1")); shift;
CONFIGDIR=$(realpath $(dirname "$1")); shift;

docker run \
	-v /run/user/$UID/pulse/native:/run/pulse/native \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=$DISPLAY \
	-v $RENDAPATH:/gpsrenda \
	-v /etc/localtime:/etc/localtime \
	-v /etc/timezone:/etc/timezone \
	-u $UID \
	-v "$RENDAPATH":/gpsrenda \
	-v "$VIDEODIR":"$VIDEODIR" \
	-v "$DATADIR":"$DATADIR" \
	-v "$CONFIGDIR":"$CONFIGDIR" \
	--rm \
	--name renda-containa \
	gpsrenda /gpsrenda/gpsrenda/scripts/renda "$VIDEODIR" "$DATADIR" "$CONFIGDIR" "${@}"

