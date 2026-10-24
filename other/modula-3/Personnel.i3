(*
 *  Personnel.i3
 *
 *   Personnel Interface
 *)

INTERFACE Personnel;

    TYPE
	File <: Public_File;
	Public_File = OBJECT
	    METHODS
		Print();
		Update(ssn: INTEGER; firstname,lastname: ARRAY OF CHAR);
		Ssn(): INTEGER;
		StaticVoid();
		DynamicVoid();
	END;

    PROCEDURE VoidFile(pf: File);
    PROCEDURE GetSsn(pf: File): INTEGER;

END Personnel.

