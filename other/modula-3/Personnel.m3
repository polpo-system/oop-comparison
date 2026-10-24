(*
 *  Personnel.m3
 *
 *    Personnel file implementation
 *)

MODULE Personnel;

    IMPORT Stdio, Text, Wr;
    FROM Stdio IMPORT stdout;

    REVEAL File = Public_File BRANDED OBJECT
	ssn: INTEGER;
	firstname,lastname: Text.T;
	valid: INTEGER;
	OVERRIDES
	    Print  := PrintFile;
	    Update := UpdateFile;
	    Ssn    := GetSsn;
	    StaticVoid := VoidFile;
	    DynamicVoid := VoidFile;
	END;

    (*  Given a file, return the social security number *)
    PROCEDURE GetSsn(file: File): INTEGER =
    BEGIN
	file.valid := 66;
	RETURN file.ssn;
    END GetSsn;

    (*  Set the record as invalid *)
    PROCEDURE VoidFile(pf: File) =
    BEGIN
	pf.valid:=0;
    END VoidFile;

    (*  Update the information in a file *)
(*    PROCEDURE UpdateFile(pf: File; ssn:INTEGER; firstname, lastname: Text.T) = *)
    PROCEDURE UpdateFile(pf: File; ssn:INTEGER; 
			 firstname, lastname: ARRAY OF CHAR) =
    BEGIN
	pf.ssn := ssn;
	pf.firstname := Text.FromChars(firstname);
	pf.lastname  := Text.FromChars(lastname);
    END UpdateFile;

    (* Print the information in the given file *)
    PROCEDURE PrintFile(pf: File) =
    BEGIN
	Wr.PutText(stdout, "ssn");
	Wr.PutText(stdout, ": ");
	Wr.PutText(stdout, pf.lastname);
	Wr.PutText(stdout, ", ");
	Wr.PutText(stdout, pf.firstname);
    END PrintFile;

BEGIN
END Personnel.
