O = o
E = .exe

ifeq ($(OS),Windows_NT)
	# RM = cmd /c del
	# use this with mingw32-make
	RM = rm -f
else
	RM = rm -f
endif

CC		= g++
AR		= ar
STRIP		= strip
LINK		= g++
WINDRES		= windres

# -fsanitize=address not work on mingw
ifeq ($(DEBUG),Y)
	CFLAGS  = -g -Wall -fsanitize=address -fno-omit-frame-pointer
	LDFLAGS = -g -fsanitize=address
else
	CFLAGS  = -O2 -Wall -Wpedantic -Wextra
	LDFLAGS = 
endif

# CFLAGS += -I$(PDCURSES_SRCDIR)

.PHONY: clean

test1.exe:	test1.o
	$(LINK) $(LDFLAGS) -o$@ $<

test1.o: test1.cpp
	$(CC) -c $(CFLAGS) -o$@ $<

testFile.exe:	testFile.o
	$(LINK) $(LDFLAGS) -o$@ $<

testFile.o: testFile.cpp
	$(CC) -c $(CFLAGS) -o$@ $<

clean:
	-$(RM) *.o
	-$(RM) *.exe
	-$(RM) $(CLEAN)
