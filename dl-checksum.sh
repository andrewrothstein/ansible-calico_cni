#!/usr/bin/env sh
VER=v3.6.0
DIR=~/Downloads
MIRROR=https://github.com/projectcalico/cni-plugin/releases/download/$VER

for PLATFORM in amd64 arm64 ppc64le
do
    wget -O $DIR/calico-$PLATFORM-$VER $MIRROR/calico-$PLATFORM
    wget -O $DIR/calico-ipam-$PLATFORM-$VER $MIRROR/calico-ipam-$PLATFORM
done
sha256sum $DIR/calico-*-$VER


