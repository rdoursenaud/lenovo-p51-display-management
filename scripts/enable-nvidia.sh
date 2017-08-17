#!/bin/bash
sudo modprobe bbswitch
sudo tee /proc/acpi/bbswitch <<< ON
sudo modprobe nvidia
sudo modprobe nvidia-modeset
sudo modprobe nvidia-uvm
sudo modprobe nvidia-drm
