//****************************
//**** student.cc   **********
//****************************

#include <stream.h>
#include <string.h>

#include "personnel.h"
#include "student.h"

// Student class constructor
#ifdef INTEGER_SSN
Student::Student(int s, char *fn, char *ln) : Personnel(s,fn,ln)
#else
Student::Student(char *s, char *fn, char *ln) : Personnel(s,fn,ln)
#endif
{
  nclasses=0;
};

// Destructor
Student::~Student()
{
  for (int i=0; i<nclasses; ++i) delete classes[i];
}

void Student::dynamic_void()
{
  valid = 0;
}

void Student::unenroll()
{
  nclasses = 0;
}

// Add a class to a student file
void Student::addclass(char *c)
{
  classes[nclasses] = new char[strlen(c)+1];
  strcpy(classes[nclasses], c);
  nclasses += 1;
};

// Print a student file
void Student::print()
{
  Personnel::print();
  if (nclasses == 0)
    cout << "-- Not Enrolled\n";
  else {
    cout << "  -- Enrolled:";
    for (int i=0; i < nclasses; ++i) cout << classes[i];
    cout << "\n";
  }
}

#ifdef GETSSN_DYNAMIC
#ifdef INTEGER_SSN
  int Student::getssn() {return ssn;};
#else
  char *Student::getssn() {return ssn;};
#endif
#endif
