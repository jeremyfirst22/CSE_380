##This is the makefile for exercise 2.1. 
## This assumes that the gsl library is located as indicated below. 


EXEC := tardis
CC   := gcc
TACC_GSL_DIR:=/opt/apps/intel13/gsl/1.15
CFLAGS  := -I$(TACC_GSL_DIR)/include
LDLIBS  := -lgsl -lgslcblas -L$(TACC_GSL_DIR)/lib



SRC  := $(wildcard *.c)
OBJ  := $(patsubst %.c,%.o,$(SRC))

$(EXEC): $(OBJ)
	$(CC) $(LDLIBS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $<

main.o mytools.o: mytools.h

.PHONY: clobber clean neat echo
clobber: clean
	$(RM) $(EXEC)
clean: neat
	$(RM) $(OBJ)
neat:
	$(RM) *~ .*~
echo: 
	@echo $(OBJ)
