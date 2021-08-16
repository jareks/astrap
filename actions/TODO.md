## Disable bell sound

Settings >> Sound >> Volume Levels >> System Sounds - mute it

## Allow F10 in gnome-terminal

Preferences >> General >> Enable the menu accelerator key - disable

## Tune your headphones

1. update your pulseaudio resampler:
```
$ vim /etc/pulse/daemon.conf 

default-sample-format = s24le
default-sample-rate = 48000
resample-method = speex-float-10
```

You can check your current settings with:
$ pacmd list-sinks

2. With pulseeffects installed you can add equalizer to make your headphones even better
Check out Oratory1990 from reddit for EQ presets.


## Night light

Settings >> Displays >> Night Light - enable
