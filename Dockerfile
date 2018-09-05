FROM registry.access.redhat.com/rhel7

MAINTAINER Jonathan Arrance <jonathan@zerostack.com>

ENV DOWNLOAD_PATH /opt/ZCOS

LABEL name="ZeroStack Intelligent Cloud Platform" \
      vendor="ZeroStack" \
      version="1.0" \
      release="1" \
      summary="A small container that will explain how to pull the ZCOS iso, and present the install instructions." \
      description="A small container that will explain how to pull the ZCOS iso, and present the install instructions." \

RUN mkdir -p $DOWNLOAD_PATH

WORKDIR $DOWNLOAD_PATH

COPY licenses /licenses

ADD shell/pull_image.sh $DOWNLOAD_PATH