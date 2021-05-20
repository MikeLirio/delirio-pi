#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 0.1                                                                               #
#                                                                                             #
#   This script will create all the volumes for Docker containers.                            #
#                                                                                             #
#   List of volumes:                                                                          #
#       + webserver  | nginx                                                                  #
#       |    - DOCKER_VOLUME_NAME_NGINX=nginx_volume                                           #
#       |                                                                                      #
#       + repository | nexus                                                                  #
#       |                                                                                      #
#       + ...                                                                                 #
#                                                                                             #
###############################################################################################
# IMPORTED SCRIPTS ############################################################################
###############################################################################################

. $BASE_PATH_SCRIPTS/colors.sh                        # Variables with the colors for the terminal.
. $BASE_PATH_SCRIPTS/global_environment_variables.sh  # All the environment variables declared along the scripts
. $BASE_PATH_SCRIPTS/progress_bar.sh                  # Progress bar.

###############################################################################################

progress_bar_start

echo -e "${GRE}#::docker/setup.sh::# ${YEL}Creating the volumes for Docker.${NC}"
. $BASE_PATH_SCRIPTS/docker/setup/volumes.sh

progress_bar 20

. $BASE_PATH_SCRIPTS/docker/setup/nginx.sh
progress_bar 10
. $BASE_PATH_SCRIPTS/docker/setup/nexus.sh
progress_bar 10
. $BASE_PATH_SCRIPTS/docker/setup/jenkins.sh
progress_bar 10
. $BASE_PATH_SCRIPTS/docker/setup/pi-hole.sh
progress_bar 10
. $BASE_PATH_SCRIPTS/docker/setup/sonar.sh
progress_bar 10

echo -e "${GRE}#::docker/setup.sh::# ${YEL}Done ${RED}<3${NC}"
progress_bar_end