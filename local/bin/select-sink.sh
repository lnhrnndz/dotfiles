#!/bin/sh

sinks="\
Laptop stereo\n\
WH-1000XM4\n\
Logi\n\
USB Dock"

sink=$(echo -e "$sinks" | dmenu -c -i -l 4 -p "Select sink")

case "$sink" in 
    Laptop\ stereo)
        pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo
        pactl set-default-source alsa_input.pci-0000_00_1f.3.analog-stereo
        ;;
    WH-1000XM4)
        pactl set-default-sink bluez_sink.F8_4E_17_84_33_1B.a2dp_sink
        ;;
    Logi)
        pactl set-default-sink bluez_sink.7C_96_D2_BA_DE_CC.a2dp_sink
        ;;
    USB\ Dock)
        pactl set-default-sink alsa_output.usb-DisplayLink_USB_3.0_Dual_Video_Dock_ABCD01210017427-02.iec958-stereo
        ;;
esac

