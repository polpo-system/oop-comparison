// ***********************
// ****   teacher.h   ****
// ***********************

class Teacher : public Personnel {
  int salary;
public:
#ifdef INTEGER_SSN
  Teacher(int ssn, char *firstname, char *lastname, int salary);
#else
  Teacher(char *ssn, char *firstname, char *lastname, int salary);
#endif
  void print();
  void updatesalary(int sal);
  void dynamic_void();
#ifdef GETSSN_DYNAMIC
#ifdef INTEGER_SSN
  int getssn();
#else
  char *getssn();
#endif
#endif
};



