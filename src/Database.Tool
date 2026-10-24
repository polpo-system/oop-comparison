Write.Open OberonErrors.Text
Write.Open OberonGuide.Text

Edit.Open Personnel.Mod
Edit.Open Student.Mod
Edit.Open Teacher.Mod
Edit.Open Database.Mod
Edit.Open Testit.Mod

Compiler.Compile Personnel.Mod\s Student.Mod\s Teacher.Mod\s Database.Mod\s Testit.Mod\s

Compiler.Compile *\s

System.Time
Compiler.Compile Personnel.Mod\s Student.Mod\s Teacher.Mod\s Database.Mod\s Testit.Mod\s

Testit.Run
