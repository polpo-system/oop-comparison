// ***********************
// ****  personnel.h  ****
// ***********************

#include <stream.h>
#include "config.h"

class Personnel {
  char *firstname, *lastname;
 protected:
  int valid;
#ifdef INTEGER_SSN
  int ssn;
#else
  char ssn[10];
#endif

 public:
#ifdef INTEGER_SSN
  Personnel(int s, char *fn, char *ln);
#else
  Personnel(char *s, char *fn, char *ln);
#endif
  ~Personnel();
  virtual void print();
  virtual void dynamic_void();
  void static_void();
#ifdef GETSSN_DYNAMIC
  virtual
#endif
#ifdef INTEGER_SSN
    int getssn();
#else
    char *getssn();
#endif
};


