## This is the makefile for exercise 2.3. 


NAME:=Exc2.3
SRC:=$(wildcard *.cpp)
OBJS := $(patsubst %.cpp,%.o,$(SRC))

CC:=g++

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
