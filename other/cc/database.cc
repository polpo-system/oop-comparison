//************************
//****  database.cc   ****
//************************

#include "config.h"

#include <stream.h>
#include <string.h>

#include "personnel.h"
#include "database.h"

//  Constructor
Database::Database()
{
  file=NULL;
  next=NULL;
}

//  Add a file to the database
void Database::add(Personnel *f)
{
  Database *tmp=this;

  while (tmp->next != NULL) {
    tmp = tmp->next;
  }
  tmp->file = f;
  tmp->next = new Database;
}

// Print the database
void Database::print()
{
  Database *tmp=this;

  while (tmp->next != NULL) {
    tmp->file->print();
    tmp = tmp->next;
  }
}

// Remove a file from the database
#ifdef INTEGER_SSN
void Database::remove(int s)
#else
void Database::remove(char *s)
#endif
{
  Database *tmp=this;

  while (tmp->next != NULL) {
#ifdef INTEGER_SSN
    if (tmp->file->getssn() == s) {
#else
    if (!strcmp(tmp->file->getssn(),s)) {
#endif
      tmp->file = tmp->next->file;
      tmp->next = tmp->next->next;
      return;
    }
    tmp = tmp->next;
  }
  cout << "Database::remove: file not found\n";
}

// Find a file in the database
#ifdef INTEGER_SSN
Personnel *Database::locate(int s)
#else
Personnel *Database::locate(char *s)
#endif
{
  Database *tmp=this;
  while (tmp->next != NULL) {
#ifdef INTEGER_SSN
    if (tmp->file->getssn() == s) {
#else
    if (!strcmp(tmp->file->getssn(),s)) {
#endif
      return tmp->file;
    }
    tmp = tmp->next;
  }

  cout << "Database::locate: file not found\n";
  return NULL;
}

// Traverse the list, performing d dispatched and s static calls per object
void Database::traverse(int d, int s)
{
  int i;
  Database *tmp=this;
  Personnel *pf;
  while (tmp->next != NULL) {

    // Perform the dispatched calls
    pf = tmp->file;
    for(i=0; i<d; ++i) {
      pf->dynamic_void();
    }

    // Perform the static calls
    pf = tmp->file;
    for(i=0; i<s; ++i) {
      pf->static_void();
    }

    tmp = tmp->next;
  }

}





