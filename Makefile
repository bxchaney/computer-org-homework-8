All: 
LIB=libConversions.o
CC=gcc

miles_hours_to_kph: miles_hours_to_kph.o
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@	
