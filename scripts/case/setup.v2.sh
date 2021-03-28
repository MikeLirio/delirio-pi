#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 0.1                                                                               #
#                                                                                             #
#   This job will set the script & service files to control the buttons of the Raspberry Pi.  #
#                                                                                             #
#   Flags:                                                                                    #
#       -r / --reset : set the files for the reset button.                                    #
#       -s / --shutdown : set the files for the shutdown button.                              #
#       -a / --all : set the files for the reset & shutdown buttons.                          #
#       -h / --help : print in console this comments.                                         #
#                                                                                             #
###############################################################################################
# IMPORTED SCRIPTS ############################################################################
###############################################################################################

. ./../colors.sh        # Variables with the colors for the terminal.
. ./../progress_bar.sh  # Progress bar.

###############################################################################################
# VARIABLES ###################################################################################
###############################################################################################

RP_SCRIPT_CASE_PATH=/opt/delirio/case   # Path to move the CASE scripts.
UBUNTU_SYSTEMD=/etc/systemd/system      # Path to move the new services for the buttons.

###############################################################################################

function restart() {
    echo -e "${GRE}#::setup.sh::# ${YEL}Copying the scripts for the Restart button...${NC}"
    echo -e "${GRE}#::setup.sh::# ${YEL}Stopping the nespi4case.restart.service service...${NC}"

    # systemctl stop nespi4case.restart.service
    # systemctl disable nespi4case.restart.service

    echo -e "${GRE}#::setup.sh::# ${YEL}Copying service and script files...${NC}"

    # cp ./nespi4case.restart.service $UBUNTU_SYSTEMD/nespi4case.restart.service
    # cp ./nespi4case.restart.gpio.py $RP_SCRIPT_CASE_PATH/nespi4case.restart.gpio.py

    echo -e "${GRE}#::setup.sh::# ${YEL}Enabling the nespi4case.restart.service service...${NC}"

    # systemctl enable nespi4case.restart.service
}

function shutdown() {
    echo -e "${GRE}#::setup.sh::# ${YEL}Copying the scripts for the Shutdown button...${NC}"
    echo -e "${GRE}#::setup.sh::# ${YEL}Stopping the nespi4case.shutdown.service service...${NC}"

    # systemctl stop nespi4case.shutdown.service
    # systemctl disable nespi4case.shutdown.service

    echo -e "${GRE}#::setup.sh::# ${YEL}Copying service and script files...${NC}"

    # cp ./nespi4case.shutdown.service $UBUNTU_SYSTEMD/nespi4case.shutdown.service
    # cp ./nespi4case.shutdown.gpio.py $RP_SCRIPT_CASE_PATH/nespi4case.shutdown.gpio.py

    echo -e "${GRE}#::setup.sh::# ${YEL}Enabling the nespi4case.shutdown.service service...${NC}"

    # systemctl enable nespi4case.shutdown.service

    echo -e "${GRE}#::setup.sh::# ${YEL}Copying the safe shutdown script${NC}"

    # cp ./safe.close.sh $RP_SCRIPT_CASE_PATH/safe.close.sh 
}

function apply_daemons() {
    echo -e "${GRE}#::setup.sh::# ${YEL}Loading the new daemons${NC}"

    # systemctl daemon-reload
    # systemctl reset-failed
}

echo -e "${GRE}#::setup.sh::# ${YEL}Setting up the scripts for the Nespi 4 Case.${NC}"

restart
shutdown
apply_daemons

echo -e "${GRE}#::setup.sh::# ${YEL}Setting up finished.${NC}"