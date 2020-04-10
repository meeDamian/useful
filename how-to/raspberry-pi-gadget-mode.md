# _Gadget_ Mode

Setup headless Raspberry Pi from scratch with nothing, but USB cable (and a way to flash SD card).

1. Download Raspbian
1. Flash it into SD card (`dd` works, but Etcher is faster)
1. Make sure card is mounted
1. `cd /Volumes/boot/` # or wherever it's mounted
1. Append `dtoverlay=dwc2` to `config.txt`
    ```
    echo "dtoverlay=dwc2" >> config.txt
    ```

1. Put `modules-load=dwc2,g_ether` just after `rootwait` in `cmdline.txt`
    ```
    # Written this way to have command behave same on MacOS & Linux
    sed -E -i.bak 's|(rootwait)|\1 modules-load=dwc2,g_ether|' cmdline.txt && rm -f cmdline.txt.bak 
    ```

1. Create `ssh`, and `avahi` files
    ```
    touch ssh avahi
    ```

1. [IMPORTANT] Connect Raspberry Pi to your computer using the microUSB port marked "USB" (**not** "PWR IN").
1. Wait until things happen
1. `ssh pi@raspberrypi.local`
1. Password is `raspberry`


### Internet

There are two ways of getting internet onto the RBP

#### Wifi

[Tell RBP WiFi to connect to][wifi] in `wpa_supplicant.conf` file.

[wifi]: https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md


#### Sharing

Alternatively, you can share internet from MacOS:

🍏 Go to `Preferences` -> `Sharing`, and setup `Internet Sharing` there.

> **NOTE:** Your connected RBP should appear in Network Preferences as `RNDIS/Ethernet Gadget` 
