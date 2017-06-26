TARGET=srf06-cc26xx
BOARD=node795
SERIAL=/dev/ttyACM0

node:
	$(MAKE) TARGET=$(TARGET) BOARD=$(BOARD) -C examples/cc26xx/node795/ cc26xx-web-demo

clean:
	$(MAKE) TARGET=$(TARGET) BOARD=$(BOARD) -C examples/cc26xx/node795/ clean

flash:
	@echo " ***"
	@echo " *** Don't forget to reset in bootloader mode!!"
	@echo " ***"
	fuser -k /dev/ttyACM0 | cat
	$(MAKE) TARGET=$(TARGET) BOARD=$(BOARD) -C examples/cc26xx/node795/ cc26xx-web-demo.upload

serial:
	picocom -b 115200 --omap lfcrlf --imap lfcrlf $(SERIAL)
