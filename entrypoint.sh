#!/bin/sh
# entrypoint.sh
# runs the reargarden script in the host that copies the daily video folder tidy up schedule to the container at startup and runs the video move routines
# the next line needs modification for the video actions
exec ./homepi_opt/video/reargarden-script.sh
#