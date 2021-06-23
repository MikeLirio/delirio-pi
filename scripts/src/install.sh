#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 1.0                                                                               #
#                                                                                             #
#   Script to run to deploy all the scripts on Raspberry configuring:                         #
#       - Copying bash files from the Github repository to Raspberry Pi.                      #
#                                                                                             #
###############################################################################################
## ENVIRONMENT VARIABLE #######################################################################
###############################################################################################

: "${BASE_PATH_SCRIPTS:= "$(pwd)"}"

if [[ -z "${UTILS_SH_IMPORTED}" ]]; then
    . $BASE_PATH_SCRIPTS/utils/utils.sh        # Variables with the colors for the terminal.
    : "${UTILS_SH_IMPORTED:? The variable needs to be defined}" 
fi

if [[ -z "${COLORS_SH_IMPORTED}" ]]; then
    . $BASE_PATH_SCRIPTS/utils/colors.sh        # Variables with the colors for the terminal.
    : "${COLORS_SH_IMPORTED:? The variable needs to be defined}" 
fi

export INSTALL_VERSION=1.1

install_log="${GRE}#::${BYEL}./install.sh${GRE}::#${NC}"

###############################################################################################

function initial_setup() {
    read_configuration
    move_delirio_system_files
    while true; do 
        read -p "$(echo -e $install_log${BYEL} Do you want to configure the Nespi4Case? Y/N)" option
        case $option in
            Y | y ) case_setup; break;;
            N | n ) break;;
            * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
        esac
    done
}

function case_setup() {
    while true; do
        echo -e "$install_log${BYEL} Which action would you like to perform about ${BRED}Nespi4Case${BYEL} ?${NC}"
        echo -e "$install_log${CYA}    [${RED}0${CYA}] Install/Update on Raspberry Pi.${NC}"
        echo -e "$install_log${CYA}    [${RED}1${CYA}] Install Reset button daemon.${NC}"
        echo -e "$install_log${CYA}    [${RED}2${CYA}] Install Shutdown button daemon.${NC}"
        echo -e "$install_log${CYA}    [${RED}3${CYA}] Install the safe-close scripts.${NC}"
        echo -e "$install_log${CYA}    [${RED}4${CYA}] Install/Update all.${NC}"
        echo -e "$install_log${CYA}    [${RED}5${CYA}] Exit.${NC}"

        read -p "$(echo -e $install_log${BYEL} Write the number of the option: ${NC})" option
        case $option in 
            0 ) move_nespi4case_system_files;;
            1 ) bash $BASE_PATH_SCRIPTS/case/setup.sh -r;;
            2 ) bash $BASE_PATH_SCRIPTS/case/setup.sh -s;;
            3 ) bash $BASE_PATH_SCRIPTS/case/setup.sh -c;;
            4 ) 
                move_nespi4case_system_files
                bash $BASE_PATH_SCRIPTS/case/setup.sh
                ;;
            5 ) break;;
            * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
        esac
    done
}

function docker_init() {
    echo -e "$install_log${BYEL} WIP.${NC}"
    # if [[ -z "${DOCKER_PATH}" ]]; then
    #     : "${DOCKER_PATH:? The variable needs to be defined}" 
    #     echo -e "$install_log${BYEL} Make sure before continue that you import the last Delirio-Pi variables.${NC}"
    # else
    #     if [[ -d "${DOCKER_PATH}" ]]; then
    #         echo -e "$install_log${BYEL} Make sure you first import all the docker files to the Raspberry Pi.${NC}"
    #     else
    #         docker-compose up -f ${DOCKER_PATH}/system/webserver
    #     fi
    # fi
}

function unistall() {
    while true; do
        echo -e "$install_log${BYEL} Which software do you want to remove?${NC}"
        echo -e "$install_log${CYA}    [${RED}0${CYA}] Initial Setup.${NC}"
        echo -e "$install_log${CYA}    [${RED}1${CYA}] .bash_profile from users.${NC}"
        echo -e "$install_log${CYA}    [${RED}2${CYA}] Nespi4Case software.${NC}"
        echo -e "$install_log${CYA}    [${RED}3${CYA}] Docker.${NC}"
        echo -e "$install_log${CYA}    [${RED}4${CYA}] All.${NC}"
        echo -e "$install_log${CYA}    [${RED}5${CYA}] Exit.${NC}"

        read -p "$(echo -e $install_log${BYEL} Write the number of the option: ${NC})" option
        case $option in 
            0 )  
                unistall_initial_setup
                ;;
            1 )  
                uninstall_bash_profiles
                ;;
            2 )  
                bash $BASE_PATH_SCRIPTS/case/setup.sh -u
                remove_nespi4case_system_files
                ;;
            3 )  
                docker_delete
                ;;
            4 ) 
                # .bash_profile
                uninstall_bash_profiles
                # docker
                docker_delete
                # Case
                bash $BASE_PATH_SCRIPTS/case/setup.sh -u
                remove_nespi4case_system_files
                # Initial Setup
                unistall_initial_setup
                ;;
            5 ) break;;
            * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
        esac
    done
}

echo -e "${GRE} ######################################################################################################${NC}"
echo -e "${install_log}${RED} /\  __-.  /\  ___\   /\ \       /\ \   /\  == \   /\ \   /\  __ \      /\  == \ /\ \   "
echo -e "${install_log}${RED} \ \ \/\ \ \ \  __\   \ \ \____  \ \ \  \ \  __<   \ \ \  \ \ \/\ \     \ \  _-/ \ \ \  "
echo -e "${install_log}${RED}  \ \____-  \ \_____\  \ \_____\  \ \_\  \ \_\ \_\  \ \_\  \ \_____\     \ \_\    \ \_\ "
echo -e "${install_log}${RED}   \/____/   \/_____/   \/_____/   \/_/   \/_/ /_/   \/_/   \/_____/      \/_/     \/_/ "
echo -e "${GRE} ######################################################################################################${NC}"
echo -e "$install_log${BYEL} Setting the ${BRED}Delirio Pi${BYEL} configuration. Thanks for downloading!${NC}"
echo -e "$install_log${NC}"
echo -e "$install_log${BYEL} Bear in mind that if it is the first time you are executing this script,${NC}"
echo -e "$install_log${BYEL} please, to avoid issues select the option <${RED}[0] Initial setup.${BYEL}> first.${NC}"
while true; do
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "$install_log${BYEL} What to you want to setup? ${NC}"
    echo -e "$install_log${CYA}    [${RED}0${CYA}] Initial setup.${NC}"
    echo -e "$install_log${CYA}    [${RED}1${CYA}] Nespi4Case setup.${NC}"
    echo -e "$install_log${CYA}    [${RED}2${CYA}] Docker Init.${NC}"
    echo -e "$install_log${CYA}    [${RED}3${CYA}] Install/Update .bash_profile files.${NC}"
    echo -e "$install_log${CYA}    [${RED}4${CYA}] Create share folders.${NC}"
    echo -e "$install_log${CYA}    [${RED}5${CYA}] Uninstall.${NC}"
    echo -e "$install_log${CYA}    [${RED}6${CYA}] Exit.${NC}"

    read -p "$(echo -e $install_log${BYEL} Write the number of the option: ${NC})" option
    case $option in 
        0 ) initial_setup;;
        1 ) case_setup;;
        2 ) docker_init;;
        3 ) install_bash_profiles;;
        4 ) share_folder;;
        5 ) unistall;;
        6 ) break;;
        * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
    esac
    echo -e "${GRE} ######################################################################################################${NC}"
done
echo -e "$install_log${BYEL} Thanks for using ${BYEL}Delirio Pi${BYEL} scripts.${NC}"
echo -e "${GRE} ######################################################################################################${NC}"
exit