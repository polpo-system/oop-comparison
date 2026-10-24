// ***********************
// ****  testit.cc  ******
// ***********************

// The % dynamically dispatched calls is given by the following:
//
//  total_calls = (4N + N(N+1)/2 + NUM_DD_OPS) * NUM_ITERATIONS
//  dd_calls    = NUM_DD_OPS * NUM_ITERATIONS
//  %dd = (dd_calls/total_calls) * 100%
//  where N=number of data entries

#include "config.h"
#include "personnel.h"
#include "database.h"
#include "teacher.h"
#include "student.h"

//  main procedure to test the database implementation
main()
{
  Database cs;
  Personnel *person;
  int n;
  int i;
  int j;

  for (n=0; n<NUM_ITERATIONS; n++) {

    // Add records
#ifdef VERBOSE
    cout << "adding...";
    cout.flush();
#endif
    i=0;

    while (i<NUM_FILES) {

      // Add student files
      for (j=0; j<NUM_STUDENTS && i<NUM_FILES; ++i, ++j) {
	cs.add(new Student(i, "PAT", "SMITH"));
      }

      // Add teacher files
      for (j=0; j<NUM_TEACHERS && i<NUM_FILES; ++i, ++j) {
	cs.add(new Teacher(i, "PAT", "SMITH", 1000));
      }
    }

    // Locate the last item in the database NUM_LOCATES times
#ifdef VERBOSE
    cout << "locating...";
    cout.flush();
#endif
    for (i=0; i<NUM_LOCATES; i++) {
      person = cs.locate(NUM_FILES-1);
    }
  
#ifdef VERBOSE
    cout << "traversing...";
    cout.flush();
#endif
    // Perform NUM_PASSES list traversals with NUM_DD_OPS operations/object
    for (i=0; i<NUM_PASSES; i++) {
      cs.traverse(NUM_DD_OPS,NUM_STATIC_OPS);
    }
    
#ifdef VERBOSE
    cout << "deleting...";
    cout.flush();
#endif
    // Delete each data file
    for (i=0; i<NUM_FILES; i++ ) {
      cs.remove(i);
    }

#ifdef VERBOSE
    cout << "done.\n";
    cout.flush();
#endif

  }    


#ifdef DEBUG
    int add_calls,locate_calls,getssn_calls,
        traversal_calls,dd_calls,ss_calls,delete_calls;
    int num_static_calls,num_dynamic_calls;
    double miss_rate;

    add_calls = NUM_ITERATIONS*NUM_FILES;
    locate_calls = NUM_ITERATIONS*NUM_LOCATES;
    traversal_calls = NUM_ITERATIONS*NUM_PASSES;
    delete_calls = NUM_ITERATIONS*NUM_FILES;
    getssn_calls = locate_calls*NUM_FILES+delete_calls;

    dd_calls = traversal_calls*NUM_DD_OPS*NUM_FILES;
    ss_calls = traversal_calls*NUM_STATIC_OPS*NUM_FILES;

    num_static_calls = add_calls+locate_calls+traversal_calls
      +delete_calls+ss_calls+getssn_calls;
    num_dynamic_calls = dd_calls;

#if NUM_DD_OPS==0
    miss_rate = 0;
#else
    miss_rate = 200.0/(NUM_DD_OPS*NUM_STUDENTS+NUM_DD_OPS*NUM_TEACHERS);
#endif

#ifdef GETSSN_DYNAMIC
    num_static_calls  -= getssn_calls;
    num_dynamic_calls += getssn_calls;
#endif

#ifdef INTEGER_SSN
    cout << "Integer ssn\n";
#else
    cout << "String ssn\n";
#endif
    cout << num_static_calls << " static calls\n";
    cout << num_dynamic_calls << " dynamically dispatched calls\n";
    cout << (num_dynamic_calls*100.0)/(num_dynamic_calls+num_static_calls)
         << "% dispatched\n";
    cout << miss_rate << "% dispatch cache miss rate for Sather\n";
#endif

}

