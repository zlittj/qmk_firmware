
OPT_DEFS += -DZETA_PROMICRO
OPT_DEFS += -DCATERINA_BOOTLOADER
INTERPHASE_UPLOAD_COMMAND = while [ ! -r $(USB) ]; do sleep 1; done; \
                         avrdude -p $(MCU) -c avr109 -U flash:w:$(TARGET).hex -P $(USB)

# # project specific files
SRC = matrix.c
MCU = atmega32u4
F_CPU = 16000000
ARCH = AVR8
F_USB = $(F_CPU)
BOOTLOADER = caterina

# Interrupt driven control endpoint task(+60)
OPT_DEFS += -DINTERRUPT_CONTROL_ENDPOINT


# Build Options
#   comment out to disable the options.
#
#BOOTMAGIC_ENABLE = yes	# Virtual DIP switch configuration(+1000)
MOUSEKEY_ENABLE = yes	# Mouse keys(+4700)
EXTRAKEY_ENABLE = yes	# Audio control and System control(+450)
CONSOLE_ENABLE = no	# Console for debug(+400)
COMMAND_ENABLE = yes   # Commands for debug and configuration
CUSTOM_MATRIX = yes    # Remote matrix from the wireless bridge
# Do not enable SLEEP_LED_ENABLE. it uses the same timer as BACKLIGHT_ENABLE
# SLEEP_LED_ENABLE = yes  # Breathing sleep LED during USB suspend
NKRO_ENABLE = yes		# USB Nkey Rollover - not yet supported in LUFA
# BACKLIGHT_ENABLE = yes  # Enable keyboard backlight functionality
# MIDI_ENABLE = YES 		# MIDI controls
UNICODE_ENABLE = YES 		# Unicode
# BLUETOOTH_ENABLE = yes # Enable Bluetooth with the Adafruit EZ-Key HID

USB = /dev/ttyACM0

# upload: build
# 	$(ZETA_UPLOAD_COMMAND)

LAYOUTS = ortho_4x12
