(*
 * Teacher.m3
 *
 *    Implementation of Teacher Files
 *)

MODULE Teacher;

    IMPORT Stdio, Wr, Personnel;
    FROM Stdio IMPORT stdout;

    REVEAL File = Public_File BRANDED OBJECT 
	    Salary: INTEGER;
	OVERRIDES
	    Print  := PrintFile;
	    UpdateSalary := UpdateTeacherSalary;
	    DynamicVoid := VoidFile;
	END;

    (* Create a new Teacher file *)
    PROCEDURE New(ssn: INTEGER; fn,ln: ARRAY OF CHAR; sal:INTEGER): File =
	VAR sf: File;
    BEGIN
	sf :=  NEW(File, Salary := sal);
	sf.Update(ssn,fn,ln);
	RETURN sf;
    END New;

    (*  Set the record as invalid *)
    PROCEDURE VoidFile(tf: File) =
    BEGIN
	tf.Salary:=0;
    END VoidFile;

    (* Update the salary in a teacher file *)
    PROCEDURE UpdateTeacherSalary(tf: File; salary:INTEGER) =
    BEGIN
	tf.Salary := salary;
    END UpdateTeacherSalary;

    (* Print a teacher file *)
    PROCEDURE PrintFile(tf: File) =
    BEGIN
	(* First, print the personnel file part *)
	Personnel.File.Print(tf);

	(* Then print the specific teacher info *)
	Wr.PutText(stdout, "  --Salary: ");
	Wr.PutText(stdout, "salary");
	Wr.PutText(stdout, "\n");
    END PrintFile;

 
BEGIN
END Teacher.

