# Autologin-Once
Requires systemd and getty

*NOTE*: This is designed to be used with systems with a encrypted home
partition, ensuring that only the crypt key has to be entered at the initial
startup. If you just want the system to login in regardless, see `man getty` 

Automatically logs in the configured user via a getty TTY once upon startup and
places a latch file in /tmp. If the latch file exists, the user is not logged
in automatically and getty is started as usual

This is done using an override for getty@tty1 at:
/etc/systemd/system/getty@tty1.service.d/

To install, copy the `autologin-once.conf` file as for example:
`autologin-once.danwell.conf` and replace `$USER` in this configuration  with
the required username. The provided `makefile` shows a working example of
installing this script for tty1
