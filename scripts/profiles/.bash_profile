#!/bin/bash


###############################################################################################
## CHANGE LOG #################################################################################
###############################################################################################
#
# Actual Version v1.0
# 
# Change Log v1.0
#       - This bash profile is the template for the users of the Raspberry Pi.
#       
#       
#
###############################################################################################
## ENVIRONMENT VARIABLE #######################################################################
###############################################################################################

export VERSION=1.0

export BASE_PATH_SCRIPTS=/opt/delirio
export BASE_PATH_ANA=/home/ahortigu
export BASE_PATH_LIRIO=/home/lirio
export BASE_PATH_ADMIN=/home/delirio

export GITHUB_PATH=/github
export GITHUB_DELIRIO=$GITHUB_PATH/delirio-pi
export GITHUB_DELIRIO_BASH_PROFILE=$GITHUB_DELIRIO/scripts/profiles/.bash_profile

###############################################################################################
## IMPORTED SCRIPTS ###########################################################################
###############################################################################################

. $BASE_PATH_SCRIPTS/colors.sh        # Variables with the colors for the terminal.
. $BASE_PATH_SCRIPTS/progress_bar.sh  # Progress bar.

###############################################################################################
## MY FUNCTIONS ###############################################################################
###############################################################################################

function help() {
    echo -e "${GRE} #::#${YEL}.bash_profil${GRE}#::##################################################################################${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "${GRE} ## ${YEL}PROFILE DOCUMENTATION ${GRE}#############################################################################${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} # ${YEL}Version ${BYEL}$VERSION ${YEL}of user ${BYEL}$(id -un)                                                                 ${GRE}#${NC}" 
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} # ${YEL}The .bash_profiles contain the next functions:                                                     ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}help / lirio / ana  ${RED}| ${YEL}Those 3 functions print the documentation.                             ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}go {where}          ${RED}| ${YEL}Function that requires a parameter used as an alias of folders.        ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}admin   - /home/delirio                                                ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}lirio   - /home/lirio                                                  ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}ana     - /home/ahortigu                                               ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}scripts - /opt/delirio/scripts                                         ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}github  - /github                                                      ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}goHelp              ${RED}| ${YEL}Documentation of go function.                                          ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}debugOn {pattern}   ${RED}| ${YEL}Activate the debug for NodeJS application giving value to the          ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}environment variable DEBUG.                                            ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}You can provide as a parameter a string used as a pattern to           ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}print logs on the terminal.                                            ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}The default value is "".                                               ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}debugOff            ${RED}| ${YEL}Deactivate the debug giving to the environmenta variable DEBUG         ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}a value of "".                                                         ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}reloadProfile       ${RED}| ${YEL}Reload the .bash_profile located on the user folder.                   ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}importProfile       ${RED}| ${YEL}Import the profile for the user from GitHub repository.                ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}https://github.com/MikeLirio/delirio-pi/scripts/profiles/.bash_profile ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}importProfileAll    ${RED}| ${YEL}Same as importProfile but for all the users of the Raspberry Pi.       ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}printenvpi          ${RED}| ${YEL}Print the environment variables declared on the .bash_profile.         ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
}

function lirio() {
    help
}

function ana() {
    help
}

function printenvpi() {
    echo -e "${GRE} #::#${YEL}.bash_profil${GRE}#::##################################################################################${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "${GRE} ## ${YEL}BASH PROFILE ENVIRONMENT VARIABLE ${GRE}#################################################################${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "                                                                   ${NC}"
    echo -e " ${YEL}Version ${BYEL}$VERSION ${YEL}of user ${BYEL}$(id -un)      ${NC}"
    echo -e "                                                                   ${NC}"
    echo -e " ${YEL}The .bash_profiles contain the next environment variables:  ${NC}"
    echo -e "                                                                   ${NC}"
    echo -e "     ${BLU}VERSION                        ${RED}| ${YEL} $VERSION                             ${NC}"
    echo -e "                                                                   ${NC}"
    echo -e "     ${BLU}BASE_PATH_SCRIPTS              ${RED}| ${YEL} $BASE_PATH_SCRIPTS                             ${NC}"
    echo -e "     ${BLU}BASE_PATH_ANA                  ${RED}| ${YEL} $BASE_PATH_ANA                             ${NC}"
    echo -e "     ${BLU}BASE_PATH_LIRIO                ${RED}| ${YEL} $BASE_PATH_LIRIO                             ${NC}"
    echo -e "     ${BLU}BASE_PATH_ADMIN                ${RED}| ${YEL} $BASE_PATH_ADMIN                             ${NC}"
    echo -e "                                                                   ${NC}"
    echo -e "     ${BLU}DEBUG                          ${RED}| ${YEL} $DEBUG                             ${NC}"
    echo -e "                                                                   ${NC}"
    echo -e "     ${BLU}GITHUB_PATH                    ${RED}| ${YEL} $GITHUB_PATH                             ${NC}"
    echo -e "     ${BLU}GITHUB_DELIRIO                 ${RED}| ${YEL} $GITHUB_DELIRIO                             ${NC}"
    echo -e "     ${BLU}GITHUB_DELIRIO_BASH_PROFILE    ${RED}| ${YEL} $GITHUB_DELIRIO_BASH_PROFILE                             ${NC}"
    echo -e "                                                                   ${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
}

function go() {
    if [ $# -eq 0 ]; then 
        echo -e "${GRE}#::#.bash_profile#::#${YEL} go where?${NC}"
        goHelp
    else if [ $# -eq 1 ]; then 
        case "$1" in
        'admin')
            echo -e "${GRE}#::#.bash_profile#::#${YEL} cd $BASE_PATH_ADMIN ${NC}"
            cd $BASE_PATH_ADMIN
        ;;
        'lirio')
            echo -e "${GRE}#::#.bash_profile#::#${YEL} cd $BASE_PATH_LIRIO ${NC}"
            cd $BASE_PATH_LIRIO
        ;;
        'ana')
            echo -e "${GRE}#::#.bash_profile#::#${YEL} cd $BASE_PATH_ANA ${NC}"
            cd $BASE_PATH_ANA
        ;;
        'scripts')
            echo -e "${GRE}#::#.bash_profile#::#${YEL} cd /opt/delirio/scripts ${NC}"
            cd /opt/delirio/scripts
        ;;
        'github')
            echo -e "${GRE}#::#.bash_profile#::#${YEL} cd /github ${NC}"
            cd /github
        ;;
        esac
    else goHelp
    fi
}

function goHelp() {
    echo -e "${GRE}#::#.bash_profile#::#${YEL} You can go to....${NC}"
    echo -e "${GRE}#::#.bash_profile#::#${BLU}      admin   - /home/delirio ${NC}"
    echo -e "${GRE}#::#.bash_profile#::#${BLU}      lirio   - /home/lirio ${NC}"
    echo -e "${GRE}#::#.bash_profile#::#${BLU}      ana     - /home/ahortigu ${NC}"
    echo -e "${GRE}#::#.bash_profile#::#${BLU}      scripts - /opt/delirio/scripts ${NC}"
    echo -e "${GRE}#::#.bash_profile#::#${BLU}      github  - /github ${NC}"
}

function debugOn() {
    echo "${GRE}#::#.bash_profile#::#${YEL} Activating DEBUG${NC}"
    if [ -z "$1" ]; then
       export DEBUG=*
       printenv DEBUG
    else
       local service=$1
       export DEBUG="$service*"
       printenv DEBUG
    fi
}

function debugOff() {
   echo -e "${GRE}#::#.bash_profile#::#${YEL} Deactivating DEBUG${NC}"
   unset DEBUG
}

function reloadProfile() {
    actualUser=$(id -un)
    . /home/$actualUser/.bash_profile
}

function importProfile() {
    actualFolder=$(pwd)
    actualUser=$(id -un)

    echo -e "${GRE}#::#.bash_profile#::#${YEL} Git pull of $GITHUB_DELIRIO... ${NC}"
    cd $GITHUB_DELIRIO
    git pull
    echo -e "${GRE}#::#.bash_profile#::#${YEL} Copying the profile for user $actualUser ${NC}"
    cp /home/$actualUser $GITHUB_DELIRIO_BASH_PROFILE

    echo -e "${GRE}#::#.bash_profile#::#${YEL} Reloading the profile for user $actualUser... ${NC}"
    reloadProfile

    echo -e "${GRE}#::#.bash_profile#::#${YEL} cd $actualFolder $ ${NC}"
    cd $actualFolder
    actualFolder=""
}

function importProfileAll() {
    actualFolder=$(pwd)
    actualUser=$(id -un)

    echo -e "${GRE}#::#.bash_profile#::#${YEL} Git pull of $GITHUB_DELIRIO... ${NC}"
    cd $GITHUB_DELIRIO
    git pull
    echo -e "${GRE}#::#.bash_profile#::#${YEL} Copying the profiles for users ${NC}"
    cp /home/lirio $GITHUB_DELIRIO_BASH_PROFILE
    cp /home/delirio $GITHUB_DELIRIO_BASH_PROFILE
    cp /home/ahortigu $GITHUB_DELIRIO_BASH_PROFILE

    echo -e "${GRE}#::#.bash_profile#::#${YEL} Reloading the profile for user $actualUser... ${NC}"
    reloadProfile

    echo -e "${GRE}#::#.bash_profile#::#${YEL} cd $actualFolder $ ${NC}"
    cd $actualFolder
    actualFolder=""
}

###############################################################################################
## START UP ###################################################################################
###############################################################################################

help