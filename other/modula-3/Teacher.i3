(*
 *  Teacher.i3
 *
 *    Teacher Interface
 *)

INTERFACE Teacher;
    IMPORT Personnel;

    TYPE
	File <: Public_File;
	Public_File = Personnel.File OBJECT
            METHODS
		UpdateSalary(salary: INTEGER);
        END;

    (* Create a new Teacher file *)
    PROCEDURE New (ssn:INTEGER; firstname,lastname:ARRAY OF CHAR; salary:INTEGER):File;

END Teacher.
