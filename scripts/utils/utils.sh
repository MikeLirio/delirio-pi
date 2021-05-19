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
    . $BASE_PATH_SCRIPTS/colors.sh        # Variables with the colors for the terminal.
fi

utils_log="${GRE}#::${YEL}./utils/utils.sh${GRE}::#${NC}"

###############################################################################################

function exportConfiguration() {
    
}

function importConfiguration() {

}

function setup_initial() {
    actualUser=$(id -un)

    echo -e "${utils_log}${YEL} Creating folder /opt/delirio .${NC}"
    sudo mkdir -p /opt/delirio/scripts
    echo -e "${utils_log}${YEL} Setting privileges 777 on /opt RPi folders.${NC}"
    sudo chown -R 777 /opt/github
    sudo chown -R 777 /opt/delirio/scripts
    echo -e "${utils_log}${YEL} Copying scripts /opt/delirio .${NC}"
    sudo cp -r /opt/github/delirio-pi/scripts /opt/delirio/
    echo -e "${utils_log}${YEL} Copying bash_profile .${NC}"
    sudo cp /opt/delirio/scripts/profiles/.bash_profile /home/$actualUser/.bash_profile
    echo -e "${utils_log}${YEL} Added as Source.${NC}"
    . /home/$actualUser/.bash_profile
}