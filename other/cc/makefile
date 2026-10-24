
SHELL=/bin/csh

CC=g++

C++FLAGS=-O
LDFLAGS=

C++=${CC}

testit: testit.o database.o personnel.o teacher.o student.o

clean:
	rm -f *.o testit

testit.o: testit.cc personnel.h database.h teacher.h student.h config.h
database.o: database.cc database.h personnel.h config.h
personnel.o: personnel.cc personnel.h config.h
teacher.o: teacher.cc teacher.h personnel.h config.h
student.o: student.cc student.h personnel.h config.h
