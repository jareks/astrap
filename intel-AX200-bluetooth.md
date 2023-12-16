Bluetooth from Intel AX200 likes to hang on Linux 5.15. Adding/removing kernel module seems to help:

```
modprobe -r btusb
modprobe btusb
bluetoothctl show
```
