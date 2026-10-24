// ***********************
// ****  database.h   ****
// ***********************

class Database {
  Personnel *file;
  Database  *next;
public:
  Database();
  void print();
  void add(Personnel *pf);
#ifdef INTEGER_SSN
  Personnel *locate(int ssn);
  void remove(int ssn);
#else
  Personnel *locate(char *ssn);
  void remove(char *ssn);
#endif
  void traverse(int d, int s);
};


