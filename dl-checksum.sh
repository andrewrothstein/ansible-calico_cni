#!/usr/bin/env sh
VER=v3.8.0
DIR=~/Downloads
MIRROR=https://github.com/projectcalico/cni-plugin/releases/download/$VER

dl()
{
    APP=$1
    PLATFORM=$2
    URL=$MIRROR/$APP-$PLATFORM
    LFILE=$DIR/$APP-$PLATFORM-$VER
    if [ ! -e $LFILE ]
    then
        wget -q -O $LFILE $URL
    fi
    printf "        # %s\n" $URL
    printf "        %s: sha256:%s\n" $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "  %s:\n" $VER
printf "    - f: calico\n"
printf "      checksums:\n"
dl calico amd64
dl calico arm64
dl calico ppc64le

printf "    - f: calico-ipam\n"
printf "      checksums:\n"
dl calico-ipam amd64
dl calico-ipam arm64
dl calico-ipam ppc64le
