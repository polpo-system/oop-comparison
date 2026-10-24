(*                                      Rob Henderson
 *                                      September 23, 1992		
 *  Personnel Module
 *
 * 	This module contains the data types  and procedures common 
 *	to all types of personnel files
 *)

MODULE Personnel;

IMPORT Out, Texts;

TYPE
	(* Personnel Files *)
	File* = POINTER TO FileData;
	FileData* = RECORD
		ssn: INTEGER;
		firstname, lastname: ARRAY 32 OF CHAR;
		valid: INTEGER;
	END;

(* Update the Information In a Personnel File *)
PROCEDURE (pf: File) Update*(ssn:INTEGER; firstname, lastname: ARRAY OF CHAR);
BEGIN
	pf.ssn:=ssn;
	pf.valid:=1;
	COPY(firstname, pf.firstname);
	COPY(lastname, pf.lastname);
END Update;

(* Print a Personnel File *)
PROCEDURE (pf: File) Print* ();
BEGIN
	Out.Int(pf.ssn,0); Out.String(": ");
	Out.String(pf.lastname); Out.String(", ");
	Out.String(pf.firstname);
END Print;

(* Void an entry (overridden in Student and Teacher *)
PROCEDURE (pf: File) DynamicVoid* ();
BEGIN
	pf.valid:=0;
END DynamicVoid;

(* Void an entry (not overridden in Student and Teacher) *)
PROCEDURE (pf: File) StaticVoid* ();
BEGIN
	pf.valid:=0;
END StaticVoid;

(* Void an entry (not overridden in Student and Teacher) *)
PROCEDURE ReallyStaticVoid* (pf: File);
BEGIN
	pf.valid:=0;
END ReallyStaticVoid;

(* Get the ssn *)
PROCEDURE (pf: File) Getssn* (): INTEGER;
BEGIN
	RETURN pf.ssn;
END Getssn;

(* Get the ssn *)
PROCEDURE StaticGetssn* (pf: File): INTEGER;
BEGIN
	RETURN pf.ssn;
END StaticGetssn;

END Personnel.
