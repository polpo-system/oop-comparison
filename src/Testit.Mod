(*
 *  Testit - Test the Oberon-2 database implementation
*)

MODULE Testit;

IMPORT Personnel, Student, Teacher, Database, Kernel, Out;

PROCEDURE Run*;
CONST
	numFiles = 500;
	numIterations = 10;
	numStudents = 2;
	numTeachers = 2;
	numLocates = 100;
	numPasses = 250;
	numDDOps = 2;
	numSTATICOps = 2;
VAR 
	CS: Database.DB;
	pf: Personnel.File;
	n,i,j: INTEGER;
	Start, End: LONGINT;

BEGIN

    (* Get starting time *)
    Start:=Kernel.GetTimer();

    (* Create the database *)
    CS := Database.CreateDB();

    FOR n:=1 TO numIterations DO

	(* Add records *)
	i:=0;
	WHILE (i<numFiles) DO

	    (* Add Students *)
	    j:=0;
	    WHILE (i < numFiles) & (j < numStudents) DO
		CS.Add(Student.Create(i,"PAT","SMITH"));
		j:=j+1;
		i:=i+1;
	    END;

	    (* Add Teachers *)
	    j:=0;
	    WHILE (i < numFiles) & (j < numTeachers) DO
		CS.Add(Teacher.Create(i,"PAT","SMITH",1000));
		j:=j+1;
		i:=i+1;
	    END;
	END;

	(* Locate the last record numLocates times *)
	FOR i:=1 TO numLocates DO
	    pf := CS.Locate(numFiles-1);
	END;

	(* Traverse the list numPasses times *)
	FOR i:=1 TO numPasses DO
	    CS.Traverse(numDDOps, numSTATICOps);
	END;

	(* Delete all the files *)
	FOR i:=0 TO numFiles-1 DO
	    CS.Delete(i);
	END;

    END;

    (* Get ending time *)
    End:=Kernel.GetTimer();

    (* Report result *)
    Out.String("Run Time = ");
    Out.Int(End-Start,0);
    Out.Ln();

END Run;
END Testit.

