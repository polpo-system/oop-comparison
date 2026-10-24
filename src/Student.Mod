(*                                  Rob Henderson
 *                                  September 23, 1992
 *  Student Module
 *
 *	This module contains the data types and procedures common
 *	to student Personnel Files
 *)

MODULE Student;

IMPORT  Out, Personnel;

TYPE
	File* = POINTER TO FileData;
	FileData = RECORD (Personnel.FileData)
		nclasses: INTEGER;
		class: ARRAY 10 OF INTEGER;
	END;

(* Create a Student File *)
PROCEDURE  Create* (ssn:INTEGER; firstname, lastname: ARRAY OF CHAR): File;
	VAR sf: File;
BEGIN
	NEW(sf);
	sf.Update(ssn, firstname, lastname); 
	sf.nclasses := 0;
	RETURN sf;
END Create;

(* Print a Student File *)
PROCEDURE (sf: File) Print*;
	VAR i: INTEGER;
BEGIN
	sf.Print^();
	Out.String("   Classes: ");
	IF sf.nclasses = 0 THEN
		Out.String("(Not Enrolled)");
	ELSE
		FOR i := 0 TO sf.nclasses-1 DO
			Out.Int(sf.class[i],0);
			Out.String(" ");
		END;
	END;
	Out.Ln;
END Print;

(* Add a Class For A Student *)
PROCEDURE  (sf: File) AddClass* (class: INTEGER);
BEGIN
	sf.class[sf.nclasses] := class; 
	INC(sf.nclasses);
END AddClass;

(* Unenroll A Student *)
PROCEDURE (sf:File) UnEnroll* ();
BEGIN
	sf.nclasses := 0;
END UnEnroll;

(* Void an entry  *)
PROCEDURE (sf: File) DynamicVoid* ();
BEGIN
	sf.nclasses:=0;
END DynamicVoid;


END Student.
