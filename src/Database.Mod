(*                                  Rob Henderson
 *                                  September 23, 1992
 *  Database Module
 *
 *)


MODULE Database;

IMPORT Personnel, Student,  Teacher, Out;

TYPE
	(* Database of Personnel Files *)
	DB* = POINTER TO DBnode;
	DBnode = RECORD
		file: Personnel.File;
		next: DB;
	END;

(* Create a New Database *)
PROCEDURE CreateDB* (): DB;
	VAR db: DB;
BEGIN
	NEW(db);
	db.file := NIL;
	db.next := NIL;
	RETURN db;
END CreateDB;

(* Find a Personnel File Given a Social Security Number *)
PROCEDURE (db: DB) Locate* (ssn: INTEGER): Personnel.File;
BEGIN
	WHILE (db.next # NIL) DO 
		(* IF (Personnel.StaticGetssn(db.file) = ssn) THEN *) (*static*)
		IF (db.file.Getssn() = ssn) THEN
			RETURN db.file;
		END;
		db := db.next;
	END;
	RETURN NIL;
END Locate;

(* Delete a Personnel File *)
PROCEDURE (db: DB) Delete* (ssn: INTEGER);
BEGIN
	WHILE (db.next # NIL) DO 
		(* IF (Personnel.StaticGetssn(db.file) = ssn) THEN *) (*static*)
		IF (db.file.Getssn() = ssn) THEN
			db.file := db.next.file;
			db.next := db.next.next;
			RETURN;
		END;
		db := db.next; 
	END;
	Out.String("Personnel.Delete: No Such Person"); Out.Ln;
END Delete;

(* Add a Student To The Database *)
PROCEDURE (db: DB) Add* (pf: Personnel.File);
BEGIN
	WHILE db.next # NIL DO db := db.next; END;
	db.file := pf;
	db.next := CreateDB();
END Add;

(* Print the database *)
PROCEDURE (db: DB) Print*();
BEGIN
	WHILE db.next # NIL DO
		db.file.Print();
		db := db.next;
	END;
	Out.Ln;
END Print;

(* Traverse the database, performing operations on each file *)
PROCEDURE (db: DB) Traverse* (numd, nums: INTEGER);
VAR
	pf: Personnel.File;
	i: INTEGER;
BEGIN
	WHILE (db.next # NIL) DO 

		(* dispatched calls *)
		pf := db.file;
		FOR i:=1 TO numd DO
			pf.DynamicVoid();
		END;

		(* static calls *)
		pf := db.file;
		FOR i:=1 TO nums DO
			(* Personnel.ReallyStaticVoid(pf); *)
			pf.StaticVoid();
		END;

		db := db.next;
	END;
END Traverse;

END Database.
