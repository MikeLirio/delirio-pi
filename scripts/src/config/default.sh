# All this variables are printed on printenvpi function

export BASE_PATH_SCRIPTS="/opt/delirio"
export CONFIG_FILE="$BASE_PATH_SCRIPTS/config/default.conf"
export CONF_FILE="$BASE_PATH_SCRIPTS/scripts/config/default.conf"

export GITHUB_PATH="/opt/github"
export GITHUB_DELIRIO="$GITHUB_PATH/delirio-pi"
export GITHUB_DELIRIO_BRANCH="main"
export GITHUB_DELIRIO_URL="https://github.com/MikeLirio/delirio-pi.git"

export DELIRIO_HOST=192.168.1.94
export DELIRIO_TIMEZONE="Europe/London"

# DOCKER

export DOCKER_PATH="/opt/delirio/docker"

export DELIRIO_DELUGE_DOWNLOADS="/sharefolder/downloads"

# VOLUME NAMES
export VN_DELUGE="DELIRIO_DELUGE_CONF"

export VN_PIHOLE="DELIRIO_PIHOLE"
export VN_PIHOLE_DNSMASQD="DELIRIO_PIHOLE_DNSMASQD"