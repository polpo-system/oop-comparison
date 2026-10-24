(*
 *  Student.m3
 *
 *    Implementation of student files
 *)

MODULE Student;

    IMPORT Stdio, Text, Wr, Personnel;
    FROM Stdio IMPORT stdout;

    REVEAL File = Public_File BRANDED OBJECT 
	    nclasses: INTEGER;
	    class: ARRAY [1..10] OF Text.T;
	OVERRIDES
	    Print  := PrintFile;
	    AddClass := AddClassToFile;
	    UnEnroll := UnEnrollStudent;
	    DynamicVoid := VoidFile;
	END;

    (* Create a student file *)
    PROCEDURE New(ssn:INTEGER; fn,ln: ARRAY OF CHAR): File =
	VAR sf: File;
    BEGIN
	sf :=  NEW(File, nclasses:=0);
	sf.Update(ssn,fn,ln);
	RETURN sf;
    END New;

    (*  Set the record as invalid *)
    PROCEDURE VoidFile(sf: File) =
    BEGIN
	sf.nclasses:=0;
    END VoidFile;

    (* Mark a student file as unenrolled *)
    PROCEDURE UnEnrollStudent(sf: File) =
    BEGIN
	sf.nclasses := 0;
    END UnEnrollStudent;

    (* Add a class to a student file *)
    PROCEDURE AddClassToFile(sf: File; class: Text.T) =
    BEGIN
	sf.nclasses := sf.nclasses + 1;
	sf.class[sf.nclasses] := class;
    END AddClassToFile;

    (* Print a student file *)
    PROCEDURE PrintFile(sf: File) =
    BEGIN
	(* First, print the personnel file data *)
	Personnel.File.Print(sf);

	(* Then, print the specific student info *)
	IF (sf.nclasses > 0) THEN
	    Wr.PutText(stdout, "  --Enrolled: ");
	    FOR i:=1 TO sf.nclasses DO
		Wr.PutText(stdout, sf.class[i]);
		Wr.PutText(stdout, " ");
	    END;
	    Wr.PutText(stdout, "\n");
	ELSE
	    Wr.PutText(stdout, "  --Not Enrolled\n");
	END;
    END PrintFile;

BEGIN
END Student.
