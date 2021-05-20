#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 1.0                                                                               #
#                                                                                             #
#   File to export and import the environment variables need it by the system.                #
#                                                                                             #
###############################################################################################
# MANDATORY VARIABLES #########################################################################
###############################################################################################

: "${BASE_PATH_SCRIPTS:? The variable needs to be defined}"

if [[ -z "${COLORS_SH_IMPORTED}" ]]; then
    . $BASE_PATH_SCRIPTS/utils/colors.sh        # Variables with the colors for the terminal.
fi

utils_log="${GRE}#::${YEL}./utils/utils.sh${GRE}::#${NC}"

###############################################################################################

# function setup_initial() {
#     actualUser=$(id -un)
# 
#     echo -e "${utils_log}${YEL} Creating folder /opt/delirio .${NC}"
#     sudo mkdir -p /opt/delirio/scripts
#     echo -e "${utils_log}${YEL} Setting privileges 777 on /opt RPi folders.${NC}"
#     sudo chown -R 777 /opt/github
#     sudo chown -R 777 /opt/delirio/scripts
#     echo -e "${utils_log}${YEL} Copying scripts /opt/delirio .${NC}"
#     sudo cp -r /opt/github/delirio-pi/scripts /opt/delirio/
#     echo -e "${utils_log}${YEL} Copying bash_profile .${NC}"
#     sudo cp /opt/delirio/scripts/profiles/.bash_profile /home/$actualUser/.bash_profile
#     echo -e "${utils_log}${YEL} Added as Source.${NC}"
#     . /home/$actualUser/.bash_profile
# }

function printenvpi() {
    echo -e "${global_log}${YEL}Version ${BYEL}$VERSION ${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "${GRE} ## ${YEL}BASH PROFILE ENVIRONMENT VARIABLE ${GRE}#################################################################${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e " ${NC}"
    echo -e " ${YEL}The .bash_profiles contain the next environment variables:  ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}VERSION                        ${RED}| ${YEL} $VERSION  ${NC}"
    echo -e "     ${BLU}INSTALL_VERSION                ${RED}| ${YEL} $INSTALL_VERSION  ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}BASE_PATH_SCRIPTS              ${RED}| ${YEL} $BASE_PATH_SCRIPTS ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}DEBUG                          ${RED}| ${YEL} $DEBUG ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}GITHUB_PATH                    ${RED}| ${YEL} $GITHUB_PATH ${NC}"
    echo -e "     ${BLU}GITHUB_DELIRIO                 ${RED}| ${YEL} $GITHUB_DELIRIO ${NC}"
    echo -e "     ${BLU}GITHUB_DELIRIO_BASH_PROFILE    ${RED}| ${YEL} $GITHUB_DELIRIO_BASH_PROFILE ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}DOCKER_VOLUME_NAME_NGINX    ${RED}| ${YEL} $DOCKER_VOLUME_NAME_NGINX ${NC}"
    echo -e " ${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
}