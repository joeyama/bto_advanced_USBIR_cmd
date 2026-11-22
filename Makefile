PROG = bto_advanced_USBIR_cmd
OBJS = $(PROG).o
PREFIX ?= /usr/local
LOCAL_BIN_DIR ?= $(PREFIX)/bin
bindir ?= $(LOCAL_BIN_DIR)
CFLAGS ?= -O2 -Wall
LDLIBS += -lusb-1.0

.PHONY: all clean install uninstall

all: $(PROG)

$(PROG): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)

$(OBJS): $(PROG).c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

clean:
	$(RM) $(OBJS) $(PROG)

install: $(PROG)
	install -d "$(DESTDIR)$(bindir)"
	install -m 0755 $(PROG) "$(DESTDIR)$(bindir)/$(PROG)"

uninstall:
	$(RM) "$(DESTDIR)$(bindir)/$(PROG)"
