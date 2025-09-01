#!/bin/sh
# entrypoint.sh
# runs the startup script in the host that copies the daily video folder tidy up schedule to the container at startup and runs the video move routines
# last modified 01/09/2025
exec ./homepi_opt/video/startup-script.sh
#