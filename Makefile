PROG = main.exe
SRC = main.cpp 
CFLAGS = -std=c++20 -Wall
LIBS = -lssl -lcrypto
INCLUDES = 
CC = g++
CPPCHECK = cppcheck

launch: all
	.\$(PROG)

all: $(PROG)

$(PROG): $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(SRC) $(LIBS) $(INCLUDES)

clean:
	del $(PROG)

.PHONY: all clean cppcheck

cppcheck:
	$(CPPCHECK) --quiet --enable=all --error-exitcode=1 \
	--inline-suppr \
	$(SRC)
