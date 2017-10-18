#!/bin/bash

XINITRC=".xinitrc.intel"
XORGGPUCONF="10-intel.conf.template"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if [ "${#}" -eq 0 ]
then
    echo "Please choose between 'intel', 'nvidia-single' and 'nvidia'"
    exit 1
fi

if [ "${EUID}" -ne 0 ]
then
    sudo "${0}" "${@}"
    exit ${?}
fi

if [ "${1}" == 'nvidia-single' ]
then
    "${SCRIPTPATH}/enable-nvidia.sh"
    XINITRC=".xinitrc.nvidia.single"
    XORGGPUCONF="10-nvidia.conf.template"
elif [ "${1}" == 'nvidia' ]
then
    sudo "${SCRIPTPATH}/enable-nvidia.sh"
    XINITRC=".xinitrc.nvidia"
    XORGGPUCONF="10-nvidia.conf.template"
else
    sudo "${SCRIPTPATH}/disable-nvidia.sh"
fi

sudo rm -f "/home/raph/.xinitrc" "/etc/X11/xorg.conf.d/10-gpu.conf"
sudo ln -s "/home/raph/${XINITRC}" "/home/raph/.xinitrc"
sudo ln -s "/etc/X11/xorg.conf.d/${XORGGPUCONF}" "/etc/X11/xorg.conf.d/10-gpu.conf"
