CC := /usr/local/arm-linux-4.1.1/bin/arm-linux-gcc

OUTPUT		= project 
SRCS		= ./src/main.c \
				./src/led.c\
				./src/dot.c\
				./src/fnd.c\
				./src/clcd.c

CFLAGS		= -I./lib


$(OUTPUT) : $(SRCS)
	$(CC) $(CFLAGS) -o $@ $(SRCS)

xim : $(SRCS)
	@cd /usr/xim && $(MAKE) -s xim_OUTPUT="$(OUTPUT)" \
	xim_PATH="$(PWD)" xim_SRCS="$(SRCS)" xim_CFLAGS="$(CFLAGS)"

clean:
	@rm -f $(OUTPUT)
	@rm -f xim_$(OUTPUT)
