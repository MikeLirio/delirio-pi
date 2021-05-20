#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 1.0                                                                               #
#                                                                                             #
#   This job will set the script & service files to control the buttons of the Raspberry Pi.  #
#                                                                                             #
#   Flags:                                                                                    #
#       -r : reset; set the files for the reset button.                                       #
#       -s : shutdown; set the files for the shutdown button.                                 #
#       -c : safe-close; set the safe close script.                                           #
#       -h : help; print in console this comments.                                            #
#       none : set all the files.                                                             #
#                                                                                             #
###############################################################################################
# MANDATORY VARIABLES #########################################################################
###############################################################################################

: "${BASE_PATH_SCRIPTS:? The variable needs to be defined}"

###############################################################################################
# IMPORTED SCRIPTS ############################################################################
###############################################################################################

if [[ -z "${COLORS_SH_IMPORTED}" ]]; then
    . $BASE_PATH_SCRIPTS/colors.sh        # Variables with the colors for the terminal.
fi

if [[ -z "${PROGRESS_BAR_SH_IMPORTED}" ]]; then
    . $BASE_PATH_SCRIPTS/progress_bar.sh  # Progress bar.
fi

###############################################################################################
# VARIABLES ###################################################################################
###############################################################################################

export CASE_SETUP_IMPORTED=true

RP_SCRIPT_CASE_PATH=$BASE_PATH_SCRIPTS/case     # Path to move the CASE scripts.
UBUNTU_SYSTEMD=/etc/systemd/system              # Path to move the new services for the buttons.
case_logs="${GRE}#::${YEL}case/setup.sh${GRE}::#${NC}"

###############################################################################################
# FUNCTIONS ###################################################################################
###############################################################################################

function srp_help () {
    echo -e "${GRE}###############################################################################################${NC}"
    echo -e "${GRE}# ${YEL}DESCRIPTION${GRE} #################################################################################${NC}"
    echo -e "${GRE}###############################################################################################${NC}"
    echo -e "${GRE}#                                                                                             #${NC}"
    echo -e "${GRE}#   ${BLU}Version ${BBLU}1.0${GRE}                                                                               #${NC}"
    echo -e "${GRE}#                                                                                             #${NC}"
    echo -e "${GRE}#   ${YEL}This job will set the script & service files to control the buttons of the Raspberry Pi.${GRE}  #${NC}"
    echo -e "${GRE}#                                                                                             #${NC}"
    echo -e "${GRE}#   ${YEL}Flags:${GRE}                                                                                    #${NC}"
    echo -e "${GRE}#       ${BLU}-r : reset; ${YEL}set the files for the reset button.${GRE}                                       #${NC}"
    echo -e "${GRE}#       ${BLU}-s : shutdown; ${YEL}set the files for the shutdown button.${GRE}                                 #${NC}"
    echo -e "${GRE}#       ${BLU}-c : safe-close; ${YEL}set the safe close script.${GRE}                                           #${NC}"
    echo -e "${GRE}#       ${BLU}-h : help; ${YEL}print in console this comments.${GRE}                                            #${NC}"
    echo -e "${GRE}#       ${BLU}none : ${YEL}set all the files.${GRE}                                                             #${NC}"
    echo -e "${GRE}#                                                                                             #${NC}"
    echo -e "${GRE}###############################################################################################${NC}"
}

function restart() {
    echo -e "$case_logs${YEL} Copying the scripts for the ${BYEL}Restart${YEL} button...${NC}"
    echo -e "$case_logs${YEL} Stopping the ${BYEL}nespi4case.restart.service${YEL} service...${NC}"

    systemctl stop nespi4case.restart.service
    systemctl disable nespi4case.restart.service

    progress_bar 15

    echo -e "$case_logs${YEL} Copying ${BYEL}nespi4case.restart.service${YEL} and ${BYEL}nespi4case.restart.gpio.py${YEL} files...${NC}"

    cp ./nespi4case.restart.service $UBUNTU_SYSTEMD/nespi4case.restart.service
    cp ./nespi4case.restart.gpio.py $RP_SCRIPT_CASE_PATH/nespi4case.restart.gpio.py

    progress_bar 15

    echo -e "$case_logs${YEL} Enabling the ${BYEL}nespi4case.restart.service${YEL} service...${NC}"

    systemctl enable nespi4case.restart.service

    progress_bar 10
}

function shutdown() {
    echo -e "$case_logs${YEL} Copying the scripts for the ${BYEL}Shutdown${YEL} button...${NC}"
    echo -e "$case_logs${YEL} Stopping the ${BYEL}nespi4case.shutdown.service${YEL} service...${NC}"

    systemctl stop nespi4case.shutdown.service
    systemctl disable nespi4case.shutdown.service

    progress_bar 15

    echo -e "$case_logs${YEL} Copying ${BYEL}nespi4case.shutdown.service${YEL} and ${BYEL}nespi4case.shutdown.gpio.py${YEL} files...${NC}"

    cp ./nespi4case.shutdown.service $UBUNTU_SYSTEMD/nespi4case.shutdown.service
    cp ./nespi4case.shutdown.gpio.py $RP_SCRIPT_CASE_PATH/nespi4case.shutdown.gpio.py

    progress_bar 15

    echo -e "$case_logs${YEL} Enabling the ${BYEL}nespi4case.shutdown.service${YEL} service...${NC}"

    systemctl enable nespi4case.shutdown.service

    progress_bar 10
}

function safe_close () {
    echo -e "$case_logs${YEL} Copying the safe ${BYEL}safe.close.sh${YEL} script${NC}"

    cp ./safe.close.sh $RP_SCRIPT_CASE_PATH/safe.close.sh 

    progress_bar 5
}

function apply_daemons() {
    echo -e "$case_logs${YEL} Loading the new daemons${NC}"

    systemctl daemon-reload
    systemctl reset-failed

    progress_bar 15
}

if [[ $1 == *"h"* ]]; then 
    srp_help
else
    echo -e "$case_logs${YEL} Setting up the scripts for the ${RED}Nespi 4 Case.${NC}"
    progress_bar_start

    # By default will execute all the steps
    if [ $# -eq 0 ]; then 
        restart
        shutdown
        safe_close
        apply_daemons
    else
        DAEMON=false

        if [[ $1 == *"r"* ]]; then 
            restart
            DAEMON=true
        fi

        if [[ $1 == *"s"* ]]; then 
            shutdown
            DAEMON=true
        fi

        if [[ $1 == *"c"* ]]; then 
            safe_close
        fi

        if [ "$DAEMON" = true ] ; then
            apply_daemons
        fi
    fi

    progress_bar_end
    echo -e "$case_logs${YEL} Setting up finished.${NC}"
fi