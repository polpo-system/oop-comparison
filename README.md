# oop-comparison

The Oberon-2 example of a comparison of object-oriented programming, for
[polpo](https://github.com/polpo-system/polpo). Robert Henderson and Benjamin Zorn, at the
University of Colorado, wrote the same small program in four object-oriented languages, Oberon-2,
Modula-3, Sather and Self, with C++ as the baseline, for their paper "A Comparison of
Object-oriented Programming in Four Modern Languages" (1993).

The program keeps personnel records in a list. Personnel is extended by Student and Teacher in
modules of their own, and Print, a type-bound procedure, is overridden by each kind of record, so
the list prints each record in its own way. Testit is the benchmark of the paper.

```
portia.Install oop-comparison
```

It runs on x86 only: the program is built on type-bound procedures, which the x86 compiler of polpo
compiles with /2 and the compilers of the other ports do not have.

## Using

    Testit.Run      ten times 500 records added, the last one found 100 times, the list
                    traversed 250 times, all records deleted; the time in milliseconds

`tools/OOPComparison.Tool` opens the sources.

## What is here

    src/Personnel.Mod     the records all kinds have in common
    src/Student.Mod       students, an extension of Personnel
    src/Teacher.Mod       teachers, another one
    src/Database.Mod      the list of records
    src/Testit.Mod        the benchmark
    src/Database.Tool     the tool text of the authors, for Oberon V4
    other/                the same program in C++, Modula-3, Sather and Self
    tools/OOPComparison.Tool
    test/OOPComparisonTest.Mod

The files reached us through a collection of Oberon software, as the archive comparison-code.tar.Z
of the authors (February 1993). The first commit has them unchanged. The one change since: Testit
takes its time from Kernel.GetTimer instead of Oberon.Time, so the benchmark runs in the console
too.

## Tests

    OOPComparisonTest.Run    8 checks: ten records added, found, checked for their kind and
                             deleted

## License

The sources carry no license; they are published here as the example of the paper, with the names
of their authors. Their copyright stays with Robert Henderson and Benjamin Zorn. The files written
for polpo (the tool text, the test and this readme) may be used under the terms of GPL-3
(`LICENSE`).
