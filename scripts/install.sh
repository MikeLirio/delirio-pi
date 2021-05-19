#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 1.0                                                                               #
#                                                                                             #
#   Script to run to deploy all the scripts on Raspberry configuring:                         #
#       - Copying bash files from the Github repository to Raspberry Pi.                      #
#       -                                                                                     #
#                                                                                             #
###############################################################################################

: "${BASE_PATH_SCRIPTS:= "."}"

. $BASE_PATH_SCRIPTS/utils/colors.sh
#. $BASE_PATH_SCRIPTS/utils/utils.sh

install_log="${GRE}#::${YEL}./install.sh${GRE}::#${NC}"

###############################################################################################

function initial_setup() {
    echo -e "$install_log ${YEL} List of important environment variables to be defined on the system:${NC}"
    #if [[ $BASE_PATH_SCRIPTS = "."]]; then
    #    echo -e "$install_log${YEL} Setting the ${BYEL}Delirio Pi${YEL} configuration. Thanks for downloading!${NC}"
    #fi
}

function bash_scripts_setup() {
    echo -e "$install_log${YEL} bash_scripts_setup${NC}"
}

function docker_setup() {
    echo -e "$install_log${YEL} docker_setup${NC}"
}

function unistall() {
    echo -e "$install_log${YEL} unistall${NC}"
}

function bash_profiles() {
    echo -e "$install_log${YEL} bash_profiles${NC}"
}

while true; do
    echo -e "$install_log${YEL} Setting the ${BYEL}Delirio Pi${YEL} configuration. Thanks for downloading!${NC}"
    echo -e "$install_log${YEL} What to you want to setup? ${NC}"
    echo -e "$install_log${BLU}    [${RED}0${BLU}] Initial setup.${NC}"
    echo -e "$install_log${BLU}    [${RED}1${BLU}] Move sh scripts.${NC}"
    echo -e "$install_log${BLU}    [${RED}2${BLU}] Docker.${NC}"
    echo -e "$install_log${BLU}    [${RED}3${BLU}] Install/Update .bash_profile files.${NC}"
    echo -e "$install_log${BLU}    [${RED}4${BLU}] Uninstall.${NC}"
    echo -e "$install_log${BLU}    [${RED}5${BLU}] Exit.${NC}"

    read -p "$(echo -e $install_log${YEL} Write the number of the option: ${NC})" option
    case $option in 
        0 ) environment_variable_setup;;
        1 ) bash_scripts_setup;;
        2 ) docker_setup;;
        3 ) bash_profiles;;
        4 ) unistall;;
        5 ) break;;
        * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
    esac
done

echo -e "$install_log${YEL} Thanks for using ${BYEL}Delirio Pi${YEL} scripts.${NC}"