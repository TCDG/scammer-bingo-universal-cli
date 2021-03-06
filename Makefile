CC=g++
CCFLAGS=-Wno-unused-result -Wno-unused-parameter -std=gnu++11 -Wall -Wextra -Werror
CCLINE=$(CCFLAGS) bingo.cpp -o bingo
CCLIBS=-lm -lpthread
all: ctime
	./ctime -begin dzm_log.ctm
	$(CC) -g $(CCLINE) -lreadline $(CCLIBS)
	./ctime -end dzm_log.ctm
release:
	./ctime -begin dzm_log.ctm
	$(CC) -O3 $(CCLINE) -lreadline $(CCLIBS)
	./ctime -end dzm_log.ctm
win:
	$(CC) $(CCLINE) $(CCLIBS)
ctime:
	gcc -O2 -Wno-unused-result ctime.c -o ctime
clean:
	rm dzm
	rm dzm_log.txt

