//*****************************
//****   personnel.cc   *******
//*****************************

#include <stream.h>
#include <string.h>
#include "personnel.h"

// Personnel constructor
#ifdef INTEGER_SSN
Personnel::Personnel(int s, char *fn, char *ln)
#else
Personnel::Personnel(char *s, char *fn, char *ln)
#endif
{
#ifdef INTEGER_SSN
  ssn = s;
#else
  strcpy(ssn,s);
#endif
  firstname = new char[strlen(fn)+1];
  lastname  = new char[strlen(ln)+1];
  strcpy(firstname, fn);
  strcpy(lastname, ln);
  valid = 1;
}; 

// destructor
Personnel::~Personnel()
{
  delete firstname;
  delete lastname;
}

void Personnel::print()
{
  cout << ssn << ": " << firstname << ' ' << lastname;
}

void Personnel::dynamic_void()
{
  valid = 0;
}

void Personnel::static_void()
{
  valid = 0;
}

#ifdef INTEGER_SSN
    int Personnel::getssn() { return ssn; };
#else
    char *Personnel::getssn() { return ssn; };
#endif
