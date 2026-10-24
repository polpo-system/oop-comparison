(*
 *  Main Module
 *)


MODULE Main;

    IMPORT Text, Database, Personnel, Student, Teacher;

    CONST
	numIterations:INTEGER = 10;
	numFiles:INTEGER      = 500;
	numStudents:INTEGER   = 2;
	numTeachers:INTEGER   = 2;
	numLocates:INTEGER    = 100;
	numPasses:INTEGER     = 250;
	numDynamicOps:INTEGER = 2;
	numStaticOps:INTEGER  = 2;
    VAR
	person: Personnel.File;
	CS: Database.DB;
	n,m: INTEGER;
	fn: ARRAY [0..2] OF CHAR;
	ln: ARRAY [0..4] OF CHAR;

BEGIN

    Text.SetChars(fn,"PAT");
    Text.SetChars(ln,"SMITH");

    (* Create a New Database *)
    CS := Database.CreateDB();

    FOR i:= 1 TO numIterations DO

	(* Add entries to the database *)
	n:=0;
	WHILE (n<numFiles) DO

	    (* Add Students *)
	    m:=0;
	    WHILE (n<numFiles) AND (m<numStudents) DO
		CS.Add(Student.New(n,fn,ln));
		n:=n+1;
		m:=m+1;
	    END;

	    (* Add Teachers *)
	    m:=0;
	    WHILE (n<numFiles) AND (m<numTeachers) DO
		CS.Add(Teacher.New(n,fn,ln,1000));
		n:=n+1;
		m:=m+1;
	    END;

	END;

	(* Locate the last record numLocates times *)
	FOR i:=0 TO (numLocates-1) DO
	    person:= CS.Locate(numFiles-1);
	END;

	(* Traverse the list numPasses times *)
	FOR i:=1 TO numPasses DO
	    CS.Traverse(numDynamicOps, numStaticOps);
	END;

	(* Delete each file *)
	FOR i:=0 TO numFiles-1 DO
	    CS.Delete(i);
	END;

    END;

END Main.
