## _Gadget_ Mode

Setup headless Raspberry Pi from scratch with nothing, but USB cable (and a way to flash SD card).

1. Download Raspbian
1. Flash it into SD card (`dd` works, but Etcher is faster)
1. Make sure card is mounted
1. `cd /Volumes/boot/` # or wherever it's mounted
1. `echo "dtoverlay=dwc2" >> config.txt`
1. `sed -E -i.bak 's|(rootwait)|\1 modules-load=dwc2,g_ether|' cmdline.txt && rm -f cmdline.txt.bak` # Written this way to have command behave same on MacOS & Linux
1. `touch ssh avahi`
1. IMPORTANT: Use the microUSB port on the Raspberry Pi Zero marked "USB" (**not** "PWR IN").
1. Wait until things happen
1. `ssh pi@raspberrypi.local`
1. Password is `raspberry`


### Internet

You have two ways:

1. Wifi
1. Share host's internet

#### Wifi

If you have RBP0W, you can just [specify wifi credentials][wifi] in `wpa_supplicant.conf` file.

[wifi]: https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md


#### Sharing

🍏 Go to `Preferences` -> `Sharing`, and setup `Internet Sharing` there.

> **NOTE:** Your connected RBP should appear in Network Preferences as `RNDIS/Ethernet Gadget` 
