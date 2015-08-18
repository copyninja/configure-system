-include config.mk
# We customize our system but can be changed to chroot directory.
export TARGET ?= /

# Device class currently only for my laptop
export CLASS ?= laptop

all: install customize

install: packagelist.txt
	sudo scripts/install_packages packagelist.txt
	touch stamp-install

customize: install
	sudo scripts/customize_system $(CLASS) $(TARGET)
