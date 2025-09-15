###########################################################################
# Dockerfile for docker image that will upload .mp4 videos via ftp      #
# from Reolink security camera to \\homeserver\Video\RearGarden         #
# It uses inotifywait to watch for ftp uploads                          #
# and Rsync to upload .mp4 files to the homeserver                      #
# Requires the following bind mounts in Portainer:                      #
# /homepi_home_mju_videos > /home/mju/Videos (watch)                    #
# /homepi_opt > /opt                                                    #
# /homeserver_video_reargarden > /mnt/homeserver_video_reargarden (sync)#
# entrypoint.sh contains the inotify code and rsync commands            #
# last updated 14/09/2025                                               #
###########################################################################

FROM alpine:latest

RUN mkdir /homepi_home_mju_videos /homepi_opt /homeserver_video_reargarden 
RUN apk add inotify-tools rsync tzdata --no-cache

ENV TZ="Europe/London"
# need the next line as TZ line has no effect
RUN cp /usr/share/zoneinfo/Europe/London /etc/localtime

ENTRYPOINT ["/homepi_opt/video/startup.sh"]

