#!/bin/bash

sudo modprobe -r i2c_hid_acpi
sudo modprobe -r i2c_hid
sudo modprobe i2c_hid_acpi
sudo modprobe i2c_hid
notify-send -t 2000 -c system -u low "Touchpad restarted" "i2c_hid_acpi toggled"
