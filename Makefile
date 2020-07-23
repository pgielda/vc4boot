AS=vc4-elf-as
AR=vc4-elf-ar
RANLIB=vc4-elf-ranlib
LD=vc4-elf-ld
CC=vc4-elf-gcc
OBJCOPY=vc4-elf-objcopy

LIBRARY_OBJS = \
	clkgetf.o \
	delay.o \
	ledflash.o \
	memset.o \
	memcpy.o \
	otp.o \
	otp_write.o \
	uart.o \
	uart_dumpregs.o \
	uart_flush.o \
	uart_putchars.o \
	uart_putdec.o \
	uart_puthex.o \
	uart_puts.o \
	main.o


%.o: %.S
	$(AS) -o $@ $<

%.o: %.c
	$(CC) -c -o $@ $<

%.elf: %.o libvc4.a
	$(LD) -o $@ $^ -T start_elf.ld

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

libvc4.a: $(LIBRARY_OBJS)
	$(AR) cr $@ $^
	$(RANLIB) $@
