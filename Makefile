CC=g++
CCFLAGS=-g -std=gnu++11 -Wall -Wextra -Werror
CCLINE=$(CCFLAGS) bingo.cpp -o bingo
CCLIBS=-lm -lpthread
all:
	$(CC) $(CCLINE) -lreadline $(CCLIBS)
win:
	$(CC) $(CCLINE) $(CCLIBS)
clean:
	rm dzm
	rm dzm_log.txt

