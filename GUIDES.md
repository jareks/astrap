### Ubuntu doesn't display your monitor resolution

```
# Asus Zenbook ux501vw + Dell S2417DG (2560x1440)
cvt -r 2560 1440 6040 60
# 2560x1440 59.95 Hz (CVT 3.69M9-R) hsync: 88.79 kHz; pclk: 241.50 MHz
Modeline "2560x1440R"  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync -vsync
xrandr --newmode  "2560x1440R"  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync -vsync
xrandr --addmode HDMI-1-1  "2560x1440R"
```

### Moving & resizing windows around with keyboard
It is very useful to quickly set window to occupy only selected part of screen (eg. left half). Check out Put Windows gnome extentions to do that.
For Ubuntu 21.10 add "40" ~/.local/share/gnome-shell/extensions/putWindow@clemens.lab21.org/metadata.json under "shell-version" to make it work.
