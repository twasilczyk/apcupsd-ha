ARG BUILD_FROM=error
FROM $BUILD_FROM

EXPOSE 3551

RUN apk add apcupsd

COPY apcupsd.conf /etc/apcupsd/apcupsd.conf

CMD [ "/sbin/apcupsd", "-b" ]
