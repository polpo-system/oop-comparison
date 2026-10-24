(*                                  Rob Henderson
 *                                  September 23, 1992
 *  Teacher Module
 *
 *	This module contains the data types and procedures common
 *	to teacher Personnel Files
 *)

MODULE Teacher;

IMPORT Personnel, Out;

TYPE
	File* = POINTER TO FileData;
	FileData = RECORD(Personnel.FileData)
		salary: INTEGER;
	END;

(* Create a Teacher File *)
PROCEDURE  Create* (ssn:INTEGER; firstname, lastname: ARRAY OF CHAR; 
				 salary: INTEGER): File;
	VAR tf: File;
BEGIN
	NEW(tf);
	tf.Update(ssn, firstname, lastname);
	tf.salary := salary;
	RETURN tf;
END Create;

(* Print a Teacher File *)
PROCEDURE (tf: File) Print* ;
BEGIN
	tf.Print^();
	Out.String("   Salary: ");
	Out.Int(tf.salary,0);
	Out.Ln;
END Print;

(* Update The Salary Of A Teacher *)
PROCEDURE (tf: File) UpdateSalary* (salary: INTEGER);
	VAR pf: Personnel.File;
BEGIN
	tf.salary := salary;
END UpdateSalary;

(* Void an entry *)
PROCEDURE (tf: File) DynamicVoid* ();
BEGIN
	tf.salary:=0;
END DynamicVoid;

END Teacher.
