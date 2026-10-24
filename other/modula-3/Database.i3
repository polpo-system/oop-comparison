(*
 * Database.i3
 *
 *   Interface to the Database module.
 *)

INTERFACE Database;

    IMPORT Personnel;
    FROM Personnel IMPORT File;

    (* Exception raised if attempt to Locate or Delete non-existent record *)
    EXCEPTION NoSuchRecord;

    TYPE 
	DB <: Public_DB;
	Public_DB = OBJECT
	    METHODS
		Add(file: File);
		Print();
		Locate(ssn: INTEGER) : File RAISES {NoSuchRecord};
		Delete(ssn: INTEGER) RAISES {NoSuchRecord};
		Traverse(numd, nums: INTEGER);
	END;

    PROCEDURE CreateDB(): DB;

END Database.
