FROM alpine:3.13

ARG VER=v1.2.0-5
ARG TARGETARCH
ARG ARCH
ENV configfile="/opt/config.yaml"
ENV log_dir="/log"
ENV TZ=Asia/Shanghai


COPY ./entrypoint.sh /root/
COPY ./arch.sh  /tmp/

RUN apk add --no-cache wget tzdata \
  && chmod +x  /tmp/arch.sh /root/entrypoint.sh \
  && mkdir /plots /tmp/linux  \
  && /tmp/arch.sh ${VER} && ls /tmp/linux -ahl\
  && mv /tmp/linux/* /opt \
  && cd /opt && mv hpool-* hpool-chia-miner \
  && chmod +x /opt/hpool-chia-miner && ls -ahl \
  && cp /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone \
  && cat /etc/timezone \
  && rm -rf /tmp/* \
  && apk del wget tzdata

WORKDIR /opt

ENTRYPOINT ["sh", "/root/entrypoint.sh"]
