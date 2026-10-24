
// ***********************
// ****   student.h   ****
// ***********************

class Student : public Personnel {
  int nclasses;
  char *classes[10];
public:
#ifdef INTEGER_SSN
  Student(int ssn, char *firstname, char *lastname);  // Constructor
#else
  Student(char *ssn, char *firstname, char *lastname);  // Constructor
#endif
  ~Student();
  void print();
  void dynamic_void();
  void addclass(char *c);
  void unenroll();
#ifdef GETSSN_DYNAMIC
#ifdef INTEGER_SSN
  int getssn();
#else
  char *getssn();
#endif
#endif
};



