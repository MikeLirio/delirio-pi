#!/bin/bash

###############################################################################################
## CHANGE LOG #################################################################################
###############################################################################################
#
# Actual Version v1.1
#
# Change Log v1.1
#       - Added setup function.
# 
# Change Log v1.0
#       - This bash profile is the template for the users of the Raspberry Pi.
#
###############################################################################################
## ENVIRONMENT VARIABLE #######################################################################
###############################################################################################

export VERSION=1.0

###############################################################################################
## IMPORTED SCRIPTS ###########################################################################
###############################################################################################

. $BASE_PATH_SCRIPTS/colors.sh                        # Variables with the colors for the terminal.
. $BASE_PATH_SCRIPTS/global_environment_variables.sh  # All the environment variables declared along the scripts
. $BASE_PATH_SCRIPTS/progress_bar.sh                  # Progress bar.

###############################################################################################
## MY FUNCTIONS ###############################################################################
###############################################################################################

function help() {
    echo -e "${GRE} #::#${YEL}.bash_profile${GRE}#::# ${YEL}Version ${BYEL}$VERSION ${YEL}of user ${BYEL}$(id -un) ${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "${GRE} ## ${YEL}PROFILE DOCUMENTATION ${GRE}#############################################################################${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} # ${YEL}The .bash_profiles contain the next functions:                                                     ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}help / lirio / ana  ${RED}| ${YEL}Those 3 functions print the documentation.                             ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}goto {where}        ${RED}| ${YEL}Function that requires a parameter used as an alias of folders.        ${GRE}#${NC}"
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
    echo -e "${GRE} #                           ${RED}| ${YEL}The default value is \"\".                                               ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}debugOff            ${RED}| ${YEL}Deactivate the debug giving to the environmenta variable DEBUG         ${GRE}#${NC}"
    echo -e "${GRE} #                           ${RED}| ${YEL}a value of \"\".                                                         ${GRE}#${NC}"
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
    echo -e "${GRE} #       ${BLU}setup               ${RED}| ${YEL}Loop to help to configure the Raspberry Pi through the                 ${GRE}#${NC}"
    echo -e "${GRE} #                                 ${RED}| ${YEL}terminal.                                                              ${GRE}#${NC}"
    echo -e "${GRE} #                                 ${RED}| ${YEL}It use internally the next functions:                                  ${GRE}#${NC}"
    echo -e "${GRE} #                                 ${RED}| ${BYEL}       setup_scripts      setup_docker     setup_case                  ${GRE}#${NC}"
    echo -e "${GRE} #                                 ${RED}| ${BYEL}       importProfileAll   importProfile                                ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}setup_scripts       ${RED}| ${YEL}Fetch and pull the repository folder and copy the script files.        ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}setup_docker        ${RED}| ${YEL}Execute the Docker setup script.                                       ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} #       ${BLU}setup_case          ${RED}| ${YEL}Execute the Case setup script.                                         ${GRE}#${NC}"
    echo -e "${GRE} #                                                                                                    ${GRE}#${NC}"
    echo -e "${GRE} ######################################################################################################${NC}"
}

function lirio() {
    help
}

function ana() {
    help
}

function goto() {
    if [ $# -eq 0 ]; then 
        echo -e "${GRE}#::#.bash_profile#::#${YEL} go where?${NC}"
        goHelp
    elif [ $# -eq 1 ]; then 
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
            echo -e "${GRE}#::#.bash_profile#::#${YEL} cd $BASE_PATH_SCRIPTS ${NC}"
            cd $BASE_PATH_SCRIPTS
        ;;
        'github')
            echo -e "${GRE}#::#.bash_profile#::#${YEL} cd $GITHUB_PATH ${NC}"
            cd $GITHUB_PATH
        ;;
        esac
    else
        goHelp
    fi
}

function gotoHelp() {
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

function setup() {
    actualFolder=$(pwd)
    actualUser=$(id -un)

    echo -e "${GRE}#::#.bash_profile#::#${YEL} Checking existence of $GITHUB_DELIRIO... ${NC}"
    if [ ! -d "$GITHUB_DELIRIO" ]; then # Take action if $DIR exists.
        echo -e "${GRE}#::#.bash_profile#::#${YEL} Cloning  $GITHUB_DELIRIO_URL ${NC}"
        cd $GITHUB_PATH
        git clone $GITHUB_DELIRIO_URL
        git checkout $GITHUB_DELIRIO_BRANCH
    fi

    cd $GITHUB_DELIRIO
    while true; do
        echo -e "${GRE}#::#.bash_profile#::#${YEL} What do you want to setup? ${NC}"
        echo -e "${GRE}#::#.bash_profile#::#${BLU}    [1] Copy script files from github.${NC}"
        echo -e "${GRE}#::#.bash_profile#::#${BLU}    [2] Docker.${NC}"
        echo -e "${GRE}#::#.bash_profile#::#${BLU}    [3] .bash_profile file for $actualUser user .${NC}"
        echo -e "${GRE}#::#.bash_profile#::#${BLU}    [4] .bash_profile files for all users.${NC}"
        echo -e "${GRE}#::#.bash_profile#::#${BLU}    [5] Nespi 4 Case configuration.${NC}"
        echo -e "${GRE}#::#.bash_profile#::#${BLU}    [6] Delirio-Pi Github branch to use.${NC}"
        read -p "${GRE}#::#.bash_profile#::#${BBLU} Write the number of the option: ${NC}" option
        case $option in
            1 ) setup_scripts; break;;
            2 ) setup_docker; break;;
            3 ) importProfile; break;;
            4 ) importProfileAll; break;;
            5 ) setup_case; break;;
            6 ) delirio_github; break;;
            * ) echo -e "${GRE}#::#.bash_profile#::#${RED} Please, follow the instructions of above. ${NC}";;
        esac
    done

    cd $actualFolder
    actualFolder=""
}

function delirio_github() {
    actualFolder=$(pwd)

    read -p "${GRE}#::#.bash_profile#::#${BBLU} Write the name of the branch to use ${NC}" branch
    cd $GITHUB_DELIRIO

    echo -e "${GRE}#::#.bash_profile#::#${YEL} Fetching repository...${NC}"
    git fetch
    echo -e "${GRE}#::#.bash_profile#::#${YEL} Checking exitence of branch $branch...${NC}"
    if [ `git branch --list $branch` ] ; then
        echo -e "${GRE}#::#.bash_profile#::#${YEL} Setting the branch $branch on GITHUB_DELIRIO_BRANCH environment variable.${NC}"
        export GITHUB_DELIRIO_BRANCH=$branch
        printenvpi | grep GITHUB_DELIRIO_BRANCH
        echo -e "${GRE}#::#.bash_profile#::#${YEL} Checking to branch $branch ${NC}"
        git checkout $GITHUB_DELIRIO_BRANCH
        echo -e "${GRE}#::#.bash_profile#::#${YEL} Pulling branch $branch ${NC}"
        git pull
    else 
        echo -e "${GRE}#::#.bash_profile#::#${YEL} The branch $branch do not exits.${NC}"
    fi
    
    cd $actualFolder
    actualFolder=""
}

function setup_scripts() {
    echo -e "${GRE}#::#.bash_profile#::#${YEL} Copying scripts from $GITHUB_DELIRIO/scripts .${NC}"
}

function setup_docker() {
    echo -e "${GRE}#::#.bash_profile#::#${YEL} Executing Docker setup file ${BYEL}$BASE_PATH_SCRIPTS/scripts/docker/setup.sh${NC}"
}

function setup_case() {
    echo -e "${GRE}#::#.bash_profile#::#${YEL} Executing Case setup file ${BYEL}$BASE_PATH_SCRIPTS/scripts/case/setup.sh${NC}"
}

function importProfile() {
    actualFolder=$(pwd)
    actualUser=$(id -un)

    echo -e "${GRE}#::#.bash_profile#::#${YEL} Git pull of $GITHUB_DELIRIO... ${NC}"
    cd $GITHUB_DELIRIO
    git fetch
    git checkout $GITHUB_DELIRIO_BRANCH
    git pull
    echo -e "${GRE}#::#.bash_profile#::#${YEL} Copying the profile for user $actualUser ${NC}"
    sudo cp $GITHUB_DELIRIO_BASH_PROFILE /home/$actualUser/.bash_profile

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
    sudo cp $GITHUB_DELIRIO_BASH_PROFILE /home/lirio/.bash_profile
    sudo cp $GITHUB_DELIRIO_BASH_PROFILE /home/delirio/.bash_profile
    sudo cp $GITHUB_DELIRIO_BASH_PROFILE /home/ahortigu/.bash_profile

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