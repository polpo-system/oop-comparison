(*
 *  Student.i3
 *
 *    Student Interface
 *)

INTERFACE Student;
    IMPORT Text, Personnel;

    TYPE
	File <: Public_File;
	Public_File = Personnel.File OBJECT
	    METHODS
		AddClass(class: Text.T);
		UnEnroll();
        END;

    (* Create a new student file *)
    PROCEDURE New (ssn:INTEGER; firstname,lastname: ARRAY OF CHAR): File;

END Student.
