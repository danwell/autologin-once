BIN=autologin-once
BINPATH=/bin/$(BIN)

.PHONY:
install:
	install $(BIN) $(BINPATH)

.PHONY: uninstall
uninstall:
	rm -f $(BINPATH)

.PHONY: install-danwell-tty1
install-danwell-tty1:
	install --mode=644 -D autologin-once.danwell.conf /etc/systemd/system/getty@tty1.service.d/autologin-once.danwell.conf
	systemctl --system daemon-reload

.PHONY: uninstall-danwell-tty1
uninstall-danwell-tty1:
	rm /etc/systemd/system/getty@tty1.service.d/autologin-once.danwell.conf
	rmdir --ignore-fail-on-non-empty /etc/systemd/system/getty@tty1.service.d
