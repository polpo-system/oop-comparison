OOPComparison - the Oberon-2 example of Henderson and Zorn's comparison of object-oriented languages (x86)

Robert Henderson and Benjamin Zorn (University of Colorado, 1993) wrote the same program in
Oberon-2, C++, Modula-3, Sather and Self: personnel records (Personnel, extended by Student and
Teacher) in a list (Database). It shows records extended across modules and type-bound
procedures: Print, overridden by each kind of record, is chosen by the record's type. The x86
compiler of polpo compiles them with /2; the others have no type-bound procedures.

  Testit.Run      the benchmark of the comparison: ten times 500 records added, the last one
                  found 100 times, the list traversed 250 times, all deleted; the milliseconds

The sources:
  Edit.Open src/pkg/oop-comparison/src/Personnel.Mod
  Edit.Open src/pkg/oop-comparison/src/Student.Mod
  Edit.Open src/pkg/oop-comparison/src/Teacher.Mod
  Edit.Open src/pkg/oop-comparison/src/Database.Mod
  Edit.Open src/pkg/oop-comparison/src/Testit.Mod

The four other versions are in the repository, in other/:
https://github.com/polpo-system/oop-comparison
