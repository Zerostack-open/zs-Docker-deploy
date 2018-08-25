FROM alpine:3.7

MAINTAINER Jonathan Arrance <jonathan@zerostack.com>

ENV DOWNLOAD_PATH /opt/ZCOS

RUN mkdir -p $DOWNLOAD_PATH

WORKDIR $DOWNLOAD_PATH

ADD shell/pull_image.sh $INSTALL_PATH

CMD ["./start_api.sh"]