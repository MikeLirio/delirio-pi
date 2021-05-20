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
## ENVIRONMENT VARIABLE #######################################################################
###############################################################################################

: "${BASE_PATH_SCRIPTS:= "$(pwd)"}"

. $BASE_PATH_SCRIPTS/utils/colors.sh
. $BASE_PATH_SCRIPTS/utils/utils.sh

export INSTALL_VERSION=1.0

install_log="${GRE}#::${YEL}./install.sh${GRE}::#${NC}"

###############################################################################################

function initial_setup() {
    while true; do
        echo -e "$install_log${YEL} Do you want to import the default configuration file to the system?${NC}"
        echo "$(cat $BASE_PATH_SCRIPTS/config/default.conf)"

        read -p "$(echo -e $install_log${YEL} Y/N: ${NC})" option
        case $option in 
            Y | y ) 
                echo -e "$install_log${YEL} Loading ${BYEL}default${YEL} configuration...${NC}"
                . $BASE_PATH_SCRIPTS/config/default.conf
                printenvpi
                break
                ;;
            N | n) 
                read -p "$install_log${YEL} Write the fullpath with the filename to read it. (Ex. /opt/config/custom.conf" custom
                echo -e "$install_log${YEL} Loading $custom configuration...${NC}"
                #. $custom
                ;;
            * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
        esac
    done
}

function case_setup() {
    if [[ -z "${CASE_SETUP_IMPORTED}" ]]; then
        . $BASE_PATH_SCRIPTS/case/setup.sh
    fi

    srp_help
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

echo -e "$install_log${YEL} Setting the ${BYEL}Delirio Pi${YEL} configuration. Thanks for downloading!${NC}"
while true; do
    echo -e "$install_log${YEL} What to you want to setup? ${NC}"
    echo -e "$install_log${BLU}    [${RED}0${BLU}] Initial setup.${NC}"
    echo -e "$install_log${BLU}    [${RED}1${BLU}] Nespi4Case setup.${NC}"
    echo -e "$install_log${BLU}    [${RED}2${BLU}] Docker.${NC}"
    echo -e "$install_log${BLU}    [${RED}3${BLU}] Install/Update .bash_profile files.${NC}"
    echo -e "$install_log${BLU}    [${RED}4${BLU}] Uninstall.${NC}"
    echo -e "$install_log${BLU}    [${RED}5${BLU}] Exit.${NC}"

    read -p "$(echo -e $install_log${YEL} Write the number of the option: ${NC})" option
    case $option in 
        0 ) initial_setup;;
        1 ) case_setup;;
        2 ) docker_setup;;
        3 ) bash_profiles;;
        4 ) unistall;;
        5 ) break;;
        * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
    esac
done

echo -e "$install_log${YEL} Thanks for using ${BYEL}Delirio Pi${YEL} scripts.${NC}"