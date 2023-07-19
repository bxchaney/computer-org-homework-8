All: miles_hours_to_kph c_to_f in_to_ft
LIB=libConversions.o
CC=gcc
BUILD_DIR=build
TARGET_DIR=target


miles_hours_to_kph: miles_hours_to_kph.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

c_to_f: c_to_f.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

in_to_ft: in_to_ft.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@	

