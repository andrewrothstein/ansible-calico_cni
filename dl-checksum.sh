#!/usr/bin/env sh
VER=v3.2.1
DIR=~/Downloads
MIRROR=https://github.com/projectcalico/cni-plugin/releases/download/$VER

for PLATFORM in "" -arm64 -ppc64le
do
    wget -O $DIR/calico$PLATFORM-cni-$VER $MIRROR/calico$PLATFORM
    wget -O $DIR/calico-ipam$PLATFORM-cni-$VER $MIRROR/calico-ipam$PLATFORM
done
sha256sum $DIR/calico*-cni-$VER


