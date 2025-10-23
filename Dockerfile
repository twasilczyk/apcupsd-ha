ARG BUILD_FROM=error
FROM $BUILD_FROM

#EXPOSE 3551/tcp
CMD [ "/sbin/apcupsd-wrapper.sh" ]

RUN apk add apcupsd envsubst

COPY rootfs /
