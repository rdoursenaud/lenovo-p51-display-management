# Lenovo P51 Display Management

## Foreword
This configuration is my personal configuration for running an Arch Linux based worstation with i3 started via an xinitrc (no display manager), a french [bepo](http://bepo.fr) keymap, the full HD laptop touch screen and 3 full HD screens connected via HDMI, DVI-D and VGA to the Lenovo worstation dock.

The provided `.Xmodmap` interverts page up/page down with home/end to match the configuration I'm used to on my TypeMatrix keyboard when in single laptop mode (ie. when I use the laptop's keyboard). You probably don't want it.

You *will* have to adapt this configuration to your needs!

The multiple monitors configuration uses nVidia PRIME, not Bumblebee.

## Setup

### Pre-requisites
- Install the latest proprietary nVidia drivers.
- Install `bbswitch` from the Bumblebee project.
- Use Xorg server. Wayland not tested.

### Installation
- Copy the files in `etc` to your systems `/etc` directory.
- Copy the files in `home` to your users `~` directory.
- Copy the files in `scripts` to a convenient place for you to launch them. I keep mine in `~/bin`.

#### Optional
For the best experience and power savings:
- Add the modules `i915`, `nvidia`, `nvidia_modeset`, `nvidia_uvm` and `nvidia_drm` to your initcpio.
- Add the files `/etc/modprobe.d/i915.conf` and `/etc/modprobe.d/nvidia_drm.conf` to your initcpio.

### Customization
Edit all the files provided in `home` to fit your needs.

## Usage
With the X server stopped. Use the `setx.sh` script to switch between configurations.

Configurations provided:
- `intel`: nVidia GPU disabled. Laptop screen only.
- `nvidia-single`: nVidia GPU enabled. Laptop screen only.
- `nvidia`: nVidia GPU enabled. Laptop screen + 3 external screens connected to the Lenovo Workstation Dock.
