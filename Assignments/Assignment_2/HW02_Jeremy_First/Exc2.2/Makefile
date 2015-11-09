## This makefile builds the program for exerciese 2.2. 
## It is dependent on the Boost libraries. They are assumed to not have moved 
## from the time this makefile was made. 

NAME:=Exc2.2
SRC:=$(wildcard *.cpp)
OBJS := $(patsubst %.cpp,%.o,$(SRC))

BOOST_INC:=/usr/local/include/boost
BOOST_LIB:=/usr/local/lib/

CC:=g++
INCLUDE:= -I$(BOOST_INC)
LDFLAGS= -L$(BOOST_LIB)
LDLIBS= -lboost_program_options

CPPFLAGS:=$(INCLUDE)

$(NAME): $(OBJS)
	$(CC) $(LDFLAGS) $(LDLIBS) -o $@ $^

%.o: %.cpp
	$(CC) $(CPPFLAGS) -c $<

.PHONY: clean clobber echo
clobber: clean
	rm -f $(NAME)
clean:
	rm -f $(OBJS)
echo:
	@echo $(OBJS)
