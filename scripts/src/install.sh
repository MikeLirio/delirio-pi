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
    read_configuration
    move_delirio_system_files
    while true; do 
        read -p "$(echo -e $install_log${YEL} Do you want to configure the Nespi4Case?)" opt_install_case
        case $opt_install_case in
            Y | y ) case_setup;;
            N | n ) break;;
            * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
        esac
    done
}

function case_setup() {
    echo "next step"
    #if [[ -z "${CASE_SETUP_IMPORTED}" ]]; then
    #    . $BASE_PATH_SCRIPTS/case/setup.sh
    #fi
    #srp_help
}

function bash_scripts_setup() {
    #echo -e "${utils_log}${YEL} Copying bash_profile .${NC}"
    #sudo cp $BASE_PATH_SCRIPTS/scripts/profiles/.bash_profile /home/$actualUser/.bash_profile
    #echo -e "${utils_log}${YEL} Added as Source.${NC}"
    #. /home/$actualUser/.bash_profile
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
echo -e "$install_log${YEL} Bear in mind that if it is the first time you are executing this script, please, to avoid issues select the option <${RED}[0] Initial setup.${YEL}> first.${NC}"
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