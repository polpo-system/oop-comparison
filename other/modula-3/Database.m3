(*
 *  Database.m3
 *
 *     Implementation of the database as a linked list of File objects.
 *)

MODULE Database;

    IMPORT Stdio, Wr, Personnel;
    FROM Stdio IMPORT stdout;
    FROM Personnel IMPORT File;

    REVEAL DB = Public_DB BRANDED OBJECT
	file: File;
	next: DB;
	OVERRIDES
	    Add		:= AddFile;
	    Print	:= PrintDB;
	    Locate	:= LocateFile;
	    Delete	:= DeleteFile;
	    Traverse	:= TraverseDB;
    END;

    (* Print the database *)
    PROCEDURE PrintDB (db: DB) =
    BEGIN
	Wr.PutText(stdout, "Database:\n");
        WHILE (db.next#NIL) DO
	    db.file.Print();
            db := db.next;
        END;
	Wr.PutText(stdout, "\n");
    END PrintDB;

    (* Add a file to the database *)
    PROCEDURE AddFile(db:DB; file: File) =
    BEGIN
	WHILE db.next # NIL DO db:= db.next END;
	db.file := file;
	db.next := CreateDB();
    END AddFile;

    (* Create an empty database *)
    PROCEDURE CreateDB(): DB =
    BEGIN
        RETURN NEW(DB, file := NIL, next := NIL);
    END CreateDB;

    (* Locate a file in the database.  Raise NoSuchRecord if not found *)
    PROCEDURE LocateFile(db: DB; ssn: INTEGER): File RAISES {NoSuchRecord} =
    BEGIN
        WHILE (db.next#NIL) DO
	    IF (Personnel.GetSsn(db.file)=ssn) THEN  (* static call *)
	    (* IF (db.file.Ssn()=ssn) THEN *) (* dynamic call *)
		RETURN db.file;
	    END;
            db := db.next;
        END;
        RAISE NoSuchRecord;
    END LocateFile;

    (* Delete a file from the database.  Raise NoSuchRecord if not found *)
    PROCEDURE DeleteFile(db: DB; ssn: INTEGER) RAISES {NoSuchRecord} =
    BEGIN
        WHILE (db.next#NIL) DO
	    IF (Personnel.GetSsn(db.file)=ssn) THEN  (* static call *)
	    (* IF (db.file.Ssn()=ssn) THEN *)  (* dynamic call *)
		db.file := db.next.file;
		db.next := db.next.next;
		RETURN;
	    END;
            db := db.next;
        END;
        RAISE NoSuchRecord;
    END DeleteFile;

    (* Traverse the database operating on each file. *)
    PROCEDURE TraverseDB(db: DB; numd, nums: INTEGER) =
    VAR
	pf:Personnel.File;

    BEGIN
        WHILE (db.next#NIL) DO 

	    (* Perform dispatched operations *)
	    pf:=db.file;
	    FOR i:=0 TO numd DO
		pf.DynamicVoid();
	    END;

	    (* Perform static operations *)
	    pf:=db.file;
	    FOR i:=0 TO nums DO
		(* pf.StaticVoid(); *) (* dynamic call *)
		Personnel.VoidFile(db.file); (* static call *)
	    END;

            db := db.next;
        END;
    END TraverseDB;

BEGIN
END Database.
