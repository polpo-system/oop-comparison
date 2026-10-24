MODULE OOPComparisonTest;  (** OOPComparisonTest.Run: the personnel records of the example, added, found, deleted *)

IMPORT Personnel, Student, Teacher, Database, Out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Run*;
VAR db: Database.DB; pf: Personnel.File; i: INTEGER;
BEGIN
  fails := 0; checks := 0;
  db := Database.CreateDB();
  i := 0;
  WHILE i < 10 DO
    IF ODD(i) THEN db.Add(Teacher.Create(i, "PAT", "SMITH", 1000)) ELSE db.Add(Student.Create(i, "PAT", "SMITH")) END;
    INC(i)
  END;
  pf := db.Locate(7); Check("Locate 7", (pf # NIL) & (pf.Getssn() = 7));
  Check("7 is a teacher", (pf # NIL) & (pf IS Teacher.File));
  pf := db.Locate(4); Check("Locate 4", (pf # NIL) & (Personnel.StaticGetssn(pf) = 4));
  Check("4 is a student", (pf # NIL) & (pf IS Student.File));
  Check("Locate 10: none", db.Locate(10) = NIL);
  db.Delete(4); Check("4 deleted", db.Locate(4) = NIL);
  Check("5 still there", db.Locate(5) # NIL);
  i := 0; WHILE i < 10 DO db.Delete(i); INC(i) END;
  Check("all deleted", db.Locate(9) = NIL);
  Out.String("OOPComparisonTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END OOPComparisonTest.
