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
#       |    - none                                                                           #
#       |                                                                                     #
#       + repository | nexus                                                                  #
#       |    - Pending to define                                                              #
#       |                                                                                     #
#       + sonar | sonarqube                                                                   #
#       |    - Pending to define                                                              #
#       |                                                                                     #
#       + jenkins                                                                             #
#       |    - Pending to define                                                              #
#       |                                                                                     #
#       + pi-hole                                                                             #
#       |    - Pending to define                                                              #
#                                                                                             #
###############################################################################################
# IMPORTED SCRIPTS ############################################################################
###############################################################################################

. $BASE_PATH_SCRIPTS/colors.sh                        # Variables with the colors for the terminal.
. $BASE_PATH_SCRIPTS/global_environment_variables.sh  # All the environment variables declared along the scripts
. $BASE_PATH_SCRIPTS/progress_bar.sh                  # Progress bar.

###############################################################################################

#function nginx_setup() {
#    if [ ! "docker volume inspect $DOCKER_VOLUME_NAME_NGINX | grep $DOCKER_VOLUME_NAME_NGINX" ]; then
#
#        echo -e "${GRE}#::docker/setup.sh::# ${YEL}Creating the volumes for Docker.${NC}"
#        docker volume create $DOCKER_VOLUME_NAME_NGINX
#
#    else
#
#        echo -e "${GRE}#::docker/setup.sh::# ${YEL} The volume $DOCKER_VOLUME_NAME_NGINX already exist!${NC}"
#        echo -e "${GRE}#::docker/setup.sh::# ${RED} Doing nothing. ${NC}"
#        
#    fi
#}

echo -e "${GRE}#::docker/setup/volumes.sh::# ${YEL}Checking the Docker volumes...${NC}"
echo -e "${GRE}#::docker/setup/volumes.sh::# ${YEL}Nothing to do ${RED}<3${NC}"