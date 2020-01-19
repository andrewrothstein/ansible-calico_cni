#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/projectcalico/cni-plugin/releases/download

dl()
{
    local ver=$1
    local app=$2
    local arch=$3
    local url=$MIRROR/$ver/$app-$arch
    local lfile=$DIR/$app-$arch-$ver
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi
    printf "        # %s\n" $url
    printf "        %s: sha256:%s\n" $arch `sha256sum $lfile | awk '{print $1}'`
}

dl_ver() {
    local ver=$1

    printf "  %s:\n" $ver
    printf "    - f: calico\n"
    printf "      checksums:\n"
    dl $ver calico amd64
    dl $ver calico arm64
    dl $ver calico ppc64le

    printf "    - f: calico-ipam\n"
    printf "      checksums:\n"
    dl $ver calico-ipam amd64
    dl $ver calico-ipam arm64
    dl $ver calico-ipam ppc64le
}

dl_ver ${1:-v3.11.2}
