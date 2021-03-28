#!/bin/bash

#########################################################################
# DESCRIPTION ###########################################################
#########################################################################
#                                                                       #
#   Version 0.1                                                         #
#                                                                       #
#   This job will set the script & service files to control the buttons #
#   of the Raspberry Pi.                                                #
#                                                                       #
#   Flags:                                                              #
#       -r : set the files for the reset button.                        #
#       -s : set the files for the shutdown button.                     #
#       -a : set the files for the reset & shutdown buttons.            #
#       -h : print in console this comments.                            #
#                                                                       #
#########################################################################
# IMPORTED SCRIPTS ######################################################
#########################################################################

. ./../colors.sh        # Variables with the colors for the terminal.
. ./../progress_bar.sh  # Progress bar.

#########################################################################
# VARIABLES #############################################################
#########################################################################

#########################################################################

function restart() {
    echo -e "${GRE}#::setup.sh::# ${YEL}Copying the scripts for the Restart button...${NC}"
    echo -e "${GRE}#::setup.sh::# ${YEL}Stopping the nespi4case.restart.service service...${NC}"

    #systemctl stop nespi4case.restart.service
    #systemctl disable nespi4case.restart.service

    echo -e "${GRE}#::setup.sh::# ${YEL}Copying service and script files...${NC}"

    #cp ./nespi4case.restart.service /etc/systemd/system/nespi4case.restart.service
    #cp ./nespi4case.restart.gpio.py /opt/delirio/case/nespi4case.restart.gpio.py

    echo -e "${GRE}#::setup.sh::# ${YEL}Enabling the nespi4case.restart.service service...${NC}"

    #systemctl enable nespi4case.restart.service

    echo -ne '#############             (66%)\r'
}

function shutdown() {
    echo -e "${GRE}#::setup.sh::# ${YEL}Copying the scripts for the Shutdown button...${NC}"
    echo -e "${GRE}#::setup.sh::# ${YEL}Stopping the nespi4case.shutdown.service service...${NC}"

    #systemctl stop nespi4case.shutdown.service
    #systemctl disable nespi4case.shutdown.service

    echo -e "${GRE}#::setup.sh::# ${YEL}Copying service and script files...${NC}"

    # cp ./nespi4case.shutdown.service /etc/systemd/system/nespi4case.shutdown.service
    # cp ./nespi4case.shutdown.gpio.py /opt/delirio/case/nespi4case.shutdown.gpio.py

    echo -e "${GRE}#::setup.sh::# ${YEL}Enabling the nespi4case.shutdown.service service...${NC}"

    # systemctl enable nespi4case.shutdown.service

    echo -e "${GRE}#::setup.sh::# ${YEL}Copying the safe shutdown script${NC}"

    # cp ./safe.close.sh /opt/delirio/case/safe.close.sh 
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

echo -e "${GRE}#::setup.sh::# ${YEL}Setting up finnished.${NC}"