
_AddSlots: (|
   numIterations = 10.
   numLocates = 100.
   numPasses = 250.
   numOperations = 4.
   numFiles = 500.
   numStudents = 2.
   numTeachers = 2.
|)

shell _AddSlots: (|


   dbtime = (| cs. person. ssn. n. m. |

      cs:   (dbProto clone).

      numIterations do: [| :i |

        "Add records"
        "'adding...' print."
	n: 0 .
	[ n < numFiles ] whileTrue: [

	  "Add Students"
	  m: 0 .
	  [ (n < numFiles) && (m < numStudents) ] whileTrue: [
	    cs add: (((studentProto clone) ssn: n)
                                     firstname: 'PAT')
                                      lastname: 'SMITH'.
	    n: n succ.
	    m: m succ.
          ].

	  "Add Teachers"
	  m: 0 .
	  [ (n < numFiles) && (m < numTeachers) ] whileTrue: [
	    cs add: ((((teacherProto clone) ssn: n)
                                      firstname: 'PAT')
                                       lastname: 'SMITH')
                                         salary: 1000 .
	    n: n succ.
	    m: m succ.
          ].
        ].

	"Locate the last record numLocates times"
        "'locating...' print."
	numLocates do: [
          person: (cs locate: (numFiles pred)).
        ].

        "Traverse the database, performing operations on each item"
        "'traversing...' print."
        numPasses do: [
          cs traverse.
        ].

	"Delete records"
        "'deleting... ' print."
        numFiles do: [|:i|
          cs delete: i.
	].
        "i print. ' done.\n' print."
      ].
      self.
   ).

|)
