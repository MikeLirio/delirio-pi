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

function move_delirio_system_files() {
    echo -e "${utils_log}${YEL} Creating folder $BASE_PATH_SCRIPTS .${NC}"
    mkdir -p $BASE_PATH_SCRIPTS/scripts
    echo -e "${utils_log}${YEL} Setting privileges 777 on /opt RPi folders.${NC}"
    chown -R 777 $BASE_PATH_SCRIPTS/scripts
    echo -e "${utils_log}${YEL} Copying scripts $BASE_PATH_SCRIPTS .${NC}"
    cp -r $GITHUB_DELIRIO/scripts/src/utils $BASE_PATH_SCRIPTS/
    cp -r $GITHUB_DELIRIO/scripts/src/config $BASE_PATH_SCRIPTS/
    cp -r $GITHUB_DELIRIO/scripts/src/install.sh $BASE_PATH_SCRIPTS/
}
}

function read_configuration() {
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
                . $custom
                ;;
            * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
        esac
    done
}

function printenvpi() {
    echo -e "${global_log}${YEL}Version ${BYEL}$VERSION ${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "${GRE} ## ${YEL}ENVIRONMENT VARIABLE ${GRE}##############################################################################${NC}"
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