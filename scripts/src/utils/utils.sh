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

export UTILS_SH_IMPORTED=true;

utils_log="${GRE}#::${BYEL}./utils/utils.sh${GRE}::#${NC}"

###############################################################################################

function read_configuration() {
    while true; do
        echo -e "${utils_log}${BYEL} Making a backup of file /etc/bash.bashrc ${NC}"
        cp /etc/bash.bashrc $BASE_PATH_SCRIPTS/config/bash.bashrc.backup
        echo -e "${utils_log}${BYEL} Do you want to import the default configuration file to the system?${NC}"
        echo "$(cat $BASE_PATH_SCRIPTS/config/default.sh)"

        read -p "$(echo -e ${utils_log}${BYEL} Y/N: ${NC})" option
        case $option in 
            Y | y )
                echo -e "${utils_log}${BYEL} Loading ${BYEL}default${BYEL} configuration...${NC}"
                cp $BASE_PATH_SCRIPTS/config/default.sh /etc/profile.d/delirio.env.sh
                echo ". /etc/profile.d/delirio.env.sh" >> /etc/bash.bashrc
                post_configuration_done
                break
                ;;
            N | n) 
                read -p "$(echo -e ${utils_log}${BYEL} Write the fullpath with the filename to read it. (Ex. /opt/config/custom.conf))" custom
                echo -e "${utils_log}${BYEL} Loading $custom configuration...${NC}"
                cp $custom /etc/profile.d/delirio.env.sh
                post_configuration_done
                break
                ;;
            * ) echo -e "${utils_log}${RED} No valid option. Try again...${NC}";;
        esac
    done
}

function post_configuration_done() {
    echo ". /etc/profile.d/delirio.env.sh" >> /etc/bash.bashrc
    source /etc/profile
    printenvpi
    echo -e "${utils_log}${ON_IRED} IMPORTANT!! Restart the computer or execute the next command one time you finnish the installation:${NC}"
    echo -e "${utils_log}${ON_IRED} source /etc/profile${NC}"
}

function move_delirio_system_files() {
    echo -e "${utils_log}${BYEL} Creating folder $BASE_PATH_SCRIPTS .${NC}"
    mkdir -p $BASE_PATH_SCRIPTS/scripts
    echo -e "${utils_log}${BYEL} Setting privileges 777 on /opt RPi folders.${NC}"
    chown -R 777 $BASE_PATH_SCRIPTS/scripts
    echo -e "${utils_log}${BYEL} Copying scripts $GITHUB_DELIRIO/scripts/src/utils to $BASE_PATH_SCRIPTS ${NC}"
    cp -r $GITHUB_DELIRIO/scripts/src/utils $BASE_PATH_SCRIPTS/
    echo -e "${utils_log}${BYEL} Copying scripts $GITHUB_DELIRIO/scripts/src/config to $BASE_PATH_SCRIPTS ${NC}"
    cp -r $GITHUB_DELIRIO/scripts/src/config $BASE_PATH_SCRIPTS/
    echo -e "${utils_log}${BYEL} Copying scripts $GITHUB_DELIRIO/scripts/src/install.sh to $BASE_PATH_SCRIPTS ${NC}"
    cp -r $GITHUB_DELIRIO/scripts/src/install.sh $BASE_PATH_SCRIPTS/
}

function move_nespi4case_system_files() {
    echo -e "${utils_log}${BYEL} Copying scripts $GITHUB_DELIRIO/scripts/src/case to $BASE_PATH_SCRIPTS ${NC}"
    cp -r $GITHUB_DELIRIO/scripts/src/case $BASE_PATH_SCRIPTS/
}

function remove_nespi4case_system_files() {
    echo -e "${utils_log}${BYEL} Removing files from $BASE_PATH_SCRIPTS/case ${NC}"
    rm -rf $BASE_PATH_SCRIPTS/case
}

function unistall_initial_setup() {
    echo -e "${utils_log}${BYEL} Removing $BASE_PATH_SCRIPTS/install.sh file.${NC}"
    rm $BASE_PATH_SCRIPTS/install.sh
    echo -e "${utils_log}${BYEL} Removing $BASE_PATH_SCRIPTS/utils file.${NC}"
    rm -rf $BASE_PATH_SCRIPTS/utils
    echo -e "${utils_log}${BYEL} Removing $BASE_PATH_SCRIPTS/config file.${NC}"
    rm -rf $BASE_PATH_SCRIPTS/config
    echo -e "${utils_log}${BYEL} Removing /etc/profile.d/delirio.env.sh file.${NC}"
    rm /etc/profile.d/delirio.env.sh
    echo -e "${utils_log}${BYEL} Loading backup of /etc/bash.bashrc${NC}"
    cp $BASE_PATH_SCRIPTS/config/bash.bashrc.backup /etc/bash.bashrc
    echo -e "${utils_log}${BYEL} Reloading the default profile.${NC}"
    source /etc/profile
    printenv
}

function install_bash_profiles() {
    if [[ -z "${GITHUB_DELIRIO}" ]]; then
        echo -e "$install_log${BYEL} Unable to import the .bash_profile files.${NC}"
        echo -e "$install_log${BYEL} Make sure that the environment variables are install from the step ${RED}[0] Initial Setup.${NC}"
    elif [ -z "$(ls -A /home)" ]; then
        echo -e "$install_log${BYEL} Unable to import the .bash_profile files.${NC}"
        echo -e "$install_log${BYEL} The folder /home is empty and doesn not have any user. It could happen if you are running this script on ${CYA}Docker${BYEL}.${NC}"
    else
        actualFolder=$(pwd)
        cd /home
        for folder in */ ; do
            echo -e "$install_log${BYEL} Copying the file to the user $folder on /home/$folder ...${NC}"
            cp $GITHUB_DELIRIO/scripts/src/profiles/bash_profile_template /home/$folder/.bash_profile
        done
        cd $actualFolder
        $actualFolder=""
    fi
}

function uninstall_bash_profiles() {
    actualFolder=$(pwd)
    cd /home
    for folder in */ ; do
        echo -e "$install_log${BYEL} Removing the file to the user $folder on /home/$folder ...${NC}"
        rm /home/$folder/.bash_profile
    done
    cd $actualFolder
    $actualFolder=""
}

function printenvpi() {
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "${GRE} ## ${BYEL}DELIRIO ENVIRONMENT VARIABLE ${GRE}#######################################################################${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e " ${NC}"
    echo -e " ${BYEL}The .bash_profiles contain the next environment variables:  ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}VERSION                        ${RED}| ${BYEL} $VERSION  ${NC}"
    echo -e "     ${BLU}INSTALL_VERSION                ${RED}| ${BYEL} $INSTALL_VERSION  ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}BASE_PATH_SCRIPTS              ${RED}| ${BYEL} $BASE_PATH_SCRIPTS ${NC}"
    echo -e "     ${BLU}CONFIG_FILE                    ${RED}| ${BYEL} $CONFIG_FILE ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}DEBUG                          ${RED}| ${BYEL} $DEBUG ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}GITHUB_PATH                    ${RED}| ${BYEL} $GITHUB_PATH ${NC}"
    echo -e "     ${BLU}GITHUB_DELIRIO                 ${RED}| ${BYEL} $GITHUB_DELIRIO ${NC}"
    echo -e "     ${BLU}GITHUB_DELIRIO_BRANCH          ${RED}| ${BYEL} $GITHUB_DELIRIO_BRANCH ${NC}"
    echo -e "     ${BLU}GITHUB_DELIRIO_URL             ${RED}| ${BYEL} $GITHUB_DELIRIO_URL ${NC}"
    echo -e " ${NC}"
    echo -e "     ${BLU}DOCKER_VOLUME_NAME_NGINX       ${RED}| ${BYEL} $DOCKER_VOLUME_NAME_NGINX ${NC}"
    echo -e " ${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
}