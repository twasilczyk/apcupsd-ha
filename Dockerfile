ARG BUILD_FROM=error
FROM $BUILD_FROM

LABEL org.opencontainers.image.source=https://github.com/twasilczyk/apcupsd-ha
EXPOSE 3551/tcp
CMD [ "/sbin/apcupsd-wrapper.sh" ]

RUN apk add apcupsd envsubst

COPY rootfs /
