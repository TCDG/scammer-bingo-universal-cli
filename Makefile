CC=g++
CCFLAGS=-g -std=gnu++11 -Wall -Wextra -Werror
CCLINE=$(CCFLAGS) bingo.cpp -o bingo
all:
	$(CC) $(CCLINE) -lreadline
win:
	$(CC) $(CCLINE)
clean:
	rm bingo
	rm dzm_log.txt

