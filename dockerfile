
######################################################################
#   Dockerfile for basic docker image to upload ftp videos           #
#   from Reolink security camera to \\homeserver\Video\RearGarden    #
#   It uses inotifywait and rsync, both need to be added to alpine   #
#   and rsync to upload .mp4 files to the homeserver                 #
#   All file & folder references are as from this docker container   #
#   Requires bind mounts for FFFFFFFFFF & /tmp                       #
#   To /home/mju/Videos and /mnt/homeserver_video_reargarden respec  #
#   last updated 20240311                                            #
######################################################################

FROM alpine:latest

RUN mkdir /homepi_opt && mkdir /homeserver_backup_homepi
RUN apk add inotify-tools rsync --no-cache

RUN apk add --no-cache tzdata
ENV TZ: "Europe/London"
# need the next line as TZ line has no effect
RUN cp /usr/share/zoneinfo/Europe/London /etc/localtime

COPY entrypoint.sh .
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

# CMD ["crond","-f"] 

