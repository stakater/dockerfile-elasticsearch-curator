FROM stakater/base-alpine:3.7

ARG CURATOR_VERSION=3.5.1
ENV CRON_SCHEDULE="0 0 * * * *"

RUN \
  apk add -Uv --progress \
    python \
    py-pip \
    sed \
    && \
  pip install --no-cache-dir \
    elasticsearch-curator==${CURATOR_VERSION} \
    && \
  mkdir /actions /config


RUN echo "${CRON_SCHEDULE}	/usr/sbin/curator --config /config/config.yaml /action/action.yaml" >> /etc/crontabs/root

COPY default actions and configuration and volume map in doc

ENTRYPOINT [ ]
CMD ["crond", "-f"]