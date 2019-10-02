#!/usr/bin/env sh
VER=${1:-v3.9.1}
DIR=~/Downloads
MIRROR=https://github.com/projectcalico/cni-plugin/releases/download/$VER

dl()
{
    local app=$1
    local arch=$2
    local url=$MIRROR/$app-$arch
    local lfile=$DIR/$app-$arch-$VER
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi
    printf "        # %s\n" $url
    printf "        %s: sha256:%s\n" $arch `sha256sum $lfile | awk '{print $1}'`
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
