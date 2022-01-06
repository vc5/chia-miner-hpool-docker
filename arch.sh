#!/bin/sh
if [ "$TARGETARCH" = "amd64" ] ; then ARCH=linux;fi
if [ "$TARGETARCH" = "arm64" ] ; then ARCH=aarch64;fi
if [ "$TARGETARCH" = "arm" ] ; then ARCH=arm;fi

VER=1.5.6
BUILD_VER=1
echo "https://github.com/hpool-dev/chia-miner/releases/download/${VER}/HPool-Miner-chia-og-v${VER}-${BUILD_VER}-linux.zip "
wget -q --no-check-certificate https://github.com/hpool-dev/chia-miner/releases/download/${VER}/HPool-Miner-chia-og-v${VER}-${BUILD_VER}-linux.zip -O /tmp/chia-miner.zip && unzip -j /tmp/chia-miner.zip -d /tmp/linux
ls /tmp/linux -ahl
mv /tmp/linux/hpool-miner-chia-linux-${ARCH} /opt/hpool-chia-miner
chmod +x /opt/hpool-chia-miner