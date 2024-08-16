#!/bin/bash

modprobe -r i2c_hid_acpi
modprobe -r i2c_hid
modprobe i2c_hid_acpi
modprobe i2c_hid
notify-send -t 2000 -c system -u low "Touchpad restarted" "i2c_hid_acpi toggled"
