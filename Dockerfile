ARG BUILD_FROM=error
FROM $BUILD_FROM

EXPOSE 3551/tcp

RUN apk add apcupsd envsubst

COPY apcupsd-wrapper.sh /sbin/apcupsd-wrapper.sh
RUN chmod +x /sbin/apcupsd-wrapper.sh
CMD [ "/sbin/apcupsd-wrapper.sh" ]

COPY apcupsd.conf.in /etc/apcupsd/apcupsd.conf.in
