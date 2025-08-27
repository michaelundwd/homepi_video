
######################################################################
#   Dockerfile for basic docker image to give nightly backup of /opt #
#   /opt folder holds all persistent data for docker containers      #
#   All file & folder references are as from this docker container   #
#   Requires bind mounts for homepi_opt & homeserver_backup_homepi   #
#   To /opt and /mnt/homeserver_backup_homepi respectively           #
#   last updated 20240311                                            #
######################################################################

FROM alpine:latest

RUN mkdir /homepi_opt && mkdir /homeserver_backup_homepi

COPY entrypoint.sh .
RUN chmod +x ./entrypoint.sh

RUN apk add --no-cache tzdata
ENV TZ: "Europe/London"
# need the next line as TZ line has no effect
RUN cp /usr/share/zoneinfo/Europe/London /etc/localtime

ENTRYPOINT ["./entrypoint.sh"]

# CMD ["crond","-f"] 

