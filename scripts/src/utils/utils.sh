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

function read_configuration() {
    while true; do
        echo -e "${utils_log}${YEL} Do you want to import the default configuration file to the system?${NC}"
        echo "$(cat $BASE_PATH_SCRIPTS/config/default.sh)"

        read -p "$(echo -e ${utils_log}${YEL} Y/N: ${NC})" option
        case $option in 
            Y | y )
                echo -e "${utils_log}${YEL} Loading ${BYEL}default${YEL} configuration...${NC}"
                cp $BASE_PATH_SCRIPTS/config/default.sh /etc/profile.d/delirio.env.sh
                source /etc/profile
                printenvpi
                break
                ;;
            N | n) 
                read -p "$(echo -e ${utils_log}${YEL} Write the fullpath with the filename to read it. (Ex. /opt/config/custom.conf))" custom
                echo -e "${utils_log}${YEL} Loading $custom configuration...${NC}"
                cp $custom /etc/profile.d/delirio.env.sh
                source /etc/profile
                printenvpi
                break
                ;;
            * ) echo -e "${utils_log}${RED} No valid option. Try again...${NC}";;
        esac
    done
}

function move_delirio_system_files() {
    echo -e "${utils_log}${YEL} Creating folder $BASE_PATH_SCRIPTS .${NC}"
    mkdir -p $BASE_PATH_SCRIPTS/scripts
    echo -e "${utils_log}${YEL} Setting privileges 777 on /opt RPi folders.${NC}"
    chown -R 777 $BASE_PATH_SCRIPTS/scripts
    echo -e "${utils_log}${YEL} Copying scripts $GITHUB_DELIRIO/scripts/src/utils to $BASE_PATH_SCRIPTS ${NC}"
    cp -r $GITHUB_DELIRIO/scripts/src/utils $BASE_PATH_SCRIPTS/
    echo -e "${utils_log}${YEL} Copying scripts $GITHUB_DELIRIO/scripts/src/config to $BASE_PATH_SCRIPTS ${NC}"
    cp -r $GITHUB_DELIRIO/scripts/src/config $BASE_PATH_SCRIPTS/
    echo -e "${utils_log}${YEL} Copying scripts $GITHUB_DELIRIO/scripts/src/install.sh to $BASE_PATH_SCRIPTS ${NC}"
    cp -r $GITHUB_DELIRIO/scripts/src/install.sh $BASE_PATH_SCRIPTS/
}

function move_nespi4case_system_files() {
    echo -e "${utils_log}${YEL} Copying scripts $GITHUB_DELIRIO/scripts/src/case to $BASE_PATH_SCRIPTS ${NC}"
    cp -r $GITHUB_DELIRIO/scripts/src/case $BASE_PATH_SCRIPTS/
}

function remove_nespi4case_system_files() {
    echo -e "${utils_log}${YEL} Removing files from $BASE_PATH_SCRIPTS/case ${NC}"
    rm -rf $BASE_PATH_SCRIPTS/case
}

function unistall_initial_setup() {
    echo -e "${utils_log}${YEL} Removing $BASE_PATH_SCRIPTS/install.sh file.${NC}"
    rm $BASE_PATH_SCRIPTS/install.sh
    echo -e "${utils_log}${YEL} Removing $BASE_PATH_SCRIPTS/utils file.${NC}"
    rm -rf $BASE_PATH_SCRIPTS/utils
    echo -e "${utils_log}${YEL} Removing $BASE_PATH_SCRIPTS/config file.${NC}"
    rm -rf $BASE_PATH_SCRIPTS/config
    echo -e "${utils_log}${YEL} Removing /etc/profile.d/delirio.env.sh file.${NC}"
    rm /etc/profile.d/delirio.env.sh
    echo -e "${utils_log}${YEL} Reloading the default profile.${NC}"
    source /etc/profile
    printenv
}

function printenvpi() {
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "${GRE} ## ${YEL}DELIRIO ENVIRONMENT VARIABLE ${GRE}#######################################################################${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e " ${NC}"
    echo -e " ${YEL}The .bash_profiles contain the next environment variables:  ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}VERSION                        ${RED}| ${YEL} $VERSION  ${NC}"
    echo -e "     ${BLU}INSTALL_VERSION                ${RED}| ${YEL} $INSTALL_VERSION  ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}BASE_PATH_SCRIPTS              ${RED}| ${YEL} $BASE_PATH_SCRIPTS ${NC}"
    echo -e "     ${BLU}CONFIG_FILE                    ${RED}| ${YEL} $CONFIG_FILE ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}DEBUG                          ${RED}| ${YEL} $DEBUG ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}GITHUB_PATH                    ${RED}| ${YEL} $GITHUB_PATH ${NC}"
    echo -e "     ${BLU}GITHUB_DELIRIO                 ${RED}| ${YEL} $GITHUB_DELIRIO ${NC}"
    echo -e "     ${BLU}GITHUB_DELIRIO_BRANCH          ${RED}| ${YEL} $GITHUB_DELIRIO_BRANCH ${NC}"
    echo -e "     ${BLU}GITHUB_DELIRIO_URL             ${RED}| ${YEL} $GITHUB_DELIRIO_URL ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}DOCKER_VOLUME_NAME_NGINX       ${RED}| ${YEL} $DOCKER_VOLUME_NAME_NGINX ${NC}"
    echo -e " ${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
}