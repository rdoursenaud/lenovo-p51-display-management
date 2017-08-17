#!/bin/bash
sudo modprobe bbswitch
sudo rmmod nvidia_drm nvidia_uvm nvidia_modeset nvidia
sudo tee /proc/acpi/bbswitch <<< OFF
