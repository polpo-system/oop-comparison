//**************************
//****  teacher.cc   *******
//**************************

#include <stream.h>

#include "personnel.h"
#include "teacher.h"

// Teacher constructor
#ifdef INTEGER_SSN
Teacher::Teacher(int s, char *fn, char* ln, int sal) : Personnel(s,fn,ln)
#else
Teacher::Teacher(char *s, char *fn, char* ln, int sal) : Personnel(s,fn,ln)
#endif
{
  salary = sal;
}

// Print a teacher file
void Teacher::print()
{
  Personnel::print();
  cout << "  -- Salary: " << salary << "\n";
}


void Teacher::updatesalary(int sal)
{
  salary = sal;
}

void Teacher::dynamic_void()
{
  valid=0;
}

#ifdef GETSSN_DYNAMIC
#ifdef INTEGER_SSN
  int Teacher::getssn() {return ssn;};
#else
  char *Teacher::getssn() {return ssn;};
#endif
#endif
