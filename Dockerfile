FROM debian:stable-slim

ARG VER=2.0.0
ARG BUILDVER=1
ARG TARGETARCH
ARG ARCH
ENV configfile="/opt/config.yaml"
ENV log_dir="/log"
ENV TZ=Asia/Shanghai


COPY ./entrypoint.sh /root/
COPY ./arch.sh  /tmp/

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends ca-certificates wget unzip \
    && chmod +x  /tmp/arch.sh /root/entrypoint.sh \
    && /tmp/arch.sh ${VER} ${BUILDVER}\
    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && cat /etc/timezone \
    && rm -rf /tmp/* \
    && ls -al /opt 

WORKDIR /opt

ENTRYPOINT ["/bin/sh", "/root/entrypoint.sh"]
