FROM alpine:3.12

ARG VER=v1.2.0-5
ARG TARGETARCH
ARG ARCH
ENV configfile="/opt/config.yaml"
ENV log_dir="/log"
ENV TZ="Asia/Shanghai"


COPY ./entrypoint.sh /root/
COPY ./arch.sh  /tmp/

RUN apk add --no-cache wget tzdata \
  && chmod +x  /tmp/arch.sh /root/entrypoint.sh \
  && mkdir /plots /tmp/linux  \
  && /tmp/arch.sh ${VER} \
  && mv /tmp/linux/* /opt \
  && cd /opt && mv hpool-* hpool-chia-miner \
  && cp /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone \
  && cat /etc/timezone \
  && rm -rf /tmp/* \
  && apk del wget tzdata

WORKDIR /opt

ENTRYPOINT ["sh", "/root/entrypoint.sh"]
