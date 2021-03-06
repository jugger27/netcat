ifeq ($(OS),Windows_NT)
	RM = del
else
	RM = rm
endif

#CC=x86_64-w64-mingw32-gcc
CC=i686-w64-mingw32-gcc

CFLAGS=-g -m32 -DNDEBUG -DWIN32 -D_CONSOLE -DTELNET -DGAPING_SECURITY_HOLE
LDFLAGS=-v -lws2_32

OBJ = getopt.o doexec.o netcat.o

all: nc.exe

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

nc.exe: $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	$(RM) $(OBJ)
	$(RM) nc.exe
