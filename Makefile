All: build miles_hours_to_kph 
LIB=libConversions.o
CC=gcc
BUILD_DIR=build
TARGET_DIR=target

build:
	mkdir -pv $(BUILD_DIR)	
	mkdir -pv $(TARGET_DIR)

miles_hours_to_kph: miles_hours_to_kph.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

# kph: kph.o $(LIB)
#	$(CC) $@.o $(LIB) -g -o $@
.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@	

