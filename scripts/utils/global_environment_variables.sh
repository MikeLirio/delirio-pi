#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 0.1                                                                               #
#                                                                                             #
#   Collection of all the environment variables used in all scripts.                          #
#                                                                                             #
###############################################################################################
# MANDATORY VARIABLES #########################################################################
###############################################################################################

: "${BASE_PATH_SCRIPTS:? The variable needs to be defined}"

if [[ -z "${COLORS_SH_IMPORTED}" ]]; then
    . $BASE_PATH_SCRIPTS/colors.sh        # Variables with the colors for the terminal.
fi

global_log="${GRE}#::#${YEL}global_environment_variables.sh${GRE}#::#${NC}"

###############################################################################################

###############################################################################################
# VARIABLES ###################################################################################
###############################################################################################

export BASE_PATH_SCRIPTS=/opt/delirio
export USET_PATH=/opt/delirio

export GITHUB_PATH=/opt/github
export GITHUB_DELIRIO=$GITHUB_PATH/delirio-pi
export GITHUB_DELIRIO_BRANCH=master
export GITHUB_DELIRIO_BASH_PROFILE=$GITHUB_DELIRIO/scripts/profiles/.bash_profile
export GITHUB_DELIRIO_URL=https://github.com/MikeLirio/delirio-pi.git

export DOCKER_VOLUME_NAME_NGINX=nginx_volume

###############################################################################################
# IMPORTED SCRIPTS ############################################################################
###############################################################################################

. $BASE_PATH_SCRIPTS/colors.sh  # Variables with the colors for the terminal.

###############################################################################################
# FUNCTIONS ###################################################################################
###############################################################################################

function printenvpi() {
    echo -e "${global_log}${YEL}Version ${BYEL}$VERSION ${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "${GRE} ## ${YEL}BASH PROFILE ENVIRONMENT VARIABLE ${GRE}#################################################################${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e " ${NC}"
    echo -e " ${YEL}The .bash_profiles contain the next environment variables:  ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}VERSION                        ${RED}| ${YEL} $VERSION  ${NC}"
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