# https://github.com/Syniurge/i2c-amd-mp2/issues/3#issuecomment-874590455
# modprobe -r i2c_hid_acpi && modprobe -r i2c_hid and reloading again helped also
echo "softdep i2c_hid pre: pinctrl_tigerlake" >> /etc/modprobe.d/i2c-touchpad.conf
