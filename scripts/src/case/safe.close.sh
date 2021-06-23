#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 0.1                                                                               #
#                                                                                             #
#   Command lines to shutdown or reboot the Raspberry safetaly.                               #
#                                                                                             #
###############################################################################################
# IMPORTED SCRIPTS ############################################################################
###############################################################################################

. ./../colors.sh        # Variables with the colors for the terminal.

###############################################################################################

echo "Script to exit from applications."
echo "1) Close Docker"
echo "2) Close any application configured on the Raspberry Pi"

# This could be another way to do the approach. Move all the scripts of safe close of the raspbery pi 
# on a folder, and executes all the files inside that folder.
# With this approach, to add or remove scripts of additional behaviors, it will consist only on 
# add/remove files inside the folder.

# for entry in /scripts/case/safe_close/*.sh; do
#   bash $entry
# done