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

. $BASE_PATH_SCRIPTS/utils/colors.sh                        # Variables with the colors for the terminal.

. $BASE_PATH_SCRIPTS/docker/jenkins.sh
. $BASE_PATH_SCRIPTS/docker/nexus.sh
. $BASE_PATH_SCRIPTS/docker/nginx.sh
. $BASE_PATH_SCRIPTS/docker/pi-hole.sh
. $BASE_PATH_SCRIPTS/docker/jenkins.sh

docker_log="${GRE}#::${BYEL}./docker/setup.sh${GRE}::#${NC}"

###############################################################################################

function setup_docker() {
    while true; then
        echo -e "${GRE} ######################################################################################################${NC}"
        echo -e "${docker_log}${BYEL} Which action would you like to perform? ${NC}"
        echo -e "${docker_log}${CYA}    [${RED}0${CYA}] Initial/Update Setup.${NC}"
        echo -e "${docker_log}${CYA}    [${RED}1${CYA}] Jenkins.${NC}"
        echo -e "${docker_log}${CYA}    [${RED}2${CYA}] Nginx.${NC}"
        echo -e "${docker_log}${CYA}    [${RED}3${CYA}] Nexus.${NC}"
        echo -e "${docker_log}${CYA}    [${RED}4${CYA}] Pi-Hole.${NC}"
        echo -e "${docker_log}${CYA}    [${RED}5${CYA}] Sonar.${NC}"
        echo -e "${docker_log}${CYA}    [${RED}6${CYA}] All.${NC}"
        echo -e "${docker_log}${CYA}    [${RED}7${CYA}] Unistall.${NC}"
        echo -e "${docker_log}${CYA}    [${RED}8${CYA}] Exit.${NC}"

        read -p "$(echo -e $docker_log${BYEL} Write the number of the option: ${NC})" option
    case $option in 
        0 ) docker_initial_setup;;
        1 ) case_setup;;
        2 ) docker_setup;;
        3 ) install_bash_profiles;;
        4 ) unistall;;
        5 ) unistall;;
        6 ) unistall;;
        7 ) break;;
        7 ) break;;
        * ) echo -e "$docker_log${RED} No valid option. Try again...${NC}";;
    esac
    done
}

echo -e "${GRE} ######################################################################################################${NC}"
echo -e "${docker_log}${YEL}Welcome to the Docker setup on ${BRED}Delirio Pi${BYEL}.${NC}"
echo -e "${GRE} ######################################################################################################${NC}"
setup_docker
echo -e "${docker_log}${YEL}Leaving the Docker installation ${RED}<3${NC}"
echo -e "${GRE} ######################################################################################################${NC}"