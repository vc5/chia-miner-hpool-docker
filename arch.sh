#!/bin/sh
if [ "$TARGETARCH" = "amd64" ] ; then ARCH=amd64;fi
if [ "$TARGETARCH" = "arm64" ] ; then ARCH=aarch64;fi
if [ "$TARGETARCH" = "arm" ] ; then ARCH=arm;fi

VER=$1
BUILD_VER=$2
ZIP_URL = "https://github.com/h9-dev/chia-miner/releases/download/v${VER}/HPool-Miner-chia-og-v${VER}-${BUILD_VER}-linux.zip "


echo ${ZIP_URL}
wget -q --no-check-certificate ${ZIP_URL} -O /tmp/chia-miner.zip && unzip -j /tmp/chia-miner.zip -d /tmp/linux
ls /tmp/linux -ahl
mv /tmp/linux/hpool-miner-chia-linux-${ARCH} /opt/hpool-chia-miner
chmod +x /opt/hpool-chia-miner