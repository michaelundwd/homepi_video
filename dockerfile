#################################################################
# Moves .mp4 files ftp'd from rear garden camera to homeserver  #
# more information in ReadMe                                    #
# last updated 15/09/2025                                       #
#################################################################

FROM alpine:latest

RUN mkdir /homepi_home_mju_videos /homepi_opt /homeserver_video_reargarden 
RUN apk add inotify-tools rsync tzdata --no-cache

ENV TZ="Europe/London"
# need the next line as TZ line has no effect
RUN cp /usr/share/zoneinfo/Europe/London /etc/localtime

ENTRYPOINT ["/homepi_opt/video/startup.sh"]

